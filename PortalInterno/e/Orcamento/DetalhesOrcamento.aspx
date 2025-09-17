<%@ Page Title="Aditivo inclusão de novos itens/objetos" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">

    <script runat="server">
                           
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("ORCAMENTO->ASSINATURAS", "ORCAMENTO", "ASSINATURAS");
            AddWebPartStaticConnection("ORCAMENTO->HISTORICO", "ORCAMENTO", "HISTORICO");         
        }        

    
    </script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }

        #OrcamentoMaster {
            display: none;
        }        
    </style>


    <div class="row">
		<wes:AjaxForm 
            runat="server"
            ID="ORCAMENTO" 
            Title="Orçamento"
            FormMode="View"
            BootstrapCols="12"
            UserDefinedCommandsVisible="True"
            UserDefinedCriteriaWhereClause="" 
            IncludeRecordInRecentItems="False"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            HideDeveloperCommands="True"
            EntityViewName="PORTAL_INT_APROVAR_VERBA_ORCAMENTARIA.FORM"
            PageWidgetHandle="110"  />
	</div>

    <div class="erp-unbox">
        <div class="portlet light">

            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    Title="Detalhes >> Ajuste orçamentário"
                    ID="TITULO" />
            </div>
            <div class="portlet-body">
                <div class="row">
                    <erp:ErpTabControl runat="server" ID="tabControl1" ShowBorder="true" RenderAsPortlet="false">

                        <erp:ErpTab runat="server" ID="tabAssinaturas" Text="Assinaturas">
                             <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="ASSINATURAS"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_PDASSINATURAS.GRID"
                                        UserDefinedCriteriaWhereClause="A.ORCAMENTOAPROVACAO = @CAMPO(HANDLE)"
                                        UserDefinedDisableRowSelection="False"
                                        UserDefinedCommandsVisible="True"
                                        UserDefinedSelectColumnVisible="False"
                                        HideDeveloperCommands="True"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="False"
                                        FilterVisible="False"
                                        SystemFilterOnly="True"
                                        UserDefinedPageSize="10"
                                        Mode="None"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        ShowTitle="False"
                                        Title="Entregas"
                                        ChromeState="Normal"
                                        PageWidgetHandle="3" />
                                </div>
                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTab1" Text="Histórico">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="HISTORICO"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_ORCAMENTO_PDSTATUS.GRID"
                                        Title="Histórico do aditivo"
                                        UserDefinedDisableRowSelection="False"
                                        UserDefinedCommandsVisible="True"
                                        UserDefinedSelectColumnVisible="False"
                                        HideDeveloperCommands="True"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="False"
                                        FilterVisible="False"
                                        DefaultFilterName=""
                                        SystemFilterOnly="True"
                                        UserDefinedPageSize="10"
                                        UserDefinedCriteriaWhereClause=" ((A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CT_ORCAMENTOAPROVACOES'))) AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE) "
                                        Mode="None"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        ShowTitle="False"
                                        ChromeState="Normal"
                                        PageWidgetHandle="1"/>
                                </div>
                            </erp:ErpTab>

                        </erp:ErpTabControl>
                    </div>
            </div>
        </div>
    </div>
</asp:content>
