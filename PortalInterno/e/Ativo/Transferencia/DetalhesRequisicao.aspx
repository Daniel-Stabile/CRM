<%@ Page Title="Visualização de assinaturas" Language="C#" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script runat="server">
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("TEXTO->ASSINATURAS", "TEXTO", "ASSINATURAS");
            AddWebPartStaticConnection("TEXTO->HISTORICO", "TEXTO", "HISTORICO");
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);
            TITULO.Title = "Detalhes";
        }
            

    </script>

    <div class="portlet light">
        <div class="portlet-title">
            <erp:ErpPortletTitleCaption
                runat="server"
                ID="TITULO" />
        </div>



        <div class="portlet-body">
            <erp:ErpTabControl runat="server" ID="TabControlRequisicao" ShowBorder="True" RenderAsPortlet="False">
                <erp:ErpTab runat="server" ID="TabAssinaturas" Text="Assinaturas">
                    <div class="row">
                        <wesWidget:SimpleGrid
                            runat="server"
                            ID="ASSINATURAS"
                            Title="Assinaturas"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            UserDefinedCriteriaWhereClause="A.ITEMMOVIMENTACAOREQUISICAO = @CAMPO(HANDLE)"
                            UserDefinedDataSourceParameters=""
                            CompanyFilterMode="OnlyCompany"
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="10"
                            Mode="None"
                            UserDefinedSelectColumnVisible="False"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_ASSINATURAS.GRID"
                            PageWidgetHandle="108" />
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="TabStatus" Text="Status">
                    <div class="row">
                        <wesWidget:AjaxForm
                            ID="TEXTO"
                            runat="server"
                            EntityViewName="PORTAL_INT_ATIVO_REQUISICAOTRANSFERENCIA_DETALHES.FORM"
                            DisplayLabels="True"
                            CanDelete="false"
                            CanUpdate="false"
                            CanInsert="false"
                            EditButtonClass="green" />
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="TabHistorico" Text="Histórico">
                    <div class="row">
                        <wesWidget:SimpleGrid
                            runat="server"
                            ID="HISTORICO"
                            Title=""
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            UserDefinedCriteriaWhereClause="A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE) AND A.HANDLETABELAORIGEM IN (SELECT HANDLE FROM Z_TABELAS WHERE NOME = 'AT_ITEMMOVIMENTACAOREQUISICOES')"
                            UserDefinedDataSourceParameters=""
                            CompanyFilterMode="OnlyCompany"
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="10"
                            Mode="None"
                            UserDefinedSelectColumnVisible="False"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            EntityViewName="PD_STATUS.CUSTOM.GRID"/>
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
</asp:Content>
