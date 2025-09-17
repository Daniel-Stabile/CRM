using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components.Scripting;
using Models.Calendar;
using Models.Google;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Summary description for CalendarioSuporteController
/// </summary>
namespace Controllers.Calendario
{
    public class CalendarioSuporteController : Controller
    {

        public GoogleCalendar gCal = new GoogleCalendar();
        //public ClientSecrets myclientsecret;
        //public IAuthorizationCodeFlow flow;
        //public CalendarService service;
        //string[] Scopes = { CalendarService.Scope.Calendar };
        public string UserId = "sminas.ltda";

        public CalendarioSuporteController()
        {
            gCal = new GoogleCalendar();

            string urlAtual = System.Web.HttpContext.Current.Request.Url.AbsolutePath.Replace("/Pages/", "");

            Criteria crit = new Criteria("A.URLDESTINO = :URL AND A.TIPO = 3");
            crit.Parameters.Add("URL", urlAtual);

            EntityBase parametroCalendar = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_INT_PARAMETROSGOOGLECALENDAR"), crit);

            if (parametroCalendar != null)
            {
                EntityBase parGoogle = ((EntityAssociation)parametroCalendar.Fields["PARAMETROGOOGLE"]).Instance;
                gCal.applicationName = parGoogle.Fields["APPLICATIONNAME"].ToString();
                gCal.calID = parametroCalendar.Fields["ID"].ToString();
                gCal.type = parametroCalendar.Fields["TIPO"].ToString();
                gCal.clientId = parGoogle.Fields["CLIENTID"].ToString();
                gCal.clientSecret = parGoogle.Fields["CLIENTSECRET"].ToString();
                gCal.datafolder = parGoogle.Fields["DATAFOLDER"].ToString();
                gCal.uri = parGoogle.Fields["URIREDIRECIONAMENTO"].ToString();
                gCal.calendarApiKey = parGoogle.Fields["CALENDARAPIKEY"].ToString();
                gCal.intParGoogle = parGoogle.Handle.Value.ToString();

            }
            gCal.urlAtual = urlAtual;

            //myclientsecret = new ClientSecrets
            //{
            //    ClientId = gCal.clientId,
            //    ClientSecret = gCal.clientSecret
            //};

            //flow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer()
            //{
            //    DataStore = new FileDataStore(System.Web.HttpContext.Current.Server.MapPath(gCal.datafolder)),
            //    ClientSecrets = myclientsecret,
            //    Scopes = Scopes
            //});

            //var code = System.Web.HttpContext.Current.Request["code"];
            //if (code != null)
            //{
            //    var token = flow.ExchangeCodeForTokenAsync(
            //                UserId,
            //                code,
            //                gCal.uri,
            //                CancellationToken.None).Result;

            //    // Extract the right state.
            //    var oauthState = AuthWebUtility.ExtracRedirectFromState(
            //        flow.DataStore, UserId, System.Web.HttpContext.Current.Request["state"]).Result;
            //    System.Web.HttpContext.Current.Response.Redirect(oauthState);
            //}
            //else
            //{
            //    var result = new AuthorizationCodeWebApp(flow, gCal.uri, gCal.uri).AuthorizeAsync(UserId, CancellationToken.None).Result;

            //    if (result.RedirectUri != null) Response.Redirect(result.RedirectUri);
            //    else
            //    {
            //        service = new CalendarService(new BaseClientService.Initializer()
            //        {
            //            HttpClientInitializer = result.Credential,
            //            ApplicationName = "Sminas ltda"
            //        });
            //    }
            //}
        }

        #region ActionResults de calendários
        /// <summary>
        /// Calendário Entregar
        /// </summary>
        /// <param name="tipo"></param>
        /// <returns></returns>
        public ActionResult CalendarioDefault(string tipo)
        {
            ViewData["gCal"] = gCal;

            return View();
        }

