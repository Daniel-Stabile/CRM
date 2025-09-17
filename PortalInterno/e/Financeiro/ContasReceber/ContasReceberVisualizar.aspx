<%@ Page Title="Detalhes" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Financeiro.ContasReceber.ContasReceberVisualizar, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">        
        protected override void LoadWebPartConnections() 
        {
            AddWebPartStaticConnection("RESUMO->IMPOSTOS", "RESUMO", "IMPOSTOS");
            AddWebPartStaticConnection("RESUMO->COMISSOES", "RESUMO", "COMISSOES");
            AddWebPartStaticConnection("RESUMO->PARCELAS", "RESUMO", "PARCELAS");
            AddWebPartStaticConnection("PARCELAS->MOVIMENTACOES", "PARCELAS", "MOVIMENTACOES");
            AddWebPartStaticConnection("PARCELAS->OCORRENCIAS", "PARCELAS", "OCORRENCIAS");            
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
                            ID="CONTASRECEBER_TITLE" />
                    </div>

                    <div class="portlet-body">
                        <div class="row">

                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="row">
                                    <erp:SimpleCardView
                                        runat="server"
                                        ID="RESUMO"
                                        EntityViewName="PORTAL_INT_CONTAS_RECEBER_RESUMO.FORM"                                   
                                        DisplayLabels="True"
                                        ColumnCount="1" />
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                                    <erp:ErpTab runat="server" ID="ErpTab2" Text="Impostos retidos">
                                        <div class="erp-unbox">
                                            <div class="row">
                                                <wes:SimpleGrid ID="IMPOSTOS" runat="server"
                                                    EntityViewName="PORTAL_INT_CONTAS_RECEBER_IMPOSTOS.GRID"
                                                    UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                                    SystemInstanceName="CORPORATIVO"
                                                    UserDefinedCommandsVisible="False"
                                                    DisplayRowCommand="False"
                                                    CanInsert="False"
                                                    CanUpdate="False"
                                                    CanDelete="False"                                            
                                                    HideDeveloperCommands ="True"/>
                                            </div>
                                        </div>
                                    </erp:ErpTab>

                                    <erp:ErpTab runat="server" ID="ErpTab1" Text="Comissões">
                                        <div class="erp-unbox">
                                            <div class="row">
                                                <wes:SimpleGrid ID="COMISSOES" runat="server"
                                                    EntityViewName="PORTAL_INT_CONTAS_RECEBER_COMISSOES.GRID"
                                                    UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                                    SystemInstanceName="CORPORATIVO"
                                                    UserDefinedCommandsVisible="False"
                                                    DisplayRowCommand="False"
                                                    CanInsert="False"
                                                    CanUpdate="False"
                                                    CanDelete="False"                                            
                                                    HideDeveloperCommands ="True"/>
                                            </div>
                                        </div>
                                    </erp:ErpTab>
                                </erp:ErpTabControl> 
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="row">
                                    <wes:SimpleGrid 
                                        runat="server"
                                        ID="PARCELAS"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_CONTAS_RECEBER_PARCELAS.GRID"
                                        Title="PARCELAS >>"
                                        UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                        UserDefinedSelectColumnVisible="False"
                                        HideDeveloperCommands="True"
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
                                        PageWidgetHandle="3"/>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <erp:ErpTabControl runat="server" ID="ErpTabControl2" ShowBorder="true" RenderAsPortlet="false">
                                    <erp:ErpTab runat="server" ID="ErpTab3" Text="Recebimentos">
                                        <div class="erp-unbox">
                                            <div class="row">
                                                <wes:SimpleGrid 
                                                    runat="server"
                                                    ID="MOVIMENTACOES"
                                                    SystemInstanceName="CORPORATIVO"
                                                    EntityViewName="PORTAL_INT_CONTAS_RECEBER_MOVIMENTACOES.GRID"
                                                    UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO IN (1,2,3,4,5,6,8,9,14,15,17,18,19,20,22,23)"
                                                    UserDefinedSelectColumnVisible="False"
                                                    HideDeveloperCommands="True"
                                                    CompanyFilterMode="None"
                                                    DisplayRowCommand="False"
                                                    SystemFilterOnly="False"
                                                    UserDefinedPageSize="10"
                                                    Mode="None"
                                                    CanInsert="False"
                                                    CanUpdate="False"
                                                    CanDelete="False"
                                                    ShowTitle="False"
                                                    ChromeState="Normal"
                                                    PageWidgetHandle="3"/>
                                            </div>
                                        </div>
                                    </erp:ErpTab>

                                    <erp:ErpTab runat="server" ID="ErpTab4" Text="Ocorrências">
                                       <div class="row">
                                            <wes:SimpleGrid 
                                                runat="server"
                                                ID="OCORRENCIAS"
                                                SystemInstanceName="CORPORATIVO"
                                                EntityViewName="PORTAL_INT_CONTAS_PAGAR_RECEBER_OCORRENCIAS.GRID"
                                                UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO = 7"
                                                UserDefinedSelectColumnVisible="False"
                                                UserDefinedCommandsVisible="True"
                                                HideDeveloperCommands="True"
                                                CompanyFilterMode="None"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="true"
                                                UserDefinedPageSize="10"
                                                Mode="None"
                                                CanInsert="True"
                                                CanUpdate="True"
                                                CanDelete="False"
                                                ShowTitle="False"
                                                ChromeState="Normal"
                                                PageWidgetHandle="3"
                                                FormUrl="~/PortalInterno/e/Financeiro/ContasReceber/EditarOcorrencias.aspx" />
                                        </div>
                                    </erp:ErpTab>
                                </erp:ErpTabControl>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>                            
</asp:Content>
