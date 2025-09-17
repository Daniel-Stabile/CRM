<%@ Page Title="Detalhes do item" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Pedidos.CadastrarItemEntregaPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_PEDIDOITEM_VIEW->GridEntregas", "RESUMO_PEDIDOITEM_VIEW", "GridEntregas");
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
                    ID="PEDIDOVENDAITEM_TITLE" />
            </div>

            <div class="portlet-body">

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="portlet">
                            <div class="portlet-body">
                                <div class="row">
                                    <erp:SimpleCardView
                                        runat="server"
                                        ID="RESUMO_PEDIDOITEM_VIEW"
                                        EntityViewName="PORTAL_CLI_PEDIDOITEM.FORM"
                                        userdefinedcriteriawhereclause="A.HANDLE = @CAMPO(HANDLE)"
                                        DisplayLabels="True"
                                        ColumnCount="1" />
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row">                            
                            <wes:SimpleGrid runat="server"
                                ID="GridEntregas"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_CLI_PEDIDOITEMENTREGAS.GRID"
                                UserDefinedCriteriaWhereClause="A.PEDIDOITEM = @CAMPO(HANDLE)"
                                Title="Entregas >>"
                                UserDefinedDisableRowSelection="True"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="False"
                                DefaultFilterName="Todos"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                PageWidgetHandle="1"
                                OnCommandExecute="GridEntregas_CommandExecute" />                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
