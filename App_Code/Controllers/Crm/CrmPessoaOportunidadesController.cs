using Benner.ERP.Comum;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Newtonsoft.Json;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Crm;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Math;
using Stimulsoft.Controls.Win.DotNetBar;
using SK.Integracoes.Benner.Services;
using Benner.Tecnologia.Common.Security;
using Benner.Corporativo.Definicoes.Contabil;
using DocumentFormat.OpenXml.Bibliography;
using DocuSign.eSign.Model;
using System.Activities.Statements;
using Benner.Decisor.Components.Base.Entidades;
using SM.Crm.Definicoes.Comum.Oportunidades;
using Controllers.Models.Crm;
using SM.Crm.Definicoes.Entradas;

namespace Controllers.Crm
{
    /// <summary>
    /// Descrição resumida de CrmPessoaOportunidadesController
    /// </summary>
    public class CrmPessoaOportunidadesController : Controller
    {
        private ContratosService contratos;
        public CrmPessoaOportunidadesController()
        {
            
        }

        public ActionResult TilesValorModalidade()
        {
            //Inicializando variaveis
            var retorno = new TilesValorModalidadeResponseModel();
            string handle = "", versao = "";
            CrmPessoaOportunidades rotaOp = null;

            //Recebendo dados da rota
            var DadosRota = this.RouteData.Values.ToList();

            try
            {
                foreach (var rota in DadosRota)
                {
                    if (rota.Key == "Model" && null != rota.Value)
                    {
                        rotaOp = (CrmPessoaOportunidades)rota.Value;
                        versao = rotaOp.Versao.ToString();
                        handle = rotaOp.Handle.Value.ToString();
                        break;
                    }
                }

                if (!handle.Equals(""))
                {
                    retorno = CrmPessoaOportunidadesDao.CreateInstance().CalcularOportunidade(CrmPessoaOportunidades.Get(rotaOp.Handle));
                    //retorno = CrmPessoaOportunidadesFuncoes.CalcularOportunidade(handle,versao);

                    retorno.ValoresOportunidade.ValorProdutos.TotalLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(retorno.ValoresOportunidade.ValorProdutos.TotalLu));
                    retorno.ValoresOportunidade.ValorProdutos.TotalLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(retorno.ValoresOportunidade.ValorProdutos.TotalLum));
                    retorno.ValoresOportunidade.ValorProdutos.TotalLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(retorno.ValoresOportunidade.ValorProdutos.TotalLocacao));

