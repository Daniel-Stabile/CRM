<%@ Page Title="Item da ordem de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_VIEW->ENTREGAS_GRID", "RESUMO_VIEW", "ENTREGAS_GRID");
        }

    </script>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="TITULO"
                    Title="Item"
                    Description="resumo do item do pedido" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-8 col-sm-8 erp-unbox">
                        <div class="row">
                            
                                <erp:SimpleCardView
                                    runat="server"
                                    ID="RESUMO_VIEW"
                                    EntityViewName="PORTAL_CLI_ORDENSVENDA_ITEM.FORM"
                                    DisplayLabels="True"
                                    ColumnCount="1"
                                    AlignReverse="false" />
                            
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="row">                            
                            <wes:SimpleGrid runat="server"
                                ID="ENTREGAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_CLI_PEDIDOITEMENTREGA.GRID"
                                Title="Entregas >> "
                                UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                PageWidgetHandle="4" />                            
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
