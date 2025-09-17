using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Collections.Generic;
using System.Linq;

using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;

public partial class Pages_Home : WesPage
{
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        umfXMLSReceita.Title = "Arraste seus arquivos aqui";
        umfXMLSReceita.SubTitle = "ou se preferir clique, para fazer upload";
        var rq = new Benner.Erp.DataContracts.UploadMultipleFilesRQ()
        {
            BusinessComponentTypeName = "Benner.Corporativo.Comercial.DocumentosEletronicos.DocumentoEletronicoImportarInutilizacao, Benner.Corporativo.Comercial",
            Description = "@FILENAME - Importar arquivo"
        };
        rq.Params.TransitoryVars["HANDLEFILIAL"] = Page.Request["filial"];
        rq.Params.TransitoryVars["OPCAO"] = Page.Request["opcao"];

        umfXMLSReceita.RequestSubmit = rq;
    }

}