using Benner.Tecnologia.Business; 
using Benner.Tecnologia.Common;
using Models.Crm;
using Models.Generico;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Benner.Tecnologia.Common.Components;
using Models.Ui;
using System.Globalization;
using Benner.Tecnologia.Metadata.Entities;

/// <summary>
/// Descrição resumida de CrmPerformanceController
/// </summary>
namespace Controllers.Crm
{
    public class CrmPerformanceController : Controller
    {
        public CrmPerformanceController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public ActionResult Planilha()
        {
            return PartialView();
        }

        public ActionResult PerformanceUsuario()
        {
            return PartialView();
        }

        public ActionResult PerformanceGeral()
        {
            return PartialView();
        }

        public ActionResult GraficoUsuario()
        {
            return PartialView();
        }

        public ActionResult GraficoVertical()
        {
            return PartialView();
        }

        public ActionResult TilesPerformanceUsuario(EntityBase model)
        {
            List<CrmPerformanceTile> response = ListMetasGeralUsuario(model);
            return View(response);
        }

        public ActionResult TilesPerformanceUsuarioAno(EntityBase model)
        {
            List<CrmPerformanceTile> response = ListMetasGeralUsuarioAno(model);
            return View(response);
        }

        public ActionResult TilesPerformance(EntityBase model)
        {
            if(model != null)
            {
                List<TileProgress> response = ListMetasGeral(model);
                return View(response);

            }
            return null;
        }

        [HttpGet]
        public ActionResult GetMetasUsuario()
        {
            object response = ListMetas();

            return Json(JsonConvert.SerializeObject(response), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetMetasGeral(EntityBase Filtro)
        {
            object response = ListMetasGeral(Filtro);

            return Json(JsonConvert.SerializeObject(response), JsonRequestBehavior.AllowGet);
        }

        public Object ListMetas()
        {
            try
            {

                Criteria critGrupo = new Criteria("A.HANDLE = @USUARIO");

                EntityBase usuario = Entity.GetFirstOrDefault(EntityDefinition.GetByName("Z_GRUPOUSUARIOS"), critGrupo);

                Usuario user = new Usuario();
                user.Handle = usuario.Handle.ToInt();
                user.Nome = usuario.Fields["NOME"].ToString();

                if (((EntityAssociation)usuario.Fields["K_FILIAL"]).Handle.IsValid())
                    user.Filial = ((EntityAssociation)usuario.Fields["K_FILIAL"]).Handle.ToString();
                if (((EntityAggregation)usuario.Fields["K_VERTICAL"]).HasValue())
                    user.Vertical = ((EntityAggregation)usuario.Fields["K_VERTICAL"]).ToString();

                #region Busca por Grupo

                Criteria critPerformanceGrupo = new Criteria("A.GRUPO = :GRUPO AND MONTH(A.MES) = MONTH(GETDATE()) AND YEAR(A.MES) = YEAR(GETDATE())");
                critPerformanceGrupo.Parameters.Add("GRUPO", ((EntityAssociation)usuario.Fields["GRUPO"]).Handle);

                List<EntityBase> listPerformanceMeta = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETA"), critPerformanceGrupo);

                List<CrmPerformanceMeta> listaDeMetas = new List<CrmPerformanceMeta>();

                foreach (EntityBase perfMeta in listPerformanceMeta)
                {
                    CrmPerformanceMeta newPerformanceMeta = new CrmPerformanceMeta();
                    newPerformanceMeta.Handle = perfMeta.Handle.ToString();
                    newPerformanceMeta.Grupo = ((EntityAssociation)perfMeta.Fields["GRUPO"]).Handle.ToString();
                    newPerformanceMeta.Data = perfMeta.Fields["MES"].ToDateTime().ToString("MM/yyyy");

                    Criteria critPerformanceMetaValor = new Criteria("A.PERFORMANCEMETA = :PERFORMANCEMETA");
                    critPerformanceMetaValor.Parameters.Add("PERFORMANCEMETA", perfMeta.Handle);

                    List<EntityBase> listPerformanceMetaValor = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETAVALOR"), critPerformanceMetaValor);
                    List<CrmPerformanceTipo> listaDeTipos = new List<CrmPerformanceTipo>();

                    // Colocando todos os valores encontrados dos tipos
                    foreach (EntityBase ent in listPerformanceMetaValor)
                    {
                        CrmPerformanceTipo newTipo = GetTipo(ent);
                        newTipo.MetaValor = ent.Fields["VALOR"].ToString();
                        newTipo.UrlGrafico = GraficoUsuarioFormView(((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Handle.ToString(), user.Handle.ToString());
                        listaDeTipos.Add(newTipo);
                    }
                    
                    newPerformanceMeta.ListaTipos = listaDeTipos;

                    listaDeMetas.Add(newPerformanceMeta);

                }

                #endregion

                #region Por Usuario

                if (((bool)usuario.Fields["K_INTELIGENCIAMERCADO"]) == true)
                {
                    Criteria critSdr = new Criteria("A.SDR = @USUARIO AND MONTH(A.MES) = MONTH(GETDATE()) AND YEAR(A.MES) = YEAR(GETDATE())");
                    
                    List<EntityBase> listPerformanceMetaSdr = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETA"), critSdr);

                    foreach(EntityBase entSDR in listPerformanceMetaSdr)
                    {
                        CrmPerformanceMeta newPerformanceMeta = new CrmPerformanceMeta();
                        newPerformanceMeta.Handle = entSDR.Handle.ToString();
                        newPerformanceMeta.Sdr = ((EntityAssociation)entSDR.Fields["SDR"]).Handle.ToString();
                        newPerformanceMeta.Data = entSDR.Fields["MES"].ToDateTime().ToString("MM/yyyy");

                        Criteria critPerformanceMetaValor = new Criteria("A.PERFORMANCEMETA = :PERFORMANCEMETA");
                        critPerformanceMetaValor.Parameters.Add("PERFORMANCEMETA", entSDR.Handle);

                        List<EntityBase> listPerformanceMetaValor = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETAVALOR"), critPerformanceMetaValor);
                        List<CrmPerformanceTipo> listaDeTipos = new List<CrmPerformanceTipo>();

                        // Colocando todos os valores encontrados dos tipos
                        foreach (EntityBase ent in listPerformanceMetaValor)
                        {
                            CrmPerformanceTipo newTipo = GetTipo(ent);
                            newTipo.MetaValor = ent.Fields["VALOR"].ToString();
                            newTipo.UrlGrafico = GraficoUsuarioFormView(((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Handle.ToString(), user.Handle.ToString());
                            listaDeTipos.Add(newTipo);
                        }

                        newPerformanceMeta.ListaTipos = listaDeTipos;

                        CrmPerformanceMeta meta = null;

                        if (listaDeMetas.Count > 0)
                        {
                            meta = listaDeMetas
                                .Where(x => x.Data == newPerformanceMeta.Data)
                                .FirstOrDefault();
                        }

                        if (meta != null)
                        {
                            List<CrmPerformanceTipo> tipoAtualizados = new List<CrmPerformanceTipo>();

                            foreach (CrmPerformanceTipo tipoNaMeta in newPerformanceMeta.ListaTipos)
                            {
                                CrmPerformanceTipo tipoEncontrado = meta
                                                                        .ListaTipos
                                                                        .Where(x => x.Handle == tipoNaMeta.Handle)
                                                                        .FirstOrDefault();

                                if (tipoEncontrado == null)
                                    meta.ListaTipos.Add(tipoNaMeta);
                                else
                                {
                                    meta.ListaTipos.RemoveAll(x => x.Handle == tipoNaMeta.Handle);
                                    tipoEncontrado.MetaValor = tipoNaMeta.MetaValor;
                                    meta.ListaTipos.Add(tipoEncontrado);
                                }

                            }
                            listaDeMetas.RemoveAll(x => x.Data == newPerformanceMeta.Data);
                            listaDeMetas.Add(meta);
                        }
                        else
                            listaDeMetas.Add(newPerformanceMeta);
                    }

                }

                if (((bool)usuario.Fields["K_EXECUTIVOCONTAS"]) == true)
                {
                    Criteria critExec = new Criteria("A.EXECUTIVO = @USUARIO AND MONTH(A.MES) = MONTH(GETDATE()) AND YEAR(A.MES) = YEAR(GETDATE())");

                    List<EntityBase> listPerformanceMetaExecutivo = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETA"), critExec);

                    foreach (EntityBase entSDR in listPerformanceMetaExecutivo)
                    {
                        CrmPerformanceMeta newPerformanceMeta = new CrmPerformanceMeta();
                        newPerformanceMeta.Handle = entSDR.Handle.ToString();
                        newPerformanceMeta.Executivo = ((EntityAssociation)entSDR.Fields["EXECUTIVO"]).Handle.ToString();
                        newPerformanceMeta.Data = entSDR.Fields["MES"].ToDateTime().ToString("MM/yyyy");

                        Criteria critPerformanceMetaValor = new Criteria("A.PERFORMANCEMETA = :PERFORMANCEMETA");
                        critPerformanceMetaValor.Parameters.Add("PERFORMANCEMETA", entSDR.Handle);

                        List<EntityBase> listPerformanceMetaValor = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETAVALOR"), critPerformanceMetaValor);
                        List<CrmPerformanceTipo> listaDeTipos = new List<CrmPerformanceTipo>();

                        // Colocando todos os valores encontrados dos tipos
                        foreach (EntityBase ent in listPerformanceMetaValor)
                        {
                            CrmPerformanceTipo newTipo = GetTipo(ent);
                            newTipo.MetaValor = ent.Fields["VALOR"].ToString();
                            newTipo.UrlGrafico = GraficoUsuarioFormView(((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Handle.ToString(), user.Handle.ToString());
                            listaDeTipos.Add(newTipo);
                        }

                        newPerformanceMeta.ListaTipos = listaDeTipos;

                        CrmPerformanceMeta meta = null;

                        if (listaDeMetas.Count > 0)
                        {
                            meta = listaDeMetas
                                .Where(x => x.Data == newPerformanceMeta.Data)
                                .FirstOrDefault();
                        }

                        if (meta != null)
                        {
                            List<CrmPerformanceTipo> tipoAtualizados = new List<CrmPerformanceTipo>();

                            foreach (CrmPerformanceTipo tipoNaMeta in newPerformanceMeta.ListaTipos)
                            {
                                CrmPerformanceTipo tipoEncontrado = meta
                                                                        .ListaTipos
                                                                        .Where(x => x.Handle == tipoNaMeta.Handle)
                                                                        .FirstOrDefault();

                                if (tipoEncontrado == null)
                                    meta.ListaTipos.Add(tipoNaMeta);
                                else
                                {
                                    meta.ListaTipos.RemoveAll(x => x.Handle == tipoNaMeta.Handle);
                                    tipoEncontrado.MetaValor = tipoNaMeta.MetaValor;
                                    meta.ListaTipos.Add(tipoEncontrado);
                                }

                            }
                            listaDeMetas.RemoveAll(x => x.Data == newPerformanceMeta.Data);
                            listaDeMetas.Add(meta);
                        }
                        else
                            listaDeMetas.Add(newPerformanceMeta);
                    }
                }


                #endregion

                foreach(CrmPerformanceMeta meta in listaDeMetas)
                {
                    foreach (CrmPerformanceTipo tipo in meta.ListaTipos)
                    {
                        if (tipo.Tipo == "1")
                        {
                            string campo = tipo
                                            .Resultados
                                            .Where(x => x.Responsavel.Handle == user.Handle)
                                            .Count()
                                            .ToString();

                            tipo.Valor = campo;
                        }
                        else if (tipo.Tipo == "2")
                        {
                            string resultado1 = "";
                            string simbolo = tipo.Simbolo;
                            string resultado2 = "";

                            if (tipo.Performance1.Tipo == "1")
                            {
                                resultado1 = tipo
                                                .Performance1
                                                .Resultados
                                                .Where(x => x.Responsavel.Handle == user.Handle)
                                                .Count()
                                                .ToString();


                            }
                            else if (tipo.Performance1.Tipo == "3")
                            {
                                if (tipo.Performance1.SelecaoResultado == "1")
                                {
                                    //COUNT

                                    resultado1 = tipo
                                                    .Performance1
                                                    .ResultadosOportunidades
                                                    .Where(x => x.Responsavel.Handle == user.Handle)
                                                    .Count()
                                                    .ToString();

                                }
                                else if (tipo.Performance1.SelecaoResultado == "2")
                                {
                                    //SUM

                                    resultado1 = tipo
                                                    .Performance1
                                                    .ResultadosOportunidades
                                                    .Where(x => x.Responsavel.Handle == user.Handle)
                                                    .Sum(x => Convert.ToDecimal(x.ValorTotal))
                                                    .ToString("C",CultureInfo.CurrentCulture);

                                    if (resultado1 == null)
                                        resultado1 = "0";

                                }

                            }


                            if (tipo.Performance2.Tipo == "1")
                            {
                                resultado2 = tipo
                                                .Performance2
                                                .Resultados
                                                .Where(x => x.Responsavel.Handle == user.Handle)
                                                .Count()
                                                .ToString();


                            }
                            else if (tipo.Performance2.Tipo == "3")
                            {
                                if (tipo.Performance2.SelecaoResultado == "1")
                                {
                                    //COUNT

                                    resultado2 = tipo
                                                    .Performance2
                                                    .ResultadosOportunidades
                                                    .Where(x => x.Responsavel.Handle == user.Handle)
                                                    .Count()
                                                    .ToString();

                                }
                                else if (tipo.Performance2.SelecaoResultado == "2")
                                {
                                    //SUM
                                    List<CrmPerformanceOportunidadeVertical> verticais = new List<CrmPerformanceOportunidadeVertical>();

                                    foreach (CrmPerformanceOportunidade opor in tipo.Performance2.ResultadosOportunidades)
                                    {
                                        verticais.AddRange(opor.listaVerticais);
                                    }

                                    resultado2 = tipo
                                                    .Performance2
                                                    .ResultadosOportunidades
                                                    .Where(x => x.Responsavel.Handle == user.Handle)
                                                    .Sum(x => Convert.ToDecimal(x.ValorTotal))
                                                    .ToString("C",CultureInfo.CurrentCulture);

                                    if (resultado2 == null)
                                        resultado2 = "0";

                                }

                            }

                            decimal resultado = 0;
                            if (simbolo == "D")
                            {
                                decimal result2 = Convert.ToDecimal(resultado2);

                                if (result2 == 0)
                                    resultado = 0;
                                else
                                    resultado = Convert.ToDecimal(resultado1) / result2;
                            }
                            else if (simbolo == "M")
                            {
                                resultado = Convert.ToDecimal(resultado1) * Convert.ToDecimal(resultado2);
                            }
                            else if (simbolo == "S")
                            {
                                resultado = Convert.ToDecimal(resultado1) - Convert.ToDecimal(resultado2);
                            }
                            else if (simbolo == "A")
                            {
                                resultado = Convert.ToDecimal(resultado1) + Convert.ToDecimal(resultado2);
                            }

                            if (tipo.Resultado == "2")
                                resultado = resultado * 100;

                            tipo.Valor = Math.Round(resultado, 2).ToString() + (tipo.Resultado == "2" ? " %" : "");

                        }
                        else if (tipo.Tipo == "3")
                        {
                            string resultado = "";

                            if (tipo.SelecaoResultado == "1")
                            {
                                //COUNT

                                resultado = tipo
                                            .ResultadosOportunidades
                                            .Where(x => x.Responsavel.Handle == user.Handle)
                                            .Count()
                                            .ToString();

                            }
                            else if (tipo.SelecaoResultado == "2")
                            {
                                //SUM

                                resultado = tipo
                                            .ResultadosOportunidades
                                            .Where(x => x.Responsavel.Handle == user.Handle)
                                            .Sum(x => Convert.ToDecimal(x.ValorTotal))
                                            .ToString("C",CultureInfo.CurrentCulture);

                                if (resultado == null)
                                    resultado = "0";

                            }

                            tipo.Valor = resultado.ToString();

                        }
                    }

                }
                //Atualizando valores encontrados pro usuario

                return new { code = 200, status = "success", message = "Metas de usuário retornadas com sucesso",data = listaDeMetas };
            }
            catch(Exception e)
            {
                StringBuilder builder = new StringBuilder();

                if(e.InnerException != null)
                    builder.AppendLine(e.InnerException.Message);
                else
                    builder.AppendLine(e.Message);

                builder.AppendLine(e.StackTrace);

                return new { code = 400, status = "error", message = builder.ToString() };

            }

        }

        public List<TileProgress> ListMetasGeral(EntityBase Filtro)
        {
            DateTime dtInicio = Filtro.Fields["DATAINICIO"].ToDateTime();
            DateTime dtFim = Filtro.Fields["DATAFIM"].ToDateTime();
            List<Handle> listFiliais = ((EntityAggregation)Filtro.Fields["FILIAIS"]).ToHandleList();
            List<Handle> listVerticais = ((EntityAggregation)Filtro.Fields["VERTICAIS"]).ToHandleList();
            List<Handle> listUsuarios = ((EntityAggregation)Filtro.Fields["FILIAIS"]).ToHandleList();

            try
            {
                Query queryTotalMeta2 = new Query();

                queryTotalMeta2.AppendLine("SELECT MES,PERFORMANCETIPO,NOMETIPO,SUM(VALORREALIZADOS) VALORREALIZADOS,SUM(META) META                  ");
                queryTotalMeta2.AppendLine("FROM(                                                                                                    ");
                queryTotalMeta2.AppendLine("SELECT A.HANDLE                                                                                          ");
                queryTotalMeta2.AppendLine("     , B.MES                                                                                             ");
                queryTotalMeta2.AppendLine("     , B.EXECUTIVO                                                                                       ");
                queryTotalMeta2.AppendLine("     , B.SDR                                                                                             ");
                queryTotalMeta2.AppendLine("     , C.PERFORMANCE                                                                                     ");
                queryTotalMeta2.AppendLine("     , A.PERFORMANCETIPO                                                                                 ");
                queryTotalMeta2.AppendLine("     , C.NOME NOMETIPO                                                                                   ");
                queryTotalMeta2.AppendLine("     , CASE                                                                                              ");
                queryTotalMeta2.AppendLine("       WHEN C.PERFORMANCE = 1 THEN COUNT(TAREFAS.HANDLE)                                                 ");
                queryTotalMeta2.AppendLine("       WHEN C.PERFORMANCE = 3 THEN COUNT(OPORTUNIDADES.HANDLE)                                           ");
                queryTotalMeta2.AppendLine("       END VALORREALIZADOS                                                                               ");
                queryTotalMeta2.AppendLine("     , SUM(DISTINCT A.VALOR) META                                                                        ");
                queryTotalMeta2.AppendLine("FROM K_CRM_PERFORMANCEMETAVALOR A                                                                        ");
                queryTotalMeta2.AppendLine("JOIN K_CRM_PERFORMANCEMETA B ON A.PERFORMANCEMETA = B.HANDLE                                             ");
                queryTotalMeta2.AppendLine("JOIN K_CRM_PERFORMANCETIPO C ON A.PERFORMANCETIPO = C.HANDLE                                             ");
                queryTotalMeta2.AppendLine("LEFT JOIN K_CRM_PERFORMANCETIPOTAREFA D ON D.TIPO = C.HANDLE                                             ");
                queryTotalMeta2.AppendLine("LEFT JOIN(                                                                                               ");
                queryTotalMeta2.AppendLine("    SELECT HANDLE, RESPONSAVEL, TAREFA, RESPOSTA, DATACONCLUSAO                                          ");
                queryTotalMeta2.AppendLine("    FROM K_CRM_TAREFAUSUARIO                                                                             ");
                queryTotalMeta2.AppendLine(") TAREFAS ON(TAREFAS.RESPONSAVEL = B.EXECUTIVO OR TAREFAS.RESPONSAVEL = B.SDR)                           ");
                queryTotalMeta2.AppendLine("             AND TAREFAS.TAREFA = D.TAREFA                                                               ");
                queryTotalMeta2.AppendLine("             AND D.RESPOSTAS LIKE '%' + CONVERT(VARCHAR, TAREFAS.RESPOSTA) + '%'                         ");
                queryTotalMeta2.AppendLine("             AND MONTH(TAREFAS.DATACONCLUSAO) = MONTH(B.MES)                                             ");
                queryTotalMeta2.AppendLine("             AND YEAR(TAREFAS.DATACONCLUSAO) = YEAR(B.MES)                                               ");
                queryTotalMeta2.AppendLine("LEFT JOIN(                                                                                               ");
                queryTotalMeta2.AppendLine("    SELECT HANDLE, RESPONSAVEL, DATAFECHAMENTO, STATUSOPORTUNIDADE                                       ");
                queryTotalMeta2.AppendLine("    FROM K_CRM_PESSOAOPORTUNIDADES                                                                       ");
                queryTotalMeta2.AppendLine(")OPORTUNIDADES ON(OPORTUNIDADES.RESPONSAVEL = B.EXECUTIVO OR OPORTUNIDADES.RESPONSAVEL = B.SDR)          ");
                queryTotalMeta2.AppendLine("             AND C.STATUSACEITO LIKE '%' + CONVERT(VARCHAR, OPORTUNIDADES.STATUSOPORTUNIDADE) + '%'      ");
                queryTotalMeta2.AppendLine("             AND MONTH(OPORTUNIDADES.DATAFECHAMENTO) = MONTH(B.MES)                                      ");
                queryTotalMeta2.AppendLine("             AND YEAR(OPORTUNIDADES.DATAFECHAMENTO) = YEAR(B.MES)                                        ");
                queryTotalMeta2.AppendLine("WHERE 1 = 1                                                                                              ");
                queryTotalMeta2.AppendLine("AND B.TIPO = 2                                                                                           ");
                queryTotalMeta2.AppendLine("AND C.PERFORMANCE IN (1,3)                                                                               ");
                queryTotalMeta2.AppendLine("AND MONTH(B.MES) = MONTH(GETDATE())                                                                                    ");
                queryTotalMeta2.AppendLine("AND YEAR(B.MES) = YEAR(GETDATE())                                                                        ");
                queryTotalMeta2.AppendLine("GROUP BY C.PERFORMANCE, A.HANDLE, B.EXECUTIVO, B.SDR, A.PERFORMANCETIPO, C.NOME, B.MES                   ");
                queryTotalMeta2.AppendLine(") TABEXEC1                                                                                               ");
                queryTotalMeta2.AppendLine("GROUP BY MES, PERFORMANCETIPO, NOMETIPO                                                                  ");

                List<EntityBase> listaMetas2 = queryTotalMeta2.Execute();
                List<TileProgress> listTiles = new List<TileProgress>();

                foreach(EntityBase ent in listaMetas2)
                {
                    TileProgress newTile    = new TileProgress();
                    newTile.Text            = ent.Fields["NOMETIPO"].ToString();
                    newTile.Resume          = "Realizado "+ ent.Fields["VALORREALIZADOS"].ToString() + " / "+ ent.Fields["META"].ToString();
                    newTile.Percent         = Math.Round((ent.Fields["VALORREALIZADOS"].ToDecimal() / ent.Fields["META"].ToDecimal())*100,2);
                    newTile.Color           = GetColor(newTile.Percent);
                    newTile.Status          = ent.Fields["VALORREALIZADOS"].ToString();
                    listTiles.Add(newTile);
                }

                return listTiles;
            }
            catch (Exception e)
            {
                StringBuilder builder = new StringBuilder();

                if (e.InnerException != null)
                    builder.AppendLine(e.InnerException.Message);
                else
                    builder.AppendLine(e.Message);

                builder.AppendLine(e.StackTrace);

                return null;

            }

        }

        public List<CrmPerformanceTile> ListMetasGeralUsuario(EntityBase model)
        {
            try
             {

                #region Teste Intervalo datas

                DateTime dataInicial = DateTime.ParseExact("16/10/2020 08:00", "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                DateTime dataFinal = DateTime.ParseExact("20/10/2020 10:00", "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                long tmSpan = 0;

                List<DateTime> dataFeriado = new List<DateTime>();
                dataFeriado.Add(DateTime.ParseExact("16/10/2020 00:00", "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture));
                dataFeriado.Add(DateTime.ParseExact("17/10/2020 00:00", "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture));
                dataFeriado.Add(DateTime.ParseExact("19/10/2020 00:00", "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture));

                foreach (DateTime day in EachDay(dataInicial, dataFinal))
                {
                   if(day.DayOfWeek != DayOfWeek.Saturday && day.DayOfWeek != DayOfWeek.Sunday)
                    {
                        if(dataInicial.Date == day.Date)
                        {
                            DateTime dataInicialFeriado = dataFeriado.FirstOrDefault(s=> s.Date == dataInicial.Date);

                            if (dataInicialFeriado.Year < 1950)
                            {
                                int hours = dataInicial.Hour;
                                int minutes = dataInicial.Minute;
                                tmSpan += TimeSpan.FromHours(24).Ticks - TimeSpan.FromMinutes(hours * 60 + minutes).Ticks;
                            }
                        }
                        else if(dataFinal.Date == day.Date)
                        {
                            DateTime dataFinalFeriado = dataFeriado.FirstOrDefault(x=> x.Date == dataFinal.Date);

                            if (dataFinalFeriado.Year < 1950)
                            {
                                int hours = dataFinal.Hour;
                                int minutes = dataFinal.Minute;
                                tmSpan += TimeSpan.FromMinutes(hours * 60 + minutes).Ticks;
                            }
                        }
                        else
                        {
                            tmSpan += TimeSpan.FromHours(24).Ticks;
                        }
                    }
                }

                TimeSpan tmSpanFinal = new TimeSpan(tmSpan);


                #endregion

                DateTime dtInicio = DateTime.Now;
                DateTime dtFim = DateTime.Now;
                EntityBase entUsuario = null;
                EntityBase entFilial = null;
                EntityBase entGrupo = null;
                EntityBase entVertical = null;

                if (model != null)
                {
                    if (((EntityAssociation)model.Fields["FILIAL"]).Handle.IsValid())
                        entFilial = ((EntityAssociation)model.Fields["FILIAL"]).Instance;

                    if (((EntityAssociation)model.Fields["USUARIO"]).Handle.IsValid())
                        entUsuario = ((EntityAssociation)model.Fields["USUARIO"]).Instance;

                    if (((EntityAssociation)model.Fields["GRUPO"]).Handle.IsValid())
                        entGrupo = ((EntityAssociation)model.Fields["GRUPO"]).Instance;

                    if (((EntityAssociation)model.Fields["VERTICAL"]).Handle.IsValid())
                        entVertical = ((EntityAssociation)model.Fields["VERTICAL"]).Instance;

                    //ZGrupoUsuarios user = ZGrupoUsuarios.GetFirstOrDefault(BennerContext.Security.GetLoggedUserHandle());

                    //if(entFilial == null)
                    //{
                    //    if (user.Fields["K_FILIAL"] != null)
                    //        if (((EntityAssociation)user.Fields["K_FILIAL"]).Handle.IsValid())
                    //            entFilial = ((EntityAssociation)user.Fields["K_FILIAL"]).Instance;

                    //}


                }

                Query queryTotalMetaUsuario = new Query();

                queryTotalMetaUsuario.AppendLine("SELECT A.HANDLE                                                                                                               ");
                queryTotalMetaUsuario.AppendLine("     , B.MES                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("     , B.ANO                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("     , B.FILIAL                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.GRUPO                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.PRODUTO                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.EXECUTIVO                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.SDR                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("     , C.PERFORMANCE                                                                                                          ");
                queryTotalMetaUsuario.AppendLine("     , A.PERFORMANCETIPO                                                                                                      ");
                queryTotalMetaUsuario.AppendLine("     , C.NOME NOMETIPO                                                                                                        ");
                queryTotalMetaUsuario.AppendLine("     , C.PERFORMANCE1                                                                                                         ");
                queryTotalMetaUsuario.AppendLine("     , C.PERFORMANCE2                                                                                                         ");
                queryTotalMetaUsuario.AppendLine("     , C.SELECAORESULTADO                                                                                                                                                     ");
                queryTotalMetaUsuario.AppendLine("     , C.RESULTADO                                                                                                                                                     ");
                queryTotalMetaUsuario.AppendLine("     , CASE                                                                                                                   ");
                queryTotalMetaUsuario.AppendLine("       WHEN C.PERFORMANCE = 1 THEN COUNT(TAREFAS.HANDLE)                                                                      ");
                queryTotalMetaUsuario.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 1 THEN COUNT(OPORTUNIDADES.HANDLE)                                                                ");
                queryTotalMetaUsuario.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 2 THEN COALESCE(SUM(OPORTUNIDADES.VALORTOTAL),0)                                                               ");
                queryTotalMetaUsuario.AppendLine("       END VALORREALIZADOS                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("     , SUM(DISTINCT A.VALOR) META                                                                                             ");
                queryTotalMetaUsuario.AppendLine("FROM K_CRM_PERFORMANCEMETAVALOR A                                                                                             ");
                queryTotalMetaUsuario.AppendLine("JOIN K_CRM_PERFORMANCEMETA B ON A.PERFORMANCEMETA = B.HANDLE                                                                  ");
                queryTotalMetaUsuario.AppendLine("JOIN K_CRM_PERFORMANCETIPO C ON A.PERFORMANCETIPO = C.HANDLE                                                                  ");
                queryTotalMetaUsuario.AppendLine("LEFT JOIN K_CRM_PERFORMANCETIPOTAREFA D ON D.TIPO = C.HANDLE                                                                  ");
                queryTotalMetaUsuario.AppendLine("LEFT JOIN(                                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("    SELECT HANDLE, RESPONSAVEL, RESPOSTAPRODUTO,(SELECT PES.FILIAL FROM K_CRM_PESSOAS PES WHERE PES.HANDLE = PESSOA) FILIAL, TAREFA, RESPOSTA, DATACONCLUSAO                                                               ");
                queryTotalMetaUsuario.AppendLine("    FROM K_CRM_TAREFAUSUARIO                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("    WHERE 1=1                                                                                                                 ");

                if(entUsuario != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL = :USUARIO                                                                                                  ");

                if (entVertical != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPOSTAPRODUTO = :VERTICAL                                                                                                  ");

                if (entFilial != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE K_FILIAL = :FILIAL)                                                                                                  ");

                if (entGrupo != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                                  ");

                if (entGrupo == null && entVertical == null && entFilial == null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL = @USUARIO                                                                                               ");

                queryTotalMetaUsuario.AppendLine(") TAREFAS ON(TAREFAS.RESPONSAVEL = B.EXECUTIVO                                                                                ");
                queryTotalMetaUsuario.AppendLine("              OR TAREFAS.RESPONSAVEL = B.SDR                                                                                  ");
                queryTotalMetaUsuario.AppendLine("              OR TAREFAS.RESPOSTAPRODUTO IN (B.PRODUTO)                                                                       ");

                if (entFilial != null && entUsuario == null && entVertical == null && entGrupo == null)
                    queryTotalMetaUsuario.AppendLine("              OR TAREFAS.FILIAL IN (B.FILIAL)                                                                       ");

                queryTotalMetaUsuario.AppendLine("              OR TAREFAS.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                           ");
                queryTotalMetaUsuario.AppendLine("             AND TAREFAS.TAREFA = D.TAREFA                                                                                    ");
                queryTotalMetaUsuario.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, TAREFAS.RESPOSTA) + '|_','|'+D.RESPOSTAS) > 0                                              ");
                queryTotalMetaUsuario.AppendLine("             AND MONTH(TAREFAS.DATACONCLUSAO) = MONTH(GETDATE())                                                              ");
                queryTotalMetaUsuario.AppendLine("             AND YEAR(TAREFAS.DATACONCLUSAO) = YEAR(GETDATE())                                                                ");
                queryTotalMetaUsuario.AppendLine("LEFT JOIN(                                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("    SELECT AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,COALESCE(SUM(ABITEM.VALORFINAL),0) VALORTOTAL,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE        ");
                queryTotalMetaUsuario.AppendLine("    FROM K_CRM_PESSOAOPORTUNIDADES AB                                                                                            ");
                queryTotalMetaUsuario.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESPROD ABPROD ON AB.HANDLE = ABPROD.OPORTUNIDADE                                                                                            ");
                queryTotalMetaUsuario.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESITENS ABITEM ON ABPROD.HANDLE = ABITEM.PRODUTO                                                                              ");
                queryTotalMetaUsuario.AppendLine("    WHERE 1=1                                                                                            ");
                queryTotalMetaUsuario.AppendLine("    AND ABPROD.STATUS = 1                                                                                            ");

                if (entUsuario != null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.RESPONSAVEL = :USUARIO                                                                                                  ");

                if (entGrupo != null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                          ");

                if (entVertical != null)
                    queryTotalMetaUsuario.AppendLine("    AND ABPROD.PRODUTO = :VERTICAL                                                                                            ");

                if (entFilial != null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.FILIAL = :FILIAL                                                                                            ");

                if (entGrupo == null && entVertical == null && entFilial == null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.RESPONSAVEL = @USUARIO                                                                                          ");

                queryTotalMetaUsuario.AppendLine("    GROUP BY AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE                                                                                           ");
                queryTotalMetaUsuario.AppendLine(")OPORTUNIDADES ON(OPORTUNIDADES.RESPONSAVEL = B.EXECUTIVO                                                                     ");
                queryTotalMetaUsuario.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL = B.SDR                                                                        ");
                queryTotalMetaUsuario.AppendLine("                  OR OPORTUNIDADES.PRODUTO IN (B.PRODUTO)                                                                        ");

                if(entFilial != null && entUsuario == null && entVertical == null && entGrupo == null)
                    queryTotalMetaUsuario.AppendLine("                  OR OPORTUNIDADES.FILIAL = B.FILIAL                                                                        ");

                queryTotalMetaUsuario.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                 ");
                queryTotalMetaUsuario.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, OPORTUNIDADES.STATUSOPORTUNIDADE) + '|_','|'+C.STATUSACEITO) > 0                           ");
                queryTotalMetaUsuario.AppendLine("             AND MONTH(OPORTUNIDADES.DATAFECHAMENTO) = MONTH(GETDATE())                                                           ");
                queryTotalMetaUsuario.AppendLine("             AND YEAR(OPORTUNIDADES.DATAFECHAMENTO) = YEAR(GETDATE())                                                             ");
                queryTotalMetaUsuario.AppendLine("WHERE 1 = 1                                                                                                                   ");

                if (entFilial != null)
                    queryTotalMetaUsuario.AppendLine("AND B.FILIAL IN (:FILIAL)                                                                           ");

                if (entUsuario != null)
                    queryTotalMetaUsuario.AppendLine("AND (B.EXECUTIVO IN (:USUARIO) OR B.SDR IN (:USUARIO))                                                                            ");
                else if(entGrupo != null)
                {
                    //queryTotalMetaUsuario.AppendLine("AND (B.GRUPO IN (:GRUPO))                                                                            ");
                    queryTotalMetaUsuario.AppendLine(@"AND (B.EXECUTIVO IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE INATIVO = 'N' AND GRUPO = :GRUPO AND K_FILIAL = :FILIAL ) 
                                                            OR 
                                                            B.SDR IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE INATIVO = 'N' AND GRUPO = :GRUPO AND K_FILIAL = :FILIAL ))                                                                            ");
                                                                                                                      
                }                                                                                                   
                else if (entVertical != null)
                    queryTotalMetaUsuario.AppendLine("AND B.PRODUTO IN (:VERTICAL)                                                                           ");
                else if (entFilial != null)
                {
                    queryTotalMetaUsuario.AppendLine("AND B.TIPO = 3                                                                           ");
                }
                else
                    queryTotalMetaUsuario.AppendLine("AND (B.EXECUTIVO IN (@USUARIO) OR B.SDR IN (@USUARIO))                                                                            ");

                queryTotalMetaUsuario.AppendLine("AND MONTH(B.MES) = MONTH(GETDATE()) AND YEAR(B.MES) = YEAR(GETDATE())                                                                                               ");
                queryTotalMetaUsuario.AppendLine("GROUP BY C.PERFORMANCE,C.SELECAORESULTADO,C.RESULTADO, A.HANDLE, B.FILIAL, B.GRUPO, B.PRODUTO, B.EXECUTIVO, B.SDR, A.PERFORMANCETIPO, C.NOME, B.MES,B.ANO, C.PERFORMANCE1,C.PERFORMANCE2       ");

                if (entUsuario != null)
                    queryTotalMetaUsuario.Parameters.Add("USUARIO", entUsuario.Handle);

                if (entGrupo != null)
                    queryTotalMetaUsuario.Parameters.Add("GRUPO", entGrupo.Handle);

                if (entVertical != null)
                    queryTotalMetaUsuario.Parameters.Add("VERTICAL", entVertical.Handle);

                if (entFilial != null)
                    queryTotalMetaUsuario.Parameters.Add("FILIAL", entFilial.Handle);

                List<EntityBase> listaMetasUsuario = new List<EntityBase>();

                listaMetasUsuario = queryTotalMetaUsuario.Execute();

                List<CrmPerformanceTile> listPerformance = new List<CrmPerformanceTile>();

                foreach(EntityBase ent in listaMetasUsuario)
                {
                    listPerformance.Add(StartTile(ent));
                }

                Query queryTotalMetaGrupo = new Query();

                queryTotalMetaGrupo.AppendLine("SELECT A.HANDLE                                                                                                                 ");
                queryTotalMetaGrupo.AppendLine("     , B.MES                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("     , B.ANO                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("     , B.FILIAL                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.GRUPO                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.PRODUTO                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.EXECUTIVO                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.SDR                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("     , C.PERFORMANCE                                                                                                            ");
                queryTotalMetaGrupo.AppendLine("     , A.PERFORMANCETIPO                                                                                                        ");
                queryTotalMetaGrupo.AppendLine("     , C.NOME NOMETIPO                                                                                                          ");
                queryTotalMetaGrupo.AppendLine("     , C.PERFORMANCE1                                                                                                           ");
                queryTotalMetaGrupo.AppendLine("     , C.PERFORMANCE2                                                                                                           ");
                queryTotalMetaGrupo.AppendLine("     , C.SELECAORESULTADO                                                                                                                                                     ");
                queryTotalMetaGrupo.AppendLine("     , C.RESULTADO                                                                                                                                                     ");
                queryTotalMetaGrupo.AppendLine("     , CASE                                                                                                                     ");
                queryTotalMetaGrupo.AppendLine("       WHEN C.PERFORMANCE = 1 THEN COUNT(TAREFAS.HANDLE)                                                                        ");
                queryTotalMetaGrupo.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 1 THEN COUNT(OPORTUNIDADES.HANDLE)                                                                  ");
                queryTotalMetaGrupo.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 2 THEN COALESCE(SUM(OPORTUNIDADES.VALORTOTAL),0)                                                                  ");
                queryTotalMetaGrupo.AppendLine("       END VALORREALIZADOS                                                                                                      ");
                queryTotalMetaGrupo.AppendLine("     , SUM(DISTINCT A.VALOR) META                                                                                               ");
                queryTotalMetaGrupo.AppendLine("FROM K_CRM_PERFORMANCEMETAVALOR A                                                                                               ");
                queryTotalMetaGrupo.AppendLine("JOIN K_CRM_PERFORMANCEMETA B ON A.PERFORMANCEMETA = B.HANDLE                                                                    ");
                queryTotalMetaGrupo.AppendLine("JOIN K_CRM_PERFORMANCETIPO C ON A.PERFORMANCETIPO = C.HANDLE                                                                    ");
                queryTotalMetaGrupo.AppendLine("LEFT JOIN K_CRM_PERFORMANCETIPOTAREFA D ON D.TIPO = C.HANDLE                                                                    ");
                queryTotalMetaGrupo.AppendLine("LEFT JOIN(                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("    SELECT HANDLE, RESPONSAVEL,RESPOSTAPRODUTO,(SELECT PES.FILIAL FROM K_CRM_PESSOAS PES WHERE PES.HANDLE = PESSOA) FILIAL, TAREFA, RESPOSTA, DATACONCLUSAO                                                               ");
                queryTotalMetaGrupo.AppendLine("    FROM K_CRM_TAREFAUSUARIO                                                                                                  ");
                queryTotalMetaGrupo.AppendLine("    WHERE 1=1                                                                                                                 ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL = :USUARIO                                                                                                  ");

                if (entGrupo != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                                ");

                if (entVertical != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPOSTAPRODUTO = :VERTICAL                                                                                                  ");

                if (entFilial != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE K_FILIAL = :FILIAL)                                                                                                ");

                if (entGrupo == null && entVertical == null && entFilial == null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL = @USUARIO                                                                                               ");

                queryTotalMetaGrupo.AppendLine(") TAREFAS ON(TAREFAS.RESPONSAVEL = B.EXECUTIVO                                                                                ");
                queryTotalMetaGrupo.AppendLine("              OR TAREFAS.RESPONSAVEL = B.SDR                                                                                  ");
                queryTotalMetaGrupo.AppendLine("              OR TAREFAS.RESPOSTAPRODUTO IN (B.PRODUTO)                                                                       ");

                if (entFilial != null && entUsuario == null && entVertical == null && entGrupo == null)
                    queryTotalMetaGrupo.AppendLine("              OR TAREFAS.FILIAL IN (B.FILIAL)                                                                       ");

                queryTotalMetaGrupo.AppendLine("              OR TAREFAS.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                           ");
                queryTotalMetaGrupo.AppendLine("             AND TAREFAS.TAREFA = D.TAREFA                                                                                    ");
                queryTotalMetaGrupo.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, TAREFAS.RESPOSTA) + '|_','|'+D.RESPOSTAS) > 0                                              ");
                queryTotalMetaGrupo.AppendLine("             AND MONTH(TAREFAS.DATACONCLUSAO) = MONTH(GETDATE())                                                              ");
                queryTotalMetaGrupo.AppendLine("             AND YEAR(TAREFAS.DATACONCLUSAO) = YEAR(GETDATE())                                                                ");
                queryTotalMetaGrupo.AppendLine("LEFT JOIN(                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("    SELECT AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,COALESCE(SUM(ABITEM.VALORFINAL),0) VALORTOTAL,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE        ");
                queryTotalMetaGrupo.AppendLine("    FROM K_CRM_PESSOAOPORTUNIDADES AB                                                                                            ");
                queryTotalMetaGrupo.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESPROD ABPROD ON AB.HANDLE = ABPROD.OPORTUNIDADE                                                                                            ");
                queryTotalMetaGrupo.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESITENS ABITEM ON ABPROD.HANDLE = ABITEM.PRODUTO                                                                              ");
                queryTotalMetaGrupo.AppendLine("    WHERE 1=1                                                                                            ");
                queryTotalMetaGrupo.AppendLine("    AND ABPROD.STATUS = 1                                                                                            ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.RESPONSAVEL = :USUARIO                                                                                            ");

                if (entGrupo != null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                                ");

                if (entVertical != null)
                    queryTotalMetaGrupo.AppendLine("    AND ABPROD.PRODUTO = :VERTICAL                                                                                            ");

                if (entFilial != null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.FILIAL = :FILIAL                                                                                            ");

                if (entGrupo == null && entVertical == null && entFilial == null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.RESPONSAVEL = @USUARIO                                                                                            ");

                queryTotalMetaGrupo.AppendLine("    GROUP BY AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE                                                                                          ");
                queryTotalMetaGrupo.AppendLine(")OPORTUNIDADES ON(OPORTUNIDADES.RESPONSAVEL = B.EXECUTIVO                                                                     ");
                queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL = B.SDR                                                                        ");
                queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.PRODUTO IN (B.PRODUTO)                                                                        ");

                if (entFilial != null && entUsuario == null && entVertical == null && entGrupo == null)
                    queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.FILIAL = B.FILIAL                                                                        ");

                queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                 ");
                queryTotalMetaGrupo.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, OPORTUNIDADES.STATUSOPORTUNIDADE) + '|_','|'+C.STATUSACEITO) > 0                           ");
                queryTotalMetaGrupo.AppendLine("             AND MONTH(OPORTUNIDADES.DATAFECHAMENTO) = MONTH(GETDATE())                                                               ");
                queryTotalMetaGrupo.AppendLine("             AND YEAR(OPORTUNIDADES.DATAFECHAMENTO) = YEAR(GETDATE())                                                               ");
                queryTotalMetaGrupo.AppendLine("WHERE 1 = 1                                                                                                                     ");

                if (entFilial != null)
                    queryTotalMetaGrupo.AppendLine("AND B.FILIAL IN (:FILIAL)                                                                           ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.AppendLine("AND (B.GRUPO IN (SELECT GRUPO FROM Z_GRUPOUSUARIOS WHERE HANDLE = :USUARIO))                            ");
                else if(entGrupo != null)
                    queryTotalMetaGrupo.AppendLine("AND (B.GRUPO IN (:GRUPO))                                                                               ");
                else if (entVertical != null)
                    queryTotalMetaGrupo.AppendLine("AND (B.PRODUTO IN (:VERTICAL))                                                                               ");
                else
                {
                    queryTotalMetaGrupo.AppendLine("AND (B.GRUPO IN (SELECT GRUPO FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO))                            ");
                    queryTotalMetaGrupo.AppendLine("AND (B.FILIAL IN (SELECT K_FILIAL FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO))                            ");

                }

                queryTotalMetaGrupo.AppendLine("AND YEAR(B.ANO) = YEAR(GETDATE())                                                                           ");
                queryTotalMetaGrupo.AppendLine("GROUP BY C.PERFORMANCE,C.SELECAORESULTADO, C.RESULTADO, A.HANDLE, B.FILIAL, B.GRUPO, B.PRODUTO, B.EXECUTIVO, B.SDR, A.PERFORMANCETIPO, C.NOME, B.MES,B.ANO, C.PERFORMANCE1,C.PERFORMANCE2                    ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.Parameters.Add("USUARIO", entUsuario.Handle);

                if (entGrupo != null)
                    queryTotalMetaGrupo.Parameters.Add("GRUPO", entGrupo.Handle);

                if (entVertical != null)
                    queryTotalMetaGrupo.Parameters.Add("VERTICAL", entVertical.Handle);

                if (entFilial != null)
                    queryTotalMetaGrupo.Parameters.Add("FILIAL", entFilial.Handle);

                List<EntityBase> listaMetasGrupo = queryTotalMetaGrupo.Execute();

                int numeroUsuarioGrupo = 1;

                if (entGrupo != null)
                {
                    Query queryCountUsuario = new Query();

                    queryCountUsuario.AppendLine("SELECT COUNT(A.HANDLE) TOTAL  ");
                    queryCountUsuario.AppendLine("FROM Z_GRUPOUSUARIOS A        ");
                    queryCountUsuario.AppendLine("WHERE 1=1                     ");
                    queryCountUsuario.AppendLine("AND A.INATIVO = 'N'           ");
                    queryCountUsuario.AppendLine("AND A.GRUPO = :GRUPO          ");

                    if(entFilial != null)
                    {
                        queryCountUsuario.AppendLine("AND A.K_FILIAL = :FILIAL          ");
                        queryCountUsuario.Parameters.Add("FILIAL", entFilial.Handle);
                    }

                    queryCountUsuario.Parameters.Add("GRUPO", entGrupo.Handle);

                    List<EntityBase> listUsuario = queryCountUsuario.Execute();

                    numeroUsuarioGrupo = listUsuario[0].Fields["TOTAL"].ToInt();
                }
                else if (entVertical != null)
                {
                    Query queryCountUsuario = new Query();

                    queryCountUsuario.AppendLine("SELECT COUNT(A.HANDLE) TOTAL                  ");
                    queryCountUsuario.AppendLine("FROM Z_GRUPOUSUARIOS A                        ");
                    queryCountUsuario.AppendLine("WHERE 1=1                                     ");
                    queryCountUsuario.AppendLine("AND A.INATIVO = 'N'                           ");
                    queryCountUsuario.AppendLine("AND A.K_VERTICAL LIKE '%' + CONVERT(VARCHAR, :VERTICAL) + '%'   ");

                    if (entFilial != null)
                    {
                        queryCountUsuario.AppendLine("AND A.K_FILIAL = :FILIAL          ");
                        queryCountUsuario.Parameters.Add("FILIAL", entFilial.Handle);
                    }
                    queryCountUsuario.Parameters.Add("VERTICAL", entVertical.Handle);

                    List<EntityBase> listUsuario = queryCountUsuario.Execute();

                    numeroUsuarioGrupo = listUsuario[0].Fields["TOTAL"].ToInt();
                }
                else if(entFilial != null)
                {
                    Query queryCountUsuario = new Query();

                    queryCountUsuario.AppendLine("SELECT COUNT(A.HANDLE) TOTAL  ");
                    queryCountUsuario.AppendLine("FROM Z_GRUPOUSUARIOS A        ");
                    queryCountUsuario.AppendLine("WHERE 1=1                     ");
                    queryCountUsuario.AppendLine("AND A.INATIVO = 'N'           ");
                    queryCountUsuario.AppendLine("AND A.K_FILIAL = :FILIAL      ");

                    if(entUsuario != null)
                        queryCountUsuario.AppendLine("AND A.HANDLE = :USUARIO      ");

                    queryCountUsuario.Parameters.Add("FILIAL", entFilial.Handle);

                    if (entUsuario != null)
                        queryCountUsuario.Parameters.Add("USUARIO", entUsuario.Handle);

                    List<EntityBase> listUsuario = queryCountUsuario.Execute();

                    numeroUsuarioGrupo = listUsuario[0].Fields["TOTAL"].ToInt();

                }
                

                foreach (EntityBase ent in listaMetasGrupo)
                {
                    //EntityBase entExistente = listaMetasUsuario
                    //                                .Where(x => x.Fields["PERFORMANCETIPO"].ToString() == ent.Fields["PERFORMANCETIPO"].ToString())
                    //                                .FirstOrDefault();
                    //if(entExistente == null)
                    //{
                    //    CrmPerformanceTile newTile = StartTile(ent);
                    //    newTile.Meta = (ent.Fields["META"].ToLong() * numeroUsuarioGrupo).ToString();

                    //    listPerformance.Add(newTile);
                    //}

                    List<CrmPerformanceTile> listEntExistente = listPerformance
                                                    .Where(x => x.PerformanceTipo == ent.Fields["PERFORMANCETIPO"].ToString())
                                                    .ToList();
                    if (listEntExistente.Count() == 0)
                    {
                        CrmPerformanceTile newTile = StartTile(ent);

                        if (newTile.Performance == "2")
                            newTile.Meta = (ent.Fields["META"].ToLong()).ToString();
                        else
                            newTile.Meta = (ent.Fields["META"].ToLong() * numeroUsuarioGrupo).ToString();

                        listPerformance.Add(newTile);
                    }
                    else
                    {
                        CrmPerformanceTile newTile = StartTile(ent);

                        decimal metaGrupo = ent.Fields["META"].ToDecimal() * (numeroUsuarioGrupo - listEntExistente.Count());
                        decimal metaUsuarioMes = listEntExistente.Sum(x => x.Meta.ToDecimal());

                        listPerformance.RemoveAll(x => x.PerformanceTipo == newTile.PerformanceTipo);

                        if (newTile.Performance == "2")
                        {
                            newTile.Meta = Math.Round((metaGrupo + metaUsuarioMes), 2).ToString();
                        }
                        else
                        {
                            newTile.Meta = (metaGrupo + metaUsuarioMes).ToString();
                        }

                        listPerformance.Add(newTile);

                    }


                }

                foreach(CrmPerformanceTile perf in listPerformance)
                {
                    if(perf.ValorRealizados == null)
                    {
                        CrmPerformanceTile perf1 = listPerformance
                                            .Where(x => x.PerformanceTipo == perf.Performance1)
                                            .FirstOrDefault();

                        CrmPerformanceTile perf2 = listPerformance
                                            .Where(x => x.PerformanceTipo == perf.Performance2)
                                            .FirstOrDefault();

                        if (perf1 != null && perf2 != null)
                        {
                            if (perf1.SelecaoResultado == "2" && perf.Resultado == "1")
                                perf.SelecaoResultado = "2";

                            string valor1 = perf1.ValorRealizados;
                            string valor2 = perf2.ValorRealizados;

                            if (valor2 == "0")
                                valor2 = "1";

                            if(perf.Resultado == "2")
                                perf.ValorRealizados = Math.Round((valor1.ToDecimal() / valor2.ToDecimal())*100,2).ToString();
                            else
                                perf.ValorRealizados = Math.Round((valor1.ToDecimal() / valor2.ToDecimal()), 2).ToString();
                        }

                    }

                    perf.CalculaPercent();
                }

                return listPerformance.OrderBy(x => x.NomeTipo).ToList();
            }
            catch (Exception e)
            {
                StringBuilder builder = new StringBuilder();

                if (e.InnerException != null)
                    builder.AppendLine(e.InnerException.Message);
                else
                    builder.AppendLine(e.Message);

                builder.AppendLine(e.StackTrace);

                return null;

            }

        }

        public List<CrmPerformanceTile> ListMetasGeralUsuarioAno(EntityBase model)
        {
            try
            {
                DateTime dtInicio = DateTime.Now;
                DateTime dtFim = DateTime.Now;
                EntityBase entUsuario = null;
                EntityBase entFilial = null;
                EntityBase entGrupo = null;
                EntityBase entVertical = null;

                if (model != null)
                {
                    if (((EntityAssociation)model.Fields["FILIAL"]).Handle.IsValid())
                        entFilial = ((EntityAssociation)model.Fields["FILIAL"]).Instance;

                    if (((EntityAssociation)model.Fields["USUARIO"]).Handle.IsValid())
                        entUsuario = ((EntityAssociation)model.Fields["USUARIO"]).Instance;

                    if (((EntityAssociation)model.Fields["GRUPO"]).Handle.IsValid())
                        entGrupo = ((EntityAssociation)model.Fields["GRUPO"]).Instance;

                    if (((EntityAssociation)model.Fields["VERTICAL"]).Handle.IsValid())
                        entVertical = ((EntityAssociation)model.Fields["VERTICAL"]).Instance;

                }

                Query queryTotalMetaUsuario = new Query();

                queryTotalMetaUsuario.AppendLine("SELECT SUM(I.META) META, SUM(I.VALORREALIZADOS) VALORREALIZADOS, ");
                queryTotalMetaUsuario.AppendLine("I.EXECUTIVO, I.PERFORMANCE, I.FILIAL, I.PERFORMANCETIPO,         ");
                queryTotalMetaUsuario.AppendLine("I.NOMETIPO, I.SELECAORESULTADO, I.RESULTADO  FROM (              ");

                queryTotalMetaUsuario.AppendLine("SELECT A.HANDLE                                                                                                                                               ");
                queryTotalMetaUsuario.AppendLine("     , B.MES                                                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("     , B.ANO                                                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("     , B.FILIAL                                                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.GRUPO                                                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.PRODUTO                                                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.EXECUTIVO                                                                                                                                            ");
                queryTotalMetaUsuario.AppendLine("     , B.SDR                                                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("     , C.PERFORMANCE                                                                                                                                          ");
                queryTotalMetaUsuario.AppendLine("     , A.PERFORMANCETIPO                                                                                                                                      ");
                queryTotalMetaUsuario.AppendLine("     , C.NOME NOMETIPO                                                                                                                                        ");
                queryTotalMetaUsuario.AppendLine("     , C.PERFORMANCE1                                                                                                                                         ");
                queryTotalMetaUsuario.AppendLine("     , C.PERFORMANCE2                                                                                                                                         ");
                queryTotalMetaUsuario.AppendLine("     , C.SELECAORESULTADO                                                                                                                                                     ");
                queryTotalMetaUsuario.AppendLine("     , C.RESULTADO                                                                                                                                                     ");
                queryTotalMetaUsuario.AppendLine("     , CASE                                                                                                                                                   ");
                queryTotalMetaUsuario.AppendLine("       WHEN C.PERFORMANCE = 1 THEN COUNT(TAREFAS.HANDLE)                                                                                                      ");
                queryTotalMetaUsuario.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 1 THEN COUNT(OPORTUNIDADES.HANDLE)                                                                     ");
                queryTotalMetaUsuario.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 2 THEN COALESCE(SUM(OPORTUNIDADES.VALORTOTAL),0)                                                                   ");
                queryTotalMetaUsuario.AppendLine("       END VALORREALIZADOS                                                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("     , SUM(DISTINCT A.VALOR) META                                                                                                                             ");
                queryTotalMetaUsuario.AppendLine("FROM K_CRM_PERFORMANCEMETAVALOR A                                                                                                                             ");
                queryTotalMetaUsuario.AppendLine("JOIN K_CRM_PERFORMANCEMETA B ON A.PERFORMANCEMETA = B.HANDLE                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("JOIN K_CRM_PERFORMANCETIPO C ON A.PERFORMANCETIPO = C.HANDLE                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("LEFT JOIN K_CRM_PERFORMANCETIPOTAREFA D ON D.TIPO = C.HANDLE                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("LEFT JOIN(                                                                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("    SELECT HANDLE, RESPONSAVEL,(SELECT PES.FILIAL FROM K_CRM_PESSOAS PES WHERE PES.HANDLE = PESSOA) FILIAL, RESPOSTAPRODUTO,TAREFA, RESPOSTA, DATACONCLUSAO   ");
                queryTotalMetaUsuario.AppendLine("    FROM K_CRM_TAREFAUSUARIO                                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("    WHERE 1=1                                                                                                                 ");

                if (entUsuario != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL = :USUARIO                                                                                                  ");

                if (entGrupo != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                                ");

                if (entVertical != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPOSTAPRODUTO = :VERTICAL                                                                                                  ");

                if (entFilial != null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE K_FILIAL = :FILIAL)                                                                                                ");

                if (entGrupo == null && entVertical == null && entFilial == null)
                    queryTotalMetaUsuario.AppendLine("    AND RESPONSAVEL = @USUARIO                                                                                               ");

                queryTotalMetaUsuario.AppendLine(") TAREFAS ON(TAREFAS.RESPONSAVEL = B.EXECUTIVO                                                                                                                ");
                queryTotalMetaUsuario.AppendLine("              OR TAREFAS.RESPONSAVEL = B.SDR                                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("              OR TAREFAS.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                                                           ");
                queryTotalMetaUsuario.AppendLine("             AND TAREFAS.TAREFA = D.TAREFA                                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, TAREFAS.RESPOSTA) + '|_','|'+D.RESPOSTAS) > 0                                                                              ");
                queryTotalMetaUsuario.AppendLine("             AND MONTH(TAREFAS.DATACONCLUSAO) = MONTH(B.MES)                                                                                                  ");
                queryTotalMetaUsuario.AppendLine("             AND YEAR(TAREFAS.DATACONCLUSAO) = YEAR(B.MES)                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("LEFT JOIN(                                                                                                                                                    ");
                queryTotalMetaUsuario.AppendLine("    SELECT AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,COALESCE(SUM(ABITEM.VALORFINAL),0) VALORTOTAL,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE                                        ");
                queryTotalMetaUsuario.AppendLine("    FROM K_CRM_PESSOAOPORTUNIDADES AB                                                                                                                         ");
                queryTotalMetaUsuario.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESPROD ABPROD ON AB.HANDLE = ABPROD.OPORTUNIDADE                                                                              ");
                queryTotalMetaUsuario.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESITENS ABITEM ON ABPROD.HANDLE = ABITEM.PRODUTO                                                                              ");
                queryTotalMetaUsuario.AppendLine("    WHERE 1=1                                                                                                                                                 ");
                queryTotalMetaUsuario.AppendLine("    AND ABPROD.STATUS = 1                                                                                                                                     ");

                if (entUsuario != null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.RESPONSAVEL = :USUARIO                                                                                            ");
                if (entGrupo != null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                            ");
                if (entVertical != null)
                    queryTotalMetaUsuario.AppendLine("    AND ABPROD.PRODUTO = :VERTICAL                                                                                            ");
                if (entFilial != null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.FILIAL = :FILIAL                                                                                            ");
                if (entGrupo == null && entVertical == null && entFilial == null)
                    queryTotalMetaUsuario.AppendLine("    AND AB.RESPONSAVEL = @USUARIO                                                                                            ");

                queryTotalMetaUsuario.AppendLine("    GROUP BY AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE                                                                                                                                     ");
                queryTotalMetaUsuario.AppendLine(")OPORTUNIDADES ON(OPORTUNIDADES.RESPONSAVEL = B.EXECUTIVO                                                                                                     ");
                queryTotalMetaUsuario.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL = B.SDR                                                                                                        ");
                queryTotalMetaUsuario.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                                                 ");
                queryTotalMetaUsuario.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, OPORTUNIDADES.STATUSOPORTUNIDADE) + '|_','|'+C.STATUSACEITO) > 0                                                           ");
                queryTotalMetaUsuario.AppendLine("             AND MONTH(OPORTUNIDADES.DATAFECHAMENTO) = MONTH(B.MES)                                                                                           ");
                queryTotalMetaUsuario.AppendLine("             AND YEAR(OPORTUNIDADES.DATAFECHAMENTO) = YEAR(B.MES)                                                                                             ");
                queryTotalMetaUsuario.AppendLine("WHERE 1 = 1                                                                                                                                                   ");

                if (entFilial != null)
                    queryTotalMetaUsuario.AppendLine("AND B.FILIAL IN (:FILIAL)                                                                           ");

                if (entUsuario != null)
                    queryTotalMetaUsuario.AppendLine("AND (B.EXECUTIVO IN (:USUARIO) OR B.SDR IN (:USUARIO))                                                                            ");
                else if (entGrupo != null)
                {
                    //queryTotalMetaUsuario.AppendLine("AND (B.GRUPO IN (:GRUPO))                                                                            ");
                    queryTotalMetaUsuario.AppendLine(@"AND (B.EXECUTIVO IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE INATIVO = 'N' AND GRUPO = :GRUPO AND K_FILIAL = :FILIAL ) 
                                                            OR 
                                                            B.SDR IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE INATIVO = 'N' AND GRUPO = :GRUPO AND K_FILIAL = :FILIAL ))                                                                            ");

                }
                else
                    queryTotalMetaUsuario.AppendLine("AND (B.EXECUTIVO IN (@USUARIO) OR B.SDR IN (@USUARIO))                                                                            ");

                queryTotalMetaUsuario.AppendLine("AND YEAR(B.MES) = YEAR(GETDATE())                                                                                             ");
                queryTotalMetaUsuario.AppendLine("GROUP BY C.PERFORMANCE,C.SELECAORESULTADO, C.RESULTADO, A.HANDLE, B.FILIAL, B.GRUPO, B.PRODUTO, B.EXECUTIVO, B.SDR, A.PERFORMANCETIPO, C.NOME, B.MES, B.ANO, C.PERFORMANCE1, C.PERFORMANCE2 ");

                if (entUsuario != null)
                    queryTotalMetaUsuario.Parameters.Add("USUARIO", entUsuario.Handle);

                if(entFilial != null)
                    queryTotalMetaUsuario.Parameters.Add("FILIAL", entFilial.Handle);

                if (entGrupo != null)
                    queryTotalMetaUsuario.Parameters.Add("GRUPO", entGrupo.Handle);

                queryTotalMetaUsuario.AppendLine(") I GROUP BY I.EXECUTIVO, I.PERFORMANCE, I.FILIAL, I.PERFORMANCETIPO, I.NOMETIPO, I.SELECAORESULTADO, I.RESULTADO");

                List<EntityBase> listaMetasUsuario = new List<EntityBase>();

                listaMetasUsuario = queryTotalMetaUsuario.Execute();

                List<CrmPerformanceTile> listPerformance = new List<CrmPerformanceTile>();

                foreach (EntityBase ent in listaMetasUsuario)
                {
                    listPerformance.Add(StartTileAno(ent));
                }

                Query queryTotalMetaGrupo = new Query();

                queryTotalMetaGrupo.AppendLine("SELECT A.HANDLE                                                                                                                                                 ");
                queryTotalMetaGrupo.AppendLine("     , B.MES                                                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("     , B.ANO                                                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("     , B.FILIAL                                                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.GRUPO                                                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.PRODUTO                                                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.EXECUTIVO                                                                                                                                              ");
                queryTotalMetaGrupo.AppendLine("     , B.SDR                                                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("     , C.PERFORMANCE                                                                                                                                            ");
                queryTotalMetaGrupo.AppendLine("     , A.PERFORMANCETIPO                                                                                                                                        ");
                queryTotalMetaGrupo.AppendLine("     , C.NOME NOMETIPO                                                                                                                                          ");
                queryTotalMetaGrupo.AppendLine("     , C.PERFORMANCE1                                                                                                                                           ");
                queryTotalMetaGrupo.AppendLine("     , C.PERFORMANCE2                                                                                                                                           ");
                queryTotalMetaGrupo.AppendLine("     , C.SELECAORESULTADO                                                                                                                                                     ");
                queryTotalMetaGrupo.AppendLine("     , C.RESULTADO                                                                                                                                                     ");
                queryTotalMetaGrupo.AppendLine("     , CASE                                                                                                                                                     ");
                queryTotalMetaGrupo.AppendLine("       WHEN C.PERFORMANCE = 1 THEN COUNT(TAREFAS.HANDLE)                                                                                                        ");
                queryTotalMetaGrupo.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 1 THEN COUNT(OPORTUNIDADES.HANDLE)                                                                                                  ");
                queryTotalMetaGrupo.AppendLine("       WHEN C.PERFORMANCE = 3 AND C.SELECAORESULTADO = 2 THEN COALESCE(SUM(OPORTUNIDADES.VALORTOTAL),0)                                                                                                  ");
                queryTotalMetaGrupo.AppendLine("       END VALORREALIZADOS                                                                                                                                      ");
                queryTotalMetaGrupo.AppendLine("     , SUM(DISTINCT A.VALOR) META                                                                                                                               ");
                queryTotalMetaGrupo.AppendLine("FROM K_CRM_PERFORMANCEMETAVALOR A                                                                                                                               ");
                queryTotalMetaGrupo.AppendLine("JOIN K_CRM_PERFORMANCEMETA B ON A.PERFORMANCEMETA = B.HANDLE                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("JOIN K_CRM_PERFORMANCETIPO C ON A.PERFORMANCETIPO = C.HANDLE                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("LEFT JOIN K_CRM_PERFORMANCETIPOTAREFA D ON D.TIPO = C.HANDLE                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("LEFT JOIN(                                                                                                                                                      ");
                queryTotalMetaGrupo.AppendLine("    SELECT HANDLE, RESPONSAVEL,(SELECT PES.FILIAL FROM K_CRM_PESSOAS PES WHERE PES.HANDLE = PESSOA) FILIAL, RESPOSTAPRODUTO,TAREFA, RESPOSTA, DATACONCLUSAO     ");
                queryTotalMetaGrupo.AppendLine("    FROM K_CRM_TAREFAUSUARIO                                                                                                                                    ");
                queryTotalMetaGrupo.AppendLine("    WHERE 1=1                                                                                                    ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL = :USUARIO                                                                                                  ");

                if (entGrupo != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                                ");

                if (entVertical != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPOSTAPRODUTO = :VERTICAL                                                                                                  ");

                if (entFilial != null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE K_FILIAL = :FILIAL)                                                                                                ");

                if (entGrupo == null && entVertical == null && entFilial == null)
                    queryTotalMetaGrupo.AppendLine("    AND RESPONSAVEL = @USUARIO                                                                                               ");

                queryTotalMetaGrupo.AppendLine(") TAREFAS ON(TAREFAS.RESPONSAVEL = B.EXECUTIVO                                                                                  ");
                queryTotalMetaGrupo.AppendLine("              OR TAREFAS.RESPONSAVEL = B.SDR                                                                                    ");

                if (entFilial != null && entUsuario == null && entVertical == null && entGrupo == null)
                    queryTotalMetaGrupo.AppendLine("              OR TAREFAS.FILIAL IN (B.FILIAL)                                                                                   ");

                queryTotalMetaGrupo.AppendLine("              OR TAREFAS.RESPOSTAPRODUTO IN (B.PRODUTO)                                                                                    ");
                queryTotalMetaGrupo.AppendLine("              OR TAREFAS.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                             ");
                queryTotalMetaGrupo.AppendLine("             AND TAREFAS.TAREFA = D.TAREFA                                                                                      ");
                queryTotalMetaGrupo.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, TAREFAS.RESPOSTA) + '|_','|'+D.RESPOSTAS) > 0                                                ");
                queryTotalMetaGrupo.AppendLine("             AND YEAR(TAREFAS.DATACONCLUSAO) = YEAR(B.ANO)                                                                      ");
                queryTotalMetaGrupo.AppendLine("LEFT JOIN(                                                                                                                      ");
                queryTotalMetaGrupo.AppendLine("    SELECT AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,COALESCE(SUM(ABITEM.VALORFINAL),0) VALORTOTAL,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE                                                              ");
                queryTotalMetaGrupo.AppendLine("    FROM K_CRM_PESSOAOPORTUNIDADES AB                                                                                              ");
                queryTotalMetaGrupo.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESPROD ABPROD ON AB.HANDLE = ABPROD.OPORTUNIDADE                                                                                              ");
                queryTotalMetaGrupo.AppendLine("    JOIN K_CRM_PESSOAOPORTUNIDADESITENS ABITEM ON ABPROD.HANDLE = ABITEM.PRODUTO                                                                              ");
                queryTotalMetaGrupo.AppendLine("    WHERE 1=1                                                                                              ");
                queryTotalMetaGrupo.AppendLine("    AND ABPROD.STATUS = 1                                                                                              ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.RESPONSAVEL = :USUARIO                                                                                            ");

                if (entGrupo != null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = :GRUPO)                                                                                            ");
                if (entVertical != null)
                    queryTotalMetaGrupo.AppendLine("    AND ABPROD.PRODUTO = :VERTICAL                                                                                            ");
                if (entFilial != null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.FILIAL = :FILIAL                                                                                            ");

                if (entFilial == null && entUsuario == null && entVertical == null && entGrupo == null)
                    queryTotalMetaGrupo.AppendLine("    AND AB.RESPONSAVEL = @USUARIO                                                                                           ");

                queryTotalMetaGrupo.AppendLine("    GROUP BY AB.HANDLE ,AB.FILIAL ,AB.RESPONSAVEL, ABPROD.PRODUTO,AB.DATAFECHAMENTO, AB.STATUSOPORTUNIDADE                                                                                                                                     ");
                queryTotalMetaGrupo.AppendLine(")OPORTUNIDADES ON(OPORTUNIDADES.RESPONSAVEL = B.EXECUTIVO                                                                       ");
                queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL = B.SDR                                                                          ");
                queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.PRODUTO IN (B.PRODUTO)                                                                         ");

                if (entFilial != null && entUsuario == null && entVertical == null && entGrupo == null)
                    queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.FILIAL IN (B.FILIAL)                                                                        ");

                queryTotalMetaGrupo.AppendLine("                  OR OPORTUNIDADES.RESPONSAVEL IN (SELECT HANDLE FROM Z_GRUPOUSUARIOS WHERE GRUPO = B.GRUPO))                   ");
                queryTotalMetaGrupo.AppendLine("             AND CHARINDEX('|'+CONVERT(VARCHAR, OPORTUNIDADES.STATUSOPORTUNIDADE) + '|_','|'+C.STATUSACEITO) > 0                             ");
                queryTotalMetaGrupo.AppendLine("             AND YEAR(OPORTUNIDADES.DATAFECHAMENTO) = YEAR(B.ANO)                                                               ");
                queryTotalMetaGrupo.AppendLine("WHERE 1 = 1                                                                                                                     ");

                if (entFilial != null)
                    queryTotalMetaGrupo.AppendLine("AND B.FILIAL IN (:FILIAL)                                                                           ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.AppendLine("AND (B.GRUPO IN (SELECT GRUPO FROM Z_GRUPOUSUARIOS WHERE HANDLE = :USUARIO))                            ");
                if (entGrupo != null)
                    queryTotalMetaGrupo.AppendLine("AND (B.GRUPO IN (:GRUPO))                                                                               ");
                if (entVertical != null)
                    queryTotalMetaGrupo.AppendLine("AND B.PRODUTO IN (:VERTICAL)                                                                           ");
                
                if (entFilial == null && entUsuario == null && entVertical == null && entGrupo == null)
                {
                    queryTotalMetaGrupo.AppendLine("AND (B.GRUPO IN (SELECT GRUPO FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO))                            ");
                    queryTotalMetaGrupo.AppendLine("AND (B.FILIAL IN (SELECT K_FILIAL FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO))                            ");

                }
                
                queryTotalMetaGrupo.AppendLine("AND YEAR(B.ANO) = YEAR(GETDATE())                                                                                               ");
                queryTotalMetaGrupo.AppendLine("GROUP BY C.PERFORMANCE,C.SELECAORESULTADO, C.RESULTADO, A.HANDLE, B.FILIAL, B.GRUPO, B.PRODUTO, B.EXECUTIVO, B.SDR, A.PERFORMANCETIPO, C.NOME, B.MES, B.ANO, C.PERFORMANCE1, C.PERFORMANCE2   ");

                if (entUsuario != null)
                    queryTotalMetaGrupo.Parameters.Add("USUARIO", entUsuario.Handle);

                if (entGrupo != null)
                    queryTotalMetaGrupo.Parameters.Add("GRUPO", entGrupo.Handle);

                if (entVertical != null)
                    queryTotalMetaGrupo.Parameters.Add("VERTICAL", entVertical.Handle);

                if (entFilial != null)
                    queryTotalMetaGrupo.Parameters.Add("FILIAL", entFilial.Handle);

                List<EntityBase> listaMetasGrupo = queryTotalMetaGrupo.Execute();

                int numeroUsuarioGrupo = 1;

                if (entGrupo != null)
                {
                    Query queryCountUsuario = new Query();

                    queryCountUsuario.AppendLine("SELECT COUNT(A.HANDLE) TOTAL  ");
                    queryCountUsuario.AppendLine("FROM Z_GRUPOUSUARIOS A        ");
                    queryCountUsuario.AppendLine("WHERE 1=1                     ");
                    queryCountUsuario.AppendLine("AND A.INATIVO = 'N'           ");
                    queryCountUsuario.AppendLine("AND A.GRUPO = :GRUPO          ");

                    if (entFilial != null)
                    {
                        queryCountUsuario.AppendLine("AND A.K_FILIAL = :FILIAL      ");
                        queryCountUsuario.Parameters.Add("FILIAL", entFilial.Handle);
                    }

                    queryCountUsuario.Parameters.Add("GRUPO", entGrupo.Handle);

                    List<EntityBase> listUsuario = queryCountUsuario.Execute();

                    numeroUsuarioGrupo = listUsuario[0].Fields["TOTAL"].ToInt();
                }
                else if (entFilial != null)
                {
                    Query queryCountUsuario = new Query();

                    queryCountUsuario.AppendLine("SELECT COUNT(A.HANDLE) TOTAL  ");
                    queryCountUsuario.AppendLine("FROM Z_GRUPOUSUARIOS A        ");
                    queryCountUsuario.AppendLine("WHERE 1=1                     ");
                    queryCountUsuario.AppendLine("AND A.INATIVO = 'N'           ");
                    queryCountUsuario.AppendLine("AND A.K_FILIAL = :FILIAL      ");

                    if (entUsuario != null)
                        queryCountUsuario.AppendLine("AND A.HANDLE = :USUARIO      ");

                    queryCountUsuario.Parameters.Add("FILIAL", entFilial.Handle);

                    if (entUsuario != null)
                        queryCountUsuario.Parameters.Add("USUARIO", entUsuario.Handle);

                    List<EntityBase> listUsuario = queryCountUsuario.Execute();

                    numeroUsuarioGrupo = listUsuario[0].Fields["TOTAL"].ToInt();
                }
                else if (entVertical != null)
                {
                    Query queryCountUsuario = new Query();

                    queryCountUsuario.AppendLine("SELECT COUNT(A.HANDLE) TOTAL                  ");
                    queryCountUsuario.AppendLine("FROM Z_GRUPOUSUARIOS A                        ");
                    queryCountUsuario.AppendLine("WHERE 1=1                                     ");
                    queryCountUsuario.AppendLine("AND A.INATIVO = 'N'                           ");
                    queryCountUsuario.AppendLine("AND A.K_VERTICAL LIKE '%' + CONVERT(VARCHAR, :VERTICAL) + '%'   ");

                    if (entFilial != null)
                    {
                        queryCountUsuario.AppendLine("AND A.K_FILIAL = :FILIAL      ");
                        queryCountUsuario.Parameters.Add("FILIAL", entFilial.Handle);
                    }

                    queryCountUsuario.Parameters.Add("VERTICAL", entVertical.Handle);

                    List<EntityBase> listUsuario = queryCountUsuario.Execute();

                    numeroUsuarioGrupo = listUsuario[0].Fields["TOTAL"].ToInt();
                }


                foreach (EntityBase ent in listaMetasGrupo)
                {
                    List<CrmPerformanceTile> listEntExistente = listPerformance
                                                    .Where(x => x.PerformanceTipo == ent.Fields["PERFORMANCETIPO"].ToString())
                                                    .ToList();
                    if (listEntExistente.Count() == 0)
                    {
                        CrmPerformanceTile newTile = StartTile(ent);

                        if(newTile.Performance == "2")
                            newTile.Meta = (ent.Fields["META"].ToLong()).ToString();
                        else
                            newTile.Meta = (ent.Fields["META"].ToLong() * numeroUsuarioGrupo * 12).ToString();

                        listPerformance.Add(newTile);
                    }
                    else
                    {
                        CrmPerformanceTile newTile = StartTile(ent);

                        decimal metaGrupo = ent.Fields["META"].ToDecimal() * (12*numeroUsuarioGrupo - listEntExistente.Count());
                        decimal metaUsuarioMes = listEntExistente.Sum(x => x.Meta.ToDecimal());

                        listPerformance.RemoveAll(x => x.PerformanceTipo == newTile.PerformanceTipo);

                        if (newTile.Performance == "2")
                        {
                            newTile.Meta = Math.Round((metaGrupo + metaUsuarioMes)/12,2).ToString();
                        }
                        else
                        {
                            newTile.Meta = (metaGrupo + metaUsuarioMes).ToString();
                        }
                        
                        listPerformance.Add(newTile);

                    }

                }

                foreach (CrmPerformanceTile perf in listPerformance)
                {
                    if (perf.ValorRealizados == null)
                    {
                        CrmPerformanceTile perf1 = listPerformance
                                            .Where(x => x.PerformanceTipo == perf.Performance1)
                                            .FirstOrDefault();

                        CrmPerformanceTile perf2 = listPerformance
                                            .Where(x => x.PerformanceTipo == perf.Performance2)
                                            .FirstOrDefault();

                        if (perf1 != null && perf2 != null)
                        {
                            if (perf1.SelecaoResultado == "2" && perf.Resultado == "1")
                                perf.SelecaoResultado = "2";

                            string valor1 = perf1.ValorRealizados;
                            string valor2 = perf2.ValorRealizados;

                            if (valor2 == "0")
                                valor2 = "1";

                            if (perf.Resultado == "2")
                                perf.ValorRealizados = Math.Round((valor1.ToDecimal() / valor2.ToDecimal()) * 100, 2).ToString();
                            else
                                perf.ValorRealizados = Math.Round((valor1.ToDecimal() / valor2.ToDecimal()), 2).ToString();
                        }

                    }

                    perf.CalculaPercent();
                }

                return listPerformance.OrderBy(x => x.NomeTipo).ToList();
            }
            catch (Exception e)
            {
                StringBuilder builder = new StringBuilder();

                if (e.InnerException != null)
                    builder.AppendLine(e.InnerException.Message);
                else
                    builder.AppendLine(e.Message);

                builder.AppendLine(e.StackTrace);

                return null;

            }

        }

        public CrmPerformanceTipo GetTipo(EntityBase ent)
        {
            CrmPerformanceTipo newCampo = new CrmPerformanceTipo();
            newCampo.Handle = ((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Handle.ToString();
            newCampo.Nome = ((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["NOME"].ToString();
            newCampo.Tipo = (((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["PERFORMANCE"] as TabItem).Value.ToString();

            if ((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["CAMPO"] as EntityAssociation).Handle.IsValid())
                newCampo.Campo = (((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["CAMPO"] as EntityAssociation).Instance.Fields["NOME"].ToString();

            if ((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["SIMBOLOMATEMATICO"] as RadioItem).HasValue())
                newCampo.Simbolo = (((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["SIMBOLOMATEMATICO"] as RadioItem).Value;

            if ((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["SELECAORESULTADO"] as ListItem).HasValue())
                newCampo.SelecaoResultado = (((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["SELECAORESULTADO"] as ListItem).Value.ToString();

            if ((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["RESULTADO"] as ListItem).HasValue())
                newCampo.Resultado = (((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["RESULTADO"] as ListItem).Value.ToString();


            EntityBase PerformanceTipo = ((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance;

            if ((PerformanceTipo.Fields["PERFORMANCE"] as TabItem).Value == 1)
            {
                newCampo.Resultados = GetTarefas(PerformanceTipo.Handle);

            }
            else if ((PerformanceTipo.Fields["PERFORMANCE"] as TabItem).Value == 2)
            {
                newCampo.Performance1 = GetTipoPerformance((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["PERFORMANCE1"] as EntityAssociation).Instance);
                newCampo.Performance2 = GetTipoPerformance((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["PERFORMANCE2"] as EntityAssociation).Instance);

            }
            else if ((PerformanceTipo.Fields["PERFORMANCE"] as TabItem).Value == 3)
            {
                newCampo.ResultadosOportunidades = GetOportunidades(PerformanceTipo);
            }

            return newCampo;
        }

        public CrmPerformanceTipoPerformance GetTipoPerformance(EntityBase ent)
        {
            CrmPerformanceTipoPerformance newCampo = new CrmPerformanceTipoPerformance();
            newCampo.Handle = ent.Handle.ToString();
            newCampo.Nome = ent.Fields["NOME"].ToString();
            newCampo.Tipo = (ent.Fields["PERFORMANCE"] as TabItem).Value.ToString();

            if ((ent.Fields["CAMPO"] as EntityAssociation).Handle.IsValid())
                newCampo.Campo = (ent.Fields["CAMPO"] as EntityAssociation).Instance.Fields["NOME"].ToString();

            if ((ent.Fields["SELECAORESULTADO"] as ListItem).HasValue())
                newCampo.SelecaoResultado = (ent.Fields["SELECAORESULTADO"] as ListItem).Value.ToString();

            if ((ent.Fields["SIMBOLOMATEMATICO"] as RadioItem).HasValue())
                newCampo.Simbolo = (ent.Fields["SIMBOLOMATEMATICO"] as RadioItem).Value;

            if ((ent.Fields["PERFORMANCE"] as TabItem).Value == 1)
            {
                newCampo.Resultados = GetTarefas(ent.Handle);
            }
            else if ((ent.Fields["PERFORMANCE"] as TabItem).Value == 3)
            {
                newCampo.ResultadosOportunidades = GetOportunidades(ent);
            }

            return newCampo;
        }

        public List<CrmPerformanceTipoTarefa> GetTarefas(Handle PerformanceTipo)
        {
            List<CrmPerformanceTipoTarefa> listToCount = new List<CrmPerformanceTipoTarefa>();
            Criteria critTarResp = new Criteria("A.TIPO = :TIPO");
            critTarResp.Parameters.Add("TIPO", PerformanceTipo);

            List<EntityBase> listTarefaResposta = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCETIPOTAREFA"), critTarResp);
            List<Handle> respostasAceitas = new List<Handle>();

            foreach (EntityBase entTarefa in listTarefaResposta)
            {
                respostasAceitas.AddRange(((EntityAggregation)entTarefa.Fields["RESPOSTAS"]).ToHandleList());
            }

            Criteria critTarefas = new Criteria("A.RESPOSTA IN (" + string.Join(",", respostasAceitas) + ") AND MONTH(A.DATACONCLUSAO) = MONTH(GETDATE()) AND YEAR(A.DATACONCLUSAO) = YEAR(GETDATE())");

            List<EntityBase> listTarefaUsuario = Entity.GetMany(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), critTarefas);

            foreach (EntityBase tarefaUsuario in listTarefaUsuario)
            {
                CrmPerformanceTipoTarefa tarefa = new CrmPerformanceTipoTarefa();
                tarefa.Handle = tarefaUsuario.Handle.Value.ToString();

                Usuario newResponsavel = new Usuario();
                newResponsavel.Handle = ((EntityAssociation)tarefaUsuario.Fields["RESPONSAVEL"]).Handle.Value;
                newResponsavel.Nome = ((EntityAssociation)tarefaUsuario.Fields["RESPONSAVEL"]).Instance.Fields["NOME"].ToString();

                tarefa.Responsavel = newResponsavel;

                EntityBase pessoaConta = ((EntityAssociation)tarefaUsuario.Fields["PESSOA"]).Instance;

                if (((EntityAssociation)pessoaConta.Fields["VERTICAL"]).Handle.IsValid())
                {
                    EntityBase vert = ((EntityAssociation)pessoaConta.Fields["VERTICAL"]).Instance;

                    CrmVertical vertical = new CrmVertical();
                    vertical.Handle = vert.Handle.ToString();
                    vertical.Nome = vert.Fields["NOME"].ToString();

                    tarefa.Vertical = vertical;
                }

                tarefa.DataConclusao = tarefaUsuario.Fields["DATACONCLUSAO"].ToDateTime().ToString("dd/MM/yyyy");

                listToCount.Add(tarefa);
            }

            return listToCount;
        }

        public List<CrmPerformanceOportunidade> GetOportunidades(EntityBase PerformanceTipo)
        {
            List<CrmPerformanceOportunidade> listToCount = new List<CrmPerformanceOportunidade>();

            EntityAggregation StatusAceitos = (EntityAggregation)PerformanceTipo.Fields["STATUSACEITO"];
            ListItem SelecaoResultado = (ListItem)PerformanceTipo.Fields["SELECAORESULTADO"];

            Criteria critOportunidade = new Criteria(@"A.STATUSOPORTUNIDADE IN (" + string.Join(",", StatusAceitos.ToHandleList()) + ")  AND MONTH(A.DATAFECHAMENTO) = MONTH(GETDATE()) AND YEAR(A.DATAFECHAMENTO) = YEAR(GETDATE())");

            List<EntityBase> listOportunidades = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADES"), critOportunidade);

            foreach (EntityBase opor in listOportunidades)
            {
                CrmPerformanceOportunidade newOportunidade = new CrmPerformanceOportunidade();
                newOportunidade.Handle = opor.Handle.ToString();

                Usuario newResponsavel = new Usuario();
                newResponsavel.Handle = ((EntityAssociation)opor.Fields["RESPONSAVEL"]).Handle.Value;
                newResponsavel.Nome = ((EntityAssociation)opor.Fields["RESPONSAVEL"]).Instance.Fields["NOME"].ToString();
                newOportunidade.Responsavel = newResponsavel;

                newOportunidade.ValorTotal = opor.Fields["VALORTOTAL"].ToString();
                newOportunidade.ValorLu = opor.Fields["VALORLU"].ToString();
                newOportunidade.ValorLum = opor.Fields["VALORLUM"].ToString();
                newOportunidade.ValorEscopo = opor.Fields["VALORESCOPO"].ToString();

                newOportunidade.listaVerticais = GetVerticais(opor.Handle);
                listToCount.Add(newOportunidade);
            }

            return listToCount;
        }

        public List<CrmPerformanceOportunidadeVertical> GetVerticais(Handle Handle)
        {
            List<CrmPerformanceOportunidadeVertical> listToCount = new List<CrmPerformanceOportunidadeVertical>();

            Query newQuery = new Query();
            newQuery.CommandText.AppendLine(" SELECT B.HANDLE OPORTUNIDADEPROD                              ");
            newQuery.CommandText.AppendLine("        , C.HANDLE VERTICAL                                    ");
            newQuery.CommandText.AppendLine("        , C.NOME NOMEVERTICAL                                  ");
            newQuery.CommandText.AppendLine("        , SUM(COALESCE(A.VALORFINAL, 0)) VALORTOTAL            ");
            newQuery.CommandText.AppendLine("        , SUM(COALESCE(A.VALORLU, 0)) VALORLU                  ");
            newQuery.CommandText.AppendLine("        , SUM(COALESCE(A.VALORLUM, 0)) VALORLUM                ");
            newQuery.CommandText.AppendLine("        , SUM(COALESCE(A.VALORESCOPO, 0)) VALORESCOPO          ");
            newQuery.CommandText.AppendLine(" FROM K_CRM_PESSOAOPORTUNIDADESITENS A                         ");
            newQuery.CommandText.AppendLine(" JOIN K_CRM_PESSOAOPORTUNIDADESPROD B ON A.PRODUTO = B.HANDLE  ");
            newQuery.CommandText.AppendLine(" JOIN K_CRM_PRODUTOS C ON B.PRODUTO = B.HANDLE                 ");
            newQuery.CommandText.AppendLine(" WHERE 1 = 1                                                   ");
            newQuery.CommandText.AppendLine(" AND B.OPORTUNIDADE = :OPORTUNIDADE                            ");
            newQuery.CommandText.AppendLine(" AND B.STATUS = 1                                              ");
            newQuery.CommandText.AppendLine(" GROUP BY B.HANDLE, C.HANDLE, C.NOME                           ");

            newQuery.Parameters.Add("OPORTUNIDADE", Handle);

            List<EntityBase> resultadoVerticais = newQuery.Execute();

            foreach (EntityBase vert in resultadoVerticais)
            {
                CrmPerformanceOportunidadeVertical newOporVert = new CrmPerformanceOportunidadeVertical();
                CrmVertical vertical = new CrmVertical();

                newOporVert.Handle = vert.Fields["OPORTUNIDADEPROD"].ToString();

                vertical.Handle = vert.Fields["VERTICAL"].ToString();
                vertical.Nome = vert.Fields["NOMEVERTICAL"].ToString();

                newOporVert.Vertical = vertical;

                newOporVert.ValorTotal = vert.Fields["VALORTOTAL"].ToString();
                newOporVert.ValorLu = vert.Fields["VALORLU"].ToString();
                newOporVert.ValorLum = vert.Fields["VALORLUM"].ToString();
                newOporVert.ValorEscopo = vert.Fields["VALORESCOPO"].ToString();

                listToCount.Add(newOporVert);
            }

            return listToCount;
        }

        public CrmPerformanceTile StartTile(EntityBase ent)
        {
            CrmPerformanceTile newTile = new CrmPerformanceTile();

            newTile.HandleMetaValor = ent.Fields["HANDLE"].ToString();

            if (ent.Fields["MES"] != null)
                newTile.Mes = ent.Fields["MES"].ToString();
            if (ent.Fields["ANO"] != null)
                newTile.Ano = ent.Fields["ANO"].ToString();
            if (ent.Fields["FILIAL"] != null)
                newTile.Filial = ent.Fields["FILIAL"].ToString();
            if (ent.Fields["GRUPO"] != null)
                newTile.Grupo = ent.Fields["GRUPO"].ToString();
            if (ent.Fields["PRODUTO"] != null)
                newTile.Produto = ent.Fields["PRODUTO"].ToString();
            if (ent.Fields["EXECUTIVO"] != null)
                newTile.Executivo = ent.Fields["EXECUTIVO"].ToString();
            if (ent.Fields["SDR"] != null)
                newTile.Sdr = ent.Fields["SDR"].ToString();
            if (ent.Fields["PERFORMANCE"] != null)
                newTile.Performance = ent.Fields["PERFORMANCE"].ToString();
            if (ent.Fields["PERFORMANCETIPO"] != null)
                newTile.PerformanceTipo = ent.Fields["PERFORMANCETIPO"].ToString();
            if (ent.Fields["NOMETIPO"] != null)
                newTile.NomeTipo = ent.Fields["NOMETIPO"].ToString();
            if (ent.Fields["PERFORMANCE1"] != null)
                newTile.Performance1 = ent.Fields["PERFORMANCE1"].ToString();
            if (ent.Fields["PERFORMANCE2"] != null)
                newTile.Performance2 = ent.Fields["PERFORMANCE2"].ToString();
            if (ent.Fields["VALORREALIZADOS"] != null)
                newTile.ValorRealizados = ent.Fields["VALORREALIZADOS"].ToDecimal().ToString();
            if (ent.Fields["META"] != null)
                newTile.Meta = ent.Fields["META"].ToDecimal().ToString();
            if (ent.Fields["SELECAORESULTADO"] != null)
                newTile.SelecaoResultado = ent.Fields["SELECAORESULTADO"].ToString();
            if (ent.Fields["RESULTADO"] != null)
                newTile.Resultado = ent.Fields["RESULTADO"].ToString();

            if (newTile.Executivo != null)
                newTile.Link = GraficoUsuarioFormView(newTile.PerformanceTipo, newTile.Executivo);

            if (newTile.Sdr != null)
                newTile.Link = GraficoUsuarioFormView(newTile.PerformanceTipo, newTile.Sdr);
            
            if(newTile.Link == null)
            {
                if (newTile.Produto == null)
                    newTile.Produto = "0";

                if (newTile.Filial == null)
                    newTile.Filial = "0";

                if (newTile.Grupo == null)
                    newTile.Grupo = "0";

                newTile.Link = GraficoVerticalFormView(newTile.PerformanceTipo, newTile.Produto, newTile.Filial, newTile.Grupo);

            }

            if (newTile.ValorRealizados != null && newTile.Meta != null)
            {
                if(newTile.Meta != "0")
                {
                    newTile.Percent = ((newTile.ValorRealizados.ToDecimal() / newTile.Meta.ToDecimal()) * 100).ToString();
                    newTile.Cor = GetColor(newTile.Percent.ToDecimal());
                    newTile.Resume = "Realizado " + newTile.ValorRealizados + " / " + newTile.Meta;
                }
                else
                {
                    newTile.Percent = "100";
                    newTile.Cor = GetColor(newTile.Percent.ToDecimal());
                    newTile.Resume = "Realizado " + newTile.ValorRealizados + " / " + newTile.Meta;
                }


            }


            return newTile;
        }

        public CrmPerformanceTile StartTileAno(EntityBase ent)
        {
            CrmPerformanceTile newTile = new CrmPerformanceTile();

            //newTile.HandleMetaValor = ent.Fields["HANDLE"].ToString();

            //if (ent.Fields["MES"] != null)
            //    newTile.Mes = ent.Fields["MES"].ToString();
            //if (ent.Fields["ANO"] != null)
            //    newTile.Ano = ent.Fields["ANO"].ToString();
            if (ent.Fields["FILIAL"] != null)
                newTile.Filial = ent.Fields["FILIAL"].ToString();
            //if (ent.Fields["GRUPO"] != null)
            //    newTile.Grupo = ent.Fields["GRUPO"].ToString();
            //if (ent.Fields["PRODUTO"] != null)
            //    newTile.Produto = ent.Fields["PRODUTO"].ToString();
            if (ent.Fields["EXECUTIVO"] != null)
                newTile.Executivo = ent.Fields["EXECUTIVO"].ToString();
            //if (ent.Fields["SDR"] != null)
            //    newTile.Sdr = ent.Fields["SDR"].ToString();
            if (ent.Fields["PERFORMANCE"] != null)
                newTile.Performance = ent.Fields["PERFORMANCE"].ToString();
            if (ent.Fields["PERFORMANCETIPO"] != null)
                newTile.PerformanceTipo = ent.Fields["PERFORMANCETIPO"].ToString();
            if (ent.Fields["NOMETIPO"] != null)
                newTile.NomeTipo = ent.Fields["NOMETIPO"].ToString();
            //if (ent.Fields["PERFORMANCE1"] != null)
            //    newTile.Performance1 = ent.Fields["PERFORMANCE1"].ToString();
            //if (ent.Fields["PERFORMANCE2"] != null)
            //    newTile.Performance2 = ent.Fields["PERFORMANCE2"].ToString();
            if (ent.Fields["VALORREALIZADOS"] != null)
                newTile.ValorRealizados = ent.Fields["VALORREALIZADOS"].ToDecimal().ToString();
            if (ent.Fields["META"] != null)
                newTile.Meta = ent.Fields["META"].ToDecimal().ToString();
            if (ent.Fields["SELECAORESULTADO"] != null)
                newTile.SelecaoResultado = ent.Fields["SELECAORESULTADO"].ToString();
            if (ent.Fields["RESULTADO"] != null)
                newTile.Resultado = ent.Fields["RESULTADO"].ToString();

            if (newTile.Executivo != null)
                newTile.Link = GraficoUsuarioFormView(newTile.PerformanceTipo, newTile.Executivo);

            if (newTile.Sdr != null)
                newTile.Link = GraficoUsuarioFormView(newTile.PerformanceTipo, newTile.Sdr);

            if (newTile.Link == null)
            {
                if (newTile.Produto == null)
                    newTile.Produto = "0";

                if (newTile.Filial == null)
                    newTile.Filial = "0";

                if (newTile.Grupo == null)
                    newTile.Grupo = "0";

                newTile.Link = GraficoVerticalFormView(newTile.PerformanceTipo, newTile.Produto, newTile.Filial, newTile.Grupo);

            }

            if (newTile.ValorRealizados != null && newTile.Meta != null)
            {
                if (newTile.Meta != "0")
                {
                    newTile.Percent = ((newTile.ValorRealizados.ToDecimal() / newTile.Meta.ToDecimal()) * 100).ToString();
                    newTile.Cor = GetColor(newTile.Percent.ToDecimal());
                    newTile.Resume = "Realizado " + newTile.ValorRealizados + " / " + newTile.Meta;
                }
                else
                {
                    newTile.Percent = "100";
                    newTile.Cor = GetColor(newTile.Percent.ToDecimal());
                    newTile.Resume = "Realizado " + newTile.ValorRealizados + " / " + newTile.Meta;
                }


            }


            return newTile;
        }

        public string GetColor(decimal result)
        {
            if (result == 100 || result > 100)
                return "green-jungle";
            if (result < 20)
                return "red-mint";
            if (result < 40)
                return "red-intense";
            if (result < 60)
                return "yellow-gold";
            if (result < 80)
                return "yellow-saffron";
            if (result < 90)
                return "green-sharp";
            if (result < 100)
                return "green-meadow";

            return "blue";
        }

        private string GraficoUsuarioFormView(string Id,string Usuario)
        {
            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_PERFORMANCETIPO",
                IsModalPage = true,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_CRM_PERFORMANCEMETA/GraficoPerformanceUsuario.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE = :HANDLE",
                    new List<Parameter>(){
                        new Parameter("HANDLE",Id),
                        new Parameter("USUARIO",Usuario),
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true);//.Split('\'').ElementAtOrDefault(1);

        }

        private string GraficoVerticalFormView(string Id, string Vertical,string Filial, string Grupo)
        {
            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_PERFORMANCETIPO",
                IsModalPage = true,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_CRM_PERFORMANCEMETA/GraficoPerformanceVertical.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE = :HANDLE",
                    new List<Parameter>(){
                        new Parameter("HANDLE",Id),
                        new Parameter("VERTICAL",Vertical),
                        new Parameter("FILIAL",Filial),
                        new Parameter("GRUPO",Grupo),
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true);//.Split('\'').ElementAtOrDefault(1);

        }

        public IEnumerable<DateTime> EachDay(DateTime from, DateTime thru)
        {
            for (var day = from.Date; day.Date <= thru.Date; day = day.AddDays(1))
                yield return day;
        }

    }
}