using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common;
using Models.Crm;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using Benner.ERP.Comum;
using SM.Crm.Definicoes;
using SM.Crm.Definicoes.Comum.Oportunidades;
using Controllers.Models.Crm;

namespace Controllers.Crm
{
    /// <summary>
    /// Classe responsável por realizar os cálculos da oportunidade
    /// </summary>
    public static class CrmPessoaOportunidadesFuncoes
    {
        //public static TilesValorModalidadeResponseModel CalcularOportunidade(string handleOportunidade, string versao)
        //{

        //    var crit = RetornaCriterioOportunidadePorVersao(handleOportunidade, versao);

        //    var retorno = new TilesValorModalidadeResponseModel();

        //    try
        //    {
        //        CrmPessoaOportunidades Oportunidade = CrmPessoaOportunidades.Get(new Handle(handleOportunidade));
        //        List<CrmPessoaOportunidadesProd> produtos = CrmPessoaOportunidadesProd.GetMany(crit);
        //        List<CrmPessoaOportunidadesItens> itens = CrmPessoaOportunidadesItens.GetMany(crit);

        //        #region Atribuindo Categoria, Modalidade, Mensagens de aviso e Desconto

        //        retorno.ValoresOportunidade.ValorProdutos = RetornaValorDosProdutosCalculado(Oportunidade);
        //        retorno.ValoresOportunidade.ValorSaas = RetornaValorDoSaasCalculado(Oportunidade);
        //        retorno.ValoresOportunidade.ValorEscopo = RetornaValorDoServicosCalculado(Oportunidade, produtos, itens);
        //        retorno.DadosModalidade = RetornaDadosModalidade(Oportunidade.Modalidade.Instance);
        //        retorno.MensagemRecursosFilial = VerificaCadastroRecursosFilial(Oportunidade, produtos, itens);
        //        retorno = AplicaDesconto(retorno, Oportunidade);

        //        retorno.PerfilBennerVertical = Oportunidade.PerfilBenner.Instance == null ? "" : Oportunidade.PerfilBenner.Instance.Fields["NOME"].ToString();
        //        #endregion
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new ArgumentException(ex.Message, ex);
        //    }

        //    return retorno;
        //}

        //public static EscopoOportunidadeResponseModel RetornaDadosEscopoPadrao(EscopoOportunidadeResponseModel retorno, CrmPessoaOportunidades op, CrmPessoaOportunidadesProd Prod, bool FiltroProduto)
        //{
        //    Query query = new Query();

        //    query.Append("SELECT I.NOME ITEM, S.NOME ESCOPO, R.RECURSO, E.HORAS, F.NOME FILIAL, RF.VALORHORA, ");
        //    query.Append("CAST((E.HORAS * RF.VALORHORA) AS MONEY) TOTALSERVICO ");
        //    query.Append("FROM K_CRM_PRODUTOITENSESCOPO E ");
        //    query.Append("JOIN K_CRM_SERVICOS S ON S.HANDLE = E.SERVICO ");
        //    query.Append("JOIN K_CRM_TABELASPRECOITENS TI ON TI.HANDLE = E.MERCADORIA ");
        //    query.Append("JOIN K_CRM_PRODUTOITENS I ON I.HANDLE = TI.ITEM ");
        //    query.Append("JOIN K_CRM_TIPOSRECURSOS R ON R.HANDLE = E.TIPORECURSO ");
        //    query.Append("JOIN K_CRM_TIPOSRECURSOSFILIAIS RF ON RF.TIPORECURSO = R.HANDLE ");
        //    query.Append("JOIN FILIAIS F ON F.HANDLE = RF.FILIAL ");
        //    query.Append("WHERE E.MERCADORIA IN ");
        //    query.Append("(SELECT HANDLE FROM K_CRM_TABELASPRECOITENS WHERE HANDLE IN ");
        //    query.Append("(SELECT MERCADORIA FROM K_CRM_PESSOAOPORTUNIDADESITENS WHERE OPORTUNIDADE=" + op.Codigo.ToString() + " AND VERSAO=" + op.Versao.ToString() + " ");
        //    if (Prod.Handle.IsValid())
        //        query.Append("AND PRODUTO = " + Prod.Handle.Value + ")) ");
        //    else
        //        query.Append(")) ");
        //    query.Append("AND F.HANDLE = " + op.Filial.Handle.Value.ToString() + " ");
        //    query.Append("AND RF.VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE())");

        //    Entities<EntityBase> resultList = query.Execute();

        //    decimal escopoPadrao = 0.00m;
        //    int horas = 0;

        //    foreach (EntityBase entidade in resultList)
        //    {
        //        EscopoPadraoModel servico = new EscopoPadraoModel()
        //        {
        //            Item = entidade.Fields["ITEM"].ToString(),
        //            Escopo = entidade.Fields["ESCOPO"].ToString(),
        //            Recurso = entidade.Fields["RECURSO"].ToString(),
        //            Horas = entidade.Fields["HORAS"].ToString(),
        //            Filial = entidade.Fields["FILIAL"].ToString(),
        //            ValorHora = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(entidade.Fields["VALORHORA"].ToString())),
        //            TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal(entidade.Fields["TOTALSERVICO"].ToString()))
        //        };

        //        escopoPadrao += Convert.ToDecimal(entidade.Fields["TOTALSERVICO"].ToString());
        //        horas += Convert.ToInt32(entidade.Fields["HORAS"].ToString());

        //        retorno.EscopoPadrao.Add(servico);
        //    }

        //    Criteria crit = new Criteria("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
        //    crit.Parameters.Add("PESSOA", op.PessoaHandle.Value);
        //    crit.Parameters.Add("VERTICAL", op.VerticalHandle.Value);
        //    crit.CompanyFilterMode = CompanyFilterMode.OnlyCompany;

        //    CrmPessoaVertical Vertical = CrmPessoaVertical.Get(crit);

        //    retorno.TotalValorEscopo = escopoPadrao.ToString();
        //    retorno.HandleOportunidade = op.Codigo.ToString();
        //    retorno.TotalHorasEscopo = horas.ToString();
        //    retorno.SubfaseVertical = Vertical.SubfaseInstance.Nome;
        //    retorno.EhEscopoPadrao = retorno.TipoDeEscopo == TiposDeEscopo.Oportunidade ? false : Prod.EscopoPadrao.ToBoolean();
        //    retorno.AdicionalNaGerenciaProjeto = Prod.Handle.IsValid() == true ? Prod.AdicionalNaGerenciaProjeto.Value : op.AdicionalNaGerenciaProjeto.Value;
        //    retorno.PorcentagemAdicionalProjeto = retorno.AdicionalNaGerenciaProjeto == true ? retorno.TipoDeEscopo == TiposDeEscopo.Oportunidade ? op.GerenciamentoProjeto : Prod.Gerenciamentoprojeto : 0;

        //    //Se for escopo personalizado
        //    if (!retorno.EhEscopoPadrao)
        //    {
        //        Query query2 = new Query();

        //        query2.Append("SELECT SUM((HORAS * VALORHORA)) VALOR, SUM(HORAS) HORAS FROM K_CRM_PO_ESCOPO WHERE ");
        //        query2.Append("OPORTUNIDADE = " + op.Handle.Value.ToString() + " AND VERSAO = " + op.Versao.ToString());

        //        if (Prod.Handle.IsValid() && FiltroProduto)
        //            query2.Append(" AND PRODUTO = " + Prod.Handle.Value.ToString());
        //        else if (FiltroProduto)
        //            query2.Append(" AND PRODUTO IS NULL");

        //        Entities<EntityBase> resultado = query2.Execute();
        //        retorno.TotalValorEscopo = resultado[0].Fields["VALOR"] == null ? "0" : resultado[0].Fields["VALOR"].ToString();
        //        retorno.TotalHorasEscopo = resultado[0].Fields["HORAS"] == null ? "0" : resultado[0].Fields["HORAS"].ToString();
        //    }

        //    retorno.HandlePessoa = op.PessoaInstance.Codigo.ToString();
        //    retorno.HandleVertical = op.Vertical.Handle.Value.ToString();

        //    Criteria crit2 = new Criteria("A.FILIAL = :FILIAL AND A.TIPORECURSO IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOS WHERE GERENCIAPROJETO = 'S' AND VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE()))");
        //    crit2.Parameters.Add("FILIAL", op.Filial.Handle.Value);
        //    crit2.CompanyFilterMode = CompanyFilterMode.None;
        //    CrmTiposRecursosFiliais recurso = CrmTiposRecursosFiliais.GetFirstOrDefault(crit2);

        //    if (null != recurso)
        //        retorno.ValorHoraGerencia = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", recurso.ValorHora);
        //    else
        //        retorno.ValorHoraGerencia = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);

        //    var critVertical = new Criteria("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
        //    critVertical.Parameters.Add("PESSOA", op.Pessoa.Handle);
        //    critVertical.Parameters.Add("VERTICAL", op.Vertical.Handle);
        //    critVertical.CompanyFilterMode = CompanyFilterMode.None;

        //    var vertical = CrmPessoaVertical.Get(critVertical);

        //    FormLinkDefinition link = new FormLinkDefinition();
        //    link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
        //    link.TargetEntityDefinitionName = "K_CRM_TIPOSRECURSOSPESSOA";
        //    link.TargetFormMode = FormLinkDefinition.FormMode.View;

        //    if (vertical.Subfase.Instance.Nome == "Cliente" && vertical.Filial.Instance.Fields["K_EHREVENDA"].ToBoolean() == false)
        //    {
        //        retorno.ValorRecursoPorContrato = true;
        //        link.WhereClause = new WhereClause("A.HANDLE = :HANDLE");
        //        link.WhereClause.AddParameter("HANDLE", vertical.Handle.Value);
        //        link.IsModalPage = true;
        //        link.Url = @"~/Pages/KCrmTiposrecursospessoa/BennerGrid.aspx";
        //    }
        //    else
        //    {
        //        retorno.ValorRecursoPorContrato = false;
        //        link.WhereClause = new WhereClause("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
        //        link.WhereClause.AddParameter("PESSOA", op.PessoaHandle.Value);
        //        link.WhereClause.AddParameter("VERTICAL", op.VerticalHandle.Value);
        //        link.IsModalPage = true;
        //        link.Url = @"~/Pages/KCrmTiposrecursospessoa/Grid.aspx";
        //    }


        //    // É necessário utilizar o UriBuilder para persistir os valores durante a transferência
        //    var url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link);

        //    retorno.UrlTipoDeRecuso = url.Substring(2);

        //    retorno.EscopoPadrao = retorno.EscopoPadrao.OrderBy(x => x.Item).ToList();

        //    return retorno;
        //}

        //public static ModalidadeModel RetornaDadosModalidade(CrmModalidades origem)
        //{
        //    ModalidadeModel dados;

        //    if (null != origem)
        //    {
        //        dados = new ModalidadeModel()
        //        {
        //            MostraLu = Convert.ToBoolean(origem.Lu),
        //            MostraLum = Convert.ToBoolean(origem.Lum),
        //            MostraLocacao = Convert.ToBoolean(origem.Locacao),
        //            MostraSaas = Convert.ToBoolean(origem.Saas),
        //            MostraServico = Convert.ToBoolean(origem.Escopo),
        //            MostraBpo = Convert.ToBoolean(origem.Bpo)
        //        };
        //    }
        //    else
        //    {
        //        dados = new ModalidadeModel()
        //        {
        //            MostraLu = false,
        //            MostraLum = false,
        //            MostraLocacao = false,
        //            MostraSaas = false,
        //            MostraServico = false,
        //            MostraBpo = false
        //        };
        //    }

        //    return dados;
        //}

        public static Criteria RetornaCriterioOportunidadePorVersao(string handleOportunidade, string versaoOportunidade)
        {
            var criteria = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO");
            criteria.Parameters.Add("OPORTUNIDADE", handleOportunidade);
            criteria.Parameters.Add("VERSAO", versaoOportunidade);

            return criteria;
        }

        //public static ProdutosCalculadosModel RetornaValorDosProdutosCalculado(CrmPessoaOportunidades op)
        //{
        //    var retorno = new ProdutosCalculadosModel();

        //    Entities<EntityBase> results = op.CalculaValorOpoprtunidade(); //CalculaValorOpoprtunidade(op.Handle.Value.ToString(), op.Versao.Value.ToString());

        //    retorno.TotalLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", results.Sum(x => Convert.ToDouble(x.Fields["LU"].ToString()) /** (1 + (Convert.ToDouble(x.Fields["MARGEMNEGOCIACAO"].ToString())/100))*/));
        //    retorno.TotalLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", results.Sum(x => Convert.ToDouble(x.Fields["LUM"].ToString()) /** (1 + (Convert.ToDouble(x.Fields["MARGEMNEGOCIACAO"].ToString()) / 100))*/));
        //    retorno.TotalLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", results.Sum(x => Convert.ToDouble(x.Fields["LOCACAO"].ToString()) /** (1 + (Convert.ToDouble(x.Fields["MARGEMNEGOCIACAO"].ToString()) / 100))*/));

        //    return retorno;
        //}

        //public static SaasCalculadoModel RetornaValorDoSaasCalculado(CrmPessoaOportunidades op)
        //{
        //    var retorno = new SaasCalculadoModel();

        //    try
        //    {
        //        var saas = CrmPoSaas.GetMany(RetornaCriterioOportunidadePorVersao(op.Handle.Value.ToString(), op.Versao.ToString()));

        //        var totalRecorrente = op.Modalidade.Instance.Locacao == true ? RetornaValorDosProdutosCalculado(op).TotalLocacao : RetornaValorDosProdutosCalculado(op).TotalLum;

        //        retorno.TotalDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", saas.Sum(x => x.Valor));
        //        retorno.TotalSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (saas.Sum(x => x.Valor) + Convert.ToDecimal(totalRecorrente)));
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new ArgumentException(ex.Message, ex);
        //    }

        //    return retorno;
        //}

        //public static ServicosCalculadoModel RetornaValorDoServicosCalculado(CrmPessoaOportunidades op, List<CrmPessoaOportunidadesProd> produtos, List<CrmPessoaOportunidadesItens> itens)
        //{
        //    var retorno = new ServicosCalculadoModel();

        //    decimal? escopoPadrao = 0.00m;
        //    decimal vlAtual = 0.00m;
        //    decimal? totalHoras = 0.00m;
        //    List<decimal> soma = new List<decimal>();

        //    Criteria crit2 = new Criteria("A.FILIAL = :FILIAL AND A.TIPORECURSO IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOS WHERE GERENCIAPROJETO = 'S' AND VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE()))");
        //    crit2.Parameters.Add("FILIAL", op.Filial.Handle.Value);
        //    crit2.CompanyFilterMode = CompanyFilterMode.None;
        //    CrmTiposRecursosFiliais recurso = CrmTiposRecursosFiliais.GetFirstOrDefault(crit2);

        //    if (produtos.Count == 0)
        //    {
        //        Query query = new Query();

        //        query.Append("SELECT SUM((HORAS * VALORHORA)) VALOR, SUM(HORAS) HORAS FROM K_CRM_PO_ESCOPO WHERE ");
        //        query.Append("OPORTUNIDADE = " + op.Handle.Value.ToString() + " AND VERSAO = " + op.Versao.ToString());

        //        Entities<EntityBase> resultado = query.Execute();

        //        if (resultado.Count == 0)
        //            retorno.TotalServicos = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);
        //        else
        //            retorno.TotalServicos = null != resultado[0].Fields["VALOR"] ? resultado[0].Fields["VALOR"].ToString() : string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);

        //        if (op.AdicionalNaGerenciaProjeto == true && op.GerenciamentoProjeto > 0 && null != resultado[0].Fields["HORAS"] && null != recurso)
        //        {
        //            retorno.TotalServicos = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(retorno.TotalServicos) + ((Convert.ToDecimal(resultado[0].Fields["HORAS"].ToString()) * (op.GerenciamentoProjeto / 100)) * recurso.ValorHora));
        //        }
        //    }
        //    else
        //    {
        //        foreach (var Prod in produtos)
        //        {
        //            if (Prod.EscopoPadrao == false)
        //            {
        //                Query query = new Query();

        //                query.Append("SELECT SUM((HORAS * VALORHORA)) VALOR, SUM(HORAS) HORAS FROM K_CRM_PO_ESCOPO WHERE ");
        //                query.Append("OPORTUNIDADE = " + op.Handle.Value.ToString() + " AND VERSAO = " + op.Versao.ToString() + " AND PRODUTO = " + Prod.Handle.Value.ToString());

        //                Entities<EntityBase> resultado = query.Execute();

        //                if (resultado.Count > 0)
        //                {
        //                    if (null != resultado[0].Fields["VALOR"])
        //                    {
        //                        totalHoras = Convert.ToDecimal(resultado[0].Fields["HORAS"].ToString());
        //                        vlAtual = Convert.ToDecimal(resultado[0].Fields["VALOR"].ToString());
        //                    }
        //                    else
        //                    {
        //                        totalHoras = 0;
        //                        vlAtual = 0;
        //                    }
        //                }

        //                if (Prod.AdicionalNaGerenciaProjeto == true && null != recurso)
        //                {
        //                    vlAtual = Convert.ToDecimal(Convert.ToDecimal(vlAtual) + (Convert.ToDecimal((Prod.Gerenciamentoprojeto / 100) * totalHoras) * recurso.ValorHora));
        //                }

        //                soma.Add(vlAtual);
        //            }
        //            else if (Prod.EscopoPadrao == true)
        //            {
        //                var padrao = RetornaDadosEscopoPadrao(new EscopoOportunidadeResponseModel(), Prod.Oportunidade.Instance, Prod, Prod.Handle.IsValid());

        //                decimal total = padrao.EscopoPadrao.Sum(r =>
        //                {
        //                    string valorString = r.TotalServico.Replace("R$ ", "").Replace(".", "").Replace(",", ".");
        //                    return decimal.Parse(valorString, CultureInfo.InvariantCulture);
        //                });

        //                if (Prod.AdicionalNaGerenciaProjeto == true)
        //                {
        //                    decimal? valorHoraGerencia = ((padrao.EscopoPadrao.Sum(x => Convert.ToInt64(x.Horas)) * Prod.Gerenciamentoprojeto) / 100);
        //                    decimal? valorTotalGerencia = decimal.Parse(padrao.ValorHoraGerencia.Replace("R$ ", "").Replace(".", "").Replace(",", "."), CultureInfo.InvariantCulture);

        //                    total += Convert.ToDecimal(valorHoraGerencia * valorTotalGerencia);

        //                    soma.Add(total);
        //                }
        //            }
        //        }

        //        //Se soma maior que zero significa que é escopo personalizado e que possui PRODUTOS vinculado à oportunidade
        //        if (soma.Count > 0)
        //        {
        //            retorno.TotalServicos = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(soma.Sum()));
        //        }
        //    }

        //    return retorno;
        //}

        //public static TilesValorModalidadeResponseModel AplicaDesconto(TilesValorModalidadeResponseModel response, CrmPessoaOportunidades op)
        //{
        //    var crit = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.NIVELAPROVACAO >= 1 AND A.NIVELAPROVACAO <= 5 AND A.DATAAPROVACAO >= (SELECT MAX(DATAAPROVACAO) FROM K_CRM_PO_DESCONTOS AS D2 WHERE A.OPORTUNIDADE = D2.OPORTUNIDADE AND A.VERSAO = D2.VERSAO AND D2.NIVELAPROVACAO = 1)");
        //    crit.Parameters.Add("OPORTUNIDADE", op.Handle);
        //    crit.Parameters.Add("VERSAO", op.Versao);
        //    crit.CompanyFilterMode = CompanyFilterMode.None;

        //    Entities<CrmPoDescontos> descontos = CrmPoDescontos.GetMany(crit);

        //    if (descontos.Count == 0)
        //    {
        //        response.MensagemDesconto = "";
        //        response.OportunidadeBloqueada = false;
        //    }
        //    else if (descontos.Count > 0)
        //    {
        //        CrmPoDescontosNivelAprovacaoListaItens maiorNivel = descontos.Max(x => x.NivelAprovacao.Index);
        //        CrmPoDescontos ultimaSolicitacao = descontos.Find(x => x.NivelAprovacao == maiorNivel);

        //        if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemAprovada)
        //        {
        //            response.MensagemDesconto = "Desconto aprovado para essa oportunidade!";
        //            response.OportunidadeBloqueada = false;

        //            response.ValoresOportunidade.ValorProdutos.TotalLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(response.ValoresOportunidade.ValorProdutos.TotalLu) * ((100 - ultimaSolicitacao.Lu) / 100));
        //            response.ValoresOportunidade.ValorProdutos.TotalLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(response.ValoresOportunidade.ValorProdutos.TotalLum) * ((100 - ultimaSolicitacao.Lum) / 100));
        //            response.ValoresOportunidade.ValorProdutos.TotalLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(response.ValoresOportunidade.ValorProdutos.TotalLocacao) * ((100 - ultimaSolicitacao.Locacao) / 100));

        //            response.ValoresOportunidade.ValorEscopo.TotalServicos = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(response.ValoresOportunidade.ValorEscopo.TotalServicos) * ((100 - ultimaSolicitacao.Servico) / 100));

        //            response.ValoresOportunidade.ValorSaas.TotalDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(response.ValoresOportunidade.ValorSaas.TotalDataCenter) * ((100 - ultimaSolicitacao.Saas) / 100));
        //            response.ValoresOportunidade.ValorSaas.TotalSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(response.ValoresOportunidade.ValorSaas.TotalDataCenter) + Convert.ToDecimal(response.ValoresOportunidade.ValorProdutos.TotalLocacao));
        //        }
        //        else if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemEmAnalise)
        //        {
        //            response.MensagemDesconto = "Solicitação de desconto em análise!";
        //            response.OportunidadeBloqueada = true;
        //        }
        //        else if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemRecusada)
        //        {
        //            response.MensagemDesconto = "Solicitação de desconto recusada!";
        //            response.OportunidadeBloqueada = true;
        //        }
        //        else if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemCancelada)
        //        {
        //            response.MensagemDesconto = "";
        //            response.OportunidadeBloqueada = false;
        //        }
        //        else
        //        {
        //            response.MensagemDesconto = "Erro!";
        //            response.OportunidadeBloqueada = true;
        //        }
        //    }

        //    return response;
        //}

        //public static string VerificaCadastroRecursosFilial(CrmPessoaOportunidades op, List<CrmPessoaOportunidadesProd> produtos, List<CrmPessoaOportunidadesItens> itens)
        //{
        //    string mensagem = "Pendente cadastro de recurso(s) na sua filial. ";

        //    var crit = new Criteria("A.FILIAL = :FILIAL AND A.TIPORECURSO IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOS WHERE GERENCIAPROJETO = 'S' AND VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE()))");
        //    crit.Parameters.Add("FILIAL", op.Filial.Handle.Value);
        //    crit.CompanyFilterMode = CompanyFilterMode.None;
        //    var recurso = CrmTiposRecursosFiliais.GetFirstOrDefault(crit);

        //    if (recurso == null)
        //        mensagem += string.Concat(" Recurso Gerência de Projeto não encontrado na filial => " + op.Filial.Instance.Nome + ".");

        //    if (produtos.Count > 0)
        //    {
        //        foreach (var prod in produtos)
        //        {
        //            if (prod.EscopoPadrao == true)
        //            {
        //                var itensDesseProduto = itens.Where(x => x.Produto.Handle == prod.Handle).ToList();

        //                foreach (var item in itensDesseProduto)
        //                {
        //                    var crit2 = new Criteria("A.MERCADORIA = :ITEM");
        //                    crit2.Parameters.Add("ITEM", item.Mercadoria.Handle.Value);

        //                    var escopoItem = CrmProdutoItensEscopo.GetMany(CrmProdutoItensEscopo.GetEntityDefinition(), crit2);

        //                    foreach (var servico in escopoItem)
        //                    {
        //                        Query query = new Query("SELECT VALORHORA FROM K_CRM_TIPOSRECURSOSFILIAIS WHERE TIPORECURSO = " + servico.TipoRecurso.Handle.Value + " AND  FILIAL = " + op.Filial.Handle.Value + " AND VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE())");

        //                        Entities<EntityBase> resultList = query.Execute();

        //                        if (resultList.Count == 0)
        //                            mensagem += string.Concat(" Recurso => " + servico.TipoRecursoInstance.Recurso + ".");
        //                    }
        //                }
        //            }
        //            //else
        //            //{
        //            //    var crit2 = new Criteria("A.PRODUTO = :PRODUTO AND A.VERSAO = :VERSAO");
        //            //    crit2.Parameters.Add("PRODUTO", prod.Handle.Value);
        //            //    crit2.Parameters.Add("VERSAO", prod.Versao.Value);
        //            //    var escopoCustomizado = CrmPoEscopo.GetMany(crit2);
        //            //}
        //        }
        //    }
        //    //else
        //    //{

        //    //}

        //    if (mensagem == "Pendente cadastro de recurso(s) na sua filial. ")
        //        mensagem = "";

        //    return mensagem;
        //}

        public static DadosConclusao PreencheDadosConclusao(CrmPessoaOportunidades op)
        {
            #region Incializacoes
            DadosConclusao dados = new DadosConclusao();
            dados.Servicos = new List<DadosSinteticosServicos>();
            dados.DescricaoServicos = new List<DadosServicosOp>();
            dados.Desconto = new DadosDesconto();
            dados.GerenciamentoProjeto = "";

            var crit = RetornaCriterioOportunidadePorVersao(op.Handle.Value.ToString(), op.Versao.ToString());
            Entities<CrmPessoaOportunidadesProd> Produtos = CrmPessoaOportunidadesProd.GetMany(crit);
            Entities<CrmPessoaOportunidadesItens> itens = CrmPessoaOportunidadesItens.GetMany(crit);

            dados.PerfilBennerVertical = op.PerfilBenner.Instance != null ? op.PerfilBenner.Instance.Fields["NOME"].ToString() : "";
            #endregion

            #region Lu, Lum, Locação
            dados.Produtos = GetDadosAnaliticosProdutos(op, dados);
            dados.CodigoOportunidade = Convert.ToInt64(op.Codigo);
            dados.Versao = Convert.ToInt64(op.Versao);
            dados.Modalidade = CrmPessoaOportunidadesDao.CreateInstance().RetornaDadosModalidade(op.Modalidade.Instance);
            dados.NomeEmpresa = op.PessoaInstance.Nome;
            if(null != op.Modalidade.Instance)
                dados.NomeModalidade = op.Modalidade.Instance.NomenclaturaCliente;
            #endregion

            #region Saas

            try
            {
                var verificarItens = itens.FindAll(x => x.Mercadoria.Instance != null && x.Mercadoria.Instance.Item.Instance != null && x.Mercadoria.Instance.Item.Instance.Tipo.Instance != null && x.Mercadoria.Instance.Item.Instance.Tipo.Instance.Nome == "Hospedagem");

                int totalItens = verificarItens.Count;
                int contador = 0;
                foreach (var item in verificarItens)
                {
                    if (item.Mercadoria.Instance.InclusoNoPacoteInicial == true)
                        contador++;
                }

                var saas = CrmPoSaas.GetMany(crit);

                if (saas != null && saas.Count > 0)
                {
                    dados.DescricaoSaas = "";
                    foreach (var dc in saas)
                    {
                        dados.DescricaoSaas += "<b>Data Center (" + dc.Produto.Instance.Produto.Instance.Nome + ")</b><br>";
                        dados.DescricaoSaas += dc.Descricao + "<br><br>";

                        var critTabelaSaas = new Criteria("A.TABELAPRECO IN (:TABELA) AND A.ITEM IN (SELECT HANDLE FROM K_CRM_PRODUTOITENS WHERE PRODUTO IN (:PRODUTO) AND TIPO IN (SELECT HANDLE FROM  K_CRM_PRODUTOITENSTIPO WHERE NOME = 'Hospedagem'))");
                        critTabelaSaas.Parameters.Add("TABELA", dc.Produto.Instance.TabelaPreco.Handle);
                        critTabelaSaas.Parameters.Add("PRODUTO", dc.Produto.Instance.Produto.Handle);
                        critTabelaSaas.CompanyFilterMode = CompanyFilterMode.None;
                        var item = CrmTabelasPrecoItens.GetFirstOrDefault(critTabelaSaas);

                        if (null != item && item.ExigeCotacao == true)
                        {
                            DadosAnaliticosProdutos datacenter = new DadosAnaliticosProdutos()
                            {
                                TituloAtivo = true,
                                TituloNome = item.Item.Instance.Produto.Instance.Nome,
                                Item = "Data Center (" + item.Item.Instance.Produto.Instance.Nome + ")",
                                Tipo = item.Item.Instance.Tipo.Instance.Nome,
                                Venda = item.Item.Instance.Venda.Instance.Nome,
                                DescricaoItem = item.Item.Instance.Descricao,
                                Usuarios = 1,
                                Empresas = dc.Produto.Instance.Empresaadicional.ToLong() + 1,
                                Unitario = 1,
                                //Lu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(item.Lu)),
                                //Lum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(item.Lum)),
                                Locacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dc.Valor)),
                                Grid = false
                            };
                            dados.Produtos.Add(datacenter);
                        }
                    }

                    if (contador == 0 && (dados.ValorDataCenter == "0,00" || dados.ValorDataCenter == string.Empty))
                    {
                        if (saas.Count > 0)
                        {
                            dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", saas.Sum(x => x.Valor));
                        }

                    }

                    if (contador == totalItens)
                    {
                        double calculado = 0.00;
                        string nomeProduto = "";

                        foreach (var item in itens)
                        {
                            if (nomeProduto == item.Produto.Instance.Produto.Instance.Nome)
                                continue;
                            else
                                nomeProduto = item.Produto.Instance.Produto.Instance.Nome;

                            var criterioSaas = new Criteria("A.PRODUTO IN (SELECT DISTINCT(PRODUTO) FROM K_CRM_PESSOAOPORTUNIDADESITENS WHERE OPORTUNIDADE =:OPORTUNIDADE AND VERSAO = :VERSAO AND MERCADORIA IN (SELECT HANDLE FROM K_CRM_TABELASPRECOITENS WHERE TABELAPRECO = :TABELAPRECO ))");
                            criterioSaas.Parameters.Add("OPORTUNIDADE", op.Handle);
                            criterioSaas.Parameters.Add("VERSAO", op.Versao);
                            criterioSaas.Parameters.Add("TABELAPRECO", item.Produto.Instance.TabelaPreco.Handle);
                            var ssaas = CrmPoSaas.GetFirstOrDefault(criterioSaas);

                            if (null != saas)
                            {
                                calculado += Convert.ToDouble(ssaas.Valor);
                            }
                        }

                        if (calculado > 0)
                        {
                            dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", calculado);
                        }

                        if (null == op.Modalidade.Instance)
                            dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);
                        else if(op.Modalidade.Instance.Lum == true)
                        {
                            dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (Convert.ToDouble(dados.ValorDataCenter) + Convert.ToDouble(dados.TotalLum)));
                        }
                        else if (op.Modalidade.Instance.Locacao == true)
                        {
                            dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (Convert.ToDouble(dados.ValorDataCenter) + Convert.ToDouble(dados.TotalLocacao)));
                        }
                    }
                    else
                    {
                        if (saas.Count > 0)
                        {
                            dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", saas.Sum(x => x.Valor));

                            if (null == op.Modalidade.Instance)
                                dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);
                            else if(op.Modalidade.Instance.Lum == true)
                            {
                                dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (Convert.ToDouble(dados.ValorDataCenter) + Convert.ToDouble(dados.TotalLum)));
                            }
                            else if (op.Modalidade.Instance.Locacao == true)
                            {
                                dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (Convert.ToDouble(dados.ValorDataCenter) + Convert.ToDouble(dados.TotalLocacao)));
                            }
                        }
                    }
                }
                else
                {
                    dados.DescricaoSaas = "Data Center está descrito conforme a tabela de preço do produto.";

                    if (contador == totalItens)
                    {
                        if (null == op.Modalidade.Instance)
                            dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);
                        else if (op.Modalidade.Instance.Lum == true)
                        {
                            dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (Convert.ToDouble(dados.ValorDataCenter) + Convert.ToDouble(dados.TotalLum)));
                        }
                        else if (op.Modalidade.Instance.Locacao == true)
                        {
                            dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (Convert.ToDouble(dados.ValorDataCenter) + Convert.ToDouble(dados.TotalLocacao)));
                        }
                    }
                }
            }
            catch (Exception)
            {
                dados.DescricaoSaas = "";
                dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);
                dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);
            }
            #endregion

            #region Serviços

            List<decimal> soma = new List<decimal>();
            List<decimal> original = new List<decimal>();
            dados.AdicionalNaGerenciaProjeto = false;

            Criteria crit2 = new Criteria("A.FILIAL = :FILIAL AND A.TIPORECURSO IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOS WHERE GERENCIAPROJETO = 'S' AND VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE()))");
            crit2.Parameters.Add("FILIAL", op.Filial.Handle.Value);
            crit2.CompanyFilterMode = CompanyFilterMode.None;
            CrmTiposRecursosFiliais recurso = CrmTiposRecursosFiliais.GetFirstOrDefault(crit2);

            if (Produtos.Count == 0)
            {
                Query query = new Query();

                query.Append("SELECT SUM((HORAS * VALORHORA)) VALOR, SUM(HORAS) HORAS FROM K_CRM_PO_ESCOPO WHERE ");
                query.Append("OPORTUNIDADE = " + op.Handle.Value.ToString() + " AND VERSAO = " + op.Versao.ToString());

                Entities<EntityBase> resultado = query.Execute();

                if (resultado.Count == 0)
                    dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);
                else
                    dados.TotalServico = null != resultado[0].Fields["VALOR"] ? resultado[0].Fields["VALOR"].ToString() : string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", 0);

                original.Add(Convert.ToDecimal(dados.TotalServico));

                if (op.AdicionalNaGerenciaProjeto == true && op.GerenciamentoProjeto > 0 && null != resultado[0].Fields["HORAS"] && null != recurso)
                {
                    dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(dados.TotalServico) + ((Convert.ToDecimal(resultado[0].Fields["HORAS"].ToString()) * (op.GerenciamentoProjeto / 100)) * recurso.ValorHora));

                    dados.AdicionalNaGerenciaProjeto = true;
                    soma.Add(Convert.ToDecimal(dados.GerenciamentoProjeto));
                }
            }
            else
            {
                decimal vlAtual = 0.00m;
                decimal? totalHoras = 0.00m;

                foreach (var Prod in Produtos)
                {
                    List<decimal> somaProduto = new List<decimal>();

                    var serv = new DadosSinteticosServicos();
                    serv.Recurso = "Escopo " + Prod.Produto.Instance.Nome;

                    if (Prod.EscopoPadrao == false)
                    {
                        Query query = new Query();

                        query.Append("SELECT SUM((HORAS * VALORHORA)) VALOR, SUM(HORAS) HORAS FROM K_CRM_PO_ESCOPO WHERE ");
                        query.Append("OPORTUNIDADE = " + op.Handle.Value.ToString() + " AND VERSAO = " + op.Versao.ToString() + " AND PRODUTO = " + Prod.Handle.Value.ToString());

                        Entities<EntityBase> resultado = query.Execute();

                        if (resultado.Count > 0)
                        {
                            if (null != resultado[0].Fields["VALOR"])
                            {
                                totalHoras = Convert.ToDecimal(resultado[0].Fields["HORAS"].ToString());
                                vlAtual = Convert.ToDecimal(resultado[0].Fields["VALOR"].ToString());
                            }
                            else
                            {
                                totalHoras = 0;
                                vlAtual = 0;
                            }
                        }

                        original.Add(vlAtual);

                        if (Prod.AdicionalNaGerenciaProjeto == true && null != recurso)
                        {
                            vlAtual = Convert.ToDecimal(Convert.ToDecimal(vlAtual) + (Convert.ToDecimal((Prod.Gerenciamentoprojeto / 100) * totalHoras) * recurso.ValorHora));

                            dados.AdicionalNaGerenciaProjeto = true;
                            serv.Recurso += " (com gerência de projeto)";
                        }

                        soma.Add(vlAtual);
                        somaProduto.Add(vlAtual);
                    }
                    else
                    {
                        var padrao = CrmPessoaOportunidadesDao.CreateInstance().RetornaDadosEscopoPadrao(new EscopoOportunidadeResponseModel(), Prod.Oportunidade.Instance, Prod, Prod.Handle.IsValid());

                        decimal total = padrao.EscopoPadrao.Sum(r =>
                        {
                            string valorString = r.TotalServico.Replace("R$ ", "").Replace(".", "").Replace(",", ".");
                            return decimal.Parse(valorString, CultureInfo.InvariantCulture);
                        });

                        original.Add(total);

                        if (Prod.AdicionalNaGerenciaProjeto == true)
                        {
                            decimal? valorHoraGerencia = ((padrao.EscopoPadrao.Sum(x => Convert.ToInt64(x.Horas)) * Prod.Gerenciamentoprojeto) / 100);
                            decimal? valorTotalGerencia = decimal.Parse(padrao.ValorHoraGerencia.Replace("R$ ", "").Replace(".", "").Replace(",", "."), CultureInfo.InvariantCulture);

                            total += Convert.ToDecimal(valorHoraGerencia * valorTotalGerencia);

                            dados.AdicionalNaGerenciaProjeto = true;
                            serv.Recurso += " (com gerência de projeto)";
                        }

                        soma.Add(total);
                        somaProduto.Add(total);
                    }

                    serv.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", somaProduto.Sum());

                    dados.Servicos.Add(serv);
                }

                if (original.Count > 0)
                    dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(original.Sum()));

                if (soma.Count > 0)
                    dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDecimal(soma.Sum()));
            }

            #endregion

            #region Proposta
            try
            {
                Entities<CrmPoProposta> buscaProposta = CrmPoProposta.GetMany(crit);

                if (buscaProposta.Count > 0)
                    dados.PropostaEmitida = true;
                else
                    dados.PropostaEmitida = false;
            }
            catch (Exception)
            {
                dados.PropostaEmitida = false;
            }
            #endregion

            #region Desconto

            if (dados.MsgDesconto == "Desconto aprovado para essa oportunidade!" || dados.MsgDesconto == "")
            {
                dados.Bloqueado = false;

                double valorAtualLu = Convert.ToDouble(dados.TotalLu);
                double valorAtualLum = Convert.ToDouble(dados.TotalLum);
                double valorAtualLocacao = Convert.ToDouble(dados.TotalLocacao);

                double valorDescontoLu = 0;
                double valorDescontoLum = 0;
                double valorDescontoLocacao = 0;

                if (null != dados.Desconto)
                {
                    valorDescontoLu = Convert.ToDouble(dados.TotalLu) * ((100 - dados.Desconto.PorcentagemLu) / 100);
                    valorDescontoLum = Convert.ToDouble(dados.TotalLum) * ((100 - dados.Desconto.PorcentagemLum) / 100);
                    valorDescontoLocacao = Convert.ToDouble(dados.TotalLocacao) * ((100 - dados.Desconto.PorcentagemLocacao) / 100);

                    dados.TotalLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorDescontoLu);
                    dados.TotalLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorDescontoLum);
                    dados.TotalLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorDescontoLocacao);
                }
                else
                {
                    dados.TotalLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtualLu);
                    dados.TotalLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtualLum);
                    dados.TotalLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtualLocacao);
                }

                if (Produtos.Count == 0)
                {
                    if (op.GerenciamentoProjeto > 0 && dados.GerenciamentoProjeto != "")
                    {
                        double valorAtual = Convert.ToDouble(dados.GerenciamentoProjeto);

                        if (null != dados.Desconto)
                        {
                            double valorDesconto = Convert.ToDouble(dados.GerenciamentoProjeto) * ((100 - dados.Desconto.PorcentagemServico) / 100);

                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico));
                            dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", valorDesconto);

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtual - valorDesconto);
                        }
                        else
                        {
                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico));
                            dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.GerenciamentoProjeto));

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", 0);
                        }
                    }
                    else
                    {
                        double valorAtual = Convert.ToDouble(dados.TotalServico);

                        if (null != dados.Desconto)
                        {
                            double valorDesconto = Convert.ToDouble(dados.TotalServico) * ((100 - dados.Desconto.PorcentagemServico) / 100);

                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico) * ((100 - dados.Desconto.PorcentagemServico) / 100));
                            dados.GerenciamentoProjeto = dados.TotalServico;

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtual - valorDesconto);
                        }
                        else
                        {
                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico));
                            dados.GerenciamentoProjeto = dados.TotalServico;

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", 0);
                        }
                    }
                }
                else if (Produtos.Count > 0 && dados.GerenciamentoProjeto != "")
                {
                    var somaServico = original.Sum();
                    var somaComProjeto = soma.Sum();

                    double valorAtual = 0;

                    //Com gerenciamento de projeto
                    if (somaComProjeto > somaServico)
                    {
                        valorAtual = Convert.ToDouble(dados.GerenciamentoProjeto);

                        if (null != dados.Desconto)
                        {
                            double valorDesconto = Convert.ToDouble(dados.GerenciamentoProjeto) * ((100 - dados.Desconto.PorcentagemServico) / 100);

                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico));
                            dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", valorDesconto);

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtual - valorDesconto);
                        }
                        else
                        {
                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico));
                            dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.GerenciamentoProjeto));

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", 0);
                        }
                    }
                    else
                    {
                        valorAtual = Convert.ToDouble(dados.TotalServico);

                        if (null != dados.Desconto)
                        {
                            double valorDesconto = Convert.ToDouble(dados.TotalServico) * ((100 - dados.Desconto.PorcentagemServico) / 100);

                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico) * ((100 - dados.Desconto.PorcentagemServico) / 100));
                            dados.GerenciamentoProjeto = dados.TotalServico;

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtual - valorDesconto);
                        }
                        else
                        {
                            dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico));
                            dados.GerenciamentoProjeto = dados.TotalServico;

                            dados.DiferencaServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", 0);
                        }
                    }
                }

                dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.ValorDataCenter) * ((100 - dados.Desconto.PorcentagemSaas) / 100));

                dados.DiferencaLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtualLu - valorDescontoLu);
                dados.DiferencaLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtualLum - valorDescontoLum);
                dados.DiferencaLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorAtualLocacao - valorDescontoLocacao);

                double valorDescontoRecorrencia = op.Modalidade.Instance.Locacao == true ? valorDescontoLocacao : valorDescontoLum;

                dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.ValorDataCenter) + valorDescontoRecorrencia);

                //if (valorAtualLocacao - valorDescontoLocacao > 0)
                //{
                //    dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.ValorDataCenter) + valorAtualLocacao);
                //}
                //else
                //{
                //    dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.ValorDataCenter) + valorAtualLocacao);
                //}

                dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.ValorDataCenter));
            }
            else
            {
                if(dados.MsgDesconto == "Solicitação de desconto recusada!")
                    dados.Bloqueado = false;
                else
                    dados.Bloqueado = true;

                dados.TotalLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.TotalLu));
                dados.TotalLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.TotalLum));
                dados.TotalLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.TotalLocacao));

                dados.TotalServico = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.TotalServico));
                dados.GerenciamentoProjeto = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(dados.GerenciamentoProjeto));

                dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.ValorDataCenter));
                dados.ValorSaas = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(dados.ValorSaas));
            }

            #endregion

            #region Ordenação Produtos
            int conta = 0;
            string nome = "";

            dados.Produtos = dados.Produtos.OrderBy(x => x.TituloNome).ThenBy(x => x.Item).ToList();

            foreach (var elemento in dados.Produtos)
            {
                if (elemento.TituloAtivo == true && conta != 0 && nome == elemento.TituloNome)
                {
                    elemento.TituloAtivo = false;
                    conta = 0;
                }
                if (((nome == "" || nome == elemento.TituloNome) && conta == 0) || (nome != elemento.TituloNome && conta != 0))
                {
                    nome = elemento.TituloNome;
                    conta++;
                }
            }

            dados.Produtos = dados.Produtos
                            .GroupBy(x => x.TituloNome)
                            .SelectMany(g =>
                            {
                                var ativo = g.FirstOrDefault(x => x.TituloAtivo);
                                var ordenados = g.OrderBy(x => x.Item).ToList();

                                if (ativo != null)
                                {
                                    ordenados.Remove(ativo);
                                    ordenados.Insert(0, ativo);
                                }

                                return ordenados;
                            })
                            .ToList();
            #endregion

            return dados;
        }

        public static List<DadosAnaliticosProdutos> GetDadosAnaliticosProdutos(CrmPessoaOportunidades Oportunidade, DadosConclusao dados)
        {
            #region Buscar Valor Original
            List<DadosAnaliticosProdutos> retorno = new List<DadosAnaliticosProdutos>();
            dados.Produtos = new List<DadosAnaliticosProdutos>();
            dados.PacoteModulos = new List<DadosPacoteModulos>();

            Entities<EntityBase> resultList = CrmPessoaOportunidadesDao.CreateInstance().CalculaValorOpoprtunidade(Oportunidade);// Oportunidade.CalculaValorOpoprtunidade(); //CalculaValorOpoprtunidade(Oportunidade.Handle.Value.ToString(), Oportunidade.Versao.Value.ToString());

            double tLu = 0.00;
            double tLum = 0.00;
            double tLocacao = 0.00;
            double dataCenter = 0.00;

            double auxLu = 0;
            double auxLum = 0;
            double auxLocacao = 0;

            foreach (EntityBase entidade in resultList)
            {
                var prods = CrmProdutoItens.Get(new Handle(entidade.Fields["HANITEM"].ToString()));

                DadosAnaliticosProdutos registro = new DadosAnaliticosProdutos()
                {
                    TituloAtivo = true,
                    TituloNome = prods.Produto.Instance.Nome,
                    Item = entidade.Fields["ITEM"].ToString(),
                    Tipo = entidade.Fields["TIPO"].ToString(),
                    Venda = entidade.Fields["VENDA"].ToString(),
                    DescricaoItem = null == entidade.Fields["DESCRICAO"] ? "" : entidade.Fields["DESCRICAO"].ToString(),
                    Usuarios = Convert.ToInt64(entidade.Fields["USUARIOS"].ToString()),
                    Empresas = Convert.ToInt64(entidade.Fields["EMPRESAS"].ToString()) + 1,
                    Unitario = Convert.ToInt64(entidade.Fields["UNITARIO"].ToString()),
                    Lu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(entidade.Fields["LU"].ToString())),
                    Lum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(entidade.Fields["LUM"].ToString())),
                    Locacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(entidade.Fields["LOCACAO"].ToString()))
                };

                tLu += Convert.ToDouble(entidade.Fields["LU"].ToString());
                tLum += Convert.ToDouble(entidade.Fields["LUM"].ToString());
                tLocacao += Convert.ToDouble(entidade.Fields["LOCACAO"].ToString());

                auxLu = 0;
                auxLum = 0;
                auxLocacao = 0;

                if (entidade.Fields["TIPO"].ToString() == "Pacote")
                {
                    try
                    {
                        var crit2 = new Criteria("A.HANDLE IN (SELECT ITEM FROM K_CRM_PRODUTOITENSPACOTE WHERE PACOTE = :PACOTE)");
                        crit2.Parameters.Add("PACOTE", entidade.Fields["HANITEM"].ToString());
                        crit2.CompanyFilterMode = CompanyFilterMode.None;

                        Entities<CrmProdutoItens> pacote = CrmProdutoItens.GetMany(crit2);

                        foreach (var item in pacote)
                        {
                            DadosPacoteModulos modulo = new DadosPacoteModulos();
                            modulo.Nome = item.Nome;
                            modulo.Descricao = null == item.Descricao ? "" : item.Descricao;
                            dados.PacoteModulos.Add(modulo);

                             var conteudo = new ConteudoPacote();
                            conteudo.ProdutoItemNome = item.Nome;
                            registro.ProdutoItens.Add(conteudo);
                            //conteudo.Lu = item.Lu
                        }

                        Criteria criteriaItens = new Criteria("A.TABELAPRECO IN (SELECT TABELAPRECO FROM K_CRM_PESSOAOPORTUNIDADESPROD WHERE HANDLE = :OPROD) AND INCLUSONOPACOTE = 'S' AND EXIGECOTACAO = 'N'");
                        criteriaItens.Parameters.Add("OPROD", entidade.Fields["HANPRODUTO"].ToString());
                        criteriaItens.CompanyFilterMode = CompanyFilterMode.None;

                        var inclusosNoPacote = CrmTabelasPrecoItens.GetMany(criteriaItens);

                        foreach (var tabelaItem in inclusosNoPacote)
                        {
                            if (tabelaItem.Item.Instance.Venda.Instance.Nome == "Unico")
                            {
                                var registroInclusoNoPacote = new DadosAnaliticosProdutos()
                                {
                                    TituloAtivo = true,
                                    TituloNome = tabelaItem.Item.Instance.Produto.Instance.Nome,
                                    Item = tabelaItem.Item.Instance.Nome,
                                    Tipo = tabelaItem.Item.Instance.Tipo.Instance.Nome,
                                    Venda = tabelaItem.Item.Instance.Venda.Instance.Nome,
                                    DescricaoItem = null == tabelaItem.Item.Instance.Descricao ? "" : tabelaItem.Item.Instance.Descricao,
                                    Usuarios = Convert.ToInt64(entidade.Fields["USUARIOS"].ToString()),
                                    Empresas = Convert.ToInt64(entidade.Fields["EMPRESAS"].ToString()) + 1,
                                    Unitario = 1,
                                    Lu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(tabelaItem.Lu)),
                                    Lum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(tabelaItem.Lum)),
                                    Locacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(tabelaItem.Locacao)),
                                    Grid = false
                                };

                                if (tabelaItem.Item.Instance.Tipo.Instance.Nome == "Hospedagem")
                                {
                                    registroInclusoNoPacote.Item = "Data Center (" + tabelaItem.Item.Instance.Produto.Instance.Nome + ")";
                                    dataCenter += Convert.ToDouble(tabelaItem.Locacao);
                                    retorno.Add(registroInclusoNoPacote);
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new BusinessException("Não existem itens indexados ao pacote. Verifique o cadastro do item");
                    }
                }
                else if (entidade.Fields["TIPO"].ToString() == "Hospedagem")
                {
                    dataCenter += Convert.ToDouble(entidade.Fields["LOCACAO"].ToString());
                }

                if (auxLu > 0 || auxLum > 0 || auxLocacao > 0)
                {
                    registro.Lu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(entidade.Fields["LU"].ToString()) - auxLu);
                    registro.Lum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", (Convert.ToDouble(entidade.Fields["LUM"].ToString()) - auxLum)); ;
                    registro.Locacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", Convert.ToDouble(entidade.Fields["LOCACAO"].ToString()) - auxLocacao);
                }

                registro.Lu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(registro.Lu));
                registro.Lum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(registro.Lum)); ;
                registro.Locacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(registro.Locacao));

                retorno.Add(registro);
            }
            dados.TotalLu = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", tLu);
            dados.TotalLum = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", tLum);
            dados.TotalLocacao = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", tLocacao);
            dados.ValorDataCenter = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:F}", dataCenter);

            #endregion

            #region Aplica Desconto

            var crit = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.NIVELAPROVACAO >= 1 AND A.NIVELAPROVACAO <= 5 AND A.DATAAPROVACAO >= (SELECT MAX(DATAAPROVACAO) FROM K_CRM_PO_DESCONTOS AS D2 WHERE A.OPORTUNIDADE = D2.OPORTUNIDADE AND A.VERSAO = D2.VERSAO AND D2.NIVELAPROVACAO = 1)");
            crit.Parameters.Add("OPORTUNIDADE", Oportunidade.Handle);
            crit.Parameters.Add("VERSAO", Oportunidade.Versao);
            crit.CompanyFilterMode = CompanyFilterMode.None;

            Entities<CrmPoDescontos> descontos = CrmPoDescontos.GetMany(crit);

            if (descontos.Count == 0)
            {
                dados.MsgDesconto = "";
                dados.OportunidadeBloqueada = false;
            }
            else if (descontos.Count > 0)
            {
                CrmPoDescontosNivelAprovacaoListaItens maiorNivel = descontos.Max(x => x.NivelAprovacao.Index);
                CrmPoDescontos ultimaSolicitacao = descontos.Find(x => x.NivelAprovacao == maiorNivel);

                if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemAprovada)
                {
                    dados.MsgDesconto = "Desconto aprovado para essa oportunidade!";
                    dados.OportunidadeBloqueada = false;

                    dados.Desconto.PorcentagemLu = Convert.ToDouble(ultimaSolicitacao.Lu);
                    dados.Desconto.PorcentagemLum = Convert.ToDouble(ultimaSolicitacao.Lum);
                    dados.Desconto.PorcentagemLocacao = Convert.ToDouble(ultimaSolicitacao.Locacao);
                    dados.Desconto.PorcentagemServico = Convert.ToDouble(ultimaSolicitacao.Servico);
                    dados.Desconto.PorcentagemSaas = Convert.ToDouble(ultimaSolicitacao.Saas);
                    dados.Desconto.PorcentagemBpo = Convert.ToDouble(ultimaSolicitacao.Bpo);
                }
                else if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemEmAnalise)
                {
                    dados.MsgDesconto = "Solicitação de desconto em análise!";
                    dados.OportunidadeBloqueada = true;
                }
                else if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemRecusada)
                {
                    dados.MsgDesconto = "Solicitação de desconto recusada!";
                    dados.OportunidadeBloqueada = true;
                }
                else if (ultimaSolicitacao.Status == CrmPoDescontosStatusListaItens.ItemCancelada)
                {
                    dados.MsgDesconto = "";
                    dados.OportunidadeBloqueada = false;
                }
                else
                {
                    dados.MsgDesconto = "Erro!";
                    dados.OportunidadeBloqueada = true;
                }
            }
            #endregion

            return retorno;
        }

        public static CondicoesPagamentoOp RetornaCondicoesPagamento(CrmPessoaOportunidades Oportunidade)
        {
            CondicoesPagamentoOp retorno = new CondicoesPagamentoOp()
            {
                CondPagLu = Oportunidade.CondPagLu,
                CondPagLum = Oportunidade.CondPagLum,
                CondPagLoc = Oportunidade.CondPagLoc,
                CondPagServ = Oportunidade.CondPagServ,
                CondPagSaas = Oportunidade.CondPagSaas,
                CondPagBpo = Oportunidade.CondPagBpo,
                CodigoOportunidade = Convert.ToInt64(Oportunidade.Codigo),
                Versao = Convert.ToInt64(Oportunidade.Versao),
                Observacao = (Oportunidade.ConsideracoesAdicionais != null && Oportunidade.ConsideracoesAdicionais.Length > 0) ? Oportunidade.ConsideracoesAdicionais : Oportunidade.Observacao
            };

            return retorno;
        }
    }
}
