<%@ Page Title="Documento" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Financeiro.DocumentoPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_VIEW->PARCELAS_GRID", "RESUMO_VIEW", "PARCELAS_GRID");
            AddWebPartStaticConnection("RESUMO_VIEW->RETENCOES_GRID", "RESUMO_VIEW", "RETENCOES_GRID");
            AddWebPartStaticConnection("PARCELAS->BAIXAS", "PARCELAS_GRID", "BAIXAS_GRID");
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
                    ID="DOCUMENTO_TITLE" />
            </div>
            <div class="portlet-body">

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">


                        <div class="portlet">
                            <div class="portlet-title">
                                <erp:ErpPortletTitleCaption
                                    runat="server"
                                    ID="ErpPortletTitleCaption1"
                                    Title="Documento"
                                    Description="resumo do documento" />
                            </div>
                            <div class="portlet-body">
                                
                                <div class="row">
                                    <wes:AjaxForm
                                        runat="server"
                                        ID="RESUMO_VIEW"
                                        EntityViewName="PORTAL_REP_FINANCEIRO_DOCUMENTO.FORM"
                                        DisplayLabels="True"
                                        ColumnCount="1"     
                                        FormMode="View"
                                        UserDefinedCommandsVisible="false"
                                        OnTranslateText="ResumoForm_TranslateText" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="RETENCOES_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_REP_FINANCEIRO_RETENCOES.GRID"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                UserDefinedDisableRowSelection="True"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                Title="Impostos retidos >> retenções do documento"
                                ChromeState="Normal"
                                PageWidgetHandle="2" />
                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="PARCELAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_REP_FINANCEIRO_DOC_PARCELAS.GRID"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                Title="Parcelas >> parcelas do documento selecionado"
                                ChromeState="Normal"
                                PageWidgetHandle="2" />
                        </div>

                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">

                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="BAIXAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_REP_FINANCEIRO_PARCELA_BAIXAS.GRID"
                                UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO IN(1,2,3,4,5,8,9,14,15,16,18,20,23)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
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
