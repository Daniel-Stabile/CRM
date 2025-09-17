using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
//using DocumentFormat.OpenXml.Spreadsheet;
using Models.Crm;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SM.Crm.Definicoes.Comum.Qualificacao;
//using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Descrição resumida de CrmPesquisaController
/// </summary>
namespace Controllers.Crm
{
    public class CrmPesquisaController : Controller
    {
        public CrmPesquisaController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public ActionResult Pesquisa()
        {
            return PartialView();
        }

        public string SaveFromPost(CrmPesquisa post)
        {
            
            var response = BennerContext.BusinessComponent.Call("SM.Crm.Definicoes.Componentes.QualificacaoLeadsComponent, SM.Crm.Definicoes", "SaveFromPost", post,null);
            //return response.ToString();

            JObject json = JObject.Parse(response.ToString());

            string status = json["status"].ToString();
            int code = json["code"].Value<int>();
            string message = json["message"].ToString();
            string url = code == 200 ? StartResumoPessoas(post.Pessoa) : "";
            return JsonConvert.SerializeObject(new { status = status, code = code, message = message, url = url });

            //      try
            //      {
            //          decimal somaResposta = 0;
            //          List<CrmPesquisaResposta> listaRespostas = new List<CrmPesquisaResposta>();

            //          foreach (CrmPesquisaPergunta perg in post.Perguntas)
            //          {
            //              listaRespostas.Add(perg.SelecionadoFechado);

            //              foreach (CrmPesquisaResposta resp in perg.SelecionadoMultiplaEscolha)
            //                  listaRespostas.Add(resp);

            //              somaResposta += perg.SelecionadoFechado.Pontuacao;
            //              somaResposta += perg.SelecionadoMultiplaEscolha.Sum(x => x.Pontuacao);
            //          }
            //          EntityBase newPesquisaPessoa = null;

            //          if (post.PesquisaSalvaHandle != null)
            //          {
            //              newPesquisaPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"), new Handle(post.PesquisaSalvaHandle),GetMode.Edit);
            //              newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //              newPesquisaPessoa.Save();
            //          }
            //          else
            //          {
            //              newPesquisaPessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"));
            //              ((EntityAssociation)newPesquisaPessoa.Fields["PESQUISA"]).Handle = new Handle(post.Handle);
            //              ((EntityAssociation)newPesquisaPessoa.Fields["PESSOA"]).Handle = new Handle(post.Pessoa);
            //              newPesquisaPessoa.Fields["STATUS"] = new ListItem(1, "Em aberto");
            //newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //              newPesquisaPessoa.Save();
            //          }

            //          Criteria critResposta = new Criteria(@"A.PESQUISAPESSOA = :PESQUISASALVA");

            //          critResposta.Parameters.Add("PESQUISASALVA", newPesquisaPessoa.Handle);

            //          Entity.DeleteMany(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAPESSOA"),critResposta);

            //          foreach (CrmPesquisaResposta resp in listaRespostas)
            //          {
            //              if (resp.Handle != null)
            //              {
            //                  EntityBase NewRespostaPessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAPESSOA"));
            //                  ((EntityAssociation)NewRespostaPessoa.Fields["PESQUISAPESSOA"]).Handle = newPesquisaPessoa.Handle;
            //                  ((EntityAssociation)NewRespostaPessoa.Fields["RESPOSTA"]).Handle = new Handle(resp.Handle);
            //                  NewRespostaPessoa.Save();

            //              }
            //          }

            //          return JsonConvert.SerializeObject(new { status = "success", code = 200, message = "Questionario Salvo! Não esqueça de qualificar a conta", url = StartResumoPessoas(post.Pessoa) });
            //      }
            //      catch (Exception e)
            //      {
            //          StringBuilder builder = new StringBuilder();
            //          builder.AppendLine(e.Message);
            //          builder.AppendLine(e.StackTrace);

            //          return JsonConvert.SerializeObject(new { status = "error", code = 400, message = builder.ToString() });
            //      }
        }

