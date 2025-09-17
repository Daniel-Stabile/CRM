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
/// Descrição resumida de CalendarioCrmController
/// </summary>
namespace Controllers.CalendarioCrm
{
    public class CalendarioCrmController : Controller
    {
    
        public CalendarioCrmController()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        
        public ActionResult CalendarioUsuario()
        {
            return PartialView();
        }

        public ActionResult Calendario()
        {
            return PartialView();
        }
        
        [HttpGet]
        public ActionResult AtividadesUsuarioMes(int mes, int ano, int usuario)
        {
            string response = JsonAtividadesUsuarioMes(mes, ano, usuario);

            return Json(response, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult GetAtendimento(string id)
        {
            string response = StartAtendimentoFormView(id);

            return Json(new { url = response }, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult GetAtendimentoByInteracao(string id)
        {
            string response = StartAtendimentoByInteracaoFormView(id);

            return Json(new { url = response }, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult ExibeModalEvento(string start, string end)
        {
            DateTime dtStart = DateTime.ParseExact(start, "dd-MM-yyyy HH:mm", CultureInfo.CreateSpecificCulture("pt-BR")).AddDays(1);
            DateTime dtEnd = DateTime.ParseExact(end, "dd-MM-yyyy HH:mm", CultureInfo.CreateSpecificCulture("pt-BR"));

            string response = StartVTs(dtStart, dtEnd);

            return Json(new { url = response }, JsonRequestBehavior.AllowGet);

        }
        
        private string JsonAtividadesUsuarioMes(int mes, int ano, int usuario)
        {
            List<CalendarEvent> listEvents = new List<CalendarEvent>();
            Query query = new Query();
            
            query.CommandText.AppendLine(" SELECT   A.HANDLE ID,");

            if (usuario == 0)
            {
                query.CommandText.AppendLine("      CASE");
                query.CommandText.AppendLine("          WHEN C.APELIDO IS NULL THEN (CAST(C.NOME AS VARCHAR(50)) +' - ' + CAST(D.NOME AS VARCHAR))");
                query.CommandText.AppendLine("          WHEN C.APELIDO IS NOT NULL THEN (CAST(C.APELIDO AS VARCHAR(50))+' - ' + CAST(D.NOME AS VARCHAR))");
                query.CommandText.AppendLine("      END TITLE,");
            }
            else
            {
                query.CommandText.AppendLine("      CASE");
                query.CommandText.AppendLine("          WHEN C.APELIDO IS NULL THEN (CAST(C.NOME AS VARCHAR(50)) +' - ' + CAST(B.NOME AS VARCHAR))");
                query.CommandText.AppendLine("          WHEN C.APELIDO IS NOT NULL THEN (CAST(C.APELIDO AS VARCHAR(50))+' - ' + CAST(B.NOME AS VARCHAR))");
                query.CommandText.AppendLine("      END TITLE,");
            }

            query.CommandText.AppendLine("          CASE");
            query.CommandText.AppendLine("              WHEN A.DATACONCLUSAO IS NULL THEN A.DATAAGENDAMENTO");
            query.CommandText.AppendLine("              WHEN A.DATACONCLUSAO IS NOT NULL THEN A.DATACONCLUSAO");
            query.CommandText.AppendLine("          END DATA,");
            query.CommandText.AppendLine("          CASE");
            query.CommandText.AppendLine("              WHEN A.STATUS = 1 AND A.DATAAGENDAMENTO < GETDATE()                     THEN '#f03434'");
            query.CommandText.AppendLine("              WHEN A.STATUS = 1 AND DATEDIFF(day, A.DATAAGENDAMENTO, GETDATE()) = 0   THEN '#f9690e'");
            query.CommandText.AppendLine("              WHEN A.STATUS = 1 AND A.DATAAGENDAMENTO > GETDATE()                     THEN '#3498db'");
            query.CommandText.AppendLine("              WHEN A.STATUS = 2                                                       THEN '#26c281'");
            query.CommandText.AppendLine("              WHEN A.STATUS = 3                                                       THEN '#95a5a6'");
            query.CommandText.AppendLine("          END COLOR");
            query.CommandText.AppendLine(" FROM K_CRM_TAREFAUSUARIO A");
            query.CommandText.AppendLine(" JOIN K_CRM_TAREFAS B ON A.TAREFA = B.HANDLE");
            query.CommandText.AppendLine(" JOIN K_CRM_PESSOAS C ON A.PESSOA = C.HANDLE");
            //////////////// INICIO - ATULIZAÇÃO CALENDÁRIO
            query.CommandText.AppendLine(" JOIN K_CRM_PESSOAVERTICAL V ON V.PESSOA = C.HANDLE AND V.VERTICAL = A.VERTICAL");
            //////////////// FIM - ATULIZAÇÃO CALENDÁRIO
            query.CommandText.AppendLine(" JOIN Z_GRUPOUSUARIOS D ON A.RESPONSAVEL = D.HANDLE");
            query.CommandText.AppendLine(" WHERE 1=1");
            query.CommandText.AppendLine(" AND ((YEAR(A.DATAAGENDAMENTO) = :ANO");
            query.CommandText.AppendLine(" AND MONTH(A.DATAAGENDAMENTO) = :MES )");
            query.CommandText.AppendLine(" OR (YEAR(A.DATACONCLUSAO) = :ANO");
            query.CommandText.AppendLine(" AND MONTH(A.DATACONCLUSAO) = :MES ))");
            query.CommandText.AppendLine(" AND C.EMPRESA = :EMPRESA");
            query.CommandText.AppendLine(" AND B.APARECECALENDARIO = 'S'");

            if (Branch.Current != null)
                query.CommandText.AppendLine(" AND (C.FILIAL = :FILIAL OR V.FILIAL = :FILIAL)");// ATULIZAÇÃO CALENDÁRIO - Filtro de vertical

            if (usuario != 0)
                query.CommandText.AppendLine(" AND A.RESPONSAVEL = :USUARIO");

            query.Parameters.Add("MES", mes);
            query.Parameters.Add("ANO", ano);
            query.Parameters.Add("EMPRESA", Company.Current.Handle);

            if (Branch.Current != null)
                query.Parameters.Add("FILIAL", Branch.Current.Handle);

            if (usuario != 0)
                query.Parameters.Add("USUARIO", BennerContext.Security.GetLoggedUserHandle());

            Entities<EntityBase> resultList = query.Execute();
            foreach (EntityBase ent in resultList)
            {
                DateTime start;
                DateTime.TryParseExact(
                        ent.Fields["DATA"].ToString(),
                        "dd/MM/yyyy HH:mm:ss",
                        System.Globalization.CultureInfo.InvariantCulture,
                        System.Globalization.DateTimeStyles.None, out start);

                listEvents.Add(new CalendarEvent(ent.Fields["ID"].ToString(), ent.Fields["TITLE"].ToString(), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), ent.Fields["COLOR"].ToString()));
            }

                return JsonConvert.SerializeObject(listEvents);
        }

        private void QueryCrm(int mes, int ano, int usuario, List<CalendarEvent> listEvents)
        {
            //DateTime start = DateTime.Now;

            //listEvents.Add(new CalendarEvent("123","CRM", start.ToString("yyyy-MM-ddTHH:mm:sszzz"), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), "#a537fd"));

            Query query = new Query();

            query.CommandText.AppendLine(" SELECT A.HANDLE ID,");
            query.CommandText.AppendLine("        (CAST(D.NOME AS VARCHAR) +' - CRM - ' + CAST(B.NOME AS VARCHAR)) AS TITLE,");
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
        }

        private string StartAtendimentoFormView(string id)
        {
            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_SUP_ATENDIMENTO",
                IsModalPage = true,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_SUP_ATENDIMENTO/resumo.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE = :HANDLE",
                    new List<Parameter>(){
                        new Parameter("HANDLE",id)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true).Split('\'').ElementAtOrDefault(1);

        }

        private string StartAtendimentoByInteracaoFormView(string id)
        {
            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_SUP_ATENDIMENTO",
                IsModalPage = true,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_SUP_ATENDIMENTO/resumo.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE IN (SELECT ATENDIMENTO FROM K_SUP_ATENDIMENTO_INTERACAO WHERE HANDLE = :HANDLE)",
                    new List<Parameter>(){
                        new Parameter("HANDLE",id)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true).Split('\'').ElementAtOrDefault(1);

        }

        private string StartVTs(DateTime start, DateTime end)
        {

            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_SUP_ATENDIMENTO",
                IsModalPage = true,
                TargetFormMode = FormLinkDefinition.FormMode.Insert,
                Url = "~/Pages/K_SUP_ATENDIMENTO/form.aspx",
                WhereClause =
                    new WhereClause(@"
                        A.DATAINICIO = :INICIO AND 
                        A.DATAFIM = :FIM AND 
                        A.MODELO = 2 ",
                    new List<Parameter>(){
                        new Parameter("INICIO",start),
                        new Parameter("FIM",end)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true).Split('\'').ElementAtOrDefault(1);

        }

    }
}