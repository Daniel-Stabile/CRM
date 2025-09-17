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
/// Summary description for CalendarioController
/// </summary>
namespace Controllers.Calendario
{
    public class CalendarioController : Controller
    {
        public CalendarioController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public ActionResult CalendarioEmpresa()
        {
            return PartialView();
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
        public ActionResult AtendimentosMes(int mes, int ano, int usuario)
        {
            string response = JsonAtendimentosMes(mes, ano, usuario);

            return Json(response, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult AgendamentosUsuarioMes(int mes, int ano, int usuario)
        {
            string response = JsonAgendamentosUsuarioMes(mes, ano, usuario);

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

        private string JsonInteracoesDia()
        {
            List<CalendarEvent> listEvents = new List<CalendarEvent>();
            Query query = new Query();

            query.CommandText.AppendLine("SELECT A.HANDLE ID,");
            query.CommandText.AppendLine("       (CAST(C.NOME AS VARCHAR) + ' - ' + LEFT(CAST(A.INTERACAO AS VARCHAR), 15)) AS TITLE,");
            query.CommandText.AppendLine("       A.DATAINICIO,");
            query.CommandText.AppendLine("       CASE");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NOT NULL THEN A.DATAFIM");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NULL THEN GETDATE()");
            query.CommandText.AppendLine("       END DATAFIM,");
            query.CommandText.AppendLine("       CASE");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NULL AND A.FATURADO = 'N' AND A.APOIO = 'N' THEN '#1E8BC3'");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NOT NULL AND A.FATURADO = 'N' AND A.APOIO = 'N' THEN '#C5EFF7'");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NULL AND A.FATURADO = 'S' AND A.APOIO = 'N' THEN '#C8F7C5'");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NOT NULL AND A.FATURADO = 'S' AND A.APOIO = 'N' THEN '#26C281'");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NULL AND A.APOIO = 'S' THEN '#9B59B6'");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NOT NULL AND A.APOIO = 'S' THEN '#DCC6E0'");
            query.CommandText.AppendLine("      END COLOR");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO_INTERACAO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO B ON A.ATENDIMENTO = B.HANDLE");
            query.CommandText.AppendLine("JOIN Z_GRUPOUSUARIOS C ON A.USUARIO = C.HANDLE");
            query.CommandText.AppendLine("WHERE DAY(A.DATAINICIO) = DAY(GETDATE())");

            Entities<EntityBase> resultList = query.Execute();
            foreach (EntityBase ent in resultList)
            {
                DateTime start;
                DateTime end;
                DateTime.TryParseExact(
                        ent.Fields["DATAINICIO"].ToString(),
                        "dd/MM/yyyy HH:mm:ss",
                        System.Globalization.CultureInfo.InvariantCulture,
                        System.Globalization.DateTimeStyles.None, out start);

                DateTime.TryParseExact(
                            ent.Fields["DATAFIm"].ToString(),
                            "dd/MM/yyyy HH:mm:ss",
                            System.Globalization.CultureInfo.InvariantCulture,
                            System.Globalization.DateTimeStyles.None, out end);


                listEvents.Add(new CalendarEvent(ent.Fields["ID"].ToString(), ent.Fields["TITLE"].ToString(), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), end.ToString("yyyy-MM-ddTHH:mm:sszzz"), ent.Fields["COLOR"].ToString()));
            }

            return JsonConvert.SerializeObject(listEvents);
        }