        public string ConcluiQuestionario(CrmPesquisa post)
        {
            string ActiveRole = BennerPrincipal.Current.ActiveRole;
            var response = BennerContext.BusinessComponent.Call("SM.Crm.Definicoes.Componentes.QualificacaoLeadsComponent, SM.Crm.Definicoes", "ConcluiQuestionario", post, ActiveRole,null);
            //return response.ToString();

            JObject json = JObject.Parse(response.ToString());

            string status = json["status"].ToString();
            int code = json["code"].Value<int>();
            string message = json["message"].ToString();
            string url = code == 206 ? StartGridPessoas() : code == 200 ? StartResumoPessoas(post.Pessoa) : "";
            return JsonConvert.SerializeObject(new { status = status, code = code, message = message, url = url /*StartResumoPessoas(post.PessoaVertical)*/ });

            //using (var tc = new TransactionContextFactory().Begin())
            //{
            //    try
            //    {
            //        decimal somaResposta = 0;
            //        List<CrmPesquisaResposta> listaRespostas = new List<CrmPesquisaResposta>();

            //        foreach (CrmPesquisaPergunta perg in post.Perguntas)
            //        {
            //            listaRespostas.Add(perg.SelecionadoFechado);

            //            foreach (CrmPesquisaResposta resp in perg.SelecionadoMultiplaEscolha)
            //                listaRespostas.Add(resp);

            //            somaResposta += perg.SelecionadoFechado.Pontuacao;
            //            somaResposta += perg.SelecionadoMultiplaEscolha.Sum(x => x.Pontuacao);
            //        }

            //        EntityBase newPesquisaPessoa = null;

            //        if (post.PesquisaSalvaHandle != null)
            //        {
            //            newPesquisaPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"), new Handle(post.PesquisaSalvaHandle), GetMode.Edit);
            //            newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //            newPesquisaPessoa.Save();
            //        }
            //        else
            //        {
            //            newPesquisaPessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"));
            //            ((EntityAssociation)newPesquisaPessoa.Fields["PESQUISA"]).Handle = new Handle(post.Handle);
            //            ((EntityAssociation)newPesquisaPessoa.Fields["PESSOA"]).Handle = new Handle(post.Pessoa);
            //            newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //            newPesquisaPessoa.Save();
            //        }

            //        Criteria critResposta = new Criteria(@"A.PESQUISAPESSOA = :PESQUISASALVA");

            //        critResposta.Parameters.Add("PESQUISASALVA", newPesquisaPessoa.Handle);

            //        Entity.DeleteMany(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAPESSOA"), critResposta);

            //        foreach (CrmPesquisaResposta resp in listaRespostas)
            //        {
            //            if (resp.Handle != null)
            //            {
            //                EntityBase NewRespostaPessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAPESSOA"));
            //                ((EntityAssociation)NewRespostaPessoa.Fields["PESQUISAPESSOA"]).Handle = newPesquisaPessoa.Handle;
            //                ((EntityAssociation)NewRespostaPessoa.Fields["RESPOSTA"]).Handle = new Handle(resp.Handle);
            //                NewRespostaPessoa.Save();
            //            }
            //        }

            //        EntityBase pesquisa = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESQUISA"), new Handle(post.Handle));
            //        EntityBase pessoa = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESSOAS"), new Handle(post.Pessoa));

            //        if (pessoa == null)
            //            throw new BusinessException("Conta não encontrada! Handle:" + post.Pessoa);

            //        int indexListaTemperatura = ((ListItem)pesquisa.Fields["TEMPERATURAPROGRESSO"]).Value;

            //        //Buscando todas as verticais cadastradas
            //        Entities<EntityBase> TodasVerticais = Entity.GetMany(EntityDefinition.GetByName("K_CRM_VERTICAL"), new Criteria("A.NOME <> 'Sem Vertical' AND A.HANDLE NOT IN (SELECT VERTICAL FROM K_CRM_PESSOAS WHERE PESSOA = " + pessoa.Handle + ")"));
            //        //Entities<EntityBase> TodasVerticais = Entity.GetAll(EntityDefinition.GetByName("K_CRM_VERTICAL"));

            //        //Variavel axiliar que define se a Vertical está atrelada ao Ramo de Atividade
            //        bool passou = false;

            //        //Varivel auxiliar para verificar se foi criado pelo menos uma Conta-Vertical
            //        int criaContaVertical = 0;

            //        //Laço de repetição para passar por todas as verticais
            //        foreach (EntityBase entity in TodasVerticais)
            //        {
            //            //Pegando o conteúdo atual do campo RAMOATIVIDADE da tabela K_CRM_VERTICAL
            //            var temp = (entity.Fields["RAMOATIVIDADE"] as EntityAggregation).FilterInfo;

            //            //Para cada Ramo de atividade atrelado a vertical atual, verifique se o valor é igual ao respondido na primeira etapa do questionário
            //            foreach (KeyValuePair<Handle, string> ramo in temp)
            //            {
            //                //Se os ramos de atividade forem iguais, logo pode ser criado uma Conta-Vertical
            //                if (ramo.Value.Equals((pessoa.Fields["RAMOATIVIDADE"] as EntityAssociation).Handle.ToString()/*post.RamoAtividade.ToString()*/))
            //                {
            //                    passou = true;
            //                    break;
            //                }
            //            }

            //            //Se a soma total das respostas na pesquisa for maior ou igual a pontuação minima exigida pela vertical, e a vertical estiver dentro do ramo de atividade escolhido
            //            if (somaResposta >= Convert.ToDecimal(entity.Fields["PONTUACAOMINIMA"].ToString()) && passou)
            //            {
            //                if (somaResposta > post.PontuacaoMuitoQuente)
            //                    SuspectContaQualificado(pesquisa, post.Pessoa, entity, newPesquisaPessoa.Handle);
            //                else if (somaResposta > post.PontuacaoQuente && (indexListaTemperatura == 2 || indexListaTemperatura == 3))
            //                    SuspectContaQualificado(pesquisa, post.Pessoa, entity, newPesquisaPessoa.Handle);
            //                else if (somaResposta > post.PontuacaoMorno && indexListaTemperatura == 3)
            //                    SuspectContaQualificado(pesquisa, post.Pessoa, entity, newPesquisaPessoa.Handle);
            //                else
            //                    SuspectContaDesqualificado(pesquisa, post.Pessoa, newPesquisaPessoa.Handle);

            //                criaContaVertical++;
            //            }

            //            //Volta a vaiavel auxiliar ao seu valor padrão
            //            passou = false;
            //        }

            //        if (criaContaVertical == 0)
            //        {
            //            SuspectContaDesqualificado(pesquisa, post.Pessoa, newPesquisaPessoa.Handle);
            //            tc.Complete();
            //            return JsonConvert.SerializeObject(new { status = "success", code = 206, message = "Conforme o questionário respondido, a conta não se qualifica para nenhuma de nossas verticais.", url = StartGridPessoas() });
            //        }
            //        else
            //        {
            //            tc.Complete();
            //            return JsonConvert.SerializeObject(new { status = "success", code = 200, message = "Questionario Salvo! Conta Qualificada", url = StartResumoPessoas(post.Pessoa) });
            //        }

            //    }
            //    catch (Exception e)
            //    {
            //        StringBuilder builder = new StringBuilder();
            //        builder.AppendLine(e.Message);
            //        builder.AppendLine(e.StackTrace);

            //        return JsonConvert.SerializeObject(new { status = "error", code = 400, message = builder.ToString() });
            //    }
            //}
        }