        public ActionResult CalendarioAtendimentoDia()
        {
            return View();
        }

        public ActionResult CalendarioSliderDefault()
        {
            return View();
        }

        #endregion

        [HttpGet]
        public ActionResult ExibeModalEvento(string start, string end, string calId, string intParGoogleHandle)
        {
            DateTime dtStart = DateTime.ParseExact(start, "dd-MM-yyyy HH:mm", CultureInfo.CreateSpecificCulture("pt-BR")).AddDays(1);
            DateTime dtEnd = DateTime.ParseExact(end, "dd-MM-yyyy HH:mm", CultureInfo.CreateSpecificCulture("pt-BR"));

            string response = StartVTs(dtStart, dtEnd, calId, intParGoogleHandle);

            return Json(new { url = response }, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult GetAtendimentosDia()
        {
            string response = JsonInteracoesDia();

            return Json(response, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult AtendimentosPendentesPorUsuario()
        {
            string response = GetAtendimentosPendentesPorUsuario();
            string sla      = GetAtendimentosSLAPorUsuario();

            return Json(new { qtdAtendimento = response, qtdSla = sla }, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult AtendimentosSLAPorUsuario()
        {
            string response = GetAtendimentosSLAPorUsuario();

            //InsereEvento(dtStart, dtEnd, new List<string>() { "pedro.teles@sminas.com.br" });
            //to retornando um json

            return Json(response, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult TilesDashboard()
        {
            int pendenteGeral = AtendimentosPendetesGeral();
            int pendenteGeralCorp = AtendimentosPendetesGeralCorporativo();
            int pendenteGeralLog = AtendimentosPendetesGeralLogistica();
            int pendenteGeralRH = AtendimentosPendetesGeralRH();
            int pendenteGeralOutros = AtendimentosPendetesGeralOutros();

            int pendenteGeralSemana = AtendimentosPendetesGeralSemana();
            int pendenteGeralCorpSemana = AtendimentosPendetesGeralCorporativoSemana();
            int pendenteGeralLogSemana = AtendimentosPendetesGeralLogisticaSemana();
            int pendenteGeralRHSemana = AtendimentosPendetesGeralRHSemana();
            int pendenteGeralOutrosSemana = AtendimentosPendetesGeralOutrosSemana();

            int resolvidoGeralSemana = AtendimentosResolvidosGeralSemana();
            int resolvidoGeralCorpSemana = AtendimentosResolvidosGeralCorporativoSemana();
            int resolvidoGeralLogSemana = AtendimentosResolvidosGeralLogisticaSemana();
            int resolvidoGeralRHSemana = AtendimentosResolvidosGeralRHSemana();
            int resolvidoGeralOutrosSemana = AtendimentosResolvidosGeralOutrosSemana();

            int homologadoGeralSemana = AtendimentosHomologadosGeralSemana();
            int homologadoGeralCorpSemana = AtendimentosHomologadosGeralCorporativoSemana();
            int homologadoGeralLogSemana = AtendimentosHomologadosGeralLogisticaSemana();
            int homologadoGeralRHSemana = AtendimentosHomologadosGeralRHSemana();
            int homologadoGeralOutrosSemana = AtendimentosHomologadosGeralOutrosSemana();

            int niveliiGeralSemana = AtendimentosNivelIIGeralSemana();
            int niveliiGeralCorpSemana = AtendimentosNivelIIGeralCorporativoSemana();
            int niveliiGeralLogSemana = AtendimentosNivelIIGeralLogisticaSemana();
            int niveliiGeralRHSemana = AtendimentosNivelIIGeralRHSemana();
            int niveliiGeralOutrosSemana = AtendimentosNivelIIGeralOutrosSemana();

            //InsereEvento(dtStart, dtEnd, new List<string>() { "pedro.teles@sminas.com.br" });
            //to retornando um json
            var result = new
            {
                pendenteGeral = pendenteGeral,
                pendenteGeralCorp = pendenteGeralCorp,
                pendenteGeralLog = pendenteGeralLog,
                pendenteGeralRH = pendenteGeralRH,
                pendenteGeralOutros = pendenteGeralOutros,

                pendenteGeralSemana = pendenteGeralSemana,
                pendenteGeralCorpSemana = pendenteGeralCorpSemana,
                pendenteGeralLogSemana = pendenteGeralLogSemana,
                pendenteGeralRHSemana = pendenteGeralRHSemana,
                pendenteGeralOutrosSemana = pendenteGeralOutrosSemana,

                resolvidoGeralSemana = resolvidoGeralSemana,
                resolvidoGeralCorpSemana = resolvidoGeralCorpSemana,
                resolvidoGeralLogSemana = resolvidoGeralLogSemana,
                resolvidoGeralRHSemana = resolvidoGeralRHSemana,
                resolvidoGeralOutrosSemana = resolvidoGeralOutrosSemana,

                homologadoGeralSemana = homologadoGeralSemana,
                homologadoGeralCorpSemana = homologadoGeralCorpSemana,
                homologadoGeralLogSemana = homologadoGeralLogSemana,
                homologadoGeralRHSemana = homologadoGeralRHSemana,
                homologadoGeralOutrosSemana = homologadoGeralOutrosSemana,

                niveliiGeralSemana = niveliiGeralSemana,
                niveliiGeralCorpSemana = niveliiGeralCorpSemana,
                niveliiGeralLogSemana = niveliiGeralLogSemana,
                niveliiGeralRHSemana = niveliiGeralRHSemana,
                niveliiGeralOutrosSemana = niveliiGeralOutrosSemana
            };
            return Json(result, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult GetAtendimento(string id)
        {
            string response = StartAtendimentoFormView(id);

            return Json(new { url = response }, JsonRequestBehavior.AllowGet);

        }

        public PartialViewResult ChartTeste()
        {
            return PartialView();
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
                    new WhereClause("A.HANDLE IN (SELECT ATENDIMENTO FROM K_SUP_ATENDIMENTO_INTERACAO WHERE HANDLE = :HANDLE)",
                    new List<Parameter>(){
                        new Parameter("HANDLE",id)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true).Split('\'').ElementAtOrDefault(1);

        }

        private string StartVTs(DateTime start, DateTime end, string calId, string intParGoogleHandle)
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

        #region Slider Gauge
        public string GetAtendimentosPendentesPorUsuario()
        {
            List<GaugeAtendimento> listAtendimento = new List<GaugeAtendimento>();
            Query query = new Query();

            // Comando SQL complexo
            query.CommandText.AppendLine("SELECT B.NOME, COUNT(A.HANDLE) ATENDIMENTO");
            query.CommandText.AppendLine("FROM Z_GRUPOUSUARIOS B");
            query.CommandText.AppendLine("LEFT JOIN K_SUP_ATENDIMENTO A ON A.ATENDENTEATUAL = B.HANDLE");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (3,4,5) AND B.INATIVO = 'N' AND B.HANDLE NOT IN(33, 109, 122, 124, 151, 152)");
            query.CommandText.AppendLine("GROUP BY B.NOME");
            query.CommandText.AppendLine("ORDER BY B.NOME");

            // Parâmetro para restringir a busca
            // Ao invocar o método "Execute" é retornado uma coleção de entidades do tipo EntityBase
            List<EntityBase> result = query.Execute();
            listAtendimento.Clear();

            foreach (EntityBase ent in result)
            {
                GaugeAtendimento gauge = new GaugeAtendimento(ent.Fields["NOME"].ToString(), Convert.ToInt32(ent.Fields["ATENDIMENTO"].ToString()));
                listAtendimento.Add(gauge);
            }
            return JsonConvert.SerializeObject(listAtendimento);
        }

        public string GetAtendimentosSLAPorUsuario()
        {
            List<GaugeAtendimento> listAtendimento = new List<GaugeAtendimento>();
            Query query = new Query();

            query.CommandText.AppendLine(" SELECT ATENDENTEATUAL, ");
            query.CommandText.AppendLine("    CAST(((ATENDIMENTOS_GANHA_SLA * 100) / (ATENDIMENTOS_TOTAL_SLA - ATENDIMENTOS_NEUTRO_SLA)) AS DECIMAL(10,2)) PERCENTUAL_SLA_ATINGIDA");
            query.CommandText.AppendLine(" FROM (");
            query.CommandText.AppendLine("    SELECT  CC.NOME ATENDENTEATUAL,");
            query.CommandText.AppendLine("            CAST(COUNT(AA.HANDLE) AS DECIMAL(10,2))  ATENDIMENTOS_TOTAL_SLA,");
            query.CommandText.AppendLine("            CAST");
            query.CommandText.AppendLine("            (");
            query.CommandText.AppendLine("              (");
            query.CommandText.AppendLine("              SELECT COUNT(A.HANDLE)  ATENDIMENTOS_GANHA_SLA");
            query.CommandText.AppendLine("              FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("              INNER JOIN K_SUP_SISCON_CAUSA B ON A.SISCONCAUSA = B.HANDLE");
            query.CommandText.AppendLine("              WHERE 1 = 1");
            query.CommandText.AppendLine("              AND A.MODELO = 1");
            query.CommandText.AppendLine("              AND A.STATUS = 5");
            query.CommandText.AppendLine("              AND A.ATENDENTEATUAL = AA.ATENDENTEATUAL");
            query.CommandText.AppendLine("              AND MONTH(A.DATAFIM) = MONTH(GETDATE())");
            query.CommandText.AppendLine("              AND YEAR(A.DATAFIM) = YEAR(GETDATE())");
            query.CommandText.AppendLine("              AND NOT EXISTS(SELECT HANDLE FROM K_SUP_ATENDIMENTO_EVENTO WHERE ATENDIMENTO = A.HANDLE AND TIPO = 4)");
            query.CommandText.AppendLine("              AND B.GANHASLA = 'S'");
            query.CommandText.AppendLine("              ) AS DECIMAL(10,2)");
            query.CommandText.AppendLine("             ) ATENDIMENTOS_GANHA_SLA,");
            query.CommandText.AppendLine("             CAST");
            query.CommandText.AppendLine("             (");
            query.CommandText.AppendLine("              (");
            query.CommandText.AppendLine("              SELECT COUNT(A.HANDLE) ATENDIMENTOS_NEUTRO_SLA");
            query.CommandText.AppendLine("              FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("              INNER JOIN K_SUP_SISCON_CAUSA B ON A.SISCONCAUSA = B.HANDLE");
            query.CommandText.AppendLine("              WHERE 1 = 1");
            query.CommandText.AppendLine("              AND A.MODELO = 1");
            query.CommandText.AppendLine("              AND A.STATUS = 5");
            query.CommandText.AppendLine("              AND A.ATENDENTEATUAL = AA.ATENDENTEATUAL");
            query.CommandText.AppendLine("              AND MONTH(A.DATAFIM) = MONTH(GETDATE())");
            query.CommandText.AppendLine("              AND YEAR(A.DATAFIM) = YEAR(GETDATE())");
            query.CommandText.AppendLine("              AND");
            query.CommandText.AppendLine("              (");
            query.CommandText.AppendLine("                (EXISTS(SELECT HANDLE FROM K_SUP_ATENDIMENTO_EVENTO WHERE ATENDIMENTO = A.HANDLE AND TIPO = 4)");
            query.CommandText.AppendLine("                    AND B.PERDESLA = 'N'");
            query.CommandText.AppendLine("                )");
            query.CommandText.AppendLine("                OR");
            query.CommandText.AppendLine("                B.GANHASLA = 'N'");
            query.CommandText.AppendLine("              )");
            query.CommandText.AppendLine("             ) AS DECIMAL(10,2)");
            query.CommandText.AppendLine("    ) ATENDIMENTOS_NEUTRO_SLA");
            query.CommandText.AppendLine("    FROM K_SUP_ATENDIMENTO AA");
            query.CommandText.AppendLine("    INNER JOIN K_SUP_SISCON_CAUSA BB ON AA.SISCONCAUSA = BB.HANDLE");
            query.CommandText.AppendLine("    INNER JOIN Z_GRUPOUSUARIOS CC ON AA.ATENDENTEATUAL = CC.HANDLE");
            query.CommandText.AppendLine("    WHERE 1 = 1");
            query.CommandText.AppendLine("    AND AA.MODELO = 1");
            query.CommandText.AppendLine("    AND AA.STATUS = 5");
            query.CommandText.AppendLine("    AND MONTH(AA.DATAFIM) = MONTH(GETDATE())");
            query.CommandText.AppendLine("    AND YEAR(AA.DATAFIM) = YEAR(GETDATE())");
            query.CommandText.AppendLine("    GROUP BY CC.NOME, AA.ATENDENTEATUAL");
            query.CommandText.AppendLine(") tab");
            query.CommandText.AppendLine("ORDER BY ATENDENTEATUAL");

            List<EntityBase> result = query.Execute();
            listAtendimento.Clear();

            foreach (EntityBase ent in result)
            {
                GaugeAtendimento gauge  = new GaugeAtendimento();
                gauge.nome              = ent.Fields["ATENDENTEATUAL"].ToString();
                gauge.total             = Convert.ToDecimal(ent.Fields["PERCENTUAL_SLA_ATINGIDA"]);
                listAtendimento.Add(gauge);
            }
            

            string response = JsonConvert.SerializeObject(listAtendimento);
            return response;
        }
        #endregion

        #region Tiles Pendentes Geral
        private int AtendimentosPendetesGeral()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISCON IS NOT NULL");

            List<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralCorporativo()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'CORPORATIVO'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralLogistica()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'LOGISTICA'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralRH()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'RH'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralOutros()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA NOT IN ('CORPORATIVO','LOGISTICA','RH')");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        #endregion

        #region Tiles Pendentes Semana
        private int AtendimentosPendetesGeralSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAINICIO >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAINICIO <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");


            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralCorporativoSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'CORPORATIVO'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAINICIO >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAINICIO <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralLogisticaSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'LOGISTICA'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAINICIO >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAINICIO <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralRHSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'RH'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAINICIO >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAINICIO <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosPendetesGeralOutrosSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS NOT IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA NOT IN ('CORPORATIVO','LOGISTICA','RH')");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAINICIO >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAINICIO <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        #endregion

        #region Tiles Resolvidos Semana
        private int AtendimentosResolvidosGeralSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS IN (5)");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAFIM >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAFIM <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");


            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosResolvidosGeralCorporativoSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS IN (5) ");
            query.CommandText.AppendLine("AND A.SISTEMA = 'CORPORATIVO'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAFIM >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAFIM <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosResolvidosGeralLogisticaSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'LOGISTICA'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAFIM >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAFIM <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosResolvidosGeralRHSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA = 'RH'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAFIM >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAFIM <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosResolvidosGeralOutrosSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("WHERE A.STATUS IN (5)");
            query.CommandText.AppendLine("AND A.SISTEMA NOT IN ('CORPORATIVO','LOGISTICA','RH')");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND A.DATAFIM >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND A.DATAFIM <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        #endregion

        #region Tiles Homologados Semana
        private int AtendimentosHomologadosGeralSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (3)");
            query.CommandText.AppendLine("AND B.TIPO = 5");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");


            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosHomologadosGeralCorporativoSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (3)");
            query.CommandText.AppendLine("AND B.TIPO = 5");
            query.CommandText.AppendLine("AND A.SISTEMA = 'CORPORATIVO'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosHomologadosGeralLogisticaSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (3)");
            query.CommandText.AppendLine("AND B.TIPO = 5");
            query.CommandText.AppendLine("AND A.SISTEMA = 'LOGISTICA'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosHomologadosGeralRHSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (3)");
            query.CommandText.AppendLine("AND B.TIPO = 5");
            query.CommandText.AppendLine("AND A.SISTEMA = 'RH'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosHomologadosGeralOutrosSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (3)");
            query.CommandText.AppendLine("AND B.TIPO = 5");
            query.CommandText.AppendLine("AND A.SISTEMA NOT IN ('CORPORATIVO','LOGISTICA','RH')");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        #endregion

        #region Tiles NivelII Semana
        private int AtendimentosNivelIIGeralSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (4)");
            query.CommandText.AppendLine("AND B.TIPO = 4");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");


            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosNivelIIGeralCorporativoSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (4)");
            query.CommandText.AppendLine("AND B.TIPO = 4");
            query.CommandText.AppendLine("AND A.SISTEMA = 'CORPORATIVO'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosNivelIIGeralLogisticaSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (4)");
            query.CommandText.AppendLine("AND B.TIPO = 4");
            query.CommandText.AppendLine("AND A.SISTEMA = 'LOGISTICA'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosNivelIIGeralRHSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (4)");
            query.CommandText.AppendLine("AND B.TIPO = 4");
            query.CommandText.AppendLine("AND A.SISTEMA = 'RH'");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        private int AtendimentosNivelIIGeralOutrosSemana()
        {
            Query query = new Query();

            query.CommandText.AppendLine("SELECT COUNT(A.HANDLE) TOTAL");
            query.CommandText.AppendLine("FROM K_SUP_ATENDIMENTO A");
            query.CommandText.AppendLine("JOIN K_SUP_ATENDIMENTO_EVENTO B ON A.HANDLE = B.ATENDIMENTO");
            query.CommandText.AppendLine("WHERE A.STATUS IN (4)");
            query.CommandText.AppendLine("AND B.TIPO = 4");
            query.CommandText.AppendLine("AND A.SISTEMA NOT IN ('CORPORATIVO','LOGISTICA','RH')");
            query.CommandText.AppendLine("AND SISCON IS NOT NULL");
            query.CommandText.AppendLine("AND B.DATA >= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN GETDATE()");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, -1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, -2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, -3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, -4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, -5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN DATEADD(D, -6, GETDATE())");
            query.CommandText.AppendLine("END");
            query.CommandText.AppendLine("AND  B.DATA <= CASE UPPER(DATENAME(weekday, getdate()))");
            query.CommandText.AppendLine("    WHEN 'DOMINGO'       THEN DATEADD(D, 6, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEGUNDA-FEIRA' THEN DATEADD(D, 5, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'TERÇA-FEIRA'   THEN DATEADD(D, 4, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUARTA-FEIRA'  THEN DATEADD(D, 3, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'QUINTA-FEIRA'  THEN DATEADD(D, 2, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SEXTA-FEIRA'   THEN DATEADD(D, 1, GETDATE())");
            query.CommandText.AppendLine("    WHEN 'SABADO'        THEN GETDATE()");
            query.CommandText.AppendLine("END");

            Entities<EntityBase> resultList = query.Execute();
            if (resultList.Count > 0)
                return Convert.ToInt32(resultList[0].Fields["TOTAL"].ToString());
            else
                return 0;
        }
        #endregion


    }
    public class GaugeAtendimento
    {
        public string nome { get; set; }
        public Decimal total { get; set; }

        public GaugeAtendimento() { }
        public GaugeAtendimento(string _nome, Decimal _total)
        {
            nome = _nome;
            total = _total;
        }
    }
}
