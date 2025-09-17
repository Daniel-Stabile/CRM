using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Benner.Corporativo.WebServices.Layouts.Comercial.Integracao;
using Benner.Tecnologia.Business;
using Benner.Corporativo.Cloud;
using Benner.Corporativo.Cloud.Vendas;
using Benner.ERP.Comum;
using System.IO;
using Benner.Corporativo.Definicoes.Administracao;
using Benner.Corporativo.Definicoes.Tributos;

public class contextTiles
{
    public string Values;
    public string Label;
    public string Title;
    public string Color;
}

public partial class Erp_vendas_nfs_grid : WesPage
{
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (Request["v"] == "s")
            return;

        if (!ValidarEmissaoNotaFiscalServico())
            Response.Redirect("~/Erp/Vendas/NFS/Configuracao.aspx");
    }

    private bool ValidarEmissaoNotaFiscalServico()
    {
        if (Branch.Current == null)
        {
            // Todas a filiais selecionadas não busca parâmetros
            return true;
        }

        //Validar informações da empresa
        Filiais filiais = Filiais.Get(Branch.Current.Handle);

        if (string.IsNullOrEmpty(filiais.Cgc))
            return false;

        //Adicionar válidações da empresa
        //Validar certificado digital
        Criteria criteria = new Criteria("A.FILIAL = :FILIAL");
        criteria.Parameters.Add(new Benner.Tecnologia.Common.Parameter("FILIAL", Branch.Current.Handle));

        var parametroFilial = TRParametroFilial.Get(criteria);
        if (parametroFilial.ArquivoAssinaturaNfe != null)
        {

            Guid temporaryId = Guid.NewGuid();
            (parametroFilial.Fields[TRParametroFilial.FieldNames.ArquivoAssinaturaNfe] as FileField).TemporaryId = temporaryId;

            FileField.RetrieveContents(parametroFilial, TRParametroFilial.FieldNames.ArquivoAssinaturaNfe, null);
            string temporaryFilePath = Path.Combine(BennerConfiguration.TemporaryContentsDirectory, temporaryId.ToString());

            try
            {
                LeitorCertificadoDigital leitor = new LeitorCertificadoDigital();
                leitor.CarregaDeArquivo(temporaryFilePath, parametroFilial.SenhaAssinaturaNfe);

                if (leitor.Validade < DateTime.Now)
                    return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
        return true;
    }

    public static string SQLTotais()
    {

        return @"   SELECT  A.STATUSNFE, 
                            SUM(A.VALORNOMINAL) VALOR
                      FROM FN_DOCUMENTOS A
                           JOIN CM_OPERACOESFATURAMENTO OP ON A.OPERACAOFATURAMENTO = OP.HANDLE
                           JOIN FN_TIPOSDOCUMENTOS TIPODOC ON A.TIPODOCUMENTO = TIPODOC.HANDLE
                     WHERE  A.EMPRESA = :EMPRESA
                           AND TIPODOC.EHNFESERVICO = 'S'
                           AND
                           (
                               (
                                   A.ABRANGENCIA = 'A'
                               )
                               OR
                               (
                                   (
                                       A.ABRANGENCIA = 'N'
                                   )
                                   AND
                                   (
                                       A.TIPOREGISTRO = 11
                                   )
                               )
                           )
                    GROUP BY A.STATUSNFE";
    }

    [WebMethod]
    public static List<contextTiles> GetTotais()
    {
        var alerts = new List<contextTiles>();

        EntityDefinition itemDefinition = EntityDefinition.FromQuery(SQLTotais());
        Criteria itemCriteria = new Criteria(new Benner.Tecnologia.Common.Parameter("EMPRESA", 1));
        Entities<EntityBase> itensDocumento = Entity.GetMany(itemDefinition, itemCriteria);
        try
        {
            var valueFieldDefinition = new CurrencyFieldDefinition() { Decimals = 2 };

            foreach (var itens in itensDocumento)
            {

                var valorNotas = valueFieldDefinition.ToUI(itens.Fields["VALOR"]);

                switch (Convert.ToInt16(itens.Fields["STATUSNFE"]))
                {
                    case 1: // notas cadastradas pendentes de emissão
                        alerts.Add(new contextTiles()
                        {
                            Values = valorNotas,
                            Label = "blue",
                            Title = "Cadastradas"
                        });
                        break;

                    case 2: // notas emitidas mas aguardando autorização da prefeitura
                        alerts.Add(new contextTiles()
                        {
                            Values = valorNotas,
                            Label = "yellow-crusta",
                            Title = "Pendentes"
                        });
                        break;
                    case 6: // notas autorizadas pela prefeitura
                        alerts.Add(new contextTiles()
                        {
                            Values = valorNotas,
                            Label = "green-jungle",
                            Title = "Autorizadas"
                        });
                        break;
                    case 7: // notas canceladas
                        alerts.Add(new contextTiles()
                        {
                            Values = valorNotas,
                            Label = "red-thunderbird",
                            Title = "Canceladas"
                        });
                        break;
                }

            }
        }
        catch (Exception e)
        {
            throw new Exception(e.Message); // ignored
        }

        return alerts;

    }
}