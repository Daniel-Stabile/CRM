using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Models.Crm;
using Newtonsoft.Json;
using SM.Crm.Definicoes.Comum.Qualificacao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_CrmPesquisa_Pesquisa : ViewPage
{
    public string jsonPesquisa ="Json";
    public EntityBase pessoa = null;
    public string mensagem="";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            var linkDefinition = this.GetLinkDefinition() as FormLinkDefinition;
            if (linkDefinition != null)

            {
                Criteria crit = new Criteria("A.HANDLE = :HANDLE");
                crit.Parameters.Add("HANDLE", linkDefinition.WhereClause.Parameters[0].Value.ToString());

                pessoa = Entity.Get(EntityDefinition.GetByName(linkDefinition.TargetEntityDefinitionName), crit);

                if (pessoa != null)
                {
                    EntityBase ramoatividade = null;
                    EntityBase filial = null;
                    EntityBase subfase = null;
                    EntityBase vertical = null;

                    if (pessoa.Fields["RAMOATIVIDADE"] != null || pessoa.Fields["VERTICAL"] != null)
                    {
                        if(pessoa.Fields["VERTICAL"] != null && (pessoa.Fields["VERTICAL"] as EntityAssociation).Handle.IsValid())
                        {
                            vertical = (pessoa.Fields["VERTICAL"] as EntityAssociation).Instance;
                            filial = (pessoa.Fields["FILIAL"] as EntityAssociation).Instance;
                            subfase = (pessoa.Fields["SUBFASE"] as EntityAssociation).Instance;

                            mensagem = BuscaPesquisaVertical(vertical.Handle, filial.Handle, pessoa.Handle, subfase.Handle) ? "Ok" : "Criar Questionario";

                            //mensagem = "Ok";
                        }
                        else if(pessoa.Fields["RAMOATIVIDADE"] != null && (pessoa.Fields["RAMOATIVIDADE"] as EntityAssociation).Handle.IsValid())
                        {
                            ramoatividade = (pessoa.Fields["RAMOATIVIDADE"] as EntityAssociation).Instance;
                            filial = (pessoa.Fields["FILIAL"] as EntityAssociation).Instance;
                            subfase = (pessoa.Fields["SUBFASE"] as EntityAssociation).Instance;

                            mensagem = BuscaPesquisa(ramoatividade.Handle, filial.Handle, pessoa.Handle, subfase.Handle) ? "Ok" : "Criar Questionario";

                            //mensagem = "Ok";

                        }
                        else
                        {
                            mensagem = "Não existe questionario cadastrado para o ramo de atividade da conta nessa filial !!!!";
                        }
                    }
                    else
                    {
                        mensagem = "Não existe questionario cadastrado para o ramo de atividade da conta nessa filial !!!!";
                    }

                }
            }
        }
        catch(Exception exception)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(exception.Message);
            builder.AppendLine(exception.StackTrace);
            builder.AppendLine(exception.Source);
            throw new BusinessException(builder.ToString());
        }
    }

    private bool BuscaPesquisa(Handle RamoAtividade, Handle FilialHandle, Handle PessoaHandle, Handle SubfaseHandle)
    {
        Criteria crit = new Criteria(@"A.SUBFASE = :SUBFASE
                                        AND A.RAMOATIVIDADE LIKE '%"+RamoAtividade.ToString()+"%'");
        //crit.Parameters.Add("FILIAL", FilialHandle);
        crit.Parameters.Add("SUBFASE", SubfaseHandle);

        EntityBase pesquisa = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESQUISA"), crit);

        CrmPesquisa newPesquisa = new CrmPesquisa();

        newPesquisa.Pessoa = PessoaHandle.ToString();

        if (pesquisa != null)
        {
            newPesquisa.Empresa             = Company.Current.Handle.ToString();
            newPesquisa.Filial              = FilialHandle.Value.ToString();
            newPesquisa.Handle              = pesquisa.Handle.ToString();
            newPesquisa.Titulo              = pesquisa.Fields["TITULO"].ToString();
            newPesquisa.RamoAtividade       = RamoAtividade.ToString();
            newPesquisa.PontuacaoQuente     = pesquisa.Fields["PONTUACAOQUENTE"].ToDecimal();
            newPesquisa.PontuacaoMorno      = pesquisa.Fields["PONTUACAOMORNO"].ToDecimal();

            Criteria critPesquisaSalva = new Criteria("A.PESQUISA = :PESQUISA AND A.PESSOA = :PESSOA");
            critPesquisaSalva.Parameters.Add("PESQUISA", pesquisa.Handle);
            critPesquisaSalva.Parameters.Add("PESSOA", PessoaHandle);

            EntityBase pesquisaSalva = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"), critPesquisaSalva);

            if(pesquisaSalva != null)
                newPesquisa.PesquisaSalvaHandle = pesquisaSalva.Handle.ToString();

            newPesquisa.Perguntas           = BuscaPerguntas(pesquisa.Handle, newPesquisa.PesquisaSalvaHandle);
            jsonPesquisa = JsonConvert.SerializeObject(newPesquisa);
            return true;
        }
        return false;
    }

    private bool BuscaPesquisaVertical(Handle VerticalHandle, Handle FilialHandle, Handle PessoaHandle, Handle SubfaseHandle)
    {
        Criteria crit = new Criteria(@"A.SUBFASE = :SUBFASE
                                        AND A.VERTICAL =:VERTICAL");
        //crit.Parameters.Add("FILIAL", FilialHandle);
        crit.Parameters.Add("SUBFASE", SubfaseHandle);
        crit.Parameters.Add("VERTICAL", VerticalHandle);

        EntityBase pesquisa = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESQUISA"), crit);

        CrmPesquisa newPesquisa = new CrmPesquisa();

        newPesquisa.Pessoa = PessoaHandle.ToString();

        if (pesquisa != null)
        {
            newPesquisa.Empresa = Company.Current.Handle.ToString();
            newPesquisa.Filial = Branch.Current.Handle.ToString();
            newPesquisa.Handle = pesquisa.Handle.ToString();
            newPesquisa.Titulo = pesquisa.Fields["TITULO"].ToString();
            newPesquisa.Vertical = VerticalHandle.ToString();
            newPesquisa.PontuacaoMuitoQuente = pesquisa.Fields["PONTUACAOMUITOQUENTE"].ToDecimal();
            newPesquisa.PontuacaoQuente = pesquisa.Fields["PONTUACAOQUENTE"].ToDecimal();
            newPesquisa.PontuacaoMorno = pesquisa.Fields["PONTUACAOMORNO"].ToDecimal();

            Criteria critPesquisaSalva = new Criteria("A.PESQUISA = :PESQUISA AND A.PESSOA = :PESSOA");
            critPesquisaSalva.Parameters.Add("PESQUISA", pesquisa.Handle);
            critPesquisaSalva.Parameters.Add("PESSOA", PessoaHandle);

            EntityBase pesquisaSalva = Entity.GetFirstOrDefault(EntityDefinition.GetByName("K_CRM_PESQUISAPESSOA"), critPesquisaSalva);

            if (pesquisaSalva != null)
                newPesquisa.PesquisaSalvaHandle = pesquisaSalva.Handle.ToString();

            newPesquisa.Perguntas = BuscaPerguntas(pesquisa.Handle, newPesquisa.PesquisaSalvaHandle);
            jsonPesquisa = JsonConvert.SerializeObject(newPesquisa);
            return true;
        }
        return false;
    }

    private List<CrmPesquisaPergunta> BuscaPerguntas(Handle PesquisaHandle,string PesquisaSalvaHandle)
    {
        Criteria crit = new Criteria("A.PESQUISA = :PESQUISA");
        crit.Parameters.Add("PESQUISA", PesquisaHandle);

        List<EntityBase> listPerguntas = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESQUISAPERGUNTA"), crit);
        List<CrmPesquisaPergunta> responsePerguntas = new List<CrmPesquisaPergunta>();

        foreach (EntityBase ent in listPerguntas)
        {
            CrmPesquisaPergunta pergunta    = new CrmPesquisaPergunta();
            pergunta.Handle                 = ent.Handle.ToString();
            pergunta.Tipo                   = (ent.Fields["TIPO"] as Benner.Tecnologia.Common.ListItem).Text;
            pergunta.Titulo                 = ent.Fields["TITULO"].ToString();
            pergunta.Respostas              = BuscaRespostas(ent.Handle);
            pergunta.Obrigatorio            = ent.Fields["OBRIGATORIO"].ToString();

            if (PesquisaSalvaHandle != null)
            {
                List<CrmPesquisaResposta> respostas = BuscaRespostaSelecionada(PesquisaSalvaHandle, pergunta.Handle);

                if(respostas.Count > 0)
                {
                    if (pergunta.Tipo == "Fechada")
                        pergunta.SelecionadoFechado = respostas.First();
                    else if(pergunta.Tipo == "Multipla escolha")
                        pergunta.SelecionadoMultiplaEscolha = respostas;

                }
            }

            responsePerguntas.Add(pergunta);
        }

        return responsePerguntas;
    }

    private List<CrmPesquisaResposta> BuscaRespostaSelecionada(string pesquisaSalvaHandle, string perguntaHandle)
    {
        Criteria crit = new Criteria(@"A.PESQUISAPESSOA = :PESQUISASALVA
                                        AND A.RESPOSTA IN (
                                            SELECT HANDLE
                                            FROM K_CRM_PESQUISARESPOSTA
                                            WHERE PERGUNTA = :PERGUNTA
                                        )");

        crit.Parameters.Add("PESQUISASALVA", new Handle(pesquisaSalvaHandle));
        crit.Parameters.Add("PERGUNTA", new Handle(perguntaHandle));

        List<EntityBase> listRespostaSalva = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTAPESSOA"),crit);
        List<CrmPesquisaResposta> responseRespostas = new List<CrmPesquisaResposta>();

        foreach(EntityBase ent in listRespostaSalva)
        {
            EntityBase resposta = ((EntityAssociation)ent.Fields["RESPOSTA"]).Instance;

            CrmPesquisaResposta novaResposta = new CrmPesquisaResposta();
            novaResposta.Handle = resposta.Handle.ToString();
            novaResposta.Titulo = resposta.Fields["TITULO"].ToString();
            novaResposta.Pontuacao = resposta.Fields["PONTUACAO"].ToDecimal();
            novaResposta.Selecionado = false;

            responseRespostas.Add(novaResposta);
        }

        return responseRespostas;
    }

    private List<CrmPesquisaResposta> BuscaRespostas(Handle PerguntaHandle)
    {
        Criteria crit = new Criteria("A.PERGUNTA = :PERGUNTA");
        crit.Parameters.Add("PERGUNTA", PerguntaHandle);

        List<EntityBase> listRespostas = Entity.GetMany(EntityDefinition.GetByName("K_CRM_PESQUISARESPOSTA"), crit);
        List<CrmPesquisaResposta> responseRespostas = new List<CrmPesquisaResposta>();

        foreach(EntityBase ent in listRespostas){
            CrmPesquisaResposta novaResposta    = new CrmPesquisaResposta();
            novaResposta.Handle                 = ent.Handle.ToString();
            novaResposta.Titulo                 = ent.Fields["TITULO"].ToString();
            novaResposta.Pontuacao              = ent.Fields["PONTUACAO"].ToDecimal();
            novaResposta.Selecionado            = false;

            responseRespostas.Add(novaResposta);
        }

        return responseRespostas;
    }
}