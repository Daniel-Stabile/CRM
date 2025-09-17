<%@ Page Title="Aprovar ordens de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">


    <script runat="server">        
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("HISTORICO->ASSINANTES", "HISTORICO", "ASSINANTES");
        }
      
    </script>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    Title="DETALHES"
                    ID="TITULO" />
            </div>
    <div class="portlet-body">
        <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
            <erp:ErpTab runat="server" ID="ErpTab1" Text="Assinaturas">
                <div class="erp-unbox">
                    <div class="row">
                        <wes:SimpleGrid ID="ASSINANTES" runat="server"
                            EntityViewName="PORTAL_INT_ASSINATURAS.GRID"
                            UserDefinedCriteriaWhereClause="A.ORDEMCONTAGEM = @CAMPO(HANDLE)"
                            SystemInstanceName="CORPORATIVO"
                            UserDefinedCommandsVisible="True"
                            DisplayRowCommand="True"
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            HideDeveloperCommands="True" />
                    </div>
                </div>
            </erp:ErpTab>
            <erp:ErpTab runat="server" ID="ErpTab2" Text="Histórico">
                <div class="erp-unbox">
                    <div class="row">
                        <wes:AjaxForm ID="HISTORICO" runat="server"
                            EntityViewName="PORTAL_INT_ORDENSCONTAGEM_HISTORICO.FORM"
                            DisplayLabels="True"
                            CanDelete="false"
                            CanUpdate="false"
                            CanInsert="false"
                            EditButtonClass="green" />
                    </div>
                </div>
            </erp:ErpTab>
        </erp:ErpTabControl>
    </div>
</asp:Content>
