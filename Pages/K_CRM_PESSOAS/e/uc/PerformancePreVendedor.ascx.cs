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

public partial class Pages_K_CRM_PESSOAS_e_uc_PerformancePreVendedor : UserControlBase<EntityBase>
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string GetValues()
    {
        Query query = new Query();
        query.CommandText.AppendLine(@" SELECT  C.NOME, ");
        query.CommandText.AppendLine("          ROUND((CAST(DD.REALIZADO AS FLOAT) * 100 ) /CAST(DD.META AS FLOAT),2) AS PRC ");
        query.CommandText.AppendLine(" FROM K_CRM_PERFORMANCEITEM DD");
        query.CommandText.AppendLine(" JOIN K_CRM_PERFORMANCESEMANA A ON DD.PERFORMANCESEMANA = A.HANDLE");
        query.CommandText.AppendLine(" JOIN K_CRM_PERFORMANCEANO B ON B.HANDLE = A.PERFORMANCEANO");
        query.CommandText.AppendLine(" JOIN K_CRM_PERFORMANCETIPO C ON C.HANDLE = DD.TIPO");
        query.CommandText.AppendLine(" WHERE B.USUARIO = 142");
        query.CommandText.AppendLine(" AND DATEADD(DAY,-7,GETDATE()) BETWEEN A.DATAINICIO AND A.DATAFIM");

        Entities<EntityBase> resultSet = query.Execute();
        List<Performance> listP = new List<Performance>();
        foreach (EntityBase ent in resultSet)
        {
            Performance item = new Performance();
            item.Nome   = ent.Fields["NOME"].ToString();
            item.Prc    = Convert.ToDecimal( ent.Fields["PRC"].ToString());
            listP.Add(item);
        }
        ;
        return JsonConvert.SerializeObject(listP);
    }

    public class Performance
    {
        public string  Nome { get; set; }
        public Decimal Prc { get; set; }
        public Performance() { }
    }

}