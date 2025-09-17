using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CrmEmailsController
/// </summary>
public class CrmEmailsController : Controller
{
    public CrmEmailsController()
    {
    }

    [HttpGet]
    public ActionResult GetEmailsNaoLidos()
    {
        return Json(ListEmailsNaoLidos(), JsonRequestBehavior.AllowGet);
    }

    public ActionResult GetManyReceiver()
    {
        var routeData = this.RouteData.Values.ToList();
        var verticais = new VerticaisConcatenadasModel();

        try
        {
            foreach (var data in routeData)
            {
                if (data.Key == "Handle" && null != data.Value)
                {
                    verticais.NomesVerticais = ReturnReceiverNames(new Handle(data.Value.ToString()));
                }
            }
            return View(verticais);
        }
        catch (Exception ex)
        {
            throw new ArgumentException("Erro ao buscar as verticais associadas a essa equipe.");
        }
    }

    private string ReturnReceiverNames(Handle handle)
    {
        var query = new Query("SELECT STRING_AGG(NOME, ', ') DESTINATARIOS FROM Z_GRUPOUSUARIOS Z_GRUPOUSUARIOS WHERE Z_GRUPOUSUARIOS.HANDLE IN (SELECT DISTINCT(K_CRM_EMAILS_LIDOS.USUARIO) FROM K_CRM_EMAILS_LIDOS K_CRM_EMAILS_LIDOS JOIN STRING_SPLIT( (SELECT REPLACE(REPLACE(SUBSTRING(DESTINATARIOS, 0, LEN(DESTINATARIOS) - 1), '|', ''), '_', ',') FROM K_CRM_EMAILS WHERE HANDLE = :HANDLE), ','    ) ON VALUE = K_CRM_EMAILS_LIDOS.USUARIO)");
        query.Parameters.Add("HANDLE", handle);
        var result = query.Execute().FirstOrDefault();

        if(null == result.Fields["DESTINATARIOS"])
        {
            query = new Query("SELECT STRING_AGG(NOME, ', ') DESTINATARIOS FROM FILIAIS FILIAIS WHERE FILIAIS.HANDLE IN (SELECT DISTINCT(FILIAIS.HANDLE) FROM FILIAIS FILIAIS JOIN STRING_SPLIT( (SELECT REPLACE(REPLACE(SUBSTRING(FILIAIS, 0, LEN(FILIAIS) - 1), '|', ''), '_', ',') FROM K_CRM_EMAILS WHERE HANDLE = :HANDLE), ','    ) ON VALUE = FILIAIS.HANDLE)");
            query.Parameters.Add("HANDLE", handle);
            result = query.Execute().FirstOrDefault();

            if (null == result.Fields["DESTINATARIOS"])
            {
                query = new Query("SELECT STRING_AGG(TITULO, ', ') DESTINATARIOS FROM Z_PAPEIS Z_PAPEIS WHERE Z_PAPEIS.HANDLE IN (SELECT DISTINCT(Z_PAPEIS.HANDLE) FROM Z_PAPEIS Z_PAPEIS JOIN STRING_SPLIT( (SELECT REPLACE(REPLACE(SUBSTRING(PAPEIS, 0, LEN(PAPEIS) - 1), '|', ''), '_', ',') FROM K_CRM_EMAILS WHERE HANDLE = :HANDLE), ','    ) ON VALUE = Z_PAPEIS.HANDLE)");
                query.Parameters.Add("HANDLE", handle);
                result = query.Execute().FirstOrDefault();
            }
        }

        return null == result.Fields["DESTINATARIOS"] ? "ERRO AO IDENTIFICAR OS DESTINATÁRIOS!" : result.Fields["DESTINATARIOS"].ToString();

    }

    private string ListEmailsNaoLidos()
    {
        var criteria = new Criteria("A.USUARIO = :USUARIO AND A.LIDO = 'N'");
        criteria.Parameters.Add("USUARIO", BennerContext.Security.GetLoggedUserHandle());

        return JsonConvert.SerializeObject(Entity.GetMany(EntityDefinition.GetByName("K_CRM_EMAILS_LIDOS"), criteria));
    }
}