using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orcamentoImportarOrcamentoPage : WesPage
{
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        umfXMLSReceita.Title = "Arraste seu arquivo aqui";
        umfXMLSReceita.SubTitle = "ou se preferir, clique para fazer upload";
        var rq = new Benner.Erp.DataContracts.UploadMultipleFilesRQ()
        {
            BusinessComponentTypeName = "Benner.Corporativo.Orcamento.Elaboracao.ImportarOrcamento, Benner.Corporativo.Orcamento",
            Description = "Importar orçamento - @FILENAME"
        };
        rq.Params.TransitoryVars["HANDLEFILIAL"] = Page.Request["filial"];
        rq.Params.TransitoryVars["OPCAO"] = Page.Request["opcao"];

        if (this.GetLinkDefinition().Parameters.ContainsKey("versaoOrcamento"))
        {
            rq.Params.TransitoryVars["versaoOrcamento"] = this.GetLinkDefinition().Parameters["versaoOrcamento"];
        }

        umfXMLSReceita.RequestSubmit = rq;

        if (IsPostBack)
            ScriptManager.RegisterStartupScript(this, GetType(), "CloseModalAndRefresh", "CloseModalAndRefresh();", true);
    }
}