        private string JsonAtendimentosMes(int mes, int ano, int usuario)
        {
            List<CalendarEvent> listEvents = new List<CalendarEvent>();
            Query query = new Query();

            query.CommandText.AppendLine(" SELECT A.HANDLE ID,");
            query.CommandText.AppendLine("      (CAST(C.NOME AS VARCHAR) + ' - ' + CAST(B.RESUMO AS VARCHAR(50))) AS TITLE,");
            query.CommandText.AppendLine("      CASE");
            query.CommandText.AppendLine("          WHEN B.MODELO = 2 AND A.DATAINICIO IS NULL THEN B.DATAINICIO");
            query.CommandText.AppendLine("          WHEN B.MODELO = 2 AND A.DATAINICIO IS NOT NULL THEN A.DATAINICIO");
            query.CommandText.AppendLine("          WHEN B.MODELO IN(1, 3) THEN A.DATAINICIO");
            query.CommandText.AppendLine("      END DATAINICIO,");
            query.CommandText.AppendLine("      CASE");
            query.CommandText.AppendLine("          WHEN B.MODELO = 2 AND A.HANDLE IS NULL THEN B.DATAFIM");
            query.CommandText.AppendLine("          WHEN B.MODELO = 2 AND A.HANDLE IS NOT NULL AND A.DATAFIM IS NOT NULL THEN A.DATAFIM");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NOT NULL THEN A.DATAFIM");
            query.CommandText.AppendLine("          WHEN A.DATAFIM IS NULL THEN GETDATE()");
            query.CommandText.AppendLine("      END DATAFIM,");
            query.CommandText.AppendLine("      CASE");
            query.CommandText.AppendLine("          WHEN B.MODELO = 2 AND A.HANDLE IS NULL THEN '#913D88'");
            query.CommandText.AppendLine("          WHEN B.MODELO = 2 AND A.FATURADO = 'S' THEN '#26C281'");
            query.CommandText.AppendLine("          WHEN B.MODELO = 2 AND A.FATURADO = 'N' THEN '#BFBFBF'");
            query.CommandText.AppendLine("          WHEN CAST(SUBSTRING(B.TOTALHORAS, 1, LEN(B.TOTALHORAS) - 3) AS INT) > 8 THEN '#CF000F'");
            query.CommandText.AppendLine("          WHEN CAST(SUBSTRING(B.TOTALHORAS, 1, LEN(B.TOTALHORAS) - 3) AS INT) > 4 THEN '#E87E04'");
            query.CommandText.AppendLine("          WHEN CAST(SUBSTRING(B.TOTALHORAS, 1, LEN(B.TOTALHORAS) - 3) AS INT) > 2 THEN '#F5D76E'");
            query.CommandText.AppendLine("          WHEN CAST(SUBSTRING(B.TOTALHORAS, 1, LEN(B.TOTALHORAS) - 3) AS INT) <= 2 THEN '#59ABE3'");
            query.CommandText.AppendLine("      END COLOR");
            query.CommandText.AppendLine(" FROM K_SUP_ATENDIMENTO B");
            query.CommandText.AppendLine(" JOIN K_SUP_ATENDIMENTO_INTERACAO A ON A.ATENDIMENTO = B.HANDLE");
            query.CommandText.AppendLine(" JOIN Z_GRUPOUSUARIOS C ON A.USUARIO = C.HANDLE");
            query.CommandText.AppendLine(" WHERE YEAR(A.DATAINICIO) = :ANO");
            query.CommandText.AppendLine(" AND MONTH(A.DATAINICIO) = :MES");

            if(usuario != 0)
                query.CommandText.AppendLine(" AND (A.USUARIO = :USUARIO OR B.ATENDENTEATUAL = :USUARIO) ");

            query.Parameters.Add("MES"      , mes);
            query.Parameters.Add("ANO"      , ano);
            query.Parameters.Add("USUARIO"  , usuario.ToString());

            Entities<EntityBase> resultList = query.Execute();
            foreach (EntityBase ent in resultList)
            {
                DateTime start;
                DateTime end;
                DateTime.TryParseExact(
                        ent.Fields["DATAINICIO"].ToString(),
                        "dd/MM/yyyy HH:mm:ss",
                        System.Globalization.CultureInfo.InvariantCulture,
                        System.Globalization.DateTimeStyles.None, out start);

                DateTime.TryParseExact(
                            ent.Fields["DATAFIM"].ToString(),
                            "dd/MM/yyyy HH:mm:ss",
                            System.Globalization.CultureInfo.InvariantCulture,
                            System.Globalization.DateTimeStyles.None, out end);


                listEvents.Add(new CalendarEvent(ent.Fields["ID"].ToString(), ent.Fields["TITLE"].ToString(), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), end.ToString("yyyy-MM-ddTHH:mm:sszzz"), ent.Fields["COLOR"].ToString()));
            }