        //private void SuspectContaDesqualificado(EntityBase entPar, string pessoa, Handle hanPesquisaPessoa)
        //{
        //    try
        //    {
        //        var filialAtual = BennerContext.Security.GetCurrentBranch(BennerContext.Administration.DefaultSystemInstanceName);
        //        if (null == filialAtual)
        //            throw new ArgumentException("Para concluir o questionário, é necessário que o usuario esteja logado em uma Filial");

        //        EntityBase subfase = (entPar.Fields["SUBFASEDESQUALIFICADO"] as EntityAssociation).Instance;
        //        EntityBase fase = (subfase.Fields["FASE"] as EntityAssociation).Instance;

        //        EntityBase entPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAS"), new Handle(pessoa), GetMode.Edit);
        //        if(null != entPessoa)
        //        {
        //            (entPessoa.Fields["FASE"] as EntityAssociation).Handle = fase.Handle;
        //            (entPessoa.Fields["SUBFASE"] as EntityAssociation).Handle = subfase.Handle;
        //            entPessoa.Save();
        //        }


        //        Criteria criteria = new Criteria(@"A.PESSOA = :PESSOA AND A.STATUS = 1 AND A.VERTICAL IS NULL");
        //        criteria.Parameters.Add("PESSOA", entPessoa.Handle.Value.ToString());

