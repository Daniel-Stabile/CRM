using Benner.Tecnologia.Common;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Benner.Corporativo.Definicoes.Financeiro;
using System.Web.UI;
using System.Web.UI.WebControls;
using Benner.Tecnologia.Common.Instrumentation;
using Benner.Tecnologia.Common.IoC;
using Benner.Corporativo.Definicoes.Financeiro.OfficeBanking;
using Benner.Corporativo.Definicoes.Web.Financeiro;

public partial class InserirCobrancaBancariaPage : WesPage
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        FORMNOVACOBRANCABANCARIA.CommandExecuted += FORMNOVACOBRANCABANCARIA_CommandExecute;
        FORMNOVACOBRANCABANCARIA.DisplayCommandExecutedDefaultMessage = false;
        PARCELAS.CommandExecuted += PARCELAS_CommandExecute;
        PARCELAS.DataLoaded += PARCELAS_DataLoaded;
    }

    void PARCELAS_DataLoaded(object sender, EventArgs e)
    {
        EntityBase cobranca = FORMNOVACOBRANCABANCARIA.GetEntity();

        if (cobranca != null)
        {
            try
            {
                int tipo = cobranca["TITULOSOCORRENCIAS"].GetInt32();
                var condicoes = new List<string>()
                {
                    string.Format("A.TIPO = {0}", tipo),
                    "A.ENTRADASAIDA = 'S'",
                    "A.TIPODEMOVIMENTO IN (1)"
                };

                PARCELAS.FilterEntity["TIPO"].SetDBValue(tipo.ToString());

                if (tipo.Equals(1))
                {
                    MostrarBuscaAvancada();
                    MostrarTitulos();
                    FiltrarTitulos(cobranca);
                }
                else if (tipo.Equals(2))
                {
                    OcutarBuscaAvancada();
                    MostrarOcorrencias();

                    FiltrarOcorrencias(cobranca, condicoes);
                }

                //PARCELAS.UserDefinedCriteriaWhereClause = string.Join(" AND ", condicoes);
                PARCELAS.ForceUpdate();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
    }

    private void FiltrarOcorrencias(EntityBase cobranca, List<string> condicoes)
    {
        if (cobranca["BANCO"].GetInt64() > 0)
            condicoes.Add("A.BANCO = " + cobranca["BANCO"].GetInt64());
        if (cobranca["OCORRENCIAS"].GetDBValue() != null)
            condicoes.Add("A.OCORRENCIABANCO IN (" + cobranca["OCORRENCIAS"].GetString().Replace("|_|", ",").Replace("|_", "") + ")");
    }

    private void FiltrarTitulos(EntityBase cobranca)
    {
        PARCELAS.UserDefinedCriteriaWhereClause = String.Format(@" (A.TIPOCOBRANCA IS NULL 
                                                                 OR A.TIPOCOBRANCA IN (SELECT HANDLE
                                                                                       FROM FN_TIPOSCOBRANCAS 
                                                                                       WHERE TIPO {0} 'X'))", 
                                                                cobranca["REMESSAPIX"].GetBoolean() ? "=" : "<>");
    }


    private void MostrarBuscaAvancada()
    {
        ControlarBuscaAvancada(true);
    }

    private void OcutarBuscaAvancada()
    {
        ControlarBuscaAvancada(false);
    }

    private void ControlarBuscaAvancada(bool visible)
    {
        var entidadeFiltro = PARCELAS.FilterEntity;

        var campos = new string[]
        {
            FNFiltroParcelasCB.FieldNames.TipoData,
            FNFiltroParcelasCB.FieldNames.Considerar,
            FNFiltroParcelasCB.FieldNames.Selecionar,
            FNFiltroParcelasCB.FieldNames.TipoCobranca,
            FNFiltroParcelasCB.FieldNames.EmissaoBloquetos,
            FNFiltroParcelasCB.FieldNames.DocumentosNormais,
            FNFiltroParcelasCB.FieldNames.DocumentosAdiantamentos,
            FNFiltroParcelasCB.FieldNames.DocumentosDevolucoes,
            FNFiltroParcelasCB.FieldNames.IncluirRejeitados
        };

        foreach (var campo in campos)
            entidadeFiltro[campo].Visible = visible;
    }

    void FORMNOVACOBRANCABANCARIA_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        CurrentStep.Value = 2.ToString();
        PARCELAS.ForceUpdate();
        PARCELAS_DataLoaded(sender, e);
    }

    private void PARCELAS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        EntityBase entity = FORMNOVACOBRANCABANCARIA.GetEntity();

        if (e.Command.Name == "CMD_VOLTAR")
            CurrentStep.Value = 1.ToString();
        else if (e.Command.Name == "CMD_OK")
        {
            try
            {
                if (PARCELAS.SelectedEntitiesHandles.Count > 0)
                {
                    entity["HANDLECOBRANCA"].SetInt64(CriarRemessa(entity));

                    VincularParcelas(entity["HANDLECOBRANCA"].GetInt32(), PARCELAS.SelectedEntitiesHandles, entity["TITULOSOCORRENCIAS"].GetInt32());
                    RedirecionarParaFormularioCobranca(entity["HANDLECOBRANCA"].GetInt32());
                }
                else
                    throw new BusinessException("Não há registros selecionados.");
            }
            catch (BusinessException except)
            {
                throw new BusinessException(except.Message);
            }
        }
    }

    private long CriarRemessa(EntityBase entity)
    {
        try
        {
            GNHbRemessa remessa = GNHbRemessa.Create();
            remessa.BancoHandle = entity["BANCO"].GetInt64();
            remessa.ContaCorrenteHandle = entity["CONTACORRENTE"].GetInt64();
            remessa.ServicoHandle = entity["SERVICO"].GetInt64();
            remessa.Sequencia = entity["SEQUENCIA"].GetInt64();
            remessa.Codigo = entity["SEQUENCIA"].GetInt64();
            remessa.CarteiraHandle = entity["CARTEIRA"].GetInt64();
            if (entity["TITULOSOCORRENCIAS"].GetInt32() == GNHbRemessaTitulosOcorrenciasTabItens.ItemTitulos.Index)
            {
                (new string[] { "OCORRENCIA", "ESPECIE", "PRIMEIRAINSTRUCAO", "SEGUNDAINSTRUCAO" }).ToList().ForEach(fieldName =>
                {

                    if (!entity[fieldName].IsNull)
                        remessa[fieldName].SetInt64(entity[fieldName].GetInt64());
                });
            }
            remessa.NomeArquivo = entity["NOMEARQUIVO"].GetString();
            remessa.TitulosOcorrencias = GNHbRemessaTitulosOcorrenciasTabItens.GetByIndex(entity["TITULOSOCORRENCIAS"].GetInt32());
            remessa.Data = entity["DATA"].GetDateTime();
            remessa.Tipo = "R";

            if (entity["REMESSAPIX"].GetBoolean())
            {
                remessa.RemessaPix = true;
                remessa.ChavePixHandle = entity["CHAVEPIX"].GetInt64();
                remessa.TempoExpiracaoPixHandle = entity["TEMPOEXPIRACAOPIX"].GetInt64();
            }

            remessa.Save();

            return remessa.Handle;
        }
        catch (Exception except)
        {
            throw new BusinessException(string.Format("Erro ao incluir remessa. {0} Erro: {1}", Environment.NewLine, except.Message), except);
        }
    }

    private void VincularParcelas(int handleCobranca, List<Handle> parcelasSelecionadas, int tipo)
    {
        tipo = tipo == 1 ? TipoRemessa.Titulo.ToInt() : TipoRemessa.Ocorrencia.ToInt();

        BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.OfficeBanking.Cobranca.FuncoesRemessaBancaria, Benner.Corporativo.Financeiro",
                                             "VincularParcelasRemessa",
                                             handleCobranca,
                                             parcelasSelecionadas,
                                             tipo);
    }

    private void RedirecionarParaFormularioCobranca(int handleCobranca)
    {
        FormLinkDefinition a = new FormLinkDefinition();
        a.Url = "~/aga/a/financeiro/cobrancabancaria/Editar.aspx";
        a.UseTargetDefinitionName = true;
        a.IsModalPage = false;
        a.SystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName;
        a.TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName;
        a.TargetEntityDefinitionName = "GN_HBREMESSAS";
        a.TargetFormMode = FormLinkDefinition.FormMode.View;
        a.WhereClause = new WhereClause(string.Format("A.HANDLE = {0}", handleCobranca));

        var ret = Benner.Tecnologia.Wes.Components.UriBuilder.Create(a);

        Response.Redirect(ret);
    }

    private void MostrarTitulos()
    {
        PARCELAS.GridDefinition.FieldDefinitions["DATAVENCIMENTO"].Visible = true;
        PARCELAS.GridDefinition.FieldDefinitions["DATAEMISSAO"].Visible = true;
        PARCELAS.GridDefinition.FieldDefinitions["ESTADO"].Visible = true;
        PARCELAS.GridDefinition.FieldDefinitions["MUNICIPIO"].Visible = true;
        PARCELAS.GridDefinition.FieldDefinitions["CEP"].Visible = true;
    }

    private void MostrarOcorrencias()
    {
        PARCELAS.GridDefinition.FieldDefinitions["NOMEOCORRENCIAREMESSA"].Visible = true;
        PARCELAS.GridDefinition.FieldDefinitions["DATA"].Visible = true;
        PARCELAS.GridDefinition.FieldDefinitions["AP"].Visible = true;
        PARCELAS.GridDefinition.FieldDefinitions["ABATIMENTO"].Visible = true;
    }

    public enum TipoRemessa
    {
        Titulo, Ocorrencia
    }
}