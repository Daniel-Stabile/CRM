using Benner.Tecnologia.Common;
using System.Web.Mvc;

/// <summary>
/// Summary description for AlocacaoContaController
/// </summary>
public class AlocacaoContaController : Controller
{
    public ActionResult GravarAlocacaoItemConta(string contas, string item)
    {
        string retorno = BennerContext.BusinessComponent.Call("Benner.Corporativo.Contabil.Alocacao.CadastroAlocacao, Benner.Corporativo.Contabil", "CadastrarAlocacao", contas, item) as string;

        return Json(retorno, JsonRequestBehavior.AllowGet);
    }
}