        //        try
        //        {
        //            EntityBase tarefaAtual = Entity.Get(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), criteria);
        //            EntityBase atualizatarefa = Entity.Get(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), criteria, GetMode.Edit);
        //            atualizatarefa.Fields["STATUS"] = new ListItem(2, "Concluido");
        //            atualizatarefa.Fields["DATACONCLUSAO"] = DateTime.Now;
        //            ((EntityAssociation)atualizatarefa.Fields["RESPOSTA"]).Handle = new Handle(342);
        //            atualizatarefa.Save();
        //        }
        //        catch (Exception e)
        //        {

        //        }

        //        EntityBase entPesquisaPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"), hanPesquisaPessoa, GetMode.Edit);
        //        entPesquisaPessoa.Fields["STATUS"] = new ListItem(2, "Concluído");

        //        entPesquisaPessoa.Save();
        //    }
        //    catch (Benner.Tecnologia.Common.Exceptions.AuthorizationException e)
        //    {
        //        throw new BusinessException(e.Message);
        //    }
        //    catch (Exception e)
        //    {
        //        throw new BusinessException(e.Message);
        //    }

        //}

        //private void SuspectContaQualificado(EntityBase entPar, string pessoa, EntityBase vertical, Handle hanPesquisaPessoa)
        //{
        //    try
        //    {
        //        var filialAtual = BennerContext.Security.GetCurrentBranch(BennerContext.Administration.DefaultSystemInstanceName);
        //        if (null == filialAtual)
        //            throw new ArgumentException("Para concluir o questionário, é necessário que o usuario esteja logado em uma Filial\n\t\n\t\n\t");

        //        EntityBase subfase = (entPar.Fields["SUBFASEQUALIFICADO"] as EntityAssociation).Instance;
        //        EntityBase fase = (subfase.Fields["FASE"] as EntityAssociation).Instance;

        //        EntityBase entPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAS"), new Handle(pessoa), GetMode.Edit);
        //        (entPessoa.Fields["FASE"] as EntityAssociation).Handle = fase.Handle;
        //        (entPessoa.Fields["SUBFASE"] as EntityAssociation).Handle = subfase.Handle;

        //        bool passou = VerificaVerticalUsuario(vertical.Handle);

        //        SM.Crm.Definicoes.Entidades.CrmPessoaVertical NovaPessoaVertical = SM.Crm.Definicoes.Entidades.CrmPessoaVertical.Create();

        //        ((EntityAssociation)NovaPessoaVertical.Fields["PESSOA"]).Handle = new Handle(pessoa);
        //        ((EntityAssociation)NovaPessoaVertical.Fields["VERTICAL"]).Handle = vertical.Handle;
        //        ((EntityAssociation)NovaPessoaVertical.Fields["SUBFASE"]).Handle = subfase.Handle;

        //        if ((entPessoa.Fields["USUARIOEXECUTIVO"] as EntityAssociation).Handle.IsValid() && passou)
        //            ((EntityAssociation)NovaPessoaVertical.Fields["USUARIOEXECUTIVO"]).Handle = (entPessoa.Fields["USUARIOEXECUTIVO"] as EntityAssociation).Handle;
        //        if ((entPessoa.Fields["USUARIOGDQ"] as EntityAssociation).Handle.IsValid() && passou)
        //            ((EntityAssociation)NovaPessoaVertical.Fields["USUARIOSDR"]).Handle = (entPessoa.Fields["USUARIOGDQ"] as EntityAssociation).Handle;

        //        if ("Sinck" == BennerContext.Administration.GetConfigurationParameter(BennerContext.Administration.BServerSystemName, "SINCKPROPRIEDADE", ConfigurationParameterType.System))
        //        {
        //            if(BennerPrincipal.Current.ActiveRole == "K_CRM_BDR_SINCK")
        //            {
        //                ((EntityAssociation)NovaPessoaVertical.Fields["USUARIOSDR"]).Handle = Entity.GetFirstOrDefault(EntityDefinition.GetByName("Z_GRUPOUSUARIOS"), new Criteria("A.K_INTELIGENCIAMERCADO = 'S' AND A.INATIVO = 'N' AND A.K_FILIAL = " + filialAtual.Handle.Value + "  AND (A.K_VERTICALPRODUTO LIKE CONCAT('',CAST((SELECT HANDLE FROM K_CRM_VERTICAL WHERE NOME = '" + vertical.Fields["NOME"].ToString() + "') AS VARCHAR),'%') OR A.K_VERTICALPRODUTO LIKE CONCAT('%',CAST((SELECT HANDLE FROM K_CRM_VERTICAL WHERE NOME = '" + vertical.Fields["NOME"].ToString() + "') AS VARCHAR),'%'))", CompanyFilterMode.None)).Handle;
        //            }
        //        }

