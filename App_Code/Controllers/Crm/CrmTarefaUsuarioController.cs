using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Models.Calendar;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Summary description for CrmController
/// </summary>
namespace Controllers.Crm
{
    public class CrmTarefaUsuarioController : Controller
    {
        public CrmTarefaUsuarioController()
        {
            //
            // TODO: Add constructor logic here
            //
            

        }
		
		[HttpGet]
		public ActionResult GetTarefaUsuarioMes(int mes, int ano, int usuario)
        {
            string response = QueryCrm(mes,ano,usuario);

            return Json(response, JsonRequestBehavior.AllowGet);

        }
		
        [HttpGet]
        public ActionResult GetTarefaUsuario(string id)
        {
            string response = StartTarefaUsuarioFormView(id);

            return Json(new { url = response }, JsonRequestBehavior.AllowGet);

        }

        private string StartTarefaUsuarioFormView(string id)
        {
            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_TAREFAUSUARIO",
                IsModalPage = true,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_CRM_TAREFAUSUARIO/form.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE = :HANDLE",
                    new List<Parameter>(){
                        new Parameter("HANDLE",id)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true).Split('\'').ElementAtOrDefault(1);

        }
		
		private string QueryCrm(int mes, int ano, int usuario)
        {
            List<CalendarEvent> listEvents = new List<CalendarEvent>();		
			
            Query query = new Query();

            query.CommandText.AppendLine(" SELECT A.HANDLE ID,");
            query.CommandText.AppendLine("        (CAST(D.NOME AS VARCHAR) +' - ' + CAST(B.NOME AS VARCHAR)) AS TITLE,");
            query.CommandText.AppendLine("        A.DATAAGENDAMENTO");
            query.CommandText.AppendLine(" FROM K_CRM_TAREFAUSUARIO A");
            query.CommandText.AppendLine(" JOIN K_CRM_TAREFAS B ON A.TAREFA = B.HANDLE");
            query.CommandText.AppendLine(" JOIN K_CRM_PESSOAS C ON A.PESSOA = C.HANDLE");
            query.CommandText.AppendLine(" JOIN Z_GRUPOUSUARIOS D ON A.RESPONSAVEL = D.HANDLE");
            query.CommandText.AppendLine(" WHERE YEAR(A.DATAAGENDAMENTO) = :ANO");
            query.CommandText.AppendLine(" AND MONTH(A.DATAAGENDAMENTO) = :MES");
            query.CommandText.AppendLine(" AND C.EMPRESA = :EMPRESA");

            if (usuario != 0)
                query.CommandText.AppendLine(" AND A.USUARIO = :USUARIO");

            query.Parameters.Add("MES", mes);
            query.Parameters.Add("ANO", ano);
            query.Parameters.Add("EMPRESA", Company.Current.Handle);

            if (usuario != 0)
                query.Parameters.Add("USUARIO", BennerContext.Security.GetLoggedUserHandle());

            Entities<EntityBase> resultList = query.Execute();
            foreach (EntityBase ent in resultList)
            {
                DateTime start;
                DateTime.TryParseExact(
                        ent.Fields["DATAAGENDAMENTO"].ToString(),
                        "dd/MM/yyyy HH:mm:ss",
                        System.Globalization.CultureInfo.InvariantCulture,
                        System.Globalization.DateTimeStyles.None, out start);

                listEvents.Add(new CalendarEvent(ent.Fields["ID"].ToString(), ent.Fields["TITLE"].ToString(), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), "#a537fd"));

            }
			
			return JsonConvert.SerializeObject(listEvents);
        }
    }
}

