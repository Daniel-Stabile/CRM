<%@ Page Title="Visualiza��o de assinaturas" Language="C#" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:content id="Content1" contentplaceholderid="Main" runat="Server">
    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("TEXTO->ASSINATURAS", "TEXTO", "ASSINATURAS");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            var entidade = TEXTO.GetEntity();
            if (entidade != null)
                TITULO.Title = "Detalhes >> Requisição " + entidade.Fields["NUMERO"].ToString();

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
                            UserDefinedCriteriaWhereClause="A.REQUISICAOPAI = @CAMPO(HANDLE)"
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
                            ShowTitle="True"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_ASSINATURAS.GRID"
                            PageWidgetHandle="108" />
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="TabHistorico" Text="Histórico">
                    <div class="row">
                    <wesWidget:AjaxForm
                        ID="TEXTO"
                        runat="server"
                        EntityViewName="PORTAL_INT_REQUISICOES_TEXTO_ASSINATURAS.FORM"
                        DisplayLabels="True"
                        CanDelete="false"
                        CanUpdate="false"
                        CanInsert="false"
                        Title="Histórico"
                        ShowTitle="False"
                        EditButtonClass="green" />
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
</asp:content>