            return JsonConvert.SerializeObject(listEvents);
        }

        private string JsonAgendamentosUsuarioMes(int mes, int ano, int usuario)
        {
            List<CalendarEvent> listEvents = new List<CalendarEvent>();			
            Query query = new Query();

            query.CommandText.AppendLine(" SELECT B.HANDLE ID,");

            if(usuario == 0)
            {
                query.CommandText.AppendLine("      CASE");
                query.CommandText.AppendLine("          WHEN D.APELIDO IS NULL THEN (CAST(C.NOME AS VARCHAR) + ' - ' + CAST(D.NOME AS VARCHAR(50)))");
                query.CommandText.AppendLine("          WHEN D.APELIDO IS NOT NULL THEN (CAST(C.NOME AS VARCHAR) + ' - ' + CAST(D.APELIDO AS VARCHAR(50)))");
                query.CommandText.AppendLine("      END TITLE,");
            }
            else
            {
                query.CommandText.AppendLine("      CASE");
                query.CommandText.AppendLine("          WHEN D.APELIDO IS NULL THEN CAST(D.NOME AS VARCHAR(50))");
                query.CommandText.AppendLine("          WHEN D.APELIDO IS NOT NULL THEN CAST(D.APELIDO AS VARCHAR(50))");
                query.CommandText.AppendLine("      END TITLE,");
            }

            query.CommandText.AppendLine("      B.DATAINICIO,");
            query.CommandText.AppendLine("      B.DATAFIM,");
            query.CommandText.AppendLine("      CASE");
            query.CommandText.AppendLine("          WHEN B.STATUS IN (9,10) AND B.TIPO IN (7,8)     THEN '#f2d984'");
            query.CommandText.AppendLine("          WHEN B.STATUS = 8                               THEN '#6bb9f0'");
            query.CommandText.AppendLine("          WHEN B.STATUS = 9                               THEN '#1f3a93'");
            query.CommandText.AppendLine("          WHEN B.STATUS = 10                              THEN '#1e824c'");
            query.CommandText.AppendLine("          WHEN B.STATUS = 11                              THEN '#bdc3c7'");
            query.CommandText.AppendLine("          WHEN B.STATUS = 17                              THEN '#68c3a3'");
            query.CommandText.AppendLine("          WHEN B.STATUS IS NOT NULL                       THEN '#95A5A6'");
            query.CommandText.AppendLine("      END COLOR");
            query.CommandText.AppendLine(" FROM K_SUP_ATENDIMENTO B");
            query.CommandText.AppendLine(" JOIN Z_GRUPOUSUARIOS C ON B.ATENDENTEATUAL = C.HANDLE");
            query.CommandText.AppendLine(" JOIN GN_PESSOAS D ON B.CLIENTE = D.HANDLE");
            query.CommandText.AppendLine(" WHERE YEAR(B.DATAINICIO) = :ANO");
            query.CommandText.AppendLine(" AND MONTH(B.DATAINICIO) = :MES");
            query.CommandText.AppendLine(" AND B.MODELO = :MODELO");

            if (usuario != 0)
                query.CommandText.AppendLine(" AND B.ATENDENTEATUAL = :USUARIO");

            query.Parameters.Add("MES"      , mes);
            query.Parameters.Add("ANO"      , ano);
            query.Parameters.Add("MODELO"   , 2);

            if (usuario != 0)
                query.Parameters.Add("USUARIO"  , BennerContext.Security.GetLoggedUserHandle());

            Entities<EntityBase> resultList = query.Execute();
            foreach (EntityBase ent in resultList)
            {
                DateTime start;
                DateTime end;
                DateTime.TryParseExact(
                        ent.Fields["DATAINICIO"].ToString(),
                        "dd/MM/yyyy HH:mm:ss",
                        System.Globalization.CultureInfo.InvariantCulture,
                        System.Globalization.DateTimeStyles.None, out start);

                DateTime.TryParseExact(
                            ent.Fields["DATAFIM"].ToString(),
                            "dd/MM/yyyy HH:mm:ss",
                            System.Globalization.CultureInfo.InvariantCulture,
                            System.Globalization.DateTimeStyles.None, out end);


                listEvents.Add(new CalendarEvent(ent.Fields["ID"].ToString(), ent.Fields["TITLE"].ToString(), start.ToString("yyyy-MM-ddTHH:mm:sszzz"), end.ToString("yyyy-MM-ddTHH:mm:sszzz"), ent.Fields["COLOR"].ToString()));
            }
            Query queryParametro = new Query();

            queryParametro.CommandText.AppendLine(" SELECT * ");
            queryParametro.CommandText.AppendLine(" FROM K_SUP_PARAMETROS");
            queryParametro.CommandText.AppendLine(" WHERE EMPRESA = :EMPRESA");

            queryParametro.Parameters.Add("EMPRESA", Company.Current.Handle);

            List<EntityBase> resultParametros = queryParametro.Execute();

            if (resultParametros.Count > 0)
            {
                if (resultParametros[0].Fields["INTEGRACRM"].ToString() == "S")
                    QueryCrm(mes, ano, usuario, listEvents);
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
