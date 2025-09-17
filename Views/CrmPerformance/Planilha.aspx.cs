using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Models.Crm;
using Models.Generico;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using ListItem = Benner.Tecnologia.Common.ListItem;

public partial class Views_CrmPerformance_Planilha : ViewPage
{
    public string JsonPlanilhaVertical = "Json";
    public string JsonPlanilhaUsuario = "Json";
    public string JsonCabecalho = "Json";
    public EntityBase performance = null;
    public string mensagem = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            var linkDefinition = this.GetLinkDefinition() as FormLinkDefinition;
            if (linkDefinition != null)
            {
                Criteria crit = new Criteria("A.HANDLE = :HANDLE");
                crit.Parameters.Add("HANDLE", linkDefinition.WhereClause.Parameters[0].Value.ToString());

                performance = Entity.Get(EntityDefinition.GetByName(linkDefinition.TargetEntityDefinitionName), crit);

                if (performance != null)
                {
                    List<CrmVertical> listaVerticais = new List<CrmVertical>();
                    List<Usuario> listaExecutivos = new List<Usuario>();

                    List<EntityBase> listVerticais = Entity.GetAll(EntityDefinition.GetByName("K_CRM_PRODUTOS"));
                    foreach(EntityBase entVert in listVerticais)
                    {
                        CrmVertical newVertical = new CrmVertical();
                        newVertical.Handle = entVert.Handle.ToString();
                        newVertical.Nome = entVert.Fields["NOME"].ToString();
                        listaVerticais.Add(newVertical);
                    }

                    Criteria critExecutivos = new Criteria("A.INATIVO = 'N' AND A.K_EXECUTIVOCONTAS = 'S' ");
                    List<EntityBase> listExecutivos = Entity.GetMany(EntityDefinition.GetByName("Z_GRUPOUSUARIOS"), critExecutivos);

                    foreach (EntityBase entUsu in listExecutivos)
                    {
                        Usuario newUsuario = new Usuario();
                        newUsuario.Handle = entUsu.Handle.ToInt();
                        newUsuario.Nome = entUsu.Fields["NOME"].ToString();

                        if(((EntityAssociation)entUsu.Fields["K_FILIAL"]).Handle.IsValid())
                            newUsuario.Filial = ((EntityAssociation)entUsu.Fields["K_FILIAL"]).Handle.ToString();
                        if (((EntityAggregation)entUsu.Fields["K_VERTICAL"]).HasValue())
                            newUsuario.Vertical = ((EntityAggregation)entUsu.Fields["K_VERTICAL"]).ToString();

                        listaExecutivos.Add(newUsuario);
                    }

                    Criteria critCampos = new Criteria("A.PERFORMANCE = :PERFORMANCE");
                    critCampos.Parameters.Add("PERFORMANCE", performance.Handle);

                    List<EntityBase> listCampos = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PERFORMANCECAMPO"),critCampos);

                    List<CrmPerformanceTipo> listaDeTipos = new List<CrmPerformanceTipo>();

                    foreach (EntityBase ent in listCampos)
                    {
                        listaDeTipos.Add(GetTipo(ent));
                    }

                    List<CrmPerformancePlanilha> resultadoFinalVertical = new List<CrmPerformancePlanilha>();
                    List<CrmPerformancePlanilha> resultadoFinalUsuario = new List<CrmPerformancePlanilha>();

                    CrmPerformancePlanilha newCabecalho = new CrmPerformancePlanilha();
                    newCabecalho.Nome = "";

                    foreach (CrmPerformanceTipo tipo in listaDeTipos)
                    {
                        newCabecalho.ListaCampos.Add(tipo.Nome);
                    }
                    
                    foreach (CrmVertical registro in listaVerticais)
                    {
                        CrmPerformancePlanilha newRegistroPlanilha = new CrmPerformancePlanilha();
                        newRegistroPlanilha.Nome = registro.Nome;

                        foreach (CrmPerformanceTipo tipo in listaDeTipos)
                        {
                            if (tipo.Tipo == "1")
                            {
                                string campo = tipo
                                                .Resultados
                                                .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
                                                .Count()
                                                .ToString();

                                newRegistroPlanilha.ListaCampos.Add(campo);
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
                                                    .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
                                                    .Count()
                                                    .ToString();


                                }
                                else if (tipo.Performance1.Tipo == "3")
                                {
                                    if (tipo.Performance1.SelecaoResultado == "1")
                                    {
                                        //COUNT
                                        List<CrmPerformanceOportunidadeVertical> verticais = new List<CrmPerformanceOportunidadeVertical>();

                                        foreach (CrmPerformanceOportunidade opor in tipo.Performance1.ResultadosOportunidades)
                                        {
                                            verticais.AddRange(opor.listaVerticais);
                                        }

                                        resultado1 = verticais
                                                    .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
                                                    .Count()
                                                    .ToString();

                                    }
                                    else if (tipo.Performance1.SelecaoResultado == "2")
                                    {
                                        //SUM
                                        List<CrmPerformanceOportunidadeVertical> verticais = new List<CrmPerformanceOportunidadeVertical>();

                                        foreach (CrmPerformanceOportunidade opor in tipo.Performance1.ResultadosOportunidades)
                                        {
                                            verticais.AddRange(opor.listaVerticais);
                                        }

                                        resultado1 = verticais
                                                    .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
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
                                                    .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
                                                    .Count()
                                                    .ToString();


                                }
                                else if (tipo.Performance2.Tipo == "3")
                                {
                                    if (tipo.Performance2.SelecaoResultado == "1")
                                    {
                                        //COUNT
                                        List<CrmPerformanceOportunidadeVertical> verticais = new List<CrmPerformanceOportunidadeVertical>();

                                        foreach (CrmPerformanceOportunidade opor in tipo.Performance2.ResultadosOportunidades)
                                        {
                                            verticais.AddRange(opor.listaVerticais);
                                        }

                                        resultado2 = verticais
                                                    .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
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

                                        resultado2 = verticais
                                                    .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
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

                                newRegistroPlanilha.ListaCampos.Add(Math.Round(resultado, 2).ToString()+(tipo.Resultado == "2"?" %":""));
                            }
                            else if (tipo.Tipo == "3")
                            {
                                string resultado = "";

                                if (tipo.SelecaoResultado == "1")
                                {
                                    //COUNT
                                    List<CrmPerformanceOportunidadeVertical> verticais = new List<CrmPerformanceOportunidadeVertical>();

                                    foreach (CrmPerformanceOportunidade opor in tipo.ResultadosOportunidades)
                                    {
                                        verticais.AddRange(opor.listaVerticais);
                                    }

                                    resultado = verticais
                                                .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
                                                .Count()
                                                .ToString();

                                }
                                else if (tipo.SelecaoResultado == "2")
                                {
                                    //SUM
                                    List<CrmPerformanceOportunidadeVertical> verticais = new List<CrmPerformanceOportunidadeVertical>();

                                    foreach (CrmPerformanceOportunidade opor in tipo.ResultadosOportunidades)
                                    {
                                        verticais.AddRange(opor.listaVerticais);
                                    }

                                    resultado = verticais
                                                .Where(x => x.Vertical != null && x.Vertical.Handle == registro.Handle)
                                                .Sum(x => Convert.ToDecimal(x.ValorTotal))
                                                .ToString();

                                    if (resultado == null)
                                        resultado = "0";

                                }

                                newRegistroPlanilha.ListaCampos.Add(resultado.ToString());

                            }
                        }

                        resultadoFinalVertical.Add(newRegistroPlanilha);
                    }

                    foreach (Usuario user in listaExecutivos)
                    {
                        CrmPerformancePlanilha newRegistroPlanilha = new CrmPerformancePlanilha();
                        newRegistroPlanilha.Nome = user.Nome;

                        foreach(CrmPerformanceTipo tipo in listaDeTipos)
                        {
                            if (tipo.Tipo == "1")
                            {
                                string campo = tipo
                                                .Resultados
                                                .Where(x => x.Responsavel.Handle == user.Handle)
                                                .Count()
                                                .ToString();

                                newRegistroPlanilha.ListaCampos.Add(campo);
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

                                newRegistroPlanilha.ListaCampos.Add(Math.Round(resultado,2).ToString() + (tipo.Resultado == "2" ? " %" : ""));

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

                                newRegistroPlanilha.ListaCampos.Add(resultado.ToString());

                            }
                        }

                        resultadoFinalUsuario.Add(newRegistroPlanilha);

                    }


                    JsonCabecalho = JsonConvert.SerializeObject(newCabecalho);
                    JsonPlanilhaVertical = JsonConvert.SerializeObject(resultadoFinalVertical);
                    JsonPlanilhaUsuario = JsonConvert.SerializeObject(resultadoFinalUsuario);
                }
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

        if((((EntityAssociation)ent.Fields["PERFORMANCETIPO"]).Instance.Fields["SIMBOLOMATEMATICO"] as RadioItem).HasValue())
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

        if((ent.Fields["SELECAORESULTADO"] as ListItem).HasValue())
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

    public List<CrmPerformanceTipoTarefa> GetTarefas (Handle PerformanceTipo)
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

        Criteria critTarefas = new Criteria("MONTH(A.DATACONCLUSAO) = MONTH(GETDATE()) AND YEAR(A.DATACONCLUSAO) = YEAR(GETDATE()) AND A.RESPOSTA IN (" + string.Join(",", respostasAceitas) + ")");

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

        Criteria critOportunidade = new Criteria(@"MONTH(A.DATAFECHAMENTO) = MONTH(GETDATE()) AND YEAR(A.DATAFECHAMENTO) = YEAR(GETDATE()) AND A.STATUSOPORTUNIDADE IN (" + string.Join(",", StatusAceitos.ToHandleList()) + ")");

        List<EntityBase> listOportunidades = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESSOAOPORTUNIDADES"), critOportunidade);

        foreach(EntityBase opor in listOportunidades)
        {
            CrmPerformanceOportunidade newOportunidade = new CrmPerformanceOportunidade();
            newOportunidade.Handle      = opor.Handle.ToString();

            Usuario newResponsavel = new Usuario();
            newResponsavel.Handle = ((EntityAssociation)opor.Fields["RESPONSAVEL"]).Handle.Value;
            newResponsavel.Nome = ((EntityAssociation)opor.Fields["RESPONSAVEL"]).Instance.Fields["NOME"].ToString();
            newOportunidade.Responsavel = newResponsavel;

            newOportunidade.ValorTotal  = opor.Fields["VALORTOTAL"].ToString();
            newOportunidade.ValorLu     = opor.Fields["VALORLU"].ToString();
            newOportunidade.ValorLum    = opor.Fields["VALORLUM"].ToString();
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

        foreach(EntityBase vert in resultadoVerticais)
        {
            CrmPerformanceOportunidadeVertical newOporVert = new CrmPerformanceOportunidadeVertical();
            CrmVertical vertical = new CrmVertical();

            newOporVert.Handle      = vert.Fields["OPORTUNIDADEPROD"].ToString();

            vertical.Handle         = vert.Fields["VERTICAL"].ToString();
            vertical.Nome           = vert.Fields["NOMEVERTICAL"].ToString();

            newOporVert.Vertical    = vertical;

            newOporVert.ValorTotal  = vert.Fields["VALORTOTAL"].ToString();
            newOporVert.ValorLu     = vert.Fields["VALORLU"].ToString();
            newOporVert.ValorLum    = vert.Fields["VALORLUM"].ToString();
            newOporVert.ValorEscopo = vert.Fields["VALORESCOPO"].ToString();

            listToCount.Add(newOporVert);
        }

        return listToCount;
    }
}