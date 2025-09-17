using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Models.Crm;
using Models.Generico;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using ListItem = Benner.Tecnologia.Common.ListItem;
using Parameter = Benner.Tecnologia.Common.Parameter;

public partial class Views_CrmPerformance_GraficoUsuario : ViewPage
{
    public string JsonMetas = "Json";
    public List<EntityBase> performanceTipo = null;
    public string mensagem = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            var linkDefinition = this.GetLinkDefinition() as FormLinkDefinition;
            if (linkDefinition != null)
            {
                string parPerformanceTipo = linkDefinition.WhereClause.GetParameterByName("HANDLE").Value.ToString();
                string parUsuario = linkDefinition.WhereClause.GetParameterByName("USUARIO").Value.ToString();

                Criteria critGrupo = new Criteria("A.HANDLE = :USUARIO");
                critGrupo.Parameters.Add("USUARIO", parUsuario);

                EntityBase usuario = Entity.GetFirstOrDefault(EntityDefinition.GetByName("Z_GRUPOUSUARIOS"), critGrupo);

                Usuario user = new Usuario();
                user.Handle = usuario.Handle.ToInt();
                user.Nome = usuario.Fields["NOME"].ToString();

                if (((EntityAssociation)usuario.Fields["K_FILIAL"]).Handle.IsValid())
                    user.Filial = ((EntityAssociation)usuario.Fields["K_FILIAL"]).Handle.ToString();
                if (((EntityAggregation)usuario.Fields["K_VERTICAL"]).HasValue())
                    user.Vertical = ((EntityAggregation)usuario.Fields["K_VERTICAL"]).ToString();

                List<CrmPerformanceMeta> listaDeMetas = new List<CrmPerformanceMeta>();

                #region Busca por Grupo

                Criteria critPerformanceGrupo = new Criteria(@" A.PERFORMANCETIPO = :PERFORMANCETIPO
                                                                AND A.PERFORMANCEMETA IN (
                                                                        SELECT HANDLE
                                                                        FROM K_CRM_PERFORMANCEMETA
                                                                        WHERE 1=1
                                                                        AND MONTH(MES) <= MONTH(GETDATE())
                                                                        AND DATEDIFF(month,MES,GETDATE()) < 6
                                                                        AND GRUPO IN (
                                                                                SELECT GRUPO
                                                                                FROM Z_GRUPOUSUARIOS
                                                                                WHERE HANDLE = :USUARIO
                                                                            ) 
                                                                    )");
                critPerformanceGrupo.Parameters.Add("PERFORMANCETIPO", linkDefinition.WhereClause.Parameters[0].Value.ToString());
                critPerformanceGrupo.Parameters.Add("USUARIO", linkDefinition.WhereClause.Parameters[1].Value.ToString());

                List<EntityBase> listPerformanceMetaGrupo = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETAVALOR"), critPerformanceGrupo);

                foreach (EntityBase ent in listPerformanceMetaGrupo)
                {
                    EntityBase perfMeta = ((EntityAssociation)ent.Fields["PERFORMANCEMETA"]).Instance;

                    CrmPerformanceMeta newPerformanceMeta = new CrmPerformanceMeta();
                    newPerformanceMeta.Handle = perfMeta.Handle.ToString();

                    if (((EntityAssociation)perfMeta.Fields["GRUPO"]).Handle.IsValid())
                        newPerformanceMeta.Grupo = ((EntityAssociation)perfMeta.Fields["GRUPO"]).Handle.ToString();

                    if (((EntityAssociation)perfMeta.Fields["EXECUTIVO"]).Handle.IsValid())
                        newPerformanceMeta.Executivo = ((EntityAssociation)perfMeta.Fields["EXECUTIVO"]).Handle.ToString();

                    if (((EntityAssociation)perfMeta.Fields["SDR"]).Handle.IsValid())
                        newPerformanceMeta.Sdr = ((EntityAssociation)perfMeta.Fields["SDR"]).Handle.ToString();

                    newPerformanceMeta.Data = perfMeta.Fields["MES"].ToDateTime().ToString("dd/MM/yyyy");

                    CrmPerformanceTipo newTipo = GetTipo(ent);
                    newTipo.MetaValor = ent.Fields["VALOR"].ToString();
                    newPerformanceMeta.ListaTipos.Add(newTipo);

                    listaDeMetas.Add(newPerformanceMeta);

                }

                #endregion

                #region Por Usuario

                if (((bool)usuario.Fields["K_INTELIGENCIAMERCADO"]) == true)
                {

                    Criteria critSdr = new Criteria(@" A.PERFORMANCETIPO = :PERFORMANCETIPO
                                                    AND A.PERFORMANCEMETA IN (
                                                        SELECT HANDLE
                                                        FROM K_CRM_PERFORMANCEMETA
                                                        WHERE 1=1
                                                        AND MONTH(MES) <= MONTH(GETDATE())
                                                        AND DATEDIFF(month,MES,GETDATE()) < 6
                                                        AND SDR = :USUARIO 
                                                        )");
                    critSdr.Parameters.Add("PERFORMANCETIPO", linkDefinition.WhereClause.Parameters[0].Value.ToString());
                    critSdr.Parameters.Add("USUARIO", linkDefinition.WhereClause.Parameters[1].Value.ToString());

                    List<EntityBase> listPerformanceMetaSdr = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETAVALOR"), critSdr);

                    foreach (EntityBase ent in listPerformanceMetaSdr)
                    {
                        EntityBase perfMeta = ((EntityAssociation)ent.Fields["PERFORMANCEMETA"]).Instance;

                        CrmPerformanceMeta newPerformanceMeta = new CrmPerformanceMeta();
                        newPerformanceMeta.Handle = perfMeta.Handle.ToString();

                        if (((EntityAssociation)perfMeta.Fields["GRUPO"]).Handle.IsValid())
                            newPerformanceMeta.Grupo = ((EntityAssociation)perfMeta.Fields["GRUPO"]).Handle.ToString();

                        if (((EntityAssociation)perfMeta.Fields["EXECUTIVO"]).Handle.IsValid())
                            newPerformanceMeta.Executivo = ((EntityAssociation)perfMeta.Fields["EXECUTIVO"]).Handle.ToString();

                        if (((EntityAssociation)perfMeta.Fields["SDR"]).Handle.IsValid())
                            newPerformanceMeta.Sdr = ((EntityAssociation)perfMeta.Fields["SDR"]).Handle.ToString();

                        newPerformanceMeta.Data = perfMeta.Fields["MES"].ToDateTime().ToString("MM/yyyy");

                        CrmPerformanceTipo newTipo = GetTipo(ent);
                        newTipo.MetaValor = ent.Fields["VALOR"].ToString();
                        newPerformanceMeta.ListaTipos.Add(newTipo);

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

                    Criteria critSdr = new Criteria(@" A.PERFORMANCETIPO = :PERFORMANCETIPO
                                                    AND A.PERFORMANCEMETA IN (
                                                        SELECT HANDLE
                                                        FROM K_CRM_PERFORMANCEMETA
                                                        WHERE 1=1
                                                        AND MONTH(MES) <= MONTH(GETDATE())
                                                        AND DATEDIFF(month,MES,GETDATE()) < 6
                                                        AND EXECUTIVO = :USUARIO 
                                                        )");
                    critSdr.Parameters.Add("PERFORMANCETIPO", linkDefinition.WhereClause.Parameters[0].Value.ToString());
                    critSdr.Parameters.Add("USUARIO", linkDefinition.WhereClause.Parameters[1].Value.ToString());

                    List<EntityBase> listPerformanceMetaSdr = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCEMETAVALOR"), critSdr);

                    foreach (EntityBase ent in listPerformanceMetaSdr)
                    {
                        EntityBase perfMeta = ((EntityAssociation)ent.Fields["PERFORMANCEMETA"]).Instance;

                        CrmPerformanceMeta newPerformanceMeta = new CrmPerformanceMeta();
                        newPerformanceMeta.Handle = perfMeta.Handle.ToString();

                        if (((EntityAssociation)perfMeta.Fields["GRUPO"]).Handle.IsValid())
                            newPerformanceMeta.Grupo = ((EntityAssociation)perfMeta.Fields["GRUPO"]).Handle.ToString();

                        if (((EntityAssociation)perfMeta.Fields["EXECUTIVO"]).Handle.IsValid())
                            newPerformanceMeta.Executivo = ((EntityAssociation)perfMeta.Fields["EXECUTIVO"]).Handle.ToString();

                        if (((EntityAssociation)perfMeta.Fields["SDR"]).Handle.IsValid())
                            newPerformanceMeta.Sdr = ((EntityAssociation)perfMeta.Fields["SDR"]).Handle.ToString();

                        newPerformanceMeta.Data = perfMeta.Fields["MES"].ToDateTime().ToString("MM/yyyy");

                        CrmPerformanceTipo newTipo = GetTipo(ent);
                        newTipo.MetaValor = ent.Fields["VALOR"].ToString();
                        newPerformanceMeta.ListaTipos.Add(newTipo);

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

                foreach (CrmPerformanceMeta meta in listaDeMetas)
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
                                                    .ToString();

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
                                                    .ToString();

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
                                            .ToString();

                                if (resultado == null)
                                    resultado = "0";

                            }

                            tipo.Valor = resultado.ToString();

                        }
                    }

                }
                //Atualizando valores encontrados pro usuario

                List<CrmPerformanceMetaValorPorData> resultadoGrafico = new List<CrmPerformanceMetaValorPorData>();

                foreach(CrmPerformanceMeta meta in listaDeMetas)
                {
                    CrmPerformanceMetaValorPorData grafValue = new CrmPerformanceMetaValorPorData();
                    grafValue.Data = meta.Data;
                    grafValue.Meta = meta.ListaTipos[0].MetaValor.ToDecimal();
                    grafValue.Valor = meta.ListaTipos[0].Valor.ToDecimal();

                    if(meta.ListaTipos[0].Resultados.Count > 0)
                    {
                        if (meta.Executivo != null && meta.Executivo.Length > 0)
                            grafValue.Link = GraficoUsuarioFormView(meta.ListaTipos[0].Resultados[0].Tarefa, meta.Executivo,meta.Data);
                        if (meta.Sdr != null && meta.Sdr.Length > 0)
                            grafValue.Link = GraficoUsuarioFormView(meta.ListaTipos[0].Resultados[0].Tarefa, meta.Sdr, meta.Data);
                    }

                    resultadoGrafico.Add(grafValue);
                }
                JsonMetas = JsonConvert.SerializeObject(resultadoGrafico.OrderByDescending(x => x.Data));
            }
        }
        catch (Exception exception)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(exception.Message);
            builder.AppendLine(exception.StackTrace);
            builder.AppendLine(exception.Source);
            throw new BusinessException(builder.ToString());
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
        EntityBase PerformanceMeta = ((EntityAssociation)ent.Fields["PERFORMANCEMETA"]).Instance;
        DateTime mes = PerformanceMeta.Fields["MES"].ToDateTime();

        if ((PerformanceTipo.Fields["PERFORMANCE"] as TabItem).Value == 1)
        {
            newCampo.Resultados = GetTarefas(PerformanceTipo.Handle,mes);

        }
        else if ((PerformanceTipo.Fields["PERFORMANCE"] as TabItem).Value == 2)
        {
            newCampo.Performance1 = GetTipoPerformance((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["PERFORMANCE1"] as EntityAssociation).Instance,mes);
            newCampo.Performance2 = GetTipoPerformance((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["PERFORMANCE2"] as EntityAssociation).Instance,mes);

        }
        else if ((PerformanceTipo.Fields["PERFORMANCE"] as TabItem).Value == 3)
        {
            newCampo.ResultadosOportunidades = GetOportunidades(PerformanceTipo, mes);
        }

        return newCampo;
    }

