<%@ Page Title="Detalhes" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">        
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("ORDEMVENDA->TAB_COMISSOES", "ORDEMVENDA", "TAB_COMISSOES");
            AddWebPartStaticConnection("ORDEMVENDA->TAB_ASSINATURAS", "ORDEMVENDA", "TAB_ASSINATURAS");
            AddWebPartStaticConnection("ORDEMVENDA->TAB_TEXTOS", "ORDEMVENDA", "TAB_TEXTOS");
            AddWebPartStaticConnection("ORDEMVENDA->TAB_NOTAS", "ORDEMVENDA", "TAB_NOTAS");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
        }
    </script>


    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }

        #WidgetMasterPedido, #WidgetMasterOrdemVenda {
            display: none;
        }
    </style>

    <div class="row">
        <wes:AjaxForm
            runat="server"
            ID="ORDEMVENDA"
            EntityViewName="PORTAL_CLI_ORDENSVENDA.FORM"
            SystemInstanceName="CORPORATIVO"
            UserDefinedCommandsVisible="false"
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false" />
    </div>


    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    Title="Detalhes >> informações da ordem de venda"
                    ID="TITULO" />
            </div>
            <div class="portlet-body">
                <div class="row">
                    <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">

                        <erp:ErpTab runat="server" ID="ErpTab1" Text="Comissões">
                            <div class="erp-unbox">
                                <div class="row">
                                    <wes:SimpleGrid ID="TAB_COMISSOES" runat="server"
                                        EntityViewName="PORTAL_INT_ORDENS_VENDA_COMISSOES.GRID"
                                        UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                                        SystemInstanceName="CORPORATIVO"
                                        UserDefinedCommandsVisible="False"
                                        DisplayRowCommand="False"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        HideDeveloperCommands="True" />
                                </div>
                            </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab2" Text="Assinaturas">
                            <div class="erp-unbox">
                                <div class="row">
                                    <wes:SimpleGrid ID="TAB_ASSINATURAS" runat="server"
                                        EntityViewName="PORTAL_INT_ORDENS_VENDA_PDASSINATURAS.GRID "
                                        UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                                        SystemInstanceName="CORPORATIVO"
                                        UserDefinedCommandsVisible="False"
                                        DisplayRowCommand="False"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        HideDeveloperCommands="True" />
                                </div>
                            </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab3" Text="Textos">
                            <div class="erp-unbox">
                                <div class="row">
                                    <wes:AjaxForm ID="TAB_TEXTOS" runat="server"
                                        EntityViewName="PORTAL_INT_ORDENS_VENDA_TEXTOS.FORM"
                                        SystemInstanceName="CORPORATIVO"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False" />
                                </div>
                            </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab4" Text="Notas">
                            <div class="erp-unbox">
                                <div class="row">
                                    <wes:SimpleGrid ID="TAB_NOTAS" runat="server"
                                        EntityViewName="PORTAL_INT_ORDENS_VENDA_NOTAS.GRID"
                                        UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                                        SystemInstanceName="CORPORATIVO"
                                        UserDefinedCommandsVisible="False"
                                        DisplayRowCommand="False"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        HideDeveloperCommands="True" />
                                </div>
                            </div>
                        </erp:ErpTab>

                    </erp:ErpTabControl>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
