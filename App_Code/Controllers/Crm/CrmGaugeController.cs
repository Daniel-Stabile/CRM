using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Models.Crm;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CrmGaugeController
/// </summary>
namespace Controllers.Crm
{
    public class CrmGaugeController : Controller
    {
        public CrmGaugeController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public ActionResult GaugeKpi()
        {
            return PartialView();
        }

        [HttpGet]
        public ActionResult GetKpiVertical()
        {
            string response = GetKpiVerticais();

            return Json(new { resultado = response }, JsonRequestBehavior.AllowGet);

        }

        public string GetKpiVerticais()
        {
            Query query = new Query();
            query.CommandText.AppendLine(@"
                        SELECT  C.NOME,
                                (
                                    SELECT ROUND(COALESCE(CAST(SUM(AC.VALORFINAL) AS FLOAT) * 100 / CAST(A.VALORMETA AS FLOAT), 0), 2)
                                    FROM K_CRM_PESSOAOPORTUNIDADES AA
                                    JOIN K_CRM_PESSOAOPORTUNIDADESPROD AB ON AA.HANDLE = AB.OPORTUNIDADE
                                    JOIN K_CRM_PESSOAOPORTUNIDADESITENS AC ON AB.HANDLE = AC.PRODUTO
                                    WHERE YEAR(AA.DATAFECHAMENTO) = YEAR(B.DATA)
                                    AND AB.PRODUTO = A.VERTICAL
                                    AND AB.STATUS = 1
                                    AND AC.STATUS = 1
                                    AND AA.STATUS = 10) TOTALVENDA,
                                (
                                    SELECT ROUND(COALESCE(CAST(SUM(AC.VALORFINAL) AS FLOAT) * 100 / CAST(A.VALORFATURAMENTO AS FLOAT), 0), 2)
                                    FROM K_CRM_PESSOAOPORTUNIDADES AA
                                    JOIN K_CRM_PESSOAOPORTUNIDADESPROD AB ON AA.HANDLE = AB.OPORTUNIDADE
                                    JOIN K_CRM_PESSOAOPORTUNIDADESITENS AC ON AB.HANDLE = AC.PRODUTO
                                    WHERE YEAR(AA.DATAFATURAMENTO) = YEAR(B.DATA)
                                    AND AB.PRODUTO = A.VERTICAL
                                    AND AB.STATUS = 1
                                    AND AC.STATUS = 1
                                    AND AA.STATUS = 10) TOTALFATURAMENTO
                        FROM K_CRM_METASVERTICAL A
                        JOIN K_CRM_METAS B ON A.META = B.HANDLE
                        JOIN K_CRM_PRODUTOS C ON A.VERTICAL = C.HANDLE
                        WHERE YEAR(B.DATA) = YEAR(GETDATE())");

            Entities<EntityBase> resultSet = query.Execute();
            List<KpiVertical> listP = new List<KpiVertical>();
            foreach (EntityBase ent in resultSet)
            {
                KpiVertical item = new KpiVertical();
                item.Nome = ent.Fields["NOME"].ToString();
                item.PrcVenda = Convert.ToDecimal(ent.Fields["TOTALVENDA"].ToString());
                item.PrcFaturamento = Convert.ToDecimal(ent.Fields["TOTALFATURAMENTO"].ToString());
                listP.Add(item);
            }

            return JsonConvert.SerializeObject(listP);
        }
    }
}

    