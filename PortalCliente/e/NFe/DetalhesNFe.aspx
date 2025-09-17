<%@ Page Title="Detalhes Nota Fiscal" Language="C#"
    Inherits="PortalCliente.NFe.DetalhesNFe, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_NOTAFISCAL_VIEW->ITENSDANOTAFISCAL", "RESUMO_NOTAFISCAL_VIEW", "ITENSDANOTAFISCAL");
            AddWebPartStaticConnection("RESUMO_NOTAFISCAL_VIEW->PARCELAS_GRID", "RESUMO_NOTAFISCAL_VIEW", "PARCELAS_GRID");
            AddWebPartStaticConnection("PARCELAS_GRID->BAIXAS_GRID", "PARCELAS_GRID", "BAIXAS_GRID");
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
                    ID="NOTAFISCAL_TITLE" />
            </div>
            <div class="portlet-body">

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">


                        <div class="portlet">
                            <div class="portlet-title">
                                <erp:ErpPortletTitleCaption
                                    runat="server"
                                    ID="ErpPortletTitleCaption1"
                                    Title="Nota fiscal"
                                    Description="resumo da nota fiscal" />
                            </div>
                            <div class="portlet-body">

                                <div class="row">
                                    <erp:SimpleCardView
                                        runat="server"
                                        ID="RESUMO_NOTAFISCAL_VIEW"
                                        EntityViewName="PORTAL_CLI_DOCUMENTONFE.FORM"
                                        UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                                        DisplayLabels="True"
                                        ColumnCount="1"
                                        OnTranslateText="RESUMO_NOTAFISCAL_VIEW_TranslateText" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">                            
                            <wes:SimpleGrid runat="server"
                                ID="ITENSDANOTAFISCAL"
                                Title="Itens >> itens da nota selecionada"
                                UserDefinedDisableRowSelection="False"
                                FormUrl=""
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(DOCUMENTO)"
                                UserDefinedDataSourceParameters=""
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="10"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                DefaultFilterName=""
                                SystemInstanceName="CORPORATIVO"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                EntityViewName="PORTAL_CLI_ITENS_NFE.GRID"
                                PageWidgetHandle="13" />                            
                        </div>
                    </div>
                </div>

                <div class="row" id="LinhaInferior" runat="server">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">                            
                            <wes:SimpleGrid runat="server"
                                ID="PARCELAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_CLI_FINANCEIRO_NOTAFISCAL_PARCELAS.GRID"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO IN(SELECT DOCUMENTOORIGEM FROM FN_DOCUMENTOS WHERE HANDLE = @CAMPO(DOCUMENTO))"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                Title="Parcelas >> parcelas do documento da nota fiscal"
                                ChromeState="Normal"
                                PageWidgetHandle="2" />
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">                            
                            <wes:SimpleGrid runat="server"
                                ID="BAIXAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_CLI_FINANCEIRO_PARCELA_BAIXAS.GRID"
                                UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO IN(1,2,3,4,5,8,9,14,15,16,18,20,23)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                Title="Pagamentos >> pagamentos já efetuados da parcela selecionada"
                                ChromeState="Normal"
                                PageWidgetHandle="3" />                            
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
