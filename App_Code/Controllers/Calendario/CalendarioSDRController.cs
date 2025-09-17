using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Models.Calendar;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CalendarioSDRController
/// </summary>
namespace Controllers.Calendario
{
    public class CalendarioSDRController : Controller
    {
        public CalendarioSDRController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
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
            query.CommandText.AppendLine(" JOIN Z_GRUPOUSUARIOS D ON A.RESPONSAVEL = D.HANDLE");
            query.CommandText.AppendLine(" WHERE 1=1");

            if (usuario != 0)
                query.CommandText.AppendLine(" AND A.STATUS = 1");

            query.CommandText.AppendLine(" AND D.K_INTELIGENCIAMERCADO = 'S'");
            query.CommandText.AppendLine(" AND B.APARECECALENDARIO = 'S'");
            query.CommandText.AppendLine(" AND ((YEAR(A.DATAAGENDAMENTO) = :ANO");
            query.CommandText.AppendLine(" AND MONTH(A.DATAAGENDAMENTO) = :MES )");
            query.CommandText.AppendLine(" OR (YEAR(A.DATACONCLUSAO) = :ANO");
            query.CommandText.AppendLine(" AND MONTH(A.DATACONCLUSAO) = :MES ))");
            query.CommandText.AppendLine(" AND C.EMPRESA = :EMPRESA");

            if (Branch.Current != null)
                query.CommandText.AppendLine(" AND C.FILIAL = :FILIAL");

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



    }

}