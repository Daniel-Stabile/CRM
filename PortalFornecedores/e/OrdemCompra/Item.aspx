<%@ Page Title="Item da ordem de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.OrdemCompra.ItemPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
    
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_VIEW->ENTREGAS_GRID", "RESUMO_VIEW", "ENTREGAS_GRID");
            AddWebPartStaticConnection("ENTREGAS_GRID->ENDERECO_VIEW", "ENTREGAS_GRID", "ENDERECO_VIEW");
        }

    </script>


    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" ID="TITULO" />

            </div>
            <div class="portlet-body">

                <div class="row">

                    <div class="col-md-8 col-sm-8 erp-unbox">

                        <div class="row">
                            <erp:SimpleCardView
                                runat="server"
                                ID="RESUMO_VIEW"
                                EntityViewName="PORTAL_FOR_ORDENSCOMPRA_ITEM.FORM"
                                DisplayLabels="True"
                                ColumnCount="1"
                                HideEmptyValues="true"
                                AlignReverse="false"
                                OnTranslateText="ResumoForm_TranslateText" />                            
                        </div>

                    </div>


                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12">

                        <div class="row">
                            
                            <wes:SimpleGrid runat="server"
                                ID="ENTREGAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_ORDENSCOMPRA_ITEM_ENTREGAS.GRID"
                                UserDefinedCriteriaWhereClause="A.ORDENSCOMPRAITENS = @CAMPO(HANDLE)"
                                UserDefinedDisableRowSelection="True"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                Title="Entregas >> todas entregas do item"
                                ChromeState="Normal"
                                PageWidgetHandle="2" />
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 erp-unbox">
                        <div class="row">
                            <erp:SimpleCardView
                                runat="server"
                                ID="ENDERECO_VIEW"
                                EntityViewName="PORTAL_FOR_ORDENSCOMPRA_ITEM_ENTREGA_ENDERECO.FORM"
                                DisplayLabels="True"
                                ColumnCount="1"
                                HideEmptyValues="true"
                                AlignReverse="false" />
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
