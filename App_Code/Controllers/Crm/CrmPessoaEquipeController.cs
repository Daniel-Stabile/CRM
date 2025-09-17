using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CrmPessoaEquipeController
/// </summary>
public class CrmPessoaEquipeController : Controller
{
    public ActionResult Verticais()
    {
        var DadosRota = this.RouteData.Values.ToList();
        var verticais = new VerticaisConcatenadasModel();

        try
        {
            foreach (var rota in DadosRota)
            {
                if (rota.Key == "Handle" && null != rota.Value)
                {
                    verticais.NomesVerticais = CrmPessoaequpeDao.CreateInstance().RetornaStringConcatenadaDasVerticaisDoUsuarioDessaConta(new Handle(rota.Value.ToString()));
                }
            }
            return View(verticais);
        }
        catch (Exception ex)
        {
            throw new ArgumentException("Erro ao buscar as verticais associadas a essa equipe.");
        }
    }
}

public class VerticaisConcatenadasModel
{
    public string NomesVerticais { get; set; }
}