        //        //EntityBase NewPessoaVertical = Entity.Create(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"));
        //        //((EntityAssociation)NewPessoaVertical.Fields["PESSOA"]).Handle = new Handle(pessoa);// Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAS"), new Handle(pessoa), GetMode.Edit).Handle;
        //        //((EntityAssociation)NewPessoaVertical.Fields["VERTICAL"]).Handle = vertical.Handle;
        //        //((EntityAssociation)NewPessoaVertical.Fields["SUBFASE"]).Handle = subfase.Handle;
        //        //if ((entPessoa.Fields["USUARIOEXECUTIVO"] as EntityAssociation).Handle.IsValid() && passou)
        //        //    ((EntityAssociation)NewPessoaVertical.Fields["USUARIOEXECUTIVO"]).Handle = (entPessoa.Fields["USUARIOEXECUTIVO"] as EntityAssociation).Handle;
        //        //if ((entPessoa.Fields["USUARIOGDQ"] as EntityAssociation).Handle.IsValid() && passou)
        //        //    ((EntityAssociation)NewPessoaVertical.Fields["USUARIOSDR"]).Handle = (entPessoa.Fields["USUARIOGDQ"] as EntityAssociation).Handle;

        //        Criteria criteria = new Criteria(@"A.PESSOA = :PESSOA AND A.STATUS = 1 AND A.VERTICAL IS NULL");
        //        criteria.Parameters.Add("PESSOA", entPessoa.Handle.Value.ToString());

        //        try
        //        {
        //            EntityBase tarefaAtual = Entity.Get(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), criteria);
        //            EntityBase atualizatarefa = Entity.Get(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), criteria, GetMode.Edit);
        //            atualizatarefa.Fields["STATUS"] = new ListItem(2, "Concluido");
        //            atualizatarefa.Fields["DATACONCLUSAO"] = DateTime.Now;
        //            ((EntityAssociation)atualizatarefa.Fields["RESPOSTA"]).Handle = new Handle(341);
        //            atualizatarefa.Save();
        //        }
        //        catch (Exception e)
        //        {

        //        }

        //        EntityBase entPesquisaPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"), hanPesquisaPessoa, GetMode.Edit);
        //        entPesquisaPessoa.Fields["STATUS"] = new ListItem(2, "Concluído");

        //        entPessoa.Save();
        //        NovaPessoaVertical.Save();
        //        //NewPessoaVertical.Save();
        //        entPesquisaPessoa.Save();
        //    }
        //    catch (Exception e)
        //    {
        //        throw new BusinessException(e.Message);
        //    }
        //}

        private string StartResumoPessoas(string id)
        {
            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_PESSOAS",
                IsModalPage = false,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_CRM_PESSOAS/resumo.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE = :HANDLE",
                    new List<Parameter>(){
                        new Parameter("HANDLE",id)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);//.Split('\'').ElementAtOrDefault(1);

        }

        private string StartGridPessoas()
        {
            var outPut = new GridLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_PESSOAS",
                IsModalPage = false,
                Url = "~/Pages/K_CRM_PESSOAS/grid.aspx"
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);//.Split('\'').ElementAtOrDefault(1);

        }

        //private bool VerificaVerticalUsuario(Handle hanVertical)
        //{
        //    bool passou = false;
        //    var verticalUsuario = Entity.Get(EntityDefinition.GetByName("Z_GRUPOUSUARIOS"), BennerContext.Security.GetLoggedUserHandle());

        //    //Pegando o conteúdo atual do campo RAMOATIVIDADE da tabela K_CRM_VERTICAL
        //    var temp = (verticalUsuario.Fields["K_VERTICALPRODUTO"] as EntityAggregation).FilterInfo;

        //    //Para cada Vertical atrelado ao usuario atual
        //    foreach (KeyValuePair<Handle, string> vert in temp)
        //    {
        //        if (vert.Key.Value.ToString() == hanVertical.Value.ToString())
        //        {
        //            passou = true;
        //            break;
        //        }
        //    }
        //    return passou;
        //}
    }
}