using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Web.UI.WebControls;
using Benner.Corporativo.Definicoes.Comercial;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Definicoes.Materiais;
using Ninject;
using Parameter = Benner.Tecnologia.Common.Parameter;


public partial class FinanceiroSegundaViaBoletosPage : WesPage
{
    [Inject]
    public IFNDocumentoDao FNDocumentoDao { get; set; }
    [Inject]
    public IPDProdutoDao PDProdutoDao { get; set; }
    [Inject]
    public ICMItemDao CMItemDao { get; set; }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        SEGUNDAVIABOLETOS.GridView.RowDataBound += GridView_RowDataBound;
    }

    private void GridView_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        var entity = e.Row.DataItem as EntityBase;

        RenderService(e, entity);
    }

    private void RenderService(GridViewRowEventArgs e, EntityBase entity)
    {
        string link = string.Empty;
        IPDProduto prod = null;
        IFNDocumento doc = FNDocumentoDao.GetFirstOrDefault(((EntityAssociation)entity.Fields["DOCUMENTO"]).Handle.Value);
        IFNDocumento docOriginal = FNDocumentoDao.GetFirstOrDefault(new Criteria("A.DOCUMENTOORIGEM = :ORG", new Parameter("ORG", doc.Handle)));

        if (docOriginal != null)
            doc = docOriginal;

        ICMItem item = CMItemDao.GetFirstOrDefault(new Criteria("A.DOCUMENTO = :DOC", new Parameter("DOC", doc.Handle)));

        if (item != null)
            prod = PDProdutoDao.GetFirstOrDefault(item.ProdutoHandle);

        if (doc.PodeGerarDANFSe && prod != null && prod.Tipo == PDProdutoTipoListaItens.ItemServico)
        {
            link = BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Comercial.DocumentosEletronicos.NFSe.NFSePackMonitor, Benner.Corporativo.Comercial",
                    "GerarDANFSEReportLink", doc.Handle.ToLong()) as string;


            e.Row.CellByName("CUSTOM_DANFE").Text = string.Format(@"<a href='{0}' target='_blank' rel='noopener noreferrer'>
                                                            <i class='fa fa-download' style=' cursor: pointer' title='Baixar DANFE'></i>
                                                          </a>", link);
        }
        else if (prod != null && prod.Tipo != PDProdutoTipoListaItens.ItemServico)
        {
            e.Row.CellByName("CUSTOM_DANFE").Text = string.Format(@"<i onclick='BaixarDANFE({0})' class='fa fa-download' style=' cursor: pointer' title='Baixar DANFE'></i>", doc.Handle);
        }

        if (entity.Fields["ARQUIVOXML"] != null || (entity.Fields["ARQUIVOXMLNFSE"] != null))
            e.Row.CellByName("CUSTOM_XML").Text = string.Format("<i onclick='BaixarXML({0}, \"{1}\")' class='fa fa-download' style=' cursor: pointer' title='Baixar XML'></i>", entity.Fields["HANDLEDOCORIGEMTIPOA"],
                entity.Fields["ARQUIVOXML"] != null ? "ARQUIVOXML" : "ARQUIVOXMLNFSE");

    }
}