                    retorno.ValoresOportunidade.ValorSaas.TotalDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(retorno.ValoresOportunidade.ValorSaas.TotalDataCenter));
                    retorno.ValoresOportunidade.ValorSaas.TotalSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(retorno.ValoresOportunidade.ValorSaas.TotalSaas));

                    retorno.ValoresOportunidade.ValorEscopo.TotalServicos = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(retorno.ValoresOportunidade.ValorEscopo.TotalServicos));
                }
            }
            catch (Exception ex)
            {
                return null;
            }

            return View(retorno);
        }

        public ActionResult Conclusao()
        {
            #region Inicializando Variaveis
            var dados = new DadosConclusao();
            var DadosRota = this.RouteData.Values.ToList();
            CrmPessoaOportunidades op = new CrmPessoaOportunidades();
            CrmPessoaOportunidadesProd Prod = new CrmPessoaOportunidadesProd();
            #endregion

            try
            {
                #region Buscando Oportunidade
                foreach (var rota in DadosRota)
                {
                    if (rota.Key == "Model" && null != rota.Value)
                    {
                        CrmPessoaOportunidades rotaOp = (CrmPessoaOportunidades)rota.Value;
                        string handle = rotaOp.Handle.Value.ToString();
                        op = CrmPessoaOportunidades.Get(new Handle(handle));
                        break;
                    }
                }
                #endregion

                #region Logica do processo

                if (op.Handle.IsValid())
                {
                    //if(op.Ativo == true)
                    //{
                    //    var linkResumo = new FormLinkDefinition();
                    //    linkResumo.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                    //    linkResumo.TargetEntityDefinitionName = CrmPessoaOportunidades.GetEntityDefinition().Name;
                    //    linkResumo.WhereClause = new WhereClause("A.HANDLE = :HANDLE");
                    //    linkResumo.WhereClause.AddParameter("HANDLE", op.Handle.Value);
                    //    linkResumo.TargetFormMode = FormLinkDefinition.FormMode.View;
                    //    linkResumo.IsModalPage = true;
                    //    linkResumo.Url = "~/Pages/K_CRM_PESSOAOPORTUNIDADES/Resumo.aspx";

                    //    Response.Redirect(Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkResumo));
                    //}

                    var crit = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(op.Handle.Value.ToString(), op.Versao.ToString());
                    dados = CrmPessoaOportunidadesFuncoes.PreencheDadosConclusao(op);

                    var linkAtiv = new FormLinkDefinition();
                    linkAtiv.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                    linkAtiv.TargetEntityDefinitionName = CrmPessoaOportunidades.GetEntityDefinition().Name;
                    linkAtiv.WhereClause = new WhereClause("A.HANDLE = :HANDLE");
                    linkAtiv.WhereClause.AddParameter("HANDLE", op.Handle.Value);
                    linkAtiv.TargetFormMode = FormLinkDefinition.FormMode.View;
                    linkAtiv.IsModalPage = true;
                    linkAtiv.Url = @"Pages/K_CRM_PESSOAOPORTUNIDADES/AtivarOportunidade.aspx";

                    dados.UrlAtivacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0}", Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkAtiv));

                    dados.OportunidadeAtiva = op.Ativo.Value;

                    //if (op.Ativo == true)
                    //    Response.Redirect("http://localhost:7501");

                    #region Observação e Condições de Pagamento 

                    dados.Observacao = (op.ConsideracoesAdicionais != null && op.ConsideracoesAdicionais.Length > 0) ? op.ConsideracoesAdicionais : op.Observacao;

                    var adicionais = CrmPoAdicional.GetMany(crit);

                    foreach(var adicional in adicionais)
                    {
                        CrmPoAdicionaisResponseModel novo = new CrmPoAdicionaisResponseModel()
                        {
                            Nome = adicional.Adicional.Instance.Nome,
                            Descricao = adicional.Descricao
                        };
                        dados.ConsideracoesAdicionais.Add(novo);
                    }

                    //if (null == op.CondPagLu || op.CondPagLu == "")
                    //    dados.CondPagLu = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.TotalLu;
                    //else
                    //    dados.CondPagLu = op.CondPagLu;

                    //if (null == op.CondPagLum || op.CondPagLum == "")
                    //    dados.CondPagLum = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.TotalLum;
                    //else
                    //    dados.CondPagLum = op.CondPagLum;

                    //if (op.CondPagLoc == null || op.CondPagLoc == "")
                    //    dados.CondPagLocacao = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.TotalLocacao;
                    //else
                    //    dados.CondPagLocacao = op.CondPagLoc;

                    //if ((op.CondPagServ == null || op.CondPagServ == "") && Convert.ToDouble(dados.GerenciamentoProjeto) > Convert.ToDouble(dados.TotalServico))
                    //    dados.CondPagServico = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.GerenciamentoProjeto));
                    //else if ((op.CondPagServ == null || op.CondPagServ == "") && Convert.ToDouble(dados.GerenciamentoProjeto) == Convert.ToDouble(dados.TotalServico))
                    //    dados.CondPagServico = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.TotalServico));
                    //else
                    //    dados.CondPagServico = op.CondPagServ;

                    //if (op.CondPagSaas == null || op.CondPagSaas == "")
                    //    dados.CondPagSaas = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.ValorSaas;
                    //else
                    //    dados.CondPagSaas = op.CondPagSaas;

                    //if (op.CondPagBpo == null || op.CondPagBpo == "")
                    //    dados.CondPagBpo = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ ";
                    //else
                    //    dados.CondPagBpo = op.CondPagBpo;

                    #endregion

                    #region Status da Oportunidade 

                    if (op.StatusOportunidadeInstance.PublicoPrivado == CrmFasesOportunidadePublicoPrivadoRadioItens.ItemPrivado)
                    {
                        //Ordem < 5 são status antes da Proposta
                        if (op.StatusOportunidadeInstance.Ordem < 5)
                        {
                            dados.PropostaAtiva = false;
                            dados.UrlProposta = "";
                        }
                        else
                        {
                            dados.PropostaAtiva = true;

                            FormLinkDefinition link = new FormLinkDefinition();
                            link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                            link.TargetEntityDefinitionName = "K_CRM_VT_PROPOSTA";
                            link.TargetFormMode = FormLinkDefinition.FormMode.Insert;
                            link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERTICALPROD = :VERTICAL");
                            link.WhereClause.AddParameter("OPORTUNIDADE", op.Handle.Value);
                            link.WhereClause.AddParameter("VERTICAL", op.VerticalHandle.Value);
                            link.Parameters.Add("OPORTUNIDADE", op.Handle.Value.ToString());
                            link.Parameters.Add("VERTICAL", op.VerticalHandle.Value.ToString());
                            link.Url = @"~/Pages/K_CRM_PESSOAOPORTUNIDADES/EmitirProposta.aspx";

                            // É necessário utilizar o UriBuilder para persistir os valores durante a transferência
                            var url = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0}", Benner.Tecnologia.Wes.Components.UriBuilder.Create(link));
                            dados.UrlProposta = url.Substring(2);
                        }
                    }
                    else if (op.StatusOportunidadeInstance.PublicoPrivado == CrmFasesOportunidadePublicoPrivadoRadioItens.ItemPublico)
                    {
                        //Ordem < 5 são status antes do Pregão / Leilão
                        if (op.StatusOportunidadeInstance.Ordem < 5)
                        {
                            dados.PropostaAtiva = false;
                        }
                        else
                        {
                            dados.PropostaAtiva = true;
                        }
                    }
                    #endregion

                    #region Controla Visibilidade dos botões

                    #region Minuta Impressa?
                    var critMinuta = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(op.Handle.Value.ToString(), op.Versao.ToString());
                    critMinuta.AddWhereClause("A.TIPO = 1");

                    try
                    {
                        Entities<CrmPoProposta> buscaProposta = CrmPoProposta.GetMany(critMinuta);

                        if (buscaProposta.Count > 0)
                            dados.MinutaImpressa = true;
                        else
                            dados.MinutaImpressa = false;
                    }
                    catch (Exception)
                    {
                        dados.MinutaImpressa = false;
                    }
                    #endregion

                    #region Proposta Impressa?
                    Criteria critProposta = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(op.Handle.Value.ToString(), op.Versao.ToString());
                    critProposta.AddWhereClause("A.TIPO = 2");

                    try
                    {
                        Entities<CrmPoProposta> buscaProposta = CrmPoProposta.GetMany(critProposta);

                        if (buscaProposta.Count > 0)
                            dados.PropostaImpressa = true;
                        else
                            dados.PropostaImpressa = false;
                    }
                    catch (Exception)
                    {
                        dados.PropostaImpressa = false;
                    }
                    #endregion

                    #region Desconto Pendente?
                    dados.DescontoPendente = dados.Bloqueado;
                    #endregion

                    #region Produto(s) Ativo(s)?
                    try
                    {
                        Entities<CrmPessoaOportunidadesProd> produtos = CrmPessoaOportunidadesProd.GetMany(crit);

                        foreach (var produto in produtos)
                        {
                            if (produto.Status == CrmPessoaOportunidadesProdStatusListaItens.ItemAtivo)
                                dados.ProdutoAtivo = true;
                            else
                                dados.ProdutoAtivo = false;
                        }
                    }
                    catch (Exception)
                    {
                        dados.ProdutoAtivo = false;
                    }
                    #endregion

                    #region Status de Proposta?
                    if (op.StatusOportunidadeInstance.Nome == "Proposta" || op.StatusOportunidadeInstance.Nome == "Pregão / Leilão")
                        dados.StatusDeProposta = true;
                    else
                        dados.StatusDeProposta = false;
                    #endregion

                    #endregion

                    dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.GerenciamentoProjeto));
                    dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.TotalServico));
                }

                #endregion
            }
            catch (Exception)
            {
                return null;
            }

            return View(dados);
        }

        public ActionResult Servicos()
        {
            var DadosRota = this.RouteData.Values.ToList();
            var retorno = new EscopoOportunidadeResponseModel();

            CrmPessoaOportunidades op = new CrmPessoaOportunidades();
            CrmPessoaOportunidadesProd Prod = new CrmPessoaOportunidadesProd(); ;

            foreach (var rota in DadosRota)
            {
                if (rota.Key == "Model" && null != rota.Value)
                {
                    op = rota.Value as CrmPessoaOportunidades;
                    if (op.Handle.IsValid())
                    {
                        if (op != null)
                        {
                            op = CrmPessoaOportunidades.Get(op.Handle);
                            retorno.TipoDeEscopo = TiposDeEscopo.Oportunidade;
                            retorno.EhPaginaModal = false;
                            retorno.HandleOportunidadeProduto = "";
                            retorno.NomeOportunidadeProduto = "";
                        }
                        else
                        {
                            CrmPessoaOportunidadesProd rotaOpProd = rota.Value as CrmPessoaOportunidadesProd;
                            if (rotaOpProd != null)
                            {
                                Prod = CrmPessoaOportunidadesProd.Get(rotaOpProd.Handle);
                                op = CrmPessoaOportunidades.Get(Prod.OportunidadeHandle);
                                retorno.TipoDeEscopo = TiposDeEscopo.Produto;
                                retorno.EhPaginaModal = false;
                                retorno.HandleOportunidadeProduto = Prod.Handle.Value.ToString();
                                retorno.NomeOportunidadeProduto = Prod.Produto.Instance.Nome;
                            }
                            else
                                throw new ArgumentException("Não foi encontrada a oportunidade e/ou produto para essa visualização");
                        }

                        FormLinkDefinition link = new FormLinkDefinition();
                        link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                        link.TargetEntityDefinitionName = "K_CRM_VT_PO_ESCOPO";
                        link.TargetFormMode = FormLinkDefinition.FormMode.Insert;
                        link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO");
                        link.WhereClause.AddParameter("OPORTUNIDADE", op.Handle.Value);
                        link.WhereClause.AddParameter("VERSAO", op.Versao.Value);
                        link.IsModalPage = true;
                        link.Url = @"~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeProdEscopo.aspx";

                        // É necessário utilizar o UriBuilder para persistir os valores durante a transferência
                        var url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link);
                        retorno.Url = url.Substring(2);
                    }
                    
                    break;
                }
                else if(rota.Key == "LinkDefinition" && null != rota.Value)
                {
                    var linkPagNova = rota.Value as FormLinkDefinition;

                    if (null != linkPagNova.Parameters["HANOPORTUNIDADEPROD"])
                        Prod = CrmPessoaOportunidadesProd.Get(new Handle(linkPagNova.Parameters["HANOPORTUNIDADEPROD"].ToString()));
                    else if(null != linkPagNova.WhereClause.Parameters[0])
                        Prod = CrmPessoaOportunidadesProd.Get(new Handle(linkPagNova.WhereClause.Parameters[0].Value.ToString()));
                    else
                        break;

                    op = CrmPessoaOportunidades.Get(Prod.OportunidadeHandle);
                    retorno.TipoDeEscopo = TiposDeEscopo.Produto;
                    retorno.EhPaginaModal = true;
                    retorno.HandleOportunidadeProduto = Prod.Handle.Value.ToString();
                    retorno.NomeOportunidadeProduto = Prod.Produto.Instance.Nome;

                    FormLinkDefinition link = new FormLinkDefinition();
                    link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                    link.TargetEntityDefinitionName = "K_CRM_VT_PO_ESCOPO";
                    link.TargetFormMode = FormLinkDefinition.FormMode.Insert;
                    link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO");
                    link.WhereClause.AddParameter("OPORTUNIDADE", op.Handle.Value);
                    link.WhereClause.AddParameter("VERSAO", op.Versao.Value);
                    link.IsModalPage = true;
                    link.Url = @"~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeProdEscopo.aspx";

                    // É necessário utilizar o UriBuilder para persistir os valores durante a transferência
                    var url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link);
                    retorno.Url = url.Substring(2);

                    break;
                }
            }

            try
            {
                if (op.Handle.IsValid())
                {
                    if (null == op.Modalidade.Instance || (Prod.Handle.IsInvalid() && (op.Modalidade.Instance.Lu == true || op.Modalidade.Instance.Lum == true || op.Modalidade.Instance.Locacao == true)))
                        return null;

                    string handleOportunidade = op.Handle.Value.ToString();
                    string versaoOportunidade = op.Versao.ToString();

                    retorno = CrmPessoaOportunidadesDao.CreateInstance().RetornaDadosEscopoPadrao(retorno, op, Prod, Prod.Handle.IsValid()); //CrmPessoaOportunidadesFuncoes.RetornaDadosEscopoPadrao(retorno, op, Prod, Prod.Handle.IsValid());

                    var crit = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(handleOportunidade, versaoOportunidade);

                    var crit3 = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(handleOportunidade, versaoOportunidade);
                    crit3.AddWhereClause("A.TIPO = 2");

                    Entities<CrmPoDescontos> solicitacoes = CrmPoDescontos.GetMany(crit);
                    Entities<CrmPoProposta> propostas = CrmPoProposta.GetMany(crit3);

                    retorno.SolicitacaoDesconto = solicitacoes.Count() > 0 || propostas.Count() > 0 ? true : false;

                    return View(retorno);
                }
                return null;
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ActionResult Minuta()
        {
            #region Inicializando Variaveis
            DadosConclusao dados = new DadosConclusao();
            var DadosRota = this.RouteData.Values.ToList();
            CrmPessoaOportunidades op = new CrmPessoaOportunidades();
            CrmPessoaOportunidadesProd Prod = new CrmPessoaOportunidadesProd();
            #endregion

            try
            {
                #region Buscando Oportunidade
                foreach (var rota in DadosRota)
                {
                    if (rota.Key == "Model" && null != rota.Value)
                    {
                        CrmPessoaOportunidades rotaOp = (CrmPessoaOportunidades)rota.Value;
                        string handle = rotaOp.Handle.Value.ToString();
                        op = CrmPessoaOportunidades.Get(new Handle(handle));
                        break;
                    }
                }
                #endregion

                #region Logica do processo

                if (op.Handle.IsValid())
                {
                    Criteria crit = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO");
                    crit.Parameters.Add("OPORTUNIDADE", op.Handle.Value);
                    crit.Parameters.Add("VERSAO", op.Versao);

                    dados = CrmPessoaOportunidadesFuncoes.PreencheDadosConclusao(op);

                    #region Observação e Condições de Pagamento 

                    dados.Observacao = op.Observacao;

                    var adicionais = CrmPoAdicional.GetMany(crit);

                    foreach (var adicional in adicionais)
                    {
                        CrmPoAdicionaisResponseModel novo = new CrmPoAdicionaisResponseModel()
                        {
                            Nome = adicional.Adicional.Instance.Nome,
                            Descricao = adicional.Descricao
                        };
                        dados.ConsideracoesAdicionais.Add(novo);
                    }

                    //if (null == op.CondPagLu || op.CondPagLu == "")
                    //    dados.CondPagLu = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.TotalLu;
                    //else
                    //    dados.CondPagLu = op.CondPagLu;

                    //if (null == op.CondPagLum || op.CondPagLum == "")
                    //    dados.CondPagLum = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.TotalLum;
                    //else
                    //    dados.CondPagLum = op.CondPagLum;

                    //if (op.CondPagLoc == null || op.CondPagLoc == "")
                    //    dados.CondPagLocacao = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.TotalLocacao;
                    //else
                    //    dados.CondPagLocacao = op.CondPagLoc;

                    //if ((op.CondPagServ == null || op.CondPagServ == "") && Convert.ToDouble(dados.GerenciamentoProjeto) > Convert.ToDouble(dados.TotalServico))
                    //    dados.CondPagServico = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.GerenciamentoProjeto));
                    //else if ((op.CondPagServ == null || op.CondPagServ == "") && Convert.ToDouble(dados.GerenciamentoProjeto) == Convert.ToDouble(dados.TotalServico))
                    //    dados.CondPagServico = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.TotalServico));
                    //else
                    //    dados.CondPagServico = op.CondPagServ;

                    //if (op.CondPagSaas == null || op.CondPagSaas == "")
                    //    dados.CondPagSaas = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ " + dados.ValorSaas;
                    //else
                    //    dados.CondPagSaas = op.CondPagSaas;

                    //if (op.CondPagBpo == null || op.CondPagBpo == "")
                    //    dados.CondPagBpo = "A titulo de licença de uso inicial, o CLIENTE pagará a Benner o valor de R$ ";
                    //else
                    //    dados.CondPagBpo = op.CondPagBpo;

                    #endregion

                    #region Status da Oportunidade 

                    if (op.StatusOportunidadeInstance.PublicoPrivado == CrmFasesOportunidadePublicoPrivadoRadioItens.ItemPrivado)
                    {
                        //Ordem < 5 são status antes da Proposta
                        if (op.StatusOportunidadeInstance.Ordem < 5)
                        {
                            dados.PropostaAtiva = false;
                            dados.UrlProposta = "";
                        }
                        else
                        {
                            dados.PropostaAtiva = true;

                            FormLinkDefinition link = new FormLinkDefinition();
                            link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                            link.TargetEntityDefinitionName = "K_CRM_VT_PROPOSTA";
                            link.TargetFormMode = FormLinkDefinition.FormMode.Insert;
                            link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERTICALPROD = :VERTICAL");
                            link.WhereClause.AddParameter("OPORTUNIDADE", op.Handle.Value);
                            link.WhereClause.AddParameter("VERTICAL", op.VerticalHandle.Value);
                            link.Parameters.Add("OPORTUNIDADE", op.Handle.Value.ToString());
                            link.Parameters.Add("VERTICAL", op.VerticalHandle.Value.ToString());
                            link.Url = @"~/Pages/K_CRM_PESSOAOPORTUNIDADES/EmitirProposta.aspx";

                            // É necessário utilizar o UriBuilder para persistir os valores durante a transferência
                            var url = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0}", Benner.Tecnologia.Wes.Components.UriBuilder.Create(link));
                            dados.UrlProposta = url.Substring(2);
                        }
                    }
                    else if (op.StatusOportunidadeInstance.PublicoPrivado == CrmFasesOportunidadePublicoPrivadoRadioItens.ItemPublico)
                    {
                        //Ordem < 5 são status antes do Pregão / Leilão
                        if (op.StatusOportunidadeInstance.Ordem < 5)
                        {
                            dados.PropostaAtiva = false;
                        }
                        else
                        {
                            dados.PropostaAtiva = true;
                        }
                    }
                    #endregion

                    #region Controla Visibilidade dos botões

                    #region Minuta Impressa?
                    Criteria critMinuta = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.TIPO = 1");
                    critMinuta.Parameters.Add("OPORTUNIDADE", op.Handle.Value);
                    critMinuta.Parameters.Add("VERSAO", op.Versao);

                    try
                    {
                        Entities<CrmPoProposta> buscaProposta = CrmPoProposta.GetMany(critMinuta);

                        if (buscaProposta.Count > 0)
                            dados.MinutaImpressa = true;
                        else
                            dados.MinutaImpressa = false;
                    }
                    catch (Exception)
                    {
                        dados.MinutaImpressa = false;
                    }
                    #endregion

                    #region Proposta Impressa?
                    Criteria critProposta = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.TIPO = 2");
                    critProposta.Parameters.Add("OPORTUNIDADE", op.Handle.Value);
                    critProposta.Parameters.Add("VERSAO", op.Versao);

                    try
                    {
                        Entities<CrmPoProposta> buscaProposta = CrmPoProposta.GetMany(critProposta);

                        if (buscaProposta.Count > 0)
                            dados.PropostaImpressa = true;
                        else
                            dados.PropostaImpressa = false;
                    }
                    catch (Exception)
                    {
                        dados.PropostaImpressa = false;
                    }
                    #endregion

                    #region Desconto Pendente?
                    dados.DescontoPendente = dados.Bloqueado;
                    #endregion

                    #region Produto(s) Ativo(s)?
                    try
                    {
                        Entities<CrmPessoaOportunidadesProd> produtos = CrmPessoaOportunidadesProd.GetMany(crit);

                        foreach (var produto in produtos)
                        {
                            if (produto.Status == CrmPessoaOportunidadesProdStatusListaItens.ItemAtivo)
                                dados.ProdutoAtivo = true;
                            else
                                dados.ProdutoAtivo = false;
                        }
                    }
                    catch (Exception)
                    {
                        dados.ProdutoAtivo = false;
                    }
                    #endregion

                    #region Status de Proposta?
                    if (op.StatusOportunidadeInstance.Nome == "Proposta" || op.StatusOportunidadeInstance.Nome == "Pregão / Leilão")
                        dados.StatusDeProposta = true;
                    else
                        dados.StatusDeProposta = false;
                    #endregion

                    #endregion

                    dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.GerenciamentoProjeto));
                    dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.TotalServico));
                }

                #endregion
            }
            catch (Exception)
            {
                return null;
            }

            return View(dados);
        }

        public ActionResult ContratoERecurso()
        {
            string handle = "";
            var retorno = new ContratosERecursosLeadsClientes();

            var DadosRota = this.RouteData.Values.ToList();

            try
            {
                foreach (var rota in DadosRota)
                {
                    if (rota.Key == "Model" && null != rota.Value)
                    {
                        var rotaOp = (CrmVtPoEscopo)rota.Value;
                        handle = rotaOp.Oportunidade.Handle.Value.ToString();
                        break;
                    }
                }

                retorno.CodigoOportunidade = handle;
                retorno.Contratos = new List<ContratoLeadsClientes>()
                {
                    new ContratoLeadsClientes() { Contrato = "CONT/02065/2014", Identificador = 1 },
                    new ContratoLeadsClientes() { Contrato = "CONT/02075/2014", Identificador = 2 },
                    new ContratoLeadsClientes() { Contrato = "CONT/02085/2014", Identificador = 3 }
                };
                retorno.Recursos = new List<RecursoLeadsClientes>()
                {
                    new RecursoLeadsClientes() { IdentificadorContrato = 1, Recurso = "Despesas com telefone1", Valor = "R$ 1000,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 1, Recurso = "Assessoria de Terceiros - Custos1", Valor = "R$ 1000,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 1, Recurso = "Royalties s/ uso Ferramenta Benner Builder1", Valor = "R$ 1000,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 2, Recurso = "Despesas com telefone2", Valor = "R$ 1200,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 2, Recurso = "Assessoria de Terceiros - Custos2", Valor = "R$ 1200,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 2, Recurso = "Royalties s/ uso Ferramenta Benner Builder2", Valor = "R$ 1200,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 3, Recurso = "Despesas com telefone3", Valor = "R$ 1500,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 3, Recurso = "Assessoria de Terceiros - Custos3", Valor = "R$ 1500,00" },
                    new RecursoLeadsClientes() { IdentificadorContrato = 3, Recurso = "Royalties s/ uso Ferramenta Benner Builder3", Valor = "R$ 1500,00" },
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return View(retorno);
        }

        public string GetServicos()
        {
            var retorno = new List<ServicosResponseModel>();

            try
            {
                Entities<CrmServicos> servicos = CrmServicos.GetAll();

                foreach (var servico in servicos)
                {
                    var serv = new ServicosResponseModel();
                    serv.Servico = servico.Nome;
                    serv.Handle = servico.Handle.Value.ToString();
                    retorno.Add(serv);
                }


                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = JsonConvert.SerializeObject(retorno) });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string GetRecursos(BuscaVerticalRequestModel vertical)
        {
            var retorno = new BuscaVerticalRequestModel();

            try
            {
                Criteria crit = new Criteria("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
                crit.Parameters.Add("PESSOA", vertical.CodigoPessoa);
                crit.Parameters.Add("VERTICAL", vertical.Vertical);
                crit.CompanyFilterMode = CompanyFilterMode.None;

                var Vertical = CrmPessoaVertical.Get(crit);

                if (Vertical.Handle.IsValid())
                {
                    if (Vertical.SubfaseInstance.Nome == "Cliente")
                    {
                        Entities<CrmTiposRecursosPessoa> tipoRecurso = CrmTiposRecursosPessoa.GetMany(crit);

                        foreach (var recurso in tipoRecurso)
                        {
                            var vlHora = new ValorHoraRecurso();
                            vlHora.Valor = Convert.ToDouble(recurso.ValorHora);
                            vlHora.Recurso = recurso.TipoRecursoInstance.Recurso;
                            vlHora.Handle = recurso.TipoRecursoHandle.Value.ToString();
                            retorno.VlHoraRecurso.Add(vlHora);
                        }
                    }
                    else
                    {
                        Entities<CrmTiposRecursosFiliais> tipoRecurso = CrmTiposRecursosFiliais.GetMany(new Criteria("A.VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE())"));

                        foreach (var recurso in tipoRecurso)
                        {
                            var vlHora = new ValorHoraRecurso();
                            vlHora.Valor = Convert.ToDouble(recurso.ValorHora);
                            vlHora.Recurso = recurso.TipoRecursoInstance.Recurso;
                            vlHora.Handle = recurso.TipoRecursoHandle.Value.ToString();
                            retorno.VlHoraRecurso.Add(vlHora);
                        }
                    }
                }

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = JsonConvert.SerializeObject(retorno) });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string GetContratos(string handlePessoa)
        {
            try
            {
                contratos = new ContratosService(BennerContext.Administration.GetConfigurationParameter(BennerContext.Administration.BServerSystemName, "SINCKINTEGRACAOERPBASEURL", ConfigurationParameterType.System),
            BennerContext.Administration.GetConfigurationParameter(BennerContext.Administration.BServerSystemName, "SINCKINTEGRACAOERPUSER", ConfigurationParameterType.System),
            Scramble.ScrambleText(BennerContext.Administration.GetConfigurationParameter(BennerContext.Administration.BServerSystemName, "SINCKINTEGRACAOERPPASSWORD", ConfigurationParameterType.System)));

                var conta = CrmPessoas.Get(new Handle(handlePessoa));

                var capas = contratos.GetCapasPorCnpjCpf(conta.CNPJ);

                var listaContratos = new List<string>();

                foreach (var capa in capas)
                    if(capa.Status == "Aprovado")
                        listaContratos.Add(capa.NumeroContrato);

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = JsonConvert.SerializeObject(listaContratos) });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string GetRecursosContrato(string numeroContrato)
        {
            var retorno = new List<RecursosContratoResponseModel>();

            try
            {
                contratos = new ContratosService(BennerContext.Administration.GetConfigurationParameter(BennerContext.Administration.BServerSystemName, "SINCKINTEGRACAOERPBASEURL", ConfigurationParameterType.System),
            BennerContext.Administration.GetConfigurationParameter(BennerContext.Administration.BServerSystemName, "SINCKINTEGRACAOERPUSER", ConfigurationParameterType.System),
            Scramble.ScrambleText(BennerContext.Administration.GetConfigurationParameter(BennerContext.Administration.BServerSystemName, "SINCKINTEGRACAOERPPASSWORD", ConfigurationParameterType.System)));

                var itensContrato = contratos.GetItensContrato(numeroContrato);

                var listaContratos = new List<string>();

                foreach (var item in itensContrato)
                {
                    var recurso = new RecursosContratoResponseModel()
                    {
                        Produto= item.Produto,
                        ValorUnitario = item.ValorUnitario.ToString()
                    };

                    retorno.Add(recurso);
                }

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = JsonConvert.SerializeObject(retorno) });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string GetEscopoPersonalizado(BuscaOportunidadeProdutoRequestModel escopoSalvo)
        {
            BindEscopo retorno = new BindEscopo();
            retorno.BindPersonalizados = new List<BindPersonalizado>();

            try
            {
                CrmPessoaOportunidades oportunidade = CrmPessoaOportunidades.Get(new Handle(escopoSalvo.Oportunidade));

                retorno.Oportunidade = oportunidade.Handle.Value.ToString();

                Criteria crit = new Criteria();

                if (escopoSalvo.HandleProduto == "")
                {
                    crit.Where = "A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.PRODUTO IS NULL";
                }
                else
                {
                    crit.Where = "A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.PRODUTO = :PRODUTO";
                    crit.Parameters.Add("PRODUTO", escopoSalvo.HandleProduto);
                }

                crit.Parameters.Add("OPORTUNIDADE", oportunidade.Handle.Value);
                crit.Parameters.Add("VERSAO", oportunidade.Versao);


                Entities<CrmPoEscopo> escopo = CrmPoEscopo.GetMany(crit);

                foreach (var item in escopo)
                {
                    var bind = new BindPersonalizado();
                    bind.ValorHora = Convert.ToDouble(item.ValorHora);
                    bind.Atividade = item.Servico.Association.Instance.Fields["NOME"].ToString();
                    bind.HandleAtividade = item.ServicoHandle.Value.ToString();
                    bind.Horas = item.Horas.ToString();
                    if(null != item.TipoRecurso.Instance)
                    {
                        bind.Recurso = item.TipoRecurso.Instance.Recurso;
                        bind.HandleRecurso = item.TipoRecursoHandle.Value.ToString();
                    }
                    else
                    {
                        bind.Contrato = item.NumeroContrato;
                        bind.RecursoContrato = item.ProdutoContrato;
                    }

                    if (escopoSalvo.HandleProduto != "")
                        bind.HandleProduto = item.ProdutoHandle.Value.ToString();
                    else
                        bind.HandleProduto = "";

                    bind.Sequencia = Convert.ToInt64(item.Sequencia);
                    bind.HandleEscopo = item.Handle.Value.ToString();
                    retorno.BindPersonalizados.Add(bind);
                }

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = JsonConvert.SerializeObject(retorno) });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string GetUrlComentario(string handleEscopo)
        {
            var link = new Benner.Tecnologia.Common.Components.FormLinkDefinition();
            link.TargetSystemInstanceName = Benner.Tecnologia.Common.BennerContext.Administration.BServerSystemName;
            link.TargetEntityDefinitionName = "K_CRM_PO_ESCOPO";
            link.TargetFormMode = Benner.Tecnologia.Common.Components.FormLinkDefinition.FormMode.Edit;
            link.WhereClause = new Benner.Tecnologia.Common.WhereClause("A.HANDLE = :HANDLE");
            link.WhereClause.AddParameter("HANDLE", handleEscopo);
            link.IsModalPage = true;
            link.Url = @"Pages/KCrmPoEscopo/ObservacaoForm.aspx";

            return string.Format(System.Globalization.CultureInfo.GetCultureInfo("pt-BR"), "{0}", Benner.Tecnologia.Wes.Components.UriBuilder.Create(link));
        }

        public string EmitirResumoOportunidade(BuscaOportunidadeProdutoRequestModel form)
        {
            bool existe = false;

            try
            {
                CrmPessoaOportunidades oportunidade = CrmPessoaOportunidades.Get(new Handle(form.Oportunidade));

                var crit = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(oportunidade.Handle.Value.ToString(), oportunidade.Versao.ToString());

                try
                {
                    Entities<CrmPoProposta> proposta = CrmPoProposta.GetMany(crit);

                    if (proposta.Count > 0)
                    {
                        existe = true;
                    }
                }
                catch (Exception)
                {

                }

                FormLinkDefinition link = new FormLinkDefinition();
                link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                link.TargetEntityDefinitionName = "K_CRM_PESSOAOPORTUNIDADES";
                link.TargetFormMode = FormLinkDefinition.FormMode.View;
                link.WhereClause = new WhereClause("A.HANDLE = :HANDLE");
                link.WhereClause.AddParameter("HANDLE", oportunidade.Handle.Value);
                link.Url = @"~/Pages/K_CRM_PESSOAOPORTUNIDADES/Resumo.aspx";

                // É necessário utilizar o UriBuilder para persistir os valores durante a transferência
                var url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link);

                CrmPoProposta novaProposta = CrmPoProposta.Create();
                novaProposta.OportunidadeHandle = oportunidade.Handle;
                novaProposta.Versao = oportunidade.Versao;
                novaProposta.UsuarioEmissaoHandle = BennerContext.Security.GetLoggedUserHandle();
                novaProposta.Tipo = CrmPoPropostaTipoListaItens.ItemMinuta;
                novaProposta.Save();

                if (!existe)
                {
                    return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = "Emissão Confirmada!", url = url.Substring(2) });
                }

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 201, message = "Essa proposta já foi emitida!", url = url.Substring(2) });

            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string AtivarOportunidade(BuscaOportunidadeProdutoRequestModel form)
        {
            var oportunidade = CrmPessoaOportunidades.GetFirstOrDefault(new Handle(form.Oportunidade));

            if (null == oportunidade)
                throw new BusinessException("Oportunidade não encontrada. Impossivel ativar este item!");

            return oportunidade.AtivarOportunidade(new BusinessArgs());
            //try
            //{
            //    var oportunidade = CrmPessoaOportunidades.Get(new Handle(form.Oportunidade), GetMode.Edit);

            //    foreach (var adicional in CrmAdicionais.GetAll())
            //    {
            //        if (adicional.Obrigatorio == false)
            //            continue;

            //        var criterioAdicional = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.ADICIONAL = :ADICIONAL");
            //        criterioAdicional.Parameters.Add("OPORTUNIDADE", oportunidade.Handle.Value);
            //        criterioAdicional.Parameters.Add("VERSAO", oportunidade.Versao.Value);
            //        criterioAdicional.Parameters.Add("ADICIONAL", adicional.Handle.Value);

            //        var busca = CrmPoAdicional.GetFirstOrDefault(criterioAdicional);

            //        if (null == busca)
            //            throw new Exception("Oportunidade não pode ser ativa pois não existe lançamento de " + adicional.Nome + ". Insira o consideração adicional obrigatória e tente novamente");
            //    }

            //    var tarefa = new CrmTarefas();

            //    if(oportunidade.PessoaInstance.PublicoPrivado == CrmPessoasPublicoPrivadoRadioItens.ItemPrivado)
            //    {
            //        tarefa = CrmTarefas.Get(new Criteria("A.NOME = 'Alterar Status da Oportunidade para Proposta'"));
            //    }
            //    else
            //    {
            //        tarefa = CrmTarefas.Get(new Criteria("A.NOME = 'Alterar Status da Oportunidade para Pregão / Leilão'"));
            //    }

            //    var critProdutos = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(oportunidade.Handle.Value.ToString(), oportunidade.Versao.ToString());

            //    Entities<CrmPessoaOportunidadesProd> produtos = CrmPessoaOportunidadesProd.GetMany(critProdutos);

            //    foreach (var produto in produtos)
            //    {
            //        var edita = CrmPessoaOportunidadesProd.Get(produto.Handle, GetMode.Edit);
            //        edita.VaiSalvarItens = false;
            //        edita.Status = CrmPessoaOportunidadesProdStatusListaItens.ItemAtivo;
            //        edita.Save();
            //    }

            //    Entities<CrmPessoaOportunidadesItens> itens = CrmPessoaOportunidadesItens.GetMany(critProdutos);

            //    foreach (var item in itens)
            //    {
            //        CrmPessoaOportunidadesItens edita = CrmPessoaOportunidadesItens.Get(item.Handle, GetMode.Edit);
            //        edita.Status = CrmPessoaOportunidadesItensStatusListaItens.ItemAtivo;
            //        edita.Save();
            //    }

            //    var CalcularOportunidade = CrmPessoaOportunidadesDao.CreateInstance().CalcularOportunidade(oportunidade); //CrmPessoaOportunidadesFuncoes.CalcularOportunidade(oportunidade.Handle.Value.ToString(), oportunidade.Versao.Value.ToString());
            //    decimal? total = 0.00m;

            //    if (oportunidade.Modalidade.Instance.Lu == true)
            //    {
            //        oportunidade.ValorLu = Convert.ToDecimal(CalcularOportunidade.ValoresOportunidade.ValorProdutos.TotalLu);
            //        total += oportunidade.ValorLu;
            //    }
            //    if (oportunidade.Modalidade.Instance.Lum == true)
            //    {
            //        oportunidade.ValorLum = Convert.ToDecimal(CalcularOportunidade.ValoresOportunidade.ValorProdutos.TotalLum);
            //        oportunidade.Recorrente = oportunidade.ValorLum;
            //        total += (oportunidade.ValorLum * 12);
            //    }
            //    if (oportunidade.Modalidade.Instance.Locacao == true)
            //    {
            //        oportunidade.ValorLocacao = Convert.ToDecimal(CalcularOportunidade.ValoresOportunidade.ValorProdutos.TotalLocacao);
            //        oportunidade.Recorrente = oportunidade.ValorLocacao;
            //        total += (oportunidade.ValorLocacao * 12);
            //    }
            //    if (oportunidade.Modalidade.Instance.Escopo == true)
            //    {
            //        oportunidade.ValorEscopo = Convert.ToDecimal(CalcularOportunidade.ValoresOportunidade.ValorEscopo.TotalServicos);
            //        total += oportunidade.ValorEscopo;
            //    }
            //    if (oportunidade.Modalidade.Instance.Saas == true)
            //    {
            //        oportunidade.ValorSaas = Convert.ToDecimal(CalcularOportunidade.ValoresOportunidade.ValorSaas.TotalSaas);
            //        total += oportunidade.ValorSaas;
            //    }

            //    oportunidade.ValorTotal = total;

            //    oportunidade.Ativo = true;

            //    oportunidade.Save();

            //    return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = "Status da oportunidade atualizado!" });

            //}
            //catch (Exception ex)
            //{
            //    throw new Exception(ex.Message, ex);
            //}
        }

        public string SalvarEscopo(BindEscopo form)
        {
            var dados = new EscopoOportunidadeResponseModel();
            CrmPessoaOportunidades op = new CrmPessoaOportunidades();
            var retorno = new DadosRetornoEscopo();
            CrmPessoaOportunidadesProd Prod = new CrmPessoaOportunidadesProd();
            try
            {
                op = CrmPessoaOportunidades.Get(new Handle(form.Oportunidade), GetMode.Edit);

                if (form.HandleProduto != "")
                    Prod = CrmPessoaOportunidadesProd.Get(new Handle(form.HandleProduto));

                dados.DadosModalidade = CrmPessoaOportunidadesDao.CreateInstance().RetornaDadosModalidade(op.ModalidadeInstance);//CrmPessoaOportunidadesFuncoes.RetornaDadosModalidade(op.Modalidade.Instance);


                if (null != op.Handle.NullableValue)
                {
                    try
                    {
                        if (!form.RdoEscopoPadrao)
                        {
                            var crit = new Criteria();

                            if (form.HandleProduto == "")
                            {
                                crit.Where = "A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.PRODUTO IS NULL";
                            }
                            else
                            {
                                crit.Where = "A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.PRODUTO = :PRODUTO";
                                crit.Parameters.Add("PRODUTO", form.HandleProduto);
                            }

                            crit.Parameters.Add("OPORTUNIDADE", op.Handle.Value.ToString());
                            crit.Parameters.Add("VERSAO", op.Versao);


                            Entities<CrmPoEscopo> escopoSalvo = CrmPoEscopo.GetMany(crit);

                            foreach (CrmPoEscopo escopo in escopoSalvo)
                            {
                                foreach (var servico in form.BindPersonalizados)
                                {
                                    if (escopo.Produto.Handle.IsValid())
                                    {
                                        if (escopo.Handle.Value.ToString() == servico.HandleEscopo && escopo.ProdutoHandle.Value == Convert.ToInt64(servico.HandleProduto))
                                        {
                                            var crit2 = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(op.Handle.Value.ToString(), op.Versao.ToString());
                                            crit2.AddWhereClause("A.PRODUTO = :PRODUTO AND A.SEQUENCIA = :SEQUENCIA");
                                            crit2.Parameters.Add("SEQUENCIA", escopo.Sequencia);
                                            crit2.Parameters.Add("PRODUTO", form.HandleProduto);

                                            try
                                            {
                                                CrmPoEscopo edita = CrmPoEscopo.Get(crit2, GetMode.Edit);
                                                edita.OportunidadeHandle = op.Handle;
                                                edita.Versao = op.Versao;
                                                edita.ValorHora = Convert.ToDecimal(servico.ValorHora);
                                                edita.Horas = Convert.ToInt64(servico.Horas);
                                                edita.ServicoHandle = new Handle(servico.Atividade);
                                                if (servico.Recurso != "")
                                                    edita.TipoRecursoHandle = new Handle(servico.Recurso);
                                                else
                                                {
                                                    escopo.NumeroContrato = servico.Contrato;
                                                    escopo.ProdutoContrato = servico.RecursoContrato;
                                                }
                                                edita.ProdutoHandle = new Handle(servico.HandleProduto);
                                                edita.Sequencia = servico.Sequencia;
                                                edita.Save();

                                                servico.Editou = true;
                                            }
                                            catch { }
                                        }
                                    }
                                    else
                                    {
                                        if (escopo.Handle.Value.ToString() == servico.HandleEscopo && escopo.Produto.Handle.IsInvalid() && servico.HandleProduto == "")
                                        {
                                            var crit2 = CrmPessoaOportunidadesFuncoes.RetornaCriterioOportunidadePorVersao(op.Handle.Value.ToString(), op.Versao.ToString());
                                            crit2.AddWhereClause("A.PRODUTO IS NULL AND A.SEQUENCIA = :SEQUENCIA");
                                            crit2.Parameters.Add("SEQUENCIA", escopo.Sequencia);

                                            try
                                            {
                                                CrmPoEscopo edita = CrmPoEscopo.Get(crit2, GetMode.Edit);
                                                edita.OportunidadeHandle = op.Handle;
                                                edita.Versao = op.Versao;
                                                edita.ValorHora = Convert.ToDecimal(servico.ValorHora);
                                                edita.Horas = Convert.ToInt64(servico.Horas);
                                                edita.ServicoHandle = new Handle(servico.Atividade);
                                                if (servico.Recurso != "")
                                                    edita.TipoRecursoHandle = new Handle(servico.Recurso);
                                                else
                                                {
                                                    escopo.NumeroContrato = servico.Contrato;
                                                    escopo.ProdutoContrato = servico.RecursoContrato;
                                                }

                                                edita.Sequencia = servico.Sequencia;
                                                edita.Save();

                                                servico.Editou = true;
                                            }
                                            catch { }
                                        }
                                    }
                                }
                            }

                            foreach (var servico in form.BindPersonalizados)
                            {
                                if (!servico.Editou)
                                {
                                    CrmPoEscopo escopo = CrmPoEscopo.Create();
                                    escopo.OportunidadeHandle = op.Handle;
                                    escopo.Versao = op.Versao;
                                    escopo.ValorHora = Convert.ToDecimal(servico.ValorHora);
                                    escopo.Horas = Convert.ToInt64(servico.Horas);
                                    escopo.ServicoHandle = new Handle(servico.Atividade);
                                    if(servico.Recurso != "")
                                        escopo.TipoRecursoHandle = new Handle(servico.Recurso);
                                    else
                                    {
                                        escopo.NumeroContrato = servico.Contrato;
                                        escopo.ProdutoContrato = servico.RecursoContrato;
                                    }

                                    if (servico.HandleProduto != "")
                                        escopo.ProdutoHandle = new Handle(servico.HandleProduto);

                                    escopo.Sequencia = servico.Sequencia;
                                    escopo.Save();
                                }
                            }
                        }

                        dados = CrmPessoaOportunidadesDao.CreateInstance().RetornaDadosEscopoPadrao(dados, op, Prod, Prod.Handle.IsValid()); //CrmPessoaOportunidadesFuncoes.RetornaDadosEscopoPadrao(dados, op, Prod, Prod.Handle.IsValid());

                        op.Save();

                        retorno.Horas = Convert.ToDouble(dados.TotalHorasEscopo);
                        retorno.Valor = Convert.ToDouble(dados.TotalValorEscopo);

                        retorno.ValorHoraGerencia = Convert.ToDouble(dados.ValorHoraGerencia);
                    }
                    catch (Exception ex)
                    {
                        throw new ArgumentException("Erro ao atualizar escopo da oportunidade");
                    }
                }

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = retorno });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string DeleteItemEscopo(DeleteItemEscopo form)
        {
            try
            {
                Criteria crit = new Criteria();

                if (form.HandleProduto == "")
                {
                    crit.Where = "A.SEQUENCIA = :SEQUENCIA AND A.PRODUTO IS NULL";
                }
                else
                {
                    crit.Where = "A.SEQUENCIA = :SEQUENCIA AND A.PRODUTO = :PRODUTO";
                    crit.Parameters.Add("PRODUTO", form.HandleProduto);
                }

                crit.Parameters.Add("SEQUENCIA", form.Sequencia);

                CrmPoEscopo.DeleteMany(crit);

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200 });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }

        public string SalvarCondicoesPagamento(CondicoesPagamentoOp form)
        {
            CrmPessoaOportunidades op = new CrmPessoaOportunidades();

            try
            {
                op = CrmPessoaOportunidades.Get(new Handle(form.CodigoOportunidade), GetMode.Edit);

                if (null != op.Handle.NullableValue)
                {
                    op.CondPagLu = form.CondPagLu;
                    op.CondPagLum = form.CondPagLum;
                    op.CondPagLoc = form.CondPagLoc;
                    op.CondPagServ = form.CondPagServ;
                    op.CondPagSaas = form.CondPagSaas;
                    op.CondPagBpo = form.CondPagBpo;
                    op.ConsideracoesAdicionais = form.Observacao;
                    op.Save();

                    return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = "Dados atualizados com sucesso!" });
                }

                return JsonConvert.SerializeObject(new { status = "Erro", code = 404, message = "Oportunidade não foi encontrada." });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }
    }
}