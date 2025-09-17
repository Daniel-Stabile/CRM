using Benner.ERP.Comum;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Controllers.Crm;
using Controllers.Models.Crm;
using DocumentFormat.OpenXml.Spreadsheet;
using Newtonsoft.Json;
using SM.Crm.Definicoes.Comum.Oportunidades;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class K_CRM_PESSOAOPORTUNIDADESNovaOportunidadePage : WesPage
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (IsPostBack)
            Session["etapa_atual"] = "";            

        this.K_ITENS.CommandExecuted += K_ITENS_CommandExecuted1;
        this.K_ITENS.RowCommandExecuted += K_ITENS_RowCommandExecuted;
        this.K_ITENS.DataLoaded += K_ITENS_DataLoaded;
        this.K_NOVAOPORTUNIDADE.CommandExecuted += K_NOVAOPORTUNIDADE_CommandExecuted1;
        this.K_NOVAOPORTUNIDADE.DataLoaded += K_NOVAOPORTUNIDADE_DataLoaded;
        this.K_PRODUTO.CommandExecuted += K_PRODUTO_CommandExecuted1;
        this.K_PRODUTOS.CommandExecuted += K_PRODUTOS_CommandExecuted;
        this.K_PRODUTOS.RowCommandExecuted += K_PRODUTOS_CommandExecuted;
        this.K_PRODUTOS.DataLoaded += K_PRODUTOS_DataLoaded;
        this.K_DATACENTER.CommandExecuted += K_DATACENTER_CommandExecuted;
        this.K_DATACENTER.RowCommandExecuted += K_DATACENTER_RowCommandExecuted;
        this.K_CONSIDERAESADICIONAIS.CommandExecuted += K_CONSIDERAESADICIONAIS_CommandExecuted;
        this.BtnEscopoProdutos.Click += BtnEscopoProdutos_Click;
        this.ActionView2.DataLoaded += ActionView2_DataLoaded;
        this.K_FECHAMENTO.DataLoaded += K_FECHAMENTO_DataLoaded;

        ActionView1.ForceUpdate();
        K_PRODUTO.ForceUpdate();
        K_ITENS.ForceUpdate();
        K_DATACENTER.ForceUpdate();
        //K_VALORSERVIO.ForceUpdate();
    }

    private void  ActionView2_DataLoaded(object sender, EventArgs e)
    {
        var comando = new Command()
        {
            Name = "Select"
        };

        K_PRODUTOS_CommandExecuted(sender, new GridCommandExecuteArgs(comando, K_PRODUTOS.GetEntity(), new NameValueDictionary()));
    }

    private void K_FECHAMENTO_DataLoaded(object sender, EventArgs e)
    {
        if (K_NOVAOPORTUNIDADE.GetEntity().Handle.IsValid() == true)
        {
            var op = CrmPessoaOportunidades.Get(K_NOVAOPORTUNIDADE.DataSource.Handle);
            if (op.Ativo == true)
            {
                var linkResumo = new FormLinkDefinition();
                linkResumo.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
                linkResumo.TargetEntityDefinitionName = CrmPessoaOportunidades.GetEntityDefinition().Name;
                linkResumo.WhereClause = new WhereClause("A.HANDLE = :HANDLE");
                linkResumo.WhereClause.AddParameter("HANDLE", op.Handle.Value);
                linkResumo.TargetFormMode = FormLinkDefinition.FormMode.View;
                linkResumo.Url = "~/Pages/K_CRM_PESSOAOPORTUNIDADES/Resumo.aspx";

                Response.Redirect(Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkResumo));
            }
        }
    }

    private void K_CONSIDERAESADICIONAIS_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        if(e.Command.Name == "CmdConclusao")
        {
            //K_FECHAMENTO.ForceUpdate();
            //CurrentStep.Value = "5";
            Session["etapa_atual"] = "5";
            Response.Redirect(Request.RawUrl);
        }
        else if (e.Command.Name == "CmdAnterior")
        {
            var oportunidade = CrmPessoaOportunidades.Get(this.K_NOVAOPORTUNIDADE.GetEntity().Handle);

            if (oportunidade.Modalidade.Instance != null)
            {
                var modalidade = oportunidade.Modalidade.Instance;
                if(modalidade.Escopo == true)
                {
                    Session["etapa_atual"] = "3";
                    Response.Redirect(Request.RawUrl);
                    //CurrentStep.Value = "3";
                }
                else if (modalidade.Lu == true || modalidade.Lum == true || modalidade.Locacao == true)
                {
                    Session["etapa_atual"] = "2";
                    Response.Redirect(Request.RawUrl);
                    //CurrentStep.Value = "2";
                }
                else
                {
                    Session["etapa_atual"] = "1";
                    Response.Redirect(Request.RawUrl);
                    //CurrentStep.Value = "1";
                }
            }
        }
    }

    private void K_NOVAOPORTUNIDADE_DataLoaded(object sender, EventArgs e)
    {
        if(K_NOVAOPORTUNIDADE.GetEntity().Handle.IsValid() == true)
        {
            var crit = new Criteria("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO");
            crit.Parameters.Add("OPORTUNIDADE", K_NOVAOPORTUNIDADE.GetEntity().Handle);
            crit.Parameters.Add("VERSAO", K_NOVAOPORTUNIDADE.GetEntity().Fields["VERSAO"].ToString());
            crit.CompanyFilterMode = CompanyFilterMode.None;
            var produtos = CrmPessoaOportunidadesProd.GetMany(crit);

            if (K_NOVAOPORTUNIDADE.DataSource.Fields["ATIVO"].ToBoolean() == true || produtos.Count > 0)
            {
                BtnEscopoProdutos.Visible = false;
                BtnAdicionarLinha.Visible = false;
            }
        }
    }

    private void BtnEscopoProdutos_Click(object sender, EventArgs e)
    {
        if (null == K_PRODUTOS.DataSource)
            K_PRODUTOS.DataLoad();

        if (K_PRODUTOS.DataSource.Count > 0)
        {
            var op = K_PRODUTOS.ProviderWidget.GetEntity();

            FormLinkDefinition link = new FormLinkDefinition();
            link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
            link.TargetEntityDefinitionName = "K_CRM_VT_PO_ESCOPO";
            link.TargetFormMode = FormLinkDefinition.FormMode.Insert;
            link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO");
            link.WhereClause.AddParameter("OPORTUNIDADE", op.Handle.Value);
            link.WhereClause.AddParameter("VERSAO", op.Fields["VERSAO"].ToString());
            link.IsModalPage = true;
            link.Url = @"~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeProdEscopo.aspx";

            string url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link);
            var size = Benner.Tecnologia.Common.Components.CommandModalSize.Large;
            var widgetIdToRefresh = "ctl00$Main$ActionView2";

            //Page.ShowModalOrRedirect(Benner.Tecnologia.Wes.Components.UriBuilder.Create(link));
            Page.ShowModal(url, size, widgetIdToRefresh);

            //ActionView2.
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "javascript:__doPostBack('ctl00$Main$K_PRODUTOS$SimpleGrid','Select$0')", addScriptTags: true);
        }
    }

    private void K_PRODUTOS_DataLoaded(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PnlGridProdutosEscopoPadrao.Attributes["style"] = "display: none;";
        } 
        if (K_PRODUTOS.DataSource.Count > 0)
        {
            PnlEscopoProdutos.Visible = true;
        }
    }

    private void K_PRODUTOS_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "cmdVoltarOportunidade")
        {
            var oportunidade = CrmPessoaOportunidades.Get(this.K_PRODUTO.ProviderWidget.GetEntity().Handle);

            if (oportunidade.Modalidade.Instance != null)
            {
                var modalidade = oportunidade.Modalidade.Instance;
                if (modalidade.Lu == true || modalidade.Lum == true || modalidade.Locacao == true)
                {
                    Session["etapa_atual"] = "2";
                    Response.Redirect(Request.RawUrl);
                    //CurrentStep.Value = "2";
                }
                else
                {
                    Session["etapa_atual"] = "1";
                    Response.Redirect(Request.RawUrl);
                    //CurrentStep.Value = "1";
                }
            }
        }
        else if (e.Command.Name == "cmdGoAdicionais")
        {
            ActionView3.ForceUpdate();
            Session["etapa_atual"] = "4";
            Response.Redirect(Request.RawUrl);
            //CurrentStep.Value = "4";
        }
        else if(e.Command.Name == "Select" && null != e.Entity)
        {
            if (IsPostBack)
            {
                var produto = CrmPessoaOportunidadesProd.Get(e.Entity.Handle);

                if (null == produto.EscopoPadrao)
                    throw new BusinessException("Para visualizar os dados do Escopo deste produto, clique no botão 'Capa Escopo' e defina alguns pré-requisitos essenciais antes de começar os lançamentos.");

                Criteria crit = new Criteria("A.PESSOA = :PESSOA AND A.VERTICAL = :VERTICAL");
                crit.Parameters.Add("PESSOA", produto.Oportunidade.Instance.Pessoa.Instance.Codigo);
                crit.Parameters.Add("VERTICAL", produto.Oportunidade.Instance.Vertical.Handle.Value);
                crit.CompanyFilterMode = CompanyFilterMode.None;

                var vertical = CrmPessoaVertical.Get(crit);

                var subfaseCliente = vertical.Subfase.Instance.Nome == "Cliente" ? true : false;
                var revenda = produto.Oportunidade.Instance.Filial.Instance.Fields["K_EHREVENDA"].ToBoolean();

                AdicionarColunasAoGridSomenteLeitura(subfaseCliente, produto.EscopoPadrao.Value, revenda);

                if (produto.EscopoPadrao == true)
                {
                    PnlGridProdutosEscopoPadrao.Attributes.Remove("style");
                    BtnAdicionarLinha.Visible = false;
                    GridEscopoPadrao.Visible = true;

                    var retorno = CrmPessoaOportunidadesDao.CreateInstance().RetornaDadosEscopoPadrao(new EscopoOportunidadeResponseModel(), produto.Oportunidade.Instance, produto, produto.Handle.IsValid()); //CrmPessoaOportunidadesFuncoes.RetornaDadosEscopoPadrao(new EscopoOportunidadeResponseModel(), produto.Oportunidade.Instance, produto, produto.Handle.IsValid());

                    GridEscopoPadrao.DataSource = retorno.EscopoPadrao;
                    GridEscopoPadrao.DataBind();

                    var entities = new Entities<EntityBase>();
                    EntityBase entity = new EntityBase();

                    decimal total = retorno.EscopoPadrao.Sum(recurso =>
                    {
                        string valorString = recurso.TotalServico.Replace("R$ ", "").Replace(".", "").Replace(",", ".");
                        return decimal.Parse(valorString, CultureInfo.InvariantCulture);
                    });

                    string totalFormatado = "R$ " + total.ToString("N2", CultureInfo.GetCultureInfo("pt-BR"));

                    entity.Fields.Add("Descricao", "Total de Serviço de Implantação");
                    entity.Fields.Add("Horas", retorno.EscopoPadrao.Sum(x => Convert.ToInt64(x.Horas)).ToString());
                    entity.Fields.Add("ValorHora", "");
                    entity.Fields.Add("ValorTotal", totalFormatado);

                    entities.Add(entity);

                    if (produto.Fields["IRACOBRAGERPROJ"].ToBoolean())
                    {
                        decimal? valorHoraGerencia = ((retorno.EscopoPadrao.Sum(x => Convert.ToInt64(x.Horas)) * produto.Gerenciamentoprojeto) / 100);
                        decimal? valorTotalGerencia = decimal.Parse(retorno.ValorHoraGerencia.Replace("R$ ", "").Replace(".", "").Replace(",", "."), CultureInfo.InvariantCulture);
                        
                        entity = new EntityBase();
                        entity.Fields.Add("Descricao", "Total de Gerenciamento de Projeto");
                        entity.Fields.Add("Horas", valorHoraGerencia.ToString());
                        entity.Fields.Add("ValorHora", retorno.ValorHoraGerencia);
                        entity.Fields.Add("ValorTotal", string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal((valorHoraGerencia * valorTotalGerencia))));

                        entities.Add(entity);

                        entity = new EntityBase();
                        entity.Fields.Add("Descricao", "Total");
                        entity.Fields.Add("Horas", (valorHoraGerencia + retorno.EscopoPadrao.Sum(x => Convert.ToInt64(x.Horas))).ToString());
                        entity.Fields.Add("ValorHora", "");
                        entity.Fields.Add("ValorTotal", string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal((valorHoraGerencia * valorTotalGerencia) + total)));

                        entities.Add(entity);
                    }

                    GridViewTotais.DataSource = entities;
                    GridViewTotais.DataBind();
                }
                else
                {
                    if(produto.Oportunidade.Instance.Ativo == true)
                        BtnAdicionarLinha.Visible = false;
                    //else
                    //    BtnAdicionarLinha.Visible = true;

                    PnlGridProdutosEscopoPadrao.Attributes.Remove("style");
                    GridEscopoPadrao.Visible = true;

                    var escopoSalvo = new BuscaOportunidadeProdutoRequestModel()
                    {
                        Oportunidade = produto.Oportunidade.Handle.Value.ToString(),
                        HandleProduto = produto.Handle.Value.ToString()
                    };

                    var response = JsonConvert.DeserializeObject<RetornoJSONPadraoApi>(new CrmPessoaOportunidadesController().GetEscopoPersonalizado(escopoSalvo));
                    BindEscopo retorno = JsonConvert.DeserializeObject<BindEscopo>(response.message);

                    var dataSource = new Entities<EntityBase>();

                    double totalHoras = 0;
                    double valorTotal = 0;

                    foreach(var item in retorno.BindPersonalizados)
                    {
                        var entity = new EntityBase();

                        entity.Fields.Add("Produto", produto.Produto.Instance.Nome);
                        entity.Fields.Add("Escopo", item.Atividade);

                        if (subfaseCliente && !revenda)
                        {
                            entity.Fields.Add("Contrato", item.Contrato);
                            entity.Fields.Add("RecursoContrato", item.RecursoContrato);
                        }
                        else
                        {
                            entity.Fields.Add("Recurso", item.Recurso);
                        }

                        totalHoras += Convert.ToDouble(item.Horas);
                        valorTotal += (Convert.ToDouble(item.Horas) * item.ValorHora);

                        entity.Fields.Add("Horas", item.Horas);
                        entity.Fields.Add("ValorHora", string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", item.ValorHora)); 
                        entity.Fields.Add("TotalServico", string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDouble(item.Horas) * item.ValorHora));
                        
                        dataSource.Add(entity);
                    }

                    GridEscopoPadrao.DataSource = dataSource;
                    GridEscopoPadrao.DataBind();

                    var entities = new Entities<EntityBase>();
                    var entityTotais = new EntityBase();

                    string totalFormatado = "R$ " + valorTotal.ToString("N2", CultureInfo.GetCultureInfo("pt-BR"));

                    entityTotais.Fields.Add("Descricao", "Total de Serviço de Implantação");
                    entityTotais.Fields.Add("Horas", totalHoras);
                    entityTotais.Fields.Add("ValorHora", "");
                    entityTotais.Fields.Add("ValorTotal", totalFormatado);

                    entities.Add(entityTotais);

                    if (produto.Fields["IRACOBRAGERPROJ"].ToBoolean())
                    {
                        Criteria crit2 = new Criteria("A.FILIAL = :FILIAL AND A.TIPORECURSO IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOS WHERE GERENCIAPROJETO = 'S' AND VIGENCIA IN (SELECT HANDLE FROM K_CRM_TIPOSRECURSOSVIGENCIA WHERE DATAINICIO<=GETDATE() AND DATAFIM>=GETDATE()))");
                        crit2.Parameters.Add("FILIAL", produto.Oportunidade.Instance.Filial.Handle.Value);
                        crit2.CompanyFilterMode = CompanyFilterMode.None;
                        CrmTiposRecursosFiliais recurso = CrmTiposRecursosFiliais.GetFirstOrDefault(crit2);

                        decimal? totalHorasGerencia = ((produto.Gerenciamentoprojeto/100) * Convert.ToDecimal(totalHoras));
                        decimal? valorTotalGerencia = null != recurso ? recurso.ValorHora : 0;

                        entityTotais = new EntityBase();
                        entityTotais.Fields.Add("Descricao", "Total de Gerenciamento de Projeto");
                        entityTotais.Fields.Add("Horas", totalHorasGerencia);
                        entityTotais.Fields.Add("ValorHora", string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", valorTotalGerencia));
                        entityTotais.Fields.Add("ValorTotal", string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal((totalHorasGerencia * valorTotalGerencia))));

                        entities.Add(entityTotais);

                        entityTotais = new EntityBase();
                        entityTotais.Fields.Add("Descricao", "Total");
                        entityTotais.Fields.Add("Horas", (totalHorasGerencia + Convert.ToDecimal(totalHoras)));
                        entityTotais.Fields.Add("ValorHora", "");
                        entityTotais.Fields.Add("ValorTotal", string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:C}", Convert.ToDecimal((totalHorasGerencia * valorTotalGerencia) + Convert.ToDecimal(valorTotal))));

                        entities.Add(entityTotais);
                    }

                    GridViewTotais.DataSource = entities;
                    GridViewTotais.DataBind();
                }

                UpdPnlGridProdutos.UpdateMode = UpdatePanelUpdateMode.Conditional;
                UpdPnlGridProdutos.Update();
            }
            else
            {
                GridEscopoPadrao.Visible = false;
                UpdPnlGridProdutos.UpdateMode = UpdatePanelUpdateMode.Conditional;
                UpdPnlGridProdutos.Update();
            }
        }
        else if(e.Command.Name == "CmdIncluirHoras")
        {
            var link = new FormLinkDefinition();
            link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
            link.IsModalPage = true;
            link.Parameters.Add("HANOPORTUNIDADEPROD", K_PRODUTOS.GetEntity().Handle.Value);
            link.Url = "~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeEscopoCustomizado.aspx";

            string url = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0}", Benner.Tecnologia.Wes.Components.UriBuilder.Create(link));
            var size = CommandModalSize.FullPage;
            var widgetIdToRefresh = "ctl00$Main$ActionView2";

            Page.ShowModal(url, size, widgetIdToRefresh);
        }
        else if (e.Command.Name == "CmdEscopoDoProduto")
        {
            var op = K_PRODUTOS.ProviderWidget.GetEntity();
            var prod = e.Entity;
            var link = new FormLinkDefinition();
            link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
            link.TargetEntityDefinitionName = "K_CRM_VT_PO_ESCOPO";
            link.TargetFormMode = FormLinkDefinition.FormMode.Insert;
            link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.PRODUTO = :PRODUTO AND A.IRACOBRARGERPROJ = :IRACOBRARGERPROJ AND A.QTDHORASGERPROJ = :QTDHORASGERPROJ A.ESCOPOPADRAO = :ESCOPOPADRAO");
            //link.WhereClause = new WhereClause("A.OPORTUNIDADE = :OPORTUNIDADE AND A.VERSAO = :VERSAO AND A.PRODUTO = :PRODUTO AND A.IRACOBRARGERPROJ = :IRACOBRARGERPROJ");
            link.WhereClause.AddParameter("OPORTUNIDADE", op.Handle.Value);
            link.WhereClause.AddParameter("VERSAO", prod.Fields["VERSAO"].ToString());
            link.WhereClause.AddParameter("PRODUTO", prod.Handle.Value);
            link.WhereClause.AddParameter("IRACOBRARGERPROJ", prod.Fields["IRACOBRAGERPROJ"]);
            link.WhereClause.AddParameter("QTDHORASGERPROJ", prod.Fields["QTDHORASGERPROJ"].ToString());
            link.WhereClause.AddParameter("ESCOPOPADRAO", prod.Fields["ESCOPOPADRAO"]);
            link.IsModalPage = true;
            link.Url = @"~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeProdEscopo.aspx";

            string url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link);
            var size = Benner.Tecnologia.Common.Components.CommandModalSize.Large;
            var widgetIdToRefresh = "ctl00$Main$ActionView2";

            //Page.ShowModalOrRedirect(Benner.Tecnologia.Wes.Components.UriBuilder.Create(link));
            Page.ShowModal(url, size, widgetIdToRefresh);
        }

        K_VALORSERVIO.ForceUpdate();
        ActionView2.ForceUpdate();
        K_PRODUTOS.ForceUpdate();
    }

    private void K_DATACENTER_RowCommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        ActionView1.ForceUpdate();
        K_PRODUTO.ForceUpdate();
        K_ITENS.ForceUpdate();
    }

    private void K_ITENS_DataLoaded(object sender, EventArgs e)
    {      
        if (null == K_PRODUTO.DataSource)
        {
            K_DATACENTER.ForceUpdate();
        }
    }

    private void K_ITENS_RowCommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        ActionView1.ForceUpdate();
        K_PRODUTO.ForceUpdate();
        K_DATACENTER.ForceUpdate();
    }

    private void K_DATACENTER_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        ActionView1.ForceUpdate();
        K_PRODUTO.ForceUpdate();
        K_ITENS.ForceUpdate();
    }

    private void K_ITENS_CommandExecuted1(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "cmdVoltarProdutos")
        {
            this.K_PRODUTO.ForceUpdate();
        }
        else if (e.Command.Name == "cmdAdicionarEscopo")
        {
            Session["etapa_atual"] = "3";
            Response.Redirect(Request.RawUrl);
            //CurrentStep.Value = "3";
        }

        ActionView1.ForceUpdate();
        K_PRODUTO.ForceUpdate();
        K_DATACENTER.ForceUpdate();
    }

    private void K_NOVAOPORTUNIDADE_CommandExecuted1(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == "Save" || e.CommandName == "SaveNew")
        {
            this.K_PRODUTO.ForceUpdate();

        }
        else if (e.CommandName == "cmdEtapa1Oportunidade")
        {
            var oportunidade = this.K_NOVAOPORTUNIDADE.GetEntity() as CrmPessoaOportunidades;
            EntityAssociation<CrmModalidades> modalidade = oportunidade.Modalidade;

            if (modalidade.Association.Instance.Fields["LU"].ToBoolean() == true || modalidade.Association.Instance.Fields["LUM"].ToBoolean() == true || modalidade.Association.Instance.Fields["LOCACAO"].ToBoolean() == true)
            {
                Session["etapa_atual"] = "2";
                Response.Redirect(Request.RawUrl);
                //CurrentStep.Value = "2";
            }
            else if (modalidade.Association.Instance.Fields["ESCOPO"].ToBoolean() == true)
            {
                Session["etapa_atual"] = "3";
                Response.Redirect(Request.RawUrl);
                //CurrentStep.Value = "3";
            }
            else
            {
                Session["etapa_atual"] = "1";
                Response.Redirect(Request.RawUrl);
                //CurrentStep.Value = "1";
            }
        }
        else if (e.CommandName == "cmdAdicionarEscopo")
        {
            Session["etapa_atual"] = "3";
            Response.Redirect(Request.RawUrl);
            //CurrentStep.Value = "3";
        }

        //if (e.CommandName != "cmdAdicionarEscopo" && e.CommandName != "cmdEtapa1Oportunidade" && e.CommandName != "Edit")
        //    Response.Redirect(Request.RawUrl);
    }

    private void K_PRODUTO_CommandExecuted1(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "cmdVoltarOportunidade")
        {
            Session["etapa_atual"] = "1";
            Response.Redirect(Request.RawUrl);
            //CurrentStep.Value = "1";
        }
        else if (e.Command.Name == "cmdGoAdicionais")
        {
            var oportunidade = CrmPessoaOportunidades.Get(this.K_NOVAOPORTUNIDADE.GetEntity().Handle);
            if(oportunidade.Modalidade.Instance != null)
            {
                var modalidade = oportunidade.Modalidade.Instance;
                if(modalidade.Escopo == true)
                {
                    Session["etapa_atual"] = "3";
                    Response.Redirect(Request.RawUrl);
                    ActionView2.ForceUpdate();
                    K_PRODUTOS.ForceUpdate();
                    //CurrentStep.Value = "3";
                }
                else
                {
                    Session["etapa_atual"] = "4";
                    Response.Redirect(Request.RawUrl);
                    ActionView3.ForceUpdate();
                    //CurrentStep.Value = "4";
                }
            }
        }
        else if (e.Command.Name == "cmdEditCustom")
        {
            this.K_PRODUTO.DisplayCommandExecutedDefaultMessage = false;
        }

        ActionView1.ForceUpdate();
        K_ITENS.ForceUpdate();
        K_DATACENTER.ForceUpdate();
    }

    protected void GridViewTotais_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Verifica se é a última linha
            if (e.Row.RowIndex > 1 && e.Row.RowIndex == GridViewTotais.Rows.Count )
            {
                // Aplica o estilo negrito
                e.Row.Font.Bold = true;
            }
        }
    }

    protected void BtnAdicionarLinha_Click(object sender, EventArgs e)
    {
        K_PRODUTOS.DataLoad();

        var link = new FormLinkDefinition();
        link.TargetSystemInstanceName = BennerContext.Administration.BServerSystemName;
        link.IsModalPage = true;
        link.Parameters.Add("HANOPORTUNIDADEPROD", K_PRODUTOS.GetEntity().Handle.Value);
        link.Url = "~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeEscopoCustomizado.aspx";

        string url = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0}", Benner.Tecnologia.Wes.Components.UriBuilder.Create(link));
        var size = CommandModalSize.FullPage;
        var widgetIdToRefresh = "ctl00$Main$ActionView2";

        Page.ShowModal(url, size, widgetIdToRefresh);

        UpdPnlGridProdutos.UpdateMode = UpdatePanelUpdateMode.Conditional;
        UpdPnlGridProdutos.Update();
    }

    private void AdicionarColunasAoGridSomenteLeitura(bool cliente, bool padrao, bool revenda)
    {
        while (GridEscopoPadrao.Columns.Count > 0)
        {
            GridEscopoPadrao.Columns.RemoveAt(0);
        }

        if (padrao)
        {
            BoundField itemColumn = new BoundField();
            itemColumn.HeaderText = "ITEM";
            itemColumn.DataField = "Item";
            GridEscopoPadrao.Columns.Add(itemColumn);

            BoundField atividadeColumn = new BoundField();
            atividadeColumn.HeaderText = "ATIVIDADE";
            atividadeColumn.DataField = "Escopo";
            GridEscopoPadrao.Columns.Add(atividadeColumn);

            BoundField recursoColumn = new BoundField();
            recursoColumn.HeaderText = "RECURSO";
            recursoColumn.DataField = "Recurso";
            GridEscopoPadrao.Columns.Add(recursoColumn);

            BoundField filialColumn = new BoundField();
            filialColumn.HeaderText = "FILIAL";
            filialColumn.DataField = "Filial";
            GridEscopoPadrao.Columns.Add(filialColumn);
        }
        else
        {
            BoundField produtoColumn = new BoundField();
            produtoColumn.HeaderText = "PRODUTO";
            produtoColumn.DataField = "Produto";
            GridEscopoPadrao.Columns.Add(produtoColumn);

            BoundField atividadeColumn = new BoundField();
            atividadeColumn.HeaderText = "ATIVIDADE";
            atividadeColumn.DataField = "Escopo";
            GridEscopoPadrao.Columns.Add(atividadeColumn);

            if (cliente && !revenda)
            {
                BoundField contratoColumn = new BoundField();
                contratoColumn.HeaderText = "CONTRATO";
                contratoColumn.DataField = "Contrato";
                GridEscopoPadrao.Columns.Add(contratoColumn);

                BoundField recursoContratoColumn = new BoundField();
                recursoContratoColumn.HeaderText = "RECURSO";
                recursoContratoColumn.DataField = "RecursoContrato";
                GridEscopoPadrao.Columns.Add(recursoContratoColumn);
            }
            else
            {
                BoundField recursoColumn = new BoundField();
                recursoColumn.HeaderText = "RECURSO";
                recursoColumn.DataField = "Recurso";
                GridEscopoPadrao.Columns.Add(recursoColumn);
            }
        }

        BoundField horasColumn = new BoundField();
        horasColumn.HeaderText = "HORAS";
        horasColumn.DataField = "Horas";
        GridEscopoPadrao.Columns.Add(horasColumn);

        BoundField valorHoraColumn = new BoundField();
        valorHoraColumn.HeaderText = "VALOR HORA";
        valorHoraColumn.DataField = "ValorHora";
        GridEscopoPadrao.Columns.Add(valorHoraColumn);

        BoundField totalColumn = new BoundField();
        totalColumn.HeaderText = "TOTAL";
        totalColumn.DataField = "TotalServico";
        GridEscopoPadrao.Columns.Add(totalColumn);
    }

    //public static string RenderViewToString(string viewName, object model)
    //{
    //    var httpContext = new HttpContextWrapper(HttpContext.Current);
    //    var controllerContext = new ControllerContext(new RequestContext(httpContext, new RouteData()), new FakeController());

    //    var razorViewEngine = new RazorViewEngine();
    //    var viewResult = razorViewEngine.FindView(controllerContext, viewName, "", false);

    //    using (var sw = new StringWriter())
    //    {
    //        var viewContext = new ViewContext(controllerContext, viewResult.View, new ViewDataDictionary(model), new TempDataDictionary(), sw);
    //        viewResult.View.Render(viewContext, sw);

    //        return sw.ToString();
    //    }
    //}
}
//public class FakeController : Controller { }

public class RetornoJSONPadraoApi
{
    public string status { get; set; }
    public int code { get; set; }
    public string message { get; set; }
}