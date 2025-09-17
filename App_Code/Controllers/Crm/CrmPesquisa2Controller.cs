using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Models.Crm;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SM.Crm.Definicoes.Comum.Qualificacao;
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
    public class CrmPesquisa2Controller : Controller
    {
        public CrmPesquisa2Controller()
        {
        }

        public ActionResult Pesquisa()
        {
            return PartialView();
        }

        public string SaveFromPost(CrmPesquisa post)
        {
            var response = BennerContext.BusinessComponent.Call("SM.Crm.Definicoes.Componentes.QualificacaoLeadsComponent, SM.Crm.Definicoes", "SaveFromPost", post, post.PessoaVertical);

            JObject json = JObject.Parse(response.ToString());

            string status = json["status"].ToString();
            int code = json["code"].Value<int>();
            string message = json["message"].ToString();
            string url = StartResumoPessoas(post.PessoaVertical);
            return JsonConvert.SerializeObject(new { status = status, code = code, message = message, url = url /*StartResumoPessoas(post.PessoaVertical)*/ });


            //return response.ToString();


            //return JsonConvert.SerializeObject(new { status = "success", code = 200, message = "Salvo!", url = StartResumoPessoas(post.Pessoa) });


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
            //              newPesquisaPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAVERTICAL"), new Handle(post.PesquisaSalvaHandle), GetMode.Edit);
            //              newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //              newPesquisaPessoa.Save();
            //          }
            //          else
            //          {
            //              newPesquisaPessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISAVERTICAL"));
            //              ((EntityAssociation)newPesquisaPessoa.Fields["PESQUISA"]).Handle = new Handle(post.Handle);
            //              ((EntityAssociation)newPesquisaPessoa.Fields["PESSOAVERTICAL"]).Handle = new Handle(post.PessoaVertical);
            //              newPesquisaPessoa.Fields["STATUS"] = new ListItem(1, "Em aberto");
            //newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //              newPesquisaPessoa.Save();
            //          }

            //          Criteria critResposta = new Criteria(@"A.PESQUISAVERTICAL = :PESQUISASALVA");

            //          critResposta.Parameters.Add("PESQUISASALVA", newPesquisaPessoa.Handle);

            //          Entity.DeleteMany(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAVERTICAL"), critResposta);

            //          foreach (CrmPesquisaResposta resp in listaRespostas)
            //          {
            //              if (resp.Handle != null)
            //              {
            //                  EntityBase NewRespostaPessoaVertical = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAVERTICAL"));
            //                  ((EntityAssociation)NewRespostaPessoaVertical.Fields["PESQUISAVERTICAL"]).Handle = newPesquisaPessoa.Handle;
            //                  ((EntityAssociation)NewRespostaPessoaVertical.Fields["RESPOSTA"]).Handle = new Handle(resp.Handle);
            //                  NewRespostaPessoaVertical.Save();

            //              }
            //          }

            //          return JsonConvert.SerializeObject(new { status = "success", code = 200, message = "Questionario Salvo! Não esqueça de qualificar a conta", url = StartResumoPessoas(post.PessoaVertical) });
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
            var response = BennerContext.BusinessComponent.Call("SM.Crm.Definicoes.Componentes.QualificacaoLeadsComponent, SM.Crm.Definicoes", "ConcluiQuestionario", post, ActiveRole, post.PessoaVertical);
            //return response.ToString();
            JObject json = JObject.Parse(response.ToString());

            string status = json["status"].ToString();
            int code = json["code"].Value<int>();
            string message = json["message"].ToString();
            string url = StartResumoPessoas(post.PessoaVertical);
            return JsonConvert.SerializeObject(new { status = status, code = code, message = message, url = url /*StartResumoPessoas(post.PessoaVertical)*/ });


            //return JsonConvert.SerializeObject(new { status = "success", code = 200, message = "Qualificado!", url = StartResumoPessoas(post.Pessoa) });
            //try
            //{
            //    decimal somaResposta = 0;
            //    List<CrmPesquisaResposta> listaRespostas = new List<CrmPesquisaResposta>();

            //    foreach (CrmPesquisaPergunta perg in post.Perguntas)
            //    {
            //        listaRespostas.Add(perg.SelecionadoFechado);

            //        foreach (CrmPesquisaResposta resp in perg.SelecionadoMultiplaEscolha)
            //            listaRespostas.Add(resp);

            //        somaResposta += perg.SelecionadoFechado.Pontuacao;
            //        somaResposta += perg.SelecionadoMultiplaEscolha.Sum(x => x.Pontuacao);
            //    }

            //    EntityBase newPesquisaPessoa = null;

            //    if (post.PesquisaSalvaHandle != null)
            //    {
            //        newPesquisaPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAVERTICAL"), new Handle(post.PesquisaSalvaHandle), GetMode.Edit);
            //        newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //        newPesquisaPessoa.Save();
            //    }
            //    else
            //    {
            //        newPesquisaPessoa = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISAVERTICAL"));
            //        ((EntityAssociation)newPesquisaPessoa.Fields["PESQUISA"]).Handle = new Handle(post.Handle);
            //        ((EntityAssociation)newPesquisaPessoa.Fields["PESSOAVERTICAL"]).Handle = new Handle(post.PessoaVertical);
            //        newPesquisaPessoa.Fields["STATUS"] = new ListItem(1, "Em aberto");
            //        newPesquisaPessoa.Fields["PONTUACAO"] = somaResposta;
            //        newPesquisaPessoa.Save();
            //    }

            //    Criteria critResposta = new Criteria(@"A.PESQUISAVERTICAL = :PESQUISASALVA");

            //    critResposta.Parameters.Add("PESQUISASALVA", newPesquisaPessoa.Handle);

            //    Entity.DeleteMany(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAVERTICAL"), critResposta);

            //    foreach (CrmPesquisaResposta resp in listaRespostas)
            //    {
            //        if (resp.Handle != null)
            //        {
            //            EntityBase NewRespostaPessoaVertical = Entity.Create(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAVERTICAL"));
            //            ((EntityAssociation)NewRespostaPessoaVertical.Fields["PESQUISAVERTICAL"]).Handle = newPesquisaPessoa.Handle;
            //            ((EntityAssociation)NewRespostaPessoaVertical.Fields["RESPOSTA"]).Handle = new Handle(resp.Handle);
            //            NewRespostaPessoaVertical.Save();
            //        }
            //    }

            //    EntityBase pesquisa = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESQUISA"), new Handle(post.Handle));

            //    //Verificando a subfase atual para gravar o registro associado à Conta ou à Vertical
            //    EntityBase subfase = (pesquisa.Fields["SUBFASEQUALIFICADO"] as EntityAssociation).Instance;

            //    int indexListaTemperatura = ((ListItem)pesquisa.Fields["TEMPERATURAPROGRESSO"]).Value;

            //        if (somaResposta > post.PontuacaoMuitoQuente)
            //            SuspectContaQualificado(pesquisa, post.PessoaVertical, post.Pessoa, newPesquisaPessoa.Handle, post.Vertical);
            //        else if (somaResposta > post.PontuacaoQuente && (indexListaTemperatura == 2 || indexListaTemperatura == 3))
            //            SuspectContaQualificado(pesquisa, post.PessoaVertical, post.Pessoa, newPesquisaPessoa.Handle, post.Vertical);
            //        else if (somaResposta > post.PontuacaoMorno && indexListaTemperatura == 3)
            //            SuspectContaQualificado(pesquisa, post.PessoaVertical, post.Pessoa, newPesquisaPessoa.Handle, post.Vertical);
            //        else
            //            SuspectContaDesqualificado(pesquisa, post.PessoaVertical, post.Pessoa, newPesquisaPessoa.Handle, post.Vertical);

            //    return JsonConvert.SerializeObject(new { status = "success", code = 200, message = "Questionario Salvo! Conta Qualificada", url = StartResumoPessoas(post.PessoaVertical) });
            //}
            //catch (Exception e)
            //{
            //    StringBuilder builder = new StringBuilder();
            //    builder.AppendLine(e.Message);
            //    builder.AppendLine(e.StackTrace);

            //    return JsonConvert.SerializeObject(new { status = "error", code = 400, message = builder.ToString() });
            //}
        }

        //private void SuspectContaDesqualificado(EntityBase entPar, string pessoaVertical, string pessoa, Handle hanPesquisaVertical, string vertical)
        //{
        //    try
        //    {
        //        EntityBase subfase = (entPar.Fields["SUBFASEDESQUALIFICADO"] as EntityAssociation).Instance;
        //        EntityBase fase = (subfase.Fields["FASE"] as EntityAssociation).Instance;

        //        EntityBase entPessoaVertical = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"), new Handle(pessoaVertical), GetMode.Edit);
        //        (entPessoaVertical.Fields["SUBFASE"] as EntityAssociation).Handle = subfase.Handle;          

        //        EntityBase entPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAS"), new Handle(pessoa), GetMode.Edit);
        //        if (!VerificaSubfaseVerticais(entPessoaVertical))
        //        {
        //            (entPessoa.Fields["FASE"] as EntityAssociation).Handle = fase.Handle;
        //            (entPessoa.Fields["SUBFASE"] as EntityAssociation).Handle = subfase.Handle;
        //        }

        //        Criteria criteria = new Criteria(@"A.PESSOA = :PESSOA AND A.STATUS = 1 AND A.VERTICAL = :VERTICAL");
        //        criteria.Parameters.Add("PESSOA", entPessoa.Handle.Value.ToString());
        //        criteria.Parameters.Add("VERTICAL", vertical);

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

        //        EntityBase entPesquisaVertical = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAVERTICAL"), hanPesquisaVertical, GetMode.Edit);
        //        entPesquisaVertical.Fields["STATUS"] = new ListItem(2, "Concluído");

        //        entPessoa.Save();
        //        entPessoaVertical.Save();
        //        entPesquisaVertical.Save();
        //    }
        //    catch (Exception e)
        //    {
        //        throw new BusinessException(e.Message);
        //    }
        //}

        //private void SuspectContaQualificado(EntityBase entPar, string pessoaVertical, string pessoa, Handle hanPesquisaVertical, string vertical)
        //{
        //    try
        //    {
        //        //using (TransactionContext tc = new TransactionContext())
        //        //{
        //            EntityBase subfase = (entPar.Fields["SUBFASEQUALIFICADO"] as EntityAssociation).Instance;
        //            EntityBase fase = (subfase.Fields["FASE"] as EntityAssociation).Instance;

        //            EntityBase entPessoaVertical = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"), new Handle(pessoaVertical), GetMode.Edit);
        //            (entPessoaVertical.Fields["SUBFASE"] as EntityAssociation).Handle = subfase.Handle;

        //            EntityBase entPessoa = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAS"), new Handle(pessoa), GetMode.Edit);
        //            if (!VerificaSubfaseVerticais(entPessoaVertical))
        //            {
        //                (entPessoa.Fields["FASE"] as EntityAssociation).Handle = fase.Handle;
        //                (entPessoa.Fields["SUBFASE"] as EntityAssociation).Handle = subfase.Handle;
        //            }

        //            Criteria criteria = new Criteria(@"A.PESSOA = :PESSOA AND A.STATUS = 1 AND A.VERTICAL = :VERTICAL");
        //            criteria.Parameters.Add("PESSOA", entPessoa.Handle.Value.ToString());
        //            criteria.Parameters.Add("VERTICAL", vertical);

        //            try
        //            {
        //                EntityBase tarefaAtual = Entity.Get(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), criteria);
        //                EntityBase atualizatarefa = Entity.Get(EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO"), criteria, GetMode.Edit);
        //                atualizatarefa.Fields["STATUS"] = new ListItem(2, "Concluido");
        //                atualizatarefa.Fields["DATACONCLUSAO"] = DateTime.Now;
        //                ((EntityAssociation)atualizatarefa.Fields["RESPOSTA"]).Handle = new Handle(341);
        //                atualizatarefa.Save();
        //            }
        //            catch (Exception e)
        //            {

        //            }

        //            EntityBase entPesquisaVertical = Entity.Get(EntityDefinition.GetByName("K_CRM_PESQUISAVERTICAL"), hanPesquisaVertical, GetMode.Edit);
        //            entPesquisaVertical.Fields["STATUS"] = new ListItem(2, "Concluído");

        //            entPessoa.Save();
        //            entPessoaVertical.Save();
        //            entPesquisaVertical.Save();

        //        //    tc.Complete();
        //        //}    
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
                TargetEntityDefinitionName = "K_CRM_PESSOAVERTICAL",
                IsModalPage = false,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                Url = "~/Pages/K_CRM_PESSOAVERTICAL/resumo.aspx",
                WhereClause =
                    new WhereClause("A.HANDLE = :HANDLE",
                    new List<Parameter>(){
                        new Parameter("HANDLE",id)
                    }),
            };

            return Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);

        }

        //private bool VerificaSubfaseVerticais(EntityBase ent)
        //{
        //    try
        //    {
        //        Criteria criteria = new Criteria("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
        //        criteria.Parameters.Add("PESSOA", (ent.Fields["PESSOA"] as EntityAssociation).Handle.Value.ToString());
        //        criteria.Parameters.Add("VERTICAL", (ent.Fields["VERTICAL"] as EntityAssociation).Handle.Value.ToString());

        //        EntityBase pessoaVertical = Entity.Get(EntityDefinition.GetByName("K_CRM_PESSOAVERTICAL"), criteria, GetMode.Edit);
        //        if ((pessoaVertical.Fields["SUBFASE"] as EntityAssociation).Instance.Fields["NOME"].ToString() == ((ent.Fields["PESSOA"] as EntityAssociation).Instance.Fields["SUBFASE"] as EntityAssociation).Instance.Fields["NOME"].ToString())
        //            return false;
        //        else
        //            return true;
        //    }
        //    catch (Exception e)
        //    {
        //        return false;
        //    }
        //}
    }
}