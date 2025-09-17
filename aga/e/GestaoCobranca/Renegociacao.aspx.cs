using Benner.Corporativo.Comum;
using Benner.Corporativo.Definicoes.GestaoDeCobranca;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Ninject;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using Benner.Corporativo.Definicoes.Financeiro.Interfaces;

public partial class GestaoCobrancaRenegociacaoPage : WesPage
{
    [Inject]
    public IGCSimulacaoPrestacaoDao PrestacaoDao { get; set; }

    [Inject]
    public IRenegociadorDocumento renegociadorDocumento { get; set; }

    public string ParcelasDaRenegociacao
    {
        get
        {
            return BennerVars.UserVars["PARCELASDARENEGOCIACAO"];
        }
    }

    public GCSimulacao Simulacao
    {
        get
        {
            return (GCSimulacao)PARMETROS.GetEntity();
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        PARCELASGERADAS.GetGridDefinitionMethod = (string systemInstanceName, string entityViewName) =>
        {
            var gridDefinition = new GridDefinition();

            var parcela = new GridFieldDefinition(new StringFieldDefinition("PARCELA", "Parcela"));
            var vencimento = new GridFieldDefinition(new StringFieldDefinition("VENCIMENTO", "Vencimento"));
            var dividaPrincipal = new GridFieldDefinition(new CurrencyFieldDefinition("DIVIDAPRINCIPAL", "Dívida"));
            var dividaJuros = new GridFieldDefinition(new CurrencyFieldDefinition("DIVIDAJUROS", "Dívida + Juros"));
            var valorParcela = new GridFieldDefinition(new CurrencyFieldDefinition("VALORPARCELA", "Prestação"));
            var principal = new GridFieldDefinition(new CurrencyFieldDefinition("PRINCIPAL", "Amortização"));
            var juros = new GridFieldDefinition(new CurrencyFieldDefinition("JUROS", "Juros"));

            parcela.Visible = vencimento.Visible = dividaPrincipal.Visible = dividaJuros.Visible = valorParcela.Visible = principal.Visible = juros.Visible = true;

            parcela.Width = "30px";
            vencimento.Width = "20px";
            dividaPrincipal.Width = "90px";
            dividaPrincipal.Width = "90px";

            gridDefinition.TableReadOnly = true;

            gridDefinition.FieldDefinitions.Add(parcela);
            gridDefinition.FieldDefinitions.Add(vencimento);
            gridDefinition.FieldDefinitions.Add(dividaPrincipal);
            gridDefinition.FieldDefinitions.Add(dividaJuros);
            gridDefinition.FieldDefinitions.Add(valorParcela);
            gridDefinition.FieldDefinitions.Add(principal);
            gridDefinition.FieldDefinitions.Add(juros);

            return gridDefinition;
        };

        PARCELASGERADAS.GetEntitiesMethod = (EntityViewBase entityViewBase, Criteria criteria) =>
        {
            var entities = new Entities<EntityBase>();
            return entities;
        };
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        TITULOS.UserDefinedCriteriaWhereClause = string.Format("A.HANDLE IN ({0})", ParcelasDaRenegociacao);
        PARMETROS.CommandExecute += PARMETROS_CommandExecute;
        PARMETROS.CommandExecuted += PARMETROS_CommandExecuted;
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        var aggregation = new EntityAggregation(GCSimulacao.GetEntityDefinition());

        foreach (var ap in ParcelasDaRenegociacao.Split(','))
        {
            aggregation.Add(long.Parse(ap));
        }

        PARMETROS.GetEntity().Fields[GCSimulacao.FieldNames.ParcelasDaRenegociacao] = aggregation;
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if ((Simulacao != null) && Simulacao.Handle.IsReallyValid())
            {
            if (!Simulacao.IsEditingOrCreating)
            {
                PreencherGridParcelasGeradas(false);
                if (Simulacao.AcordoHandle.IsReallyValid() && Simulacao.AcordoInstance.Status == GCAcordoStatusListaItens.ItemEfetivado)
                    ScriptManager.RegisterStartupScript(this, GetType(), "Renegociacao.aspx", "esconderBotoes(true);", true);
                else
                    ScriptManager.RegisterStartupScript(this, GetType(), "Renegociacao.aspx", "esconderBotoes(false);", true);
            }
        }
    }

    private void PARMETROS_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        switch (e.CommandName)
        {
            case "CMD_GERARPARCELAS":
                ControlaSimulacao();
                PARMETROS.ForceUpdate();
                break;

            case "Save":
                SalvarSimulacaoRenegociacao();
                break;

            case "Cancel":
                Page.CloseModalOrRedirectToPrevious();
                break;
        }
    }

    private void PARMETROS_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        switch (e.CommandName)
        {
            case "CMD_GERARPARCELAS":
                ValidarParametros();
                PreencherGridParcelasGeradas(true);
                break;

            case "CMD_EFETIVAR":
                EfetivarSimulacaoRenegociacao();
                break;
        }
    }

    private void ControlaSimulacao()
    {
        if (Simulacao.AcordoHandle.IsReallyValid() && Simulacao.AcordoInstance.Status == GCAcordoStatusListaItens.ItemEfetivado)
            ScriptManager.RegisterStartupScript(this, GetType(), "Renegociacao.aspx", "fecharGridParcelas(false);", true);
        else
            ScriptManager.RegisterStartupScript(this, GetType(), "Renegociacao.aspx", "fecharGridParcelas(true);", true);
    }

    private void ValidarParametros()
    {
        StringBuilder sb = new StringBuilder();

        if (Simulacao.FilialHandle.IsReallyInvalid())
            sb.AppendLine("A filial deve ser preenchida.");
        if (Simulacao.Data == null)
            sb.AppendLine("A data deve ser preenchida.");
        if (Simulacao.DataSimulacao == null)
            sb.AppendLine("A data da simulação deve ser preenchida.");
        if (Simulacao.PrimeiroVencimento == null)
            sb.AppendLine("A data do primeiro vencimento deve ser preenchida.");
        if (Simulacao.QtdeParcelas == null || Simulacao.QtdeParcelas == 0)
            sb.AppendLine("A quantidade de parcelas deve ser maior que zero.");

        if (Simulacao.ValorEntrada > 0 && Simulacao.VencimentoEntrada == null)
            sb.AppendLine("Se o documento possuir uma entrada o vencimento da mesma deve estar preenchido.");

        if (!string.IsNullOrEmpty(sb.ToString()))
            throw new BusinessException(sb.ToString());
    }

    private void PreencherGridParcelasGeradas(bool botaoGerar)
    {
        PARCELASGERADAS.GetEntitiesMethod = (EntityViewBase entityViewBase, Criteria criteria) =>
        {
            var entities = new Entities<EntityBase>();

            if (botaoGerar)
            {
                List<ValoresParcelasGeradasStruct> parcelasGeradas = CalcularValoresSimulacao();

                foreach (ValoresParcelasGeradasStruct parcGerada in parcelasGeradas)
                {
                    EntityBase parcelaGrid = (EntityBase)new EntityBuilder()
                        .AddString("PARCELA", parcGerada.Parcela)
                        .AddString("VENCIMENTO", parcGerada.Vencimento.ToString("dd/MM/yyyy"))
                        .AddDecimal("DIVIDAPRINCIPAL", parcGerada.DividaPrincipal)
                        .AddDecimal("DIVIDAJUROS", parcGerada.DividaJuros)
                        .AddDecimal("VALORPARCELA", parcGerada.ValorParcela)
                        .AddDecimal("PRINCIPAL", parcGerada.Principal)
                        .AddDecimal("JUROS", parcGerada.Juros)
                        .Build();
                    entities.Add(parcelaGrid);
                }
            }
            else
            {
                var prestacoes = PrestacaoDao.GetMany(a => a.SimulacaoHandle == Simulacao.Handle);

                if (prestacoes == null || prestacoes.Count <= 0)
                    return null;

                foreach (IGCSimulacaoPrestacao parcGerada in prestacoes)
                {
                    EntityBase parcelaGrid = (EntityBase)new EntityBuilder()
                        .AddString("PARCELA", parcGerada.Parcela)
                        .AddString("VENCIMENTO", parcGerada.Vencimento.ToDateTime().ToString("dd/MM/yyyy"))
                        .AddDecimal("DIVIDAPRINCIPAL", parcGerada.DividaPrincipal)
                        .AddDecimal("DIVIDAJUROS", parcGerada.DividaJuros)
                        .AddDecimal("VALORPARCELA", parcGerada.ValorParcela)
                        .AddDecimal("PRINCIPAL", parcGerada.ValorParcela - (parcGerada.DividaJuros - parcGerada.DividaPrincipal))
                        .AddDecimal("JUROS", parcGerada.DividaJuros - parcGerada.DividaPrincipal)
                        .Build();
                    entities.Add(parcelaGrid);
                }
            }

            return entities;
        };

        PARCELASGERADAS.ForceUpdate();
    }

    public void SalvarSimulacaoRenegociacao()
    {
        renegociadorDocumento.SalvarSimulacaoRenegociacao(Simulacao);
    }

    private void EfetivarSimulacaoRenegociacao()
    {
        renegociadorDocumento.EfetivarSimulacaoRenegociacao(Simulacao);
    }

    private List<ValoresParcelasGeradasStruct> CalcularValoresSimulacao()
    {
        return BennerContext.BusinessComponent.Call(
            "Benner.Corporativo.Financeiro.Renegociacao.RenegociadorDocumento, " +
            "Benner.Corporativo.Financeiro",
            "CalcularValoresSimulacao", Simulacao) as List<ValoresParcelasGeradasStruct>;
    }
}
