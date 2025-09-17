using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdiantamentosLancamentosPage : WesPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LANCAMENTOSADT.CommandExecute += LANCAMENTOSADT_CommandExecute;
    }

    private void LANCAMENTOSADT_CommandExecute(Object sender, GridCommandExecuteArgs e)
    {
        string parcelasCompensadas = HttpContext.Current.Request.QueryString.Get("ParcelasCompensadas");
        var tipo = Convert.ToInt32(HttpContext.Current.Request.QueryString.Get("Tipo"));
        var pessoa = Convert.ToInt64(HttpContext.Current.Request.QueryString.Get("Pessoa"));

        if (e.Command.Name == "CMD_EXCLUIRCONTABILIZACAO")
        {
            if (!string.IsNullOrEmpty(parcelasCompensadas))
            {
                var parameters = new object[2]
               {
                    parcelasCompensadas,
                    tipo
               };
                var result = BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.AdiantamentoDevolucoes.Movimentacoes.Processamento.ExcluirContabilizacao, Benner.Corporativo.Financeiro", 
                                                                  "ExcluirContab", 
                                                                  parameters);
            }
        }
        else if (e.Command.Name == "CMD_CONTABILIZAR")
        {
            if (!string.IsNullOrEmpty(parcelasCompensadas))
            {
                var parameters = new object[3]
               {
                    parcelasCompensadas,
                    tipo,
                    pessoa
               };
                var result = BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.AdiantamentoDevolucoes.Movimentacoes.Processamento.Contabilizar, Benner.Corporativo.Financeiro", 
                                                                  "Contabiliza", 
                                                                  parameters);
            }
        }
    }

    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("RESUMO_LANCAMENTO", "LANCAMENTOSADT", "LANCAMENTOSCONNECTION");
        AddWebPartStaticConnection("RESUMOGRID", "LANCAMENTOSADT", "LANCAMENTOSGRIDCONNECTION");
    }
}