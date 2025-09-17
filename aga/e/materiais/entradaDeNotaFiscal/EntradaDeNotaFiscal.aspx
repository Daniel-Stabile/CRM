<%@ Page Title="Entrada de nota fiscal" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Materiais.EntradaDeNotaFiscal.EntradaDeNotaFiscal" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:updatepanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:updatepanel>
    <div class="portlet light" id="form_wizard">
        <div class="portlet-body form">
            <div class="form-wizard">
                <div class="form-body">
                    <ul class="nav nav-pills nav-justified steps">
                        <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Fornecedor e pré-recebimento</span></a></li>
                        <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Seleção de O.C., contrato ou apontamento</span></a></li>
                        <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa fa-check"></i>Informações finais da nota</span></a></li>
                    </ul>
                    <div id="bar" class="progress progress-striped" role="progressbar">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="row">
                                <wes:SimpleGrid 
                                    runat="server" 
                                    ID="STEP1_FORNECEDOR_XML"
                                    PortletCssClass="" 
                                    PortletLayout="Default" 
                                    BootstrapCols="12"
                                    ShowTitle="False" 
                                    ProviderWidgetUniqueId="" 
                                    ChromeState="Fixed" 
                                    CanDelete="False" 
                                    CanUpdate="False" 
                                    CanInsert="False" 
                                    EntityViewName="CP_PRERECEBIMENTONFES.ENTRADANOTAFISCAL.GRID" 
                                    DefaultFilterName="Fornecedor" 
                                    Mode="Fixed" 
                                    UserDefinedSelectColumnVisible="True" 
                                    UserDefinedPageSize="10" 
                                    SystemFilterOnly="False" 
                                    DisplayRowCommand="False" 
                                    CompanyFilterMode="OnlyCompany" 
                                    UserDefinedCriteriaWhereClause="A.STATUS &lt;&gt; 6 AND A.TIPO IN (1, 2, 6)" 
                                    ShowExport="False" 
                                    UserDefinedDisableRowSelection="True" 
                                    Level="20" 
                                    Order="10" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <wes:CommandsPanel 
                                        runat="server" 
                                        ID="STEP2_COMANDOS"
                                        PortletLayout="Default" 
                                        BootstrapCols="12" 
                                        ShowTitle="False"
                                        ChromeState="Normal" 
                                        CanDelete="False" 
                                        CanUpdate="False" 
                                        CanInsert="False" 
                                        EntityViewName="CONSULTA_OCS_CONTRATOS_ENTRADA_NOTA_FISCAL.DATASOURCE.COMANDOSPASSO2.GRID" 
                                        VerticalOrientation="False" 
                                        Level="20" 
                                        Order="20"  />
                                </div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <wes:AjaxForm 
                                        runat="server" 
                                        ID="STEP2_PAINEL_INFORMACOES"
                                        PortletLayout="Default" 
                                        BootstrapCols="12"
                                        ShowTitle="False"
                                        ChromeState="Fixed" 
                                        CanDelete="False" 
                                        CanUpdate="False" 
                                        CanInsert="True"
                                        EntityViewName="PD_VTENTRADANOTAFISCAL.PASSO2_FORNECEDOR_NUMERONOTA.FORM" 
                                        FormMode="None" 
                                        IncludeRecordInRecentItems="False" 
                                        UserDefinedCommandsVisible="False"
                                        Level="20" 
                                        Order="30" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="tabbable-custom boxless" style="margin-left: 15px;">
                                    <ul class="nav nav-tabs">
                                        <li class="active">
                                            <a href="#selecionarItens" data-toggle="tab">Selecionar itens</a>
                                        </li>
                                        <li>
                                            <a href="#revisarSelecao" data-toggle="tab">Revisar seleção</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" style:"width: 100%;">
                                        <div class="tab-pane active" id="selecionarItens">
                                            <wes:SimpleGrid
                                                runat="server"
                                                ID="STEP2_ITENS_XML"
                                                Title="Itens NF-e"
                                                PortletLayout="Default"
                                                BootstrapCols="6"
                                                ShowTitle="True"
                                                ChromeState="Fixed"
                                                CanDelete="False"
                                                CanUpdate="False"
                                                CanInsert="False"
                                                EntityViewName="CP_PRERECEBIMENTONFEITENS.SELECIONARITENS_ENTRADA_NF.GRID"
                                                Mode="Search"
                                                UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10" SystemFilterOnly="False"
                                                DisplayRowCommand="False"
                                                CompanyFilterMode="OnlyCompany"
                                                ShowExport="False"
                                                UserDefinedDisableRowSelection="False"
                                                Level="20"
                                                Order="40" />
                                            <wes:SimpleGrid
                                                runat="server"
                                                ID="STEP2_SELECAO_ITENS_OC_CONTRATO"
                                                Title="Entregas O.C., contrato ou apontamento"
                                                PortletLayout="Default"
                                                BootstrapCols="12"
                                                ShowTitle="True"
                                                ChromeState="Fixed"
                                                CanDelete="False"
                                                CanUpdate="False"
                                                CanInsert="False"
                                                EntityViewName="CONSULTA_OCS_CONTRATOS_ENTRADA_NOTA_FISCAL.DATASOURCE.SELECAO_ENTRADANF.GRID"
                                                Mode="Search"
                                                UserDefinedSelectColumnVisible="True"
                                                UserDefinedPageSize="10"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="False"
                                                CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause="A.VARIACAO = @CAMPO(VARIACAO)"
                                                ShowExport="False"
                                                UserDefinedDisableRowSelection="True"
                                                Level="20"
                                                Order="50" />
                                        </div>
                                        <div class="tab-pane" id="revisarSelecao">
                                            <wes:SimpleGrid
                                                runat="server"
                                                ID="STEP2_REVISAO_ITENS_OC_CONTRATO"
                                                Title="Entregas selecionadas"
                                                PortletLayout="Default"
                                                BootstrapCols="12"
                                                ShowTitle="True"
                                                ChromeState="Fixed"
                                                CanDelete="False"
                                                CanUpdate="False"
                                                CanInsert="False"
                                                EntityViewName="CONSULTA_OCS_CONTRATOS_ENTRADA_NOTA_FISCAL.DATASOURCE.REVISAO_ENTRADANF.GRID"
                                                Mode="Search"
                                                UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="True"
                                                CompanyFilterMode="OnlyCompany"
                                                ShowExport="False"
                                                UserDefinedDisableRowSelection="True"
                                                Level="20"
                                                Order="60" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab3">
                            <div class="row">
                                <wes:AjaxForm 
                                    runat="server" 
                                    ID="STEP3_CAPA_FISICO"
                                    PortletLayout="Default" 
                                    BootstrapCols="12"
                                    ShowTitle="False"
                                    ChromeState="Fixed" 
                                    CanDelete="False" 
                                    CanUpdate="False" 
                                    CanInsert="True" 
                                    EntityViewName="CP_RECEBIMENTOFISICOPAI.ENTRADA_NOTA_FISCAL_DADOS_FINAIS.FORM" 
                                    FormMode="None" 
                                    IncludeRecordInRecentItems="False" 
                                    UserDefinedCommandsVisible="True"
                                    Level="20" 
                                    Order="70" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../../../../Content/js/materiais/entradaDeNotaFiscal/EntradaDeNotaFiscal.js"></script>

    <style>
        .editavelQtdeRecebida {
            min-width: 150px !important;
        }

        #STEP2_ITENS_XML .portlet-title {
            height: 65px;
        }

        #STEP2_SELECAO_ITENS_OC_CONTRATO .portlet-title {
            height: 65px;
        }
    </style>
</asp:Content>