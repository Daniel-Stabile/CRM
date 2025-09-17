using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Metadata.Entities;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Models.Crm;
using System.Globalization;
using Benner.Tecnologia.Business;
using Controllers.Models.Crm;

namespace Controllers.Crm
{
    /// <summary>
    /// Descrição resumida de CrmPoDescontosController
    /// </summary>
    public class CrmPoDescontosController : Controller
    {
        public CrmPoDescontosController()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public ActionResult AvaliarDesconto()
        {
            var dadosOportunidade = new DadosOportunidade();
            CrmPoDescontos PoDesconto = new CrmPoDescontos();
            Dictionary<int, decimal?> niveisUsuario = new Dictionary<int, decimal?>();

            var DadosRota = this.RouteData.Values.ToList();
            bool editar = false;

            dadosOportunidade.Desconto = new DadosDesconto();
            dadosOportunidade.Existente = false;

            try
            {
                foreach (var rota in DadosRota)
                {
                    if (rota.Key == "Link")
                    {
                        Benner.Tecnologia.Common.Components.FormLinkDefinition a = (Benner.Tecnologia.Common.Components.FormLinkDefinition)rota.Value;
                        if (a.TargetEntityHandle.IsValid())
                        {
                            if (a.WhereClause.Parameters.Count > 0)
                            {
                                foreach (var parametro in a.WhereClause.Parameters)
                                {
                                    if (parametro.Name.Contains("HANDLE"))
                                        dadosOportunidade.TxtOportunidade = parametro.Value.ToString();
                                    else if (parametro.Name.Contains("VERSAO"))
                                        dadosOportunidade.TxtVersao = parametro.Value.ToString();
                                    else if (parametro.Name.Contains("RESPONSAVEL"))
                                        dadosOportunidade.TxtUsuarioInclusao = parametro.Value.ToString();
                                }
                            }

                            PoDesconto = CrmPoDescontos.GetFirstOrDefault(a.TargetEntityHandle);

                            dadosOportunidade.TxtOportunidade = PoDesconto.OportunidadeHandle.Value.ToString();
                            dadosOportunidade.TxtVersao = PoDesconto.Versao.ToString();
                            dadosOportunidade.TxtUsuarioInclusao = PoDesconto.UsuarioSolicitacaoHandle.Value.ToString();

                            dadosOportunidade.Desconto.Handle = PoDesconto.Handle.Value;
                            dadosOportunidade.Existente = true;
                            dadosOportunidade.Desconto.Observacao = PoDesconto.Descricao;

                            if (a.TargetFormMode == FormLinkDefinition.FormMode.Edit)
                                editar = true;

                            dadosOportunidade.Desconto.PorcentagemLu = Convert.ToDouble(PoDesconto.Lu);
                            dadosOportunidade.Desconto.PorcentagemLum = Convert.ToDouble(PoDesconto.Lum);
                            dadosOportunidade.Desconto.PorcentagemLocacao = Convert.ToDouble(PoDesconto.Locacao);
                            dadosOportunidade.Desconto.PorcentagemServico = Convert.ToDouble(PoDesconto.Servico);
                            dadosOportunidade.Desconto.PorcentagemSaas = Convert.ToDouble(PoDesconto.Saas);
                            dadosOportunidade.Desconto.PorcentagemBpo = Convert.ToDouble(PoDesconto.Bpo);
                            dadosOportunidade.TxtStatus = PoDesconto.Status.Description.ToString();

                            if (PoDesconto.UsuarioAprovacaoHandle.IsValid())
                            {
                                dadosOportunidade.Desconto.TxtUsuarioAprovacao = PoDesconto.UsuarioAprovacaoInstance.Nome;
                            }
                        }
                        else
                        {
                            if (a.TargetFormMode == FormLinkDefinition.FormMode.Insert)
                            {
                                foreach (var parametro in a.WhereClause.Parameters)
                                {
                                    if (parametro.Name.Contains("HANDLE"))
                                        dadosOportunidade.TxtOportunidade = parametro.Value.ToString();
                                    else if (parametro.Name.Contains("VERSAO"))
                                        dadosOportunidade.TxtVersao = parametro.Value.ToString();
                                    else if (parametro.Name.Contains("RESPONSAVEL"))
                                        dadosOportunidade.TxtUsuarioInclusao = parametro.Value.ToString();
                                }
                            }
                            else
                            {
                                foreach (var parametro in a.WhereClause.Parameters)
                                {
                                    if (parametro.Name.Contains("HANDLE"))
                                    {
                                        PoDesconto = CrmPoDescontos.GetFirstOrDefault(new Handle(parametro.Value.ToString()));
                                        break;
                                    }
                                }

                                dadosOportunidade.Desconto.Handle = PoDesconto.Handle.Value;
                                dadosOportunidade.Existente = true;
                                dadosOportunidade.Desconto.Observacao = PoDesconto.Descricao;

                                if (a.TargetFormMode == FormLinkDefinition.FormMode.Edit)
                                    editar = true;

                                dadosOportunidade.Desconto.PorcentagemLu = Convert.ToDouble(PoDesconto.Lu);
                                dadosOportunidade.Desconto.PorcentagemLum = Convert.ToDouble(PoDesconto.Lum);
                                dadosOportunidade.Desconto.PorcentagemLocacao = Convert.ToDouble(PoDesconto.Locacao);
                                dadosOportunidade.Desconto.PorcentagemServico = Convert.ToDouble(PoDesconto.Servico);
                                dadosOportunidade.Desconto.PorcentagemSaas = Convert.ToDouble(PoDesconto.Saas);
                                dadosOportunidade.Desconto.PorcentagemBpo = Convert.ToDouble(PoDesconto.Bpo);
                                dadosOportunidade.TxtStatus = PoDesconto.Status.Description.ToString();

                                if (PoDesconto.UsuarioAprovacaoHandle.IsValid())
                                {
                                    dadosOportunidade.Desconto.TxtUsuarioAprovacao = PoDesconto.UsuarioAprovacaoInstance.Nome;
                                }

                                dadosOportunidade.TxtOportunidade = PoDesconto.OportunidadeHandle.Value.ToString();
                                dadosOportunidade.TxtVersao = PoDesconto.Versao.ToString();
                                dadosOportunidade.TxtUsuarioInclusao = PoDesconto.UsuarioSolicitacaoHandle.Value.ToString();
                            }
                        }
                        break;
                    }
                }

                //CrmPessoaOportunidadesFuncoes.CalcularOportunidade(dadosOportunidade.TxtOportunidade, dadosOportunidade.TxtVersao);

                CrmPessoaOportunidades oportunidade = CrmPessoaOportunidades.Get(new Handle(dadosOportunidade.TxtOportunidade));

                var dadosTabela = CrmPessoaOportunidadesDao.CreateInstance().CalcularOportunidade(oportunidade);

                dadosOportunidade.TxtOportunidade += " - " + oportunidade.PessoaInstance.Nome;
                dadosOportunidade.CodigoOportunidade = Convert.ToInt64(oportunidade.Codigo);

                ZGrupoUsuarios usuarios = ZGrupoUsuarios.Get(new Handle(dadosOportunidade.TxtUsuarioInclusao));

                ZGrupoUsuarios porcentagemUsuarioAtual = ZGrupoUsuarios.Get(BennerContext.Security.GetLoggedUserHandle());

                var PapeisUsuario = Benner.Tecnologia.Common.Authorization.UserRepository.GetUnassignedUserRoles(porcentagemUsuarioAtual.Apelido);

                foreach (var papel in PapeisUsuario)
                {
                    try
                    {
                        Criteria crit = new Criteria("A.NOME = :NOME");
                        crit.Parameters.Add("NOME", papel.Name);
                        RoleEntity Role = RoleEntity.Get(crit);

                        Criteria crit2 = new Criteria("A.PAPEL = :PAPEL");
                        crit2.Parameters.Add("PAPEL", Role.Handle.Value);
                        CrmNiveisDesconto nivel = CrmNiveisDesconto.Get(crit2);

                        dadosOportunidade.PorcentagemDesconto = nivel.PorcentagemDesconto.ToString();

                        niveisUsuario.Add(nivel.Nivel.Index, nivel.PorcentagemDesconto);
                        //break;
                    }
                    catch
                    {
                        dadosOportunidade.PorcentagemDesconto = "0";
                    }
                }

                if (niveisUsuario.Count > 0)
                {
                    dadosOportunidade.NivelUsuario = niveisUsuario.Max(x => x.Key).ToString();
                    dadosOportunidade.PorcentagemDesconto = niveisUsuario.Max(x => x.Value).ToString();
                }

                //dadosOportunidade.txtLocacaoA = dadosTabela.txtLocacaoA;
                //dadosOportunidade.txtLocacaoB = dadosTabela.txtLocacaoB;
                //dadosOportunidade.txtLocacaoC = dadosTabela.txtLocacaoC;

                //dadosOportunidade.txtLuA = dadosTabela.txtLuA;
                //dadosOportunidade.txtLuB = dadosTabela.txtLuB;
                //dadosOportunidade.txtLuC = dadosTabela.txtLuC;

                //dadosOportunidade.txtLumA = dadosTabela.txtLumA;
                //dadosOportunidade.txtLumB = dadosTabela.txtLumB;
                //dadosOportunidade.txtLumC = dadosTabela.txtLumC;

                //dadosOportunidade.txtSaas = dadosTabela.txtSaas;
                //dadosOportunidade.txtEscopo = dadosTabela.txtEscopo;
                //dadosOportunidade.TotalLu = dadosTabela.TotalLu;
                //dadosOportunidade.TotalLum = dadosTabela.TotalLum;
                //dadosOportunidade.TotalLocacao = dadosTabela.TotalLocacao;

                //dadosOportunidade.Categoria = dadosTabela.Categoria;
                //dadosOportunidade.Modalidade = dadosTabela.Modalidade;

                dadosOportunidade.TxtUsuarioInclusao = usuarios.Nome;
                dadosOportunidade.HandleUsuario = usuarios.Handle.Value;

                dadosOportunidade.ValoresOportunidade.ValorProdutos.TotalLu = dadosTabela.ValoresOportunidade.ValorProdutos.TotalLu;
                dadosOportunidade.ValoresOportunidade.ValorProdutos.TotalLum = dadosTabela.ValoresOportunidade.ValorProdutos.TotalLum;
                dadosOportunidade.ValoresOportunidade.ValorProdutos.TotalLocacao = dadosTabela.ValoresOportunidade.ValorProdutos.TotalLocacao;
                dadosOportunidade.ValoresOportunidade.ValorEscopo.TotalServicos = dadosTabela.ValoresOportunidade.ValorEscopo.TotalServicos;
                dadosOportunidade.ValoresOportunidade.ValorSaas.TotalDataCenter = dadosTabela.ValoresOportunidade.ValorSaas.TotalDataCenter;    
                dadosOportunidade.ValoresOportunidade.ValorSaas.TotalSaas = dadosTabela.ValoresOportunidade.ValorSaas.TotalSaas;

                dadosOportunidade.DadosModalidade = CrmPessoaOportunidadesDao.CreateInstance().RetornaDadosModalidade(oportunidade.Modalidade.Instance); //CrmPessoaOportunidadesFuncoes.RetornaDadosModalidade(oportunidade.Modalidade.Instance);

                dadosOportunidade.Desconto.Editar = editar;

                //if (dadosOportunidade.Existente)
                //{
                //    dadosOportunidade.txtLocacaoA = (Convert.ToDouble(dadosOportunidade.txtLocacaoA) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLocacao) / 100))).ToString();
                //    dadosOportunidade.txtLocacaoB = (Convert.ToDouble(dadosOportunidade.txtLocacaoB) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLocacao) / 100))).ToString();
                //    dadosOportunidade.txtLocacaoC = (Convert.ToDouble(dadosOportunidade.txtLocacaoC) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLocacao) / 100))).ToString();

                //    dadosOportunidade.txtLuA = (Convert.ToDouble(dadosOportunidade.txtLuA) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLu) / 100))).ToString();
                //    dadosOportunidade.txtLuB = (Convert.ToDouble(dadosOportunidade.txtLuB) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLu) / 100))).ToString();
                //    dadosOportunidade.txtLuC = (Convert.ToDouble(dadosOportunidade.txtLuC) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLu) / 100))).ToString();

                //    dadosOportunidade.txtLumA = (Convert.ToDouble(dadosOportunidade.txtLumA) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLum) / 100))).ToString();
                //    dadosOportunidade.txtLumB = (Convert.ToDouble(dadosOportunidade.txtLumB) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLum) / 100))).ToString();
                //    dadosOportunidade.txtLumC = (Convert.ToDouble(dadosOportunidade.txtLumC) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemLum) / 100))).ToString();

                //    dadosOportunidade.txtSaas = (Convert.ToDouble(dadosOportunidade.txtSaas) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemSaas) / 100))).ToString();
                //    dadosOportunidade.txtEscopo = (Convert.ToDouble(dadosOportunidade.txtEscopo) * (1 - (Convert.ToDouble(dadosOportunidade.Desconto.PorcentagemServico) / 100))).ToString();
                //}
                //else
                //{
                //    dadosOportunidade.TxtStatus = "Pendente";
                //    dadosOportunidade.Desconto.Handle = 0;
                //    dadosOportunidade.Desconto.Observacao = "";
                //}
            }
            catch (Exception)
            {
                return null;
            }

            if (null == dadosOportunidade.Desconto.Observacao)
                dadosOportunidade.Desconto.Observacao = "";

            return View(dadosOportunidade);
        }

        public string AcaoDesconto(BindDesconto form)
        {
            bool ExigeAprovacao = false;

            try
            {
                if (form.HandleDesconto == 0)
                {
                    bool contemValor = false;

                    if (form.PorcentagemLu > 0)
                        contemValor = true;
                    if (form.PorcentagemLum > 0)
                        contemValor = true;
                    if (form.PorcentagemLocacao > 0)
                        contemValor = true;
                    if (form.PorcentagemServico > 0)
                        contemValor = true;
                    if (form.PorcentagemSaas > 0)
                        contemValor = true;
                    if (form.PorcentagemBpo > 0)
                        contemValor = true;

                    //var criteria = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.STATUS IN (1,2,3,5)");
                    //criteria.Parameters.Add("OPORTUNIDADE", form.Oportunidade);
                    //criteria.Parameters.Add("VERSAO", form.Versao);
                    //criteria.CompanyFilterMode = CompanyFilterMode.None;

                    //var jaExiste = CrmPoDescontos.GetFirstOrDefault(criteria);
                    var query = new Query("SELECT TOP 1 * FROM K_CRM_PO_DESCONTOS A WHERE A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.NIVELAPROVACAO >= 1 AND A.NIVELAPROVACAO <= 5 AND A.DATAAPROVACAO >= (SELECT MAX(DATAAPROVACAO) FROM K_CRM_PO_DESCONTOS AS D2 WHERE A.OPORTUNIDADE = D2.OPORTUNIDADE AND A.VERSAO = D2.VERSAO AND D2.NIVELAPROVACAO = 1) ORDER BY NIVELAPROVACAO DESC");
                    query.Parameters.Add("OPORTUNIDADE", form.Oportunidade);
                    query.Parameters.Add("VERSAO", form.Versao);

                    var result = query.Execute();
                    var jaExiste = result.FirstOrDefault();

                    if (jaExiste != null && null != jaExiste.Fields["STATUS"] && jaExiste.Fields["STATUS"].ToString() != "5" && jaExiste.Fields["STATUS"].ToString() != "4")
                        throw new ArgumentException("Já existe uma solicitação de desconto em análise, pendente ou aprovada para essa oportunidade nessa versão.");

                    if (contemValor)
                    {
                        CrmPoDescontos novoDesconto = CrmPoDescontos.Create();
                        novoDesconto.Lu = Convert.ToDecimal(form.PorcentagemLu);
                        novoDesconto.Lum = Convert.ToDecimal(form.PorcentagemLum);
                        novoDesconto.Locacao = Convert.ToDecimal(form.PorcentagemLocacao);
                        novoDesconto.Servico = Convert.ToDecimal(form.PorcentagemServico);
                        novoDesconto.Saas = Convert.ToDecimal(form.PorcentagemSaas);
                        novoDesconto.Bpo = Convert.ToDecimal(form.PorcentagemBpo);
                        novoDesconto.Observacao = form.Observacao;
                        novoDesconto.Descricao = form.Observacao;
                        novoDesconto.Aprovado = !form.Recusada;
                        novoDesconto.OportunidadeHandle = form.Oportunidade;
                        novoDesconto.Versao = form.Versao;
                        novoDesconto.UsuarioAprovacaoHandle = BennerContext.Security.GetLoggedUserHandle();
                        novoDesconto.UsuarioSolicitacaoHandle = form.UsuarioSolicitacao;

                        switch (form.NivelUsuario[0])
                        {
                            case '1':
                                novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item1;
                                break;
                            case '2':
                                novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item2;
                                break;
                            case '3':
                                novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item3;
                                break;
                            case '4':
                                novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item4;
                                break;
                            case '5':
                                novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item5;
                                break;
                            default:
                                throw new ArgumentException("Papel do usuario sem nivel de aprovação cadastrado. Contate o administrador do sistema.");
                        }

                        if (!form.Solicitar)
                            novoDesconto.Status = CrmPoDescontosStatusListaItens.ItemAprovada;
                        else
                        {
                            if (form.Recusada)
                                novoDesconto.Status = CrmPoDescontosStatusListaItens.ItemRecusada;
                            else
                            {
                                novoDesconto.Status = CrmPoDescontosStatusListaItens.ItemAprovada;
                                ExigeAprovacao = true;
                            }
                        }

                        novoDesconto.Save();

                        if (ExigeAprovacao && !form.Recusada)
                        {
                            CrmPoDescontos desconto = CrmPoDescontos.Create();
                            desconto.Lu = Convert.ToDecimal(form.PorcentagemLu);
                            desconto.Lum = Convert.ToDecimal(form.PorcentagemLum);
                            desconto.Locacao = Convert.ToDecimal(form.PorcentagemLocacao);
                            desconto.Servico = Convert.ToDecimal(form.PorcentagemServico);
                            desconto.Saas = Convert.ToDecimal(form.PorcentagemSaas);
                            desconto.Bpo = Convert.ToDecimal(form.PorcentagemBpo);
                            desconto.Observacao = form.Observacao;
                            desconto.Descricao = form.Observacao;
                            //desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item2;
                            desconto.Aprovado = false;
                            desconto.OportunidadeHandle = form.Oportunidade;
                            desconto.Versao = form.Versao;
                            desconto.UsuarioSolicitacaoHandle = form.UsuarioSolicitacao;
                            desconto.Status = CrmPoDescontosStatusListaItens.ItemEmAnalise;

                            switch (form.NivelUsuario[0])
                            {
                                case '1':
                                    desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item2;
                                    break;
                                case '2':
                                    desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item3;
                                    break;
                                case '3':
                                    desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item4;
                                    break;
                                case '4':
                                    desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item5;
                                    break;
                                //case '5':
                                //    desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item5;
                                //    break;
                                default:
                                    throw new ArgumentException("Papel do usuario sem nivel de aprovação cadastrado. Contate o administrador do sistema.");
                            }

                            desconto.Save();

                        }
                    }
                }
                else
                {
                    CrmPoDescontos novoDesconto = CrmPoDescontos.Get(new Handle(form.HandleDesconto.ToString()), GetMode.Edit);

                    if (!form.Solicitar)
                    {
                        novoDesconto.Status = CrmPoDescontosStatusListaItens.ItemAprovada;
                    }
                    else
                    {
                        if (form.Recusada)
                            novoDesconto.Status = CrmPoDescontosStatusListaItens.ItemRecusada;
                        else
                        {
                            novoDesconto.Status = CrmPoDescontosStatusListaItens.ItemAprovada;
                            ExigeAprovacao = true;
                        }
                    }

                    novoDesconto.Lu = Convert.ToDecimal(form.PorcentagemLu);
                    novoDesconto.Lum = Convert.ToDecimal(form.PorcentagemLum);
                    novoDesconto.Locacao = Convert.ToDecimal(form.PorcentagemLocacao);
                    novoDesconto.Servico = Convert.ToDecimal(form.PorcentagemServico);
                    novoDesconto.Saas = Convert.ToDecimal(form.PorcentagemSaas);
                    novoDesconto.Bpo = Convert.ToDecimal(form.PorcentagemBpo);
                    novoDesconto.Observacao = form.Observacao;
                    novoDesconto.Descricao = form.Observacao;
                    novoDesconto.Aprovado = !form.Recusada;
                    novoDesconto.OportunidadeHandle = form.Oportunidade;
                    novoDesconto.Versao = form.Versao;
                    novoDesconto.UsuarioAprovacaoHandle = BennerContext.Security.GetLoggedUserHandle();
                    novoDesconto.UsuarioSolicitacaoHandle = form.UsuarioSolicitacao;

                    switch (form.NivelUsuario[0])
                    {
                        case '1':
                            novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item1;
                            break;
                        case '2':
                            novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item2;
                            break;
                        case '3':
                            novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item3;
                            break;
                        case '4':
                            novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item4;
                            break;
                        case '5':
                            novoDesconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item5;
                            break;
                        default:
                            throw new ArgumentException("Papel do usuario sem nivel de aprovação cadastrado. Contate o administrador do sistema.");
                    }

                    novoDesconto.Save();

                    if (ExigeAprovacao && !form.Recusada)
                    {
                        CrmPoDescontos desconto = CrmPoDescontos.Create();
                        desconto.Lu = Convert.ToDecimal(form.PorcentagemLu);
                        desconto.Lum = Convert.ToDecimal(form.PorcentagemLum);
                        desconto.Locacao = Convert.ToDecimal(form.PorcentagemLocacao);
                        desconto.Servico = Convert.ToDecimal(form.PorcentagemServico);
                        desconto.Saas = Convert.ToDecimal(form.PorcentagemSaas);
                        desconto.Bpo = Convert.ToDecimal(form.PorcentagemBpo);
                        desconto.Observacao = form.Observacao;
                        desconto.Descricao = form.Observacao;
                        //desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item2;
                        desconto.Aprovado = false;
                        desconto.OportunidadeHandle = form.Oportunidade;
                        desconto.Versao = form.Versao;
                        desconto.UsuarioSolicitacaoHandle = form.UsuarioSolicitacao;
                        desconto.Status = CrmPoDescontosStatusListaItens.ItemEmAnalise;

                        switch (form.NivelUsuario[0])
                        {
                            case '1':
                                desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item2;
                                break;
                            case '2':
                                desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item3;
                                break;
                            case '3':
                                desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item4;
                                break;
                            case '4':
                                desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item5;
                                break;
                            //case '5':
                            //    desconto.NivelAprovacao = CrmPoDescontosNivelAprovacaoListaItens.Item5;
                            //    break;
                            default:
                                throw new ArgumentException("Papel do usuario sem nivel de aprovação cadastrado. Contate o administrador do sistema.");
                        }

                        desconto.Save();

                    }
                }

                FormLinkDefinition link = new FormLinkDefinition();
                link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                link.TargetEntityDefinitionName = "K_CRM_PO_DESCONTOS";
                link.TargetFormMode = FormLinkDefinition.FormMode.View;
                link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO");
                link.WhereClause.AddParameter("OPORTUNIDADE", form.Oportunidade);
                link.WhereClause.AddParameter("VERSAO", form.Versao);
                link.Url = @"~/Pages/KCrmPoDescontos/Grid.aspx";

                // É necessário utilizar o UriBuilder para persistir os valores durante a transferência
                var url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link);

                string Uri = url.Substring(2);

                return JsonConvert.SerializeObject(new { status = "Sucesso", code = 200, message = "Dados Salvos com sucesso!", Url = Uri });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { status = "Erro", code = 400, message = ex.Message.ToString() });
            }
        }
    }
}
