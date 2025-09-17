<%@ Page Title="Aprova ordem de compra" Language="C#" AutoEventWireup="true"
    Inherits="Benner.Corporativo.Wes.WebApp.PortalInterno.OrdensCompra.AprovarOrdemCompra" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">        
        protected override void LoadWebPartConnections()
        {

            AddWebPartStaticConnection("RESUMO->ITENS", "RESUMO", "ITENS");
            AddWebPartStaticConnection("RESUMO->PAGAMENTOS", "RESUMO", "PAGAMENTOS");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            var entidade = RESUMO.GetEntity();

            ORDENSCOMPRA_TITLE.Title = entidade["NUMERO"].GetString() + " - " + entidade["FORNECEDOR"].GetString();

        }
    </script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }
    </style>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="ORDENSCOMPRA_TITLE" />
            </div>

            <div class="portlet-body">
                <div class="row">

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:AjaxForm
                                runat="server"
                                ID="RESUMO"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause=""
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                FormMode="View"
                                HideDeveloperCommands="true"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR.FORM" />
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid ID="PAGAMENTOS" runat="server"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR_PAGAMENTOS.GRID"
                                UserDefinedCriteriaWhereClause="A.ORDENSCOMPRA = @CAMPO(HANDLE)"
                                SystemInstanceName="CORPORATIVO"
                                UserDefinedCommandsVisible="False"
                                DisplayRowCommand="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                Title="Condições de pagamento"
                                ShowTitle="true"
                                HideDeveloperCommands="True" />
                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row">
                            <wes:SimpleGrid ID="ITENS" runat="server"
                                EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR_ITENS.GRID"
                                UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE)"
                                SystemInstanceName="CORPORATIVO"
                                UserDefinedCommandsVisible="False"
                                DisplayRowCommand="True"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                Title="Itens da OC >>"
                                ShowTitle="True"
                                HideDeveloperCommands="True"
                                PageWidgetHandle="1"
                                UserDefinedDisableRowSelection="True"
                                UserDefinedPageSize="20"
                                Mode="None"
                                ChromeState="Normal"
                                FormUrl="~/PortalInterno/e/Suprimentos/OrdensCompra/DetalhesItemOrdemCompra.aspx" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
