using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Newtonsoft.Json;
using Benner.Tecnologia.Wes.Components;

public partial class Pages_K_CRM_PESSOAS_e_uc_PerPreVendedorMesAnterior : UserControlBase<EntityBase>
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string GetValues()
    {
        Query query = new Query();
        query.CommandText.AppendLine(@" SELECT  
                                                C.NOME, ");
        query.CommandText.AppendLine(@"          (SELECT
                                                      ROUND(SUM(
                                                        ROUND(
                                                          (CAST(DD.REALIZADO AS FLOAT) * 100) / CAST(DD.META AS FLOAT),
                                                          2)
                                                        ) / COUNT(DD.HANDLE), 2) AS TOTAL
                                                   FROM K_CRM_PERFORMANCEITEM DD
                                                   JOIN K_CRM_PERFORMANCESEMANA AS AA ON DD.PERFORMANCESEMANA = AA.HANDLE
                                                   JOIN K_CRM_PERFORMANCEANO AS BB ON AA.PERFORMANCEANO = BB.HANDLE
                                                   WHERE DD.TIPO = D.TIPO
                                                   AND(
                                                      DATEPART(m, AA.DATAINICIO) = DATEPART(m, DATEADD(m, -1, getdate()))
                                                      OR
                                                      DATEPART(m, AA.DATAFIM) = DATEPART(m, DATEADD(m, -1, getdate()))
                                                   )
                                                   AND DATEPART(yyyy, BB.ANO) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
                                                 ) AS PRC ");
        query.CommandText.AppendLine(" FROM K_CRM_PERFORMANCEITEM D");
        query.CommandText.AppendLine(" JOIN K_CRM_PERFORMANCESEMANA A ON D.PERFORMANCESEMANA = A.HANDLE");
        query.CommandText.AppendLine(" JOIN K_CRM_PERFORMANCEANO B ON B.HANDLE = A.PERFORMANCEANO");
        query.CommandText.AppendLine(" JOIN K_CRM_PERFORMANCETIPO C ON C.HANDLE = D.TIPO");
        query.CommandText.AppendLine(" WHERE B.USUARIO = 142");
        query.CommandText.AppendLine(@" AND (
                                            DATEPART(m, A.DATAINICIO) = DATEPART(m, DATEADD(m, -1, getdate()))
                                            OR
                                            DATEPART(m, A.DATAFIM) = DATEPART(m, DATEADD(m, -1, getdate()))
                                            )
                                        AND DATEPART(yyyy, B.ANO) = DATEPART(yyyy, DATEADD(m, -1, getdate()))");
        query.CommandText.AppendLine(" GROUP BY C.NOME,D.TIPO");

        Entities<EntityBase> resultSet = query.Execute();
        List<Performance> listP = new List<Performance>();
        foreach (EntityBase ent in resultSet)
        {
            Performance item = new Performance();
            item.Nome = ent.Fields["NOME"].ToString();
            item.Prc = Convert.ToDecimal(ent.Fields["PRC"].ToString());
            listP.Add(item);
        }
        ;
        return JsonConvert.SerializeObject(listP);
    }

    public class Performance
    {
        public string Nome { get; set; }
        public Decimal Prc { get; set; }
        public Performance() { }
    }
}