<%@ Page Title="Item da ordem de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content runat="server" id="Content" contentplaceholderid="Main" xmlns:asp="urn:asp.net">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            TITULO.Title = "Detalhes do Item >>";
        }      
    </script>

    <div class="portlet light">
        <div class="portlet-title">
            <erp:ErpPortletTitleCaption
                runat="server"
                ID="TITULO" />
        </div>
        <div class="portlet-body">
            <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">

                <erp:ErpTab runat="server" ID="ErpTab1" Text="Texto de Compra">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:AjaxForm ID="TEXTO" runat="server"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_ITEM_TEXTO.FORM"
                                DisplayLabels="True"
                                CanDelete="False"
                                CanUpdate="False"
                                CanInsert="False"
                                ShowTitle="False"
                                Title="Informações Adicionais"
                                EditButtonClass="green" />
                        </div>
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
</asp:content>