    public CrmPerformanceTipoPerformance GetTipoPerformance(EntityBase ent,DateTime mes)
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
            newCampo.Resultados = GetTarefas(ent.Handle,mes);
        }
        else if ((ent.Fields["PERFORMANCE"] as TabItem).Value == 3)
        {
            newCampo.ResultadosOportunidades = GetOportunidades(ent, mes);
        }

        return newCampo;
    }

    public List<CrmPerformanceTipoTarefa> GetTarefas(Handle PerformanceTipo,DateTime Mes)
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

        Criteria critTarefas = new Criteria("A.RESPOSTA IN (" + string.Join(",", respostasAceitas) + ") AND A.RESPONSAVEL = @USUARIO AND MONTH(A.DATACONCLUSAO) = MONTH(:DATA) AND MONTH(A.DATACONCLUSAO) = MONTH(:DATA)");

        critTarefas.Parameters.Add("DATA", Mes);

        List<EntityBase> listTarefaUsuario = Entity.GetMany(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), critTarefas);

        foreach (EntityBase tarefaUsuario in listTarefaUsuario)
        {
            CrmPerformanceTipoTarefa tarefa = new CrmPerformanceTipoTarefa();
            tarefa.Handle = tarefaUsuario.Handle.Value.ToString();
            tarefa.Tarefa = ((EntityAssociation)tarefaUsuario.Fields["TAREFA"]).Handle.Value.ToString();
            tarefa.Handle = ((EntityAssociation)tarefaUsuario.Fields["RESPOSTA"]).Handle.Value.ToString();

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

    public List<CrmPerformanceOportunidade> GetOportunidades(EntityBase PerformanceTipo,DateTime Mes)
    {
        List<CrmPerformanceOportunidade> listToCount = new List<CrmPerformanceOportunidade>();

        EntityAggregation StatusAceitos = (EntityAggregation)PerformanceTipo.Fields["STATUSACEITO"];
        ListItem SelecaoResultado = (ListItem)PerformanceTipo.Fields["SELECAORESULTADO"];

        Criteria critOportunidade = new Criteria(@"A.STATUSOPORTUNIDADE IN (" + string.Join(",", StatusAceitos.ToHandleList()) + ") AND A.RESPONSAVEL = @USUARIO  AND MONTH(A.DATAFECHAMENTO) = MONTH(:DATA) AND YEAR(A.DATAFECHAMENTO) = YEAR(:DATA)");

        critOportunidade.Parameters.Add("DATA", Mes);
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

    private string GraficoUsuarioFormView(string Id, string Usuario, string Data)
    {
        var outPut = new FormLinkDefinition
        {
            TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
            TargetEntityDefinitionName = "K_CRM_TAREFAUSUARIO",
            IsModalPage = false,
            TargetFormMode = FormLinkDefinition.FormMode.View,
            Url = "~/Pages/K_CRM_TAREFAUSUARIO/grid.aspx",
            WhereClause =
                new WhereClause("A.TAREFA = :TAREFA AND A.RESPONSAVEL = :USUARIO",
                new List<Parameter>(){
                        new Parameter("TAREFA",Id),
                        new Parameter("USUARIO",Usuario),
                        new Parameter("DATA",Data),
                }),
        };

        return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);//.Split('\'').ElementAtOrDefault(1);

    }
}