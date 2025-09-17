<%@ Page Title="Aprovar ordens de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content runat="server" id="Content" contentplaceholderid="Main" xmlns:asp="urn:asp.net">

    <script runat="server">        
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("HISTORICO->ASSINANTES", "HISTORICO", "ASSINANTES");
            AddWebPartStaticConnection("HISTORICO->ANEXOS", "HISTORICO", "ANEXOS");
        }
      
    </script>

    <div class="portlet-body">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    Title="Detalhes"
                    ID="TITULO" />
            </div>

            <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                <erp:ErpTab runat="server" ID="ErpTab1" Text="Assinaturas">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:SimpleGrid ID="ASSINANTES" runat="server"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR_ASSINANTES.GRID"
                                UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE)"
                                SystemInstanceName="CORPORATIVO"
                                UserDefinedCommandsVisible="True"
                                DisplayRowCommand="True"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                Title="Assinaturas"
                                ShowTitle="False"
                                HideDeveloperCommands="True" />
                        </div>
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab2" Text="Histórico">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:AjaxForm ID="HISTORICO" runat="server"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR_HISTORICO.FORM"
                                DisplayLabels="True"
                                CanDelete="false"
                                CanUpdate="false"
                                CanInsert="false"
                                Title="Histórico"
                                ShowTitle="False"
                                EditButtonClass="green" />
                        </div>
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab3" Text="Motivo do Status">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:AjaxForm ID="MOTIVOSTATUS" runat="server"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR_MOTIVOSTATUS.FORM"
                                DisplayLabels="True"
                                CanDelete="False"
                                CanUpdate="False"
                                CanInsert="False"
                                Title="Motivo do Status"
                                ShowTitle="False"
                                EditButtonClass="green" />
                        </div>
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab4" Text="Anexos">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:SimpleGrid ID="ANEXOS" runat="server"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR_ANEXOS.GRID"
                                UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE)"
                                SystemInstanceName="CORPORATIVO"
                                UserDefinedCommandsVisible="True"
                                DisplayRowCommand="True"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                Title="Anexos"
                                ShowTitle="False"
                                HideDeveloperCommands="True" />
                        </div>
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
</asp:content>
