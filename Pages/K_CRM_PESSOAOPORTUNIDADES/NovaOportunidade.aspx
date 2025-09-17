<%@ Page Title="Nova Oportunidade" Language="C#" CodeFile="~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidade.aspx.cs"
    Inherits="K_CRM_PESSOAOPORTUNIDADESNovaOportunidadePage" %>

    <%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp"
        TagPrefix="wes" %>
        <%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components"
            TagPrefix="wes" %>

            <asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
                <asp:updatepanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
                    <contenttemplate>
                        <asp:hiddenfield runat="server" id="CurrentStep" value="1" clientidmode="Static" />
                    </contenttemplate>
                </asp:updatepanel>
                <div class="portlet light" id="form_wizard">
                    <div class="portlet-body form">
                        <div class="form-wizard">
                            <div class="form-body">
                                <ul class="nav nav-pills nav-justified steps">
                                    <li><a data-toggle="tab" class="step" href="#tab1"><span
                                                class="number">1</span><span class="desc"><i
                                                    class="fa fa-check"></i>Oportunidade</span></a></li>
                                    <li><a data-toggle="tab" class="step" href="#tab2"><span
                                                class="number">2</span><span class="desc"><i
                                                    class="fa fa-check"></i>Produtos</span></a></li>
                                    <li><a data-toggle="tab" class="step" href="#tab3"><span
                                                class="number">3</span><span class="desc"><i
                                                    class="fa fa-check"></i>Serviços</span></a></li>
                                    <li><a data-toggle="tab" class="step" href="#tab4"><span
                                                class="number">4</span><span class="desc"><i
                                                    class="fa fa-check"></i>Adicionais</span></a></li>
                                    <li><a data-toggle="tab" class="step" href="#tab5"><span
                                                class="number">5</span><span class="desc"><i
                                                    class="fa fa-check"></i>Conclusão</span></a></li>
                                </ul>
                                <div id="bar" class="progress progress-striped" role="progressbar">
                                    <div class="progress-bar progress-bar-success"></div>
                                </div>
                                <%--<% 
                var controller = new Controllers.Crm.CrmPessoaOportunidadesController();
                System.Web.Mvc.ActionResult tiles = controller.TilesValorModalidade();
                ViewResult viewResult = tiles as ViewResult;

                if (viewResult != null)
                {
                    string renderedView = RenderViewToString(viewResult.ViewName,viewResult.View);
                    Response.Write(renderedView);
                }
            %>--%>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab1">
                                        <div class="row">
                                            
                                            <wes:ActionView runat="server" ID="K_TABELASDEPRECO"
                                                Title="Tabelas de Preço" Subtitle="" PortletCssClass=""
                                                PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false"
                                                ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE" ChromeState="Fixed"
                                                Controller="CrmPessoaOportunidades" Action="TilesValorModalidade"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="5" />
                                            <%--<%Session["TILESVALORMODALIDADE"] = K_TABELASDEPRECO; %>--%>
                                            <wes:AjaxForm runat="server" ID="K_NOVAOPORTUNIDADE"
                                                Title="Nova Oportunidade" Subtitle="" PortletCssClass=""
                                                PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false"
                                                ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False"
                                                CanUpdate="True" CanInsert="True"
                                                EntityViewName="K_CRM_PESSOAOPORTUNIDADES.NOVAOPORTUNIDADE.FORM"
                                                FormMode="None" IncludeRecordInRecentItems="True"
                                                UserDefinedCommandsVisible="True"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="10" />
                                            <wes:SimpleGrid runat="server" ID="K_TAREFAS" Title="Histórico" Subtitle=""
                                                PortletCssClass="" PortletLayout="Default" BootstrapCols="12"
                                                FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE"
                                                ChromeState="Fixed" CanDelete="False" CanUpdate="False"
                                                CanInsert="False" EntityViewName="K_CRM_TAREFAUSUARIO.OPORTUNIDADE.GRID"
                                                Mode="None" UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10" SystemFilterOnly="False"
                                                DisplayRowCommand="False" CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause="A.RESPOSTAOPORTUNIDADE = @CAMPO(HANDLE)"
                                                FormUrl="~/Pages/K_CRM_TAREFAUSUARIO/form.aspx" ShowExport="True"
                                                UserDefinedDisableRowSelection="False"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="121" />
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab2">
                                        <div class="row">
                                            <%--<% K_TABELASDEPRECO.RenderControl(); %>--%>
                                            <wes:ActionView runat="server" ID="ActionView1" Title="Tabelas de Preço"
                                                Subtitle="" PortletCssClass="" PortletLayout="Default"
                                                BootstrapCols="12" FontIcon="" ShowTitle="false"
                                                ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE" ChromeState="Fixed"
                                                Controller="CrmPessoaOportunidades" Action="TilesValorModalidade"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="5" />
                                            <wes:SimpleGrid runat="server" ID="K_PRODUTO" Title="Produtos" Subtitle=""
                                                PortletCssClass="" PortletLayout="Default" BootstrapCols="12"
                                                FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE"
                                                ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True"
                                                EntityViewName="K_CRM_PESSOAOPORTUNIDADESPROD.NOVAOPORTUNIDADE.GRID"
                                                Mode="None" UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10" SystemFilterOnly="False"
                                                DisplayRowCommand="True" CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause="A.STATUS IN (3) AND A.OPORTUNIDADE = @CAMPO(HANDLE) AND A.VERSAO = @CAMPO(VERSAO)"
                                                FormUrl="~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeProd.aspx"
                                                ShowExport="True" UserDefinedDisableRowSelection="False"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="16" />
                                            <wes:SimpleGrid runat="server" ID="K_ITENS" Title="Itens" Subtitle=""
                                                PortletCssClass="" PortletLayout="Default" BootstrapCols="12"
                                                FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_PRODUTO"
                                                ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True"
                                                EntityViewName="K_CRM_PESSOAOPORTUNIDADESITENS.NOVAOPORTUNIDADE.GRID"
                                                Mode="None" UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10" SystemFilterOnly="False"
                                                DisplayRowCommand="True" CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause="A.PRODUTO= @CAMPO(HANDLE) AND A.OPORTUNIDADE = @CAMPO(OPORTUNIDADE) AND A.VERSAO = @CAMPO(VERSAO) "
                                                FormUrl="~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeItem.aspx"
                                                ShowExport="True" UserDefinedDisableRowSelection="False"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="30" />
                                            <wes:SimpleGrid runat="server" ID="K_DATACENTER" Title="Data Center"
                                                Subtitle="" PortletCssClass="" PortletLayout="Default"
                                                BootstrapCols="12" FontIcon="" ShowTitle="true"
                                                ProviderWidgetUniqueId="K_PRODUTO" ChromeState="Fixed" CanDelete="True"
                                                CanUpdate="True" CanInsert="True"
                                                EntityViewName="K_CRM_PO_SAAS.NOVAOPORTUNIDADE.GRID" Mode="None"
                                                UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10"
                                                SystemFilterOnly="False" DisplayRowCommand="True"
                                                CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(HANDLE) AND A.OPORTUNIDADE = @CAMPO(OPORTUNIDADE) AND A.VERSAO = @CAMPO(VERSAO)"
                                                FormUrl="~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeSaas.aspx"
                                                ShowExport="True" UserDefinedDisableRowSelection="False"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="57" />
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab3">
                                        <div class="row">
                                            <wes:ActionView runat="server" ID="ActionView2" Title="Tabelas de Preço"
                                                Subtitle="" PortletCssClass="" PortletLayout="Default"
                                                BootstrapCols="12" FontIcon="" ShowTitle="false"
                                                ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE" ChromeState="Fixed"
                                                Controller="CrmPessoaOportunidades" Action="TilesValorModalidade"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="5" />
                                            <wes:SimpleGrid runat="server" ID="K_PRODUTOS" Title="Produtos"
                                                Subtitle="Escopo por Produto" PortletCssClass="" PortletLayout="Default"
                                                BootstrapCols="12" FontIcon="" ShowTitle="true"
                                                ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE" ChromeState="Fixed"
                                                CanDelete="True" CanUpdate="True" CanInsert="True"
                                                EntityViewName="K_CRM_PESSOAOPORTUNIDADESPROD.NOVAOP_SERV.GRID"
                                                Mode="None" UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10" SystemFilterOnly="False"
                                                DisplayRowCommand="True" CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause="A.OPORTUNIDADE = @CAMPO(HANDLE) AND A.VERSAO = @CAMPO(VERSAO)"
                                                ShowExport="True" UserDefinedDisableRowSelection="False"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="121" />
                                            <wes:ActionView runat="server" ID="K_VALORSERVIO" Title="Serviços"
                                                Subtitle="" PortletCssClass="" PortletLayout="Default"
                                                BootstrapCols="12" FontIcon="" ShowTitle="false"
                                                ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE" ChromeState="Fixed"
                                                Controller="CrmPessoaOportunidades" Action="Servicos"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="70" />
                                            <asp:Panel ID="PnlEscopoProdutos" runat="server" Visible="False">
                                                <div class="col-md-12">
                                                    <div class="portlet">
                                                        <asp:UpdatePanel ID="UpdPnlGridProdutos" runat="server"
                                                            ChildrenAsTriggers="true">
                                                            <ContentTemplate>
                                                                <asp:LinkButton ID="BtnEscopoProdutos" runat="server"
                                                                    CssClass="btn btn-action green-seagreen">
                                                                    <i class="fa icon-target btn-action"></i>Capa Escopo
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="BtnAdicionarLinha" runat="server"
                                                                    OnClick="BtnAdicionarLinha_Click"
                                                                    CssClass="btn btn-action green-haze"
                                                                    Visible="false">
                                                                    <i
                                                                        class="fa fa-list-alt btn-action"></i>Customização
                                                                </asp:LinkButton>
                                                                <asp:Panel ID="PnlGridProdutosEscopoPadrao"
                                                                    runat="server">
                                                                    <div class="table-responsive table-scrollable">
                                                                        <asp:GridView ID="GridEscopoPadrao"
                                                                            runat="server" CssClass="table table-hover"
                                                                            AutoGenerateColumns="False" Visible="False"
                                                                            GridLines="None">
                                                                            <Columns>

                                                                            </Columns>
                                                                        </asp:GridView>
                                                                        <asp:GridView ID="GridViewTotais" runat="server"
                                                                            CssClass="table table-hover"
                                                                            AutoGenerateColumns="False" GridLines="None"
                                                                            OnRowDataBound="GridViewTotais_RowDataBound">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="Descricao"
                                                                                    HeaderText="TOTAIS"
                                                                                    ItemStyle-Width="65%" />
                                                                                <asp:BoundField DataField="Horas"
                                                                                    HeaderText="Horas"
                                                                                    ItemStyle-Width="10%" />
                                                                                <asp:BoundField DataField="ValorHora"
                                                                                    HeaderText="Valor Hora (R$)"
                                                                                    ItemStyle-Width="10%" />
                                                                                <asp:BoundField DataField="ValorTotal"
                                                                                    HeaderText="Valor Total (R$)"
                                                                                    ItemStyle-Width="15%" />
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </asp:Panel>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab4">
                                        <div class="row">
                                            <wes:ActionView runat="server" ID="ActionView3" Title="Tabelas de Preço"
                                                Subtitle="" PortletCssClass="" PortletLayout="Default"
                                                BootstrapCols="12" FontIcon="" ShowTitle="false"
                                                ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE" ChromeState="Fixed"
                                                Controller="CrmPessoaOportunidades" Action="TilesValorModalidade"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="5" />
                                            <wes:SimpleGrid runat="server" ID="K_CONSIDERAESADICIONAIS"
                                                Title="Considerações Adicionais" Subtitle="" PortletCssClass=""
                                                PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true"
                                                ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE" ChromeState="Fixed"
                                                CanDelete="True" CanUpdate="True" CanInsert="True"
                                                EntityViewName="K_CRM_PO_ADICIONAL.GRID" Mode="None"
                                                UserDefinedCriteriaWhereClause="A.OPORTUNIDADE = @CAMPO(HANDLE) AND A.VERSAO = @CAMPO(VERSAO)"
                                                UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10"
                                                SystemFilterOnly="False" DisplayRowCommand="True"
                                                CompanyFilterMode="OnlyCompany"
                                                FormUrl="~/Pages/KCrmPoAdicional/Form.aspx" ShowExport="True"
                                                UserDefinedDisableRowSelection="False"
                                                PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                                Order="141" />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab5">
                                    <div class="row">
                                        <wes:ActionView runat="server" ID="K_FECHAMENTO" Title="Fechamento" Subtitle=""
                                            PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon=""
                                            ShowTitle="false" ProviderWidgetUniqueId="K_NOVAOPORTUNIDADE"
                                            ChromeState="Fixed" Controller="CrmPessoaOportunidades" Action="Conclusao"
                                            PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADE" Level="50"
                                            Order="80" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <script type="text/javascript">

                    $(function () {
                        $('#form_wizard').bootstrapWizard({
                            onTabClick: function (tab, navigation, index, clickedIndex) {
                                return false;
                            },
                            onNext: function (tab, navigation, index) {
                            },
                            onPrevious: function (tab, navigation, index) {
                            },
                            onTabShow: function (tab, navigation, index) {
                                var total = navigation.find('li').length;
                                var current = index + 1;
                                var $percent = (current / total) * 100;
                                $('#form_wizard').find('.progress-bar').css({
                                    width: $percent + '%'
                                });
                            }
                        });

                        //selectCurrentStep = function () {
                        //    var currentStep = $("#CurrentStep").val();
                        //    $('[href="#tab' + currentStep + '"]').tab('show');
                        //};
                        selectCurrentStep = function () {
                            var currentStep = $("#CurrentStep").val();
                            if (null != "<%= Session["etapa_atual"] %>" && "" != "<%= Session["etapa_atual"] %>" && currentStep != "4") {
                                currentStep = "<%= Session["etapa_atual"] %>";
                                $('[href="#tab' + currentStep + '"]').tab('show');
                            }
                            else {
                                $('[href="#tab' + currentStep + '"]').tab('show');
                            }
                        };

                        var prm = Sys.WebForms.PageRequestManager.getInstance();
                        if (!prm.get_isInAsyncPostBack()) {
                            prm.add_endRequest(function (sender, args) {
                                selectCurrentStep();
                            });
                        }

                        selectCurrentStep();
                    });
                    function Voltar() {
                        <% 
                        Session["etapa_atual"] = "1";
                        %>
                        //$('[href="#tab' + 1 + '"]').tab('show');
                        window.location.reload(1);
                    }
                    function VoltarProdutos() {
                        $('[href="#tab' + 2 + '"]').tab('show');
                    }
                    function GoServicos() {
                        $('[href="#tab' + 3 + '"]').tab('show');
                    }
                    function GoSaas() {
                        $('[href="#tab' + 2 + '"]').tab('show');
                    }
                    function GoConclusao() {
                        $('[href="#tab' + 5 + '"]').tab('show');
                    }
                    function GoFechamento() {
                        var currentStep = document.getElementById("CurrentStep");
                        currentStep.value = 4;
                        __doPostBack('ctl00$Main$ActionView3', 'CrmPessoaOportunidades$TilesValorModalidade${ }');
                        $('[href="#tab' + currentStep.value + '"]').tab('show');
                    }

                    //var parentElement = document.getElementById('ctl00_Main_BtnEscopoProdutos');
                    //var bodyElement = document.getElementById('ctl00_Body');

                    //// Função de callback para o evento de clique no elemento pai
                    //function handleParentClick() {

                    //    // Verifica se o elemento possui a classe "modal-open"
                    //    if (bodyElement.classList.contains('modal-open')) {
                    //        console.log('Modal open');
                    //    } else {
                    //        // Verifica se a div ModalCommand_modal existe
                    //        if (document.getElementById('ModalCommand_modal')) {
                    //            console.log('Modal oculto');
                    //        } else {
                    //            console.log('Sem modal');
                    //        }
                    //    }
                    //}

                    //parentElement.addEventListener('click', handleParentClick);

                    //// Cria um observador de mutação
                    //var observer = new MutationObserver(function (mutationsList) {
                    //    for (var mutation of mutationsList) {
                    //        if (mutation.type === 'childList') {
                    //            // Verifica se a div ModalCommand_modal foi adicionada
                    //            if (mutation.addedNodes.length > 0 && (mutation.addedNodes[0].id === 'ModalCommand_modal') ) {
                    //                console.log('Modal adicionado');
                    //                // Faça sua lógica aqui quando a div for adicionada
                    //                // Exemplo: Manipular a div ou executar alguma ação relacionada ao modal
                    //            }
                    //        }
                    //    }
                    //});

                    //// Configura as opções do observador de mutação
                    //var observerConfig = { childList: true };

                    //// Inicia a observação do elemento pai
                    //observer.observe(bodyElement, observerConfig);


                    //// Seletor do elemento pai que já existe na página
                    //var parentElement = document.getElementById('ctl00_Main_BtnEscopoProdutos');

                    //// Função de callback para o evento de clique no elemento pai
                    //function handleParentClick(event) {
                    //    // Obtém o elemento <body> pelo ID
                    //    var bodyElement = document.getElementById('ctl00_Body');

                    //    // Verifica se o elemento possui a classe "modal-open"
                    //    if (bodyElement.classList.contains('modal-open')) {
                    //        console.log('Modal open');
                    //    } else {
                    //        if (document.getElementById('ModalCommand_modal')) {
                    //            console.log('Modal oculto');
                    //        }
                    //        else {
                    //            console.log('Sem modal');
                    //        }
                            
                    //    }

                    //}

                    //parentElement.addEventListener('click', handleParentClick);
                    

                </script>
            </asp:Content>