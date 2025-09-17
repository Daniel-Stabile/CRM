<%@ Page Title="Solicitação" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Suprimentos.Solicitacoes.CadastroSolicitacaoCapa, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <style>
        #SolicitacaoWidget {
            display: none;
        }

    </style>

    <div class="erp-unbox">
        <div class="portlet light ">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" Title="Nada ainda" ID="COTACAO_TITLE" />
            </div>

            <div class="row">
		        <wes:AjaxForm 
                    runat="server"
                    ID="ITEMESCONDIDO" 
                    FormMode="View"
                    BootstrapCols="12"
                    UserDefinedCommandsVisible="True"
                    UserDefinedCriteriaWhereClause="" 
                    IncludeRecordInRecentItems="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    HideDeveloperCommands="true"
                    EntityViewName="PORTAL_INT_VISUALIZAR_ITEM_SOLICITACAO.FORM"
                    PageWidgetHandle="110"  />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-5 erp-unbox">
                        <div class="row">
                            <wes:AjaxForm
                                ID="CAPA"
                                runat="server"
                                EntityViewName="PORTAL_INT_VISUALIZAR_SOLICITACAO.FORM"
                                FormMode="View"
                                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(SOLICITACAO)"
                                Title="Anexos da solicitação"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                HideDeveloperCommands="false"
                                EditButtonClass="green" />
                        </div>
                    </div>
                    <div class="col-md-7">
                        <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="ErpTab1" Text="Item">
                                <div class="erp-unbox">
                                    <div class="row">
                                        <wes:AjaxForm
                                        ID="ITEM"
                                        runat="server"
                                        EntityViewName="PORTAL_INT_VISUALIZAR_ITEM_SOLICITACAO.FORM"
                                        DisplayLabels="True"
                                        ShowTitle="false"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        FormMode="View"
                                        HideDeveloperCommands="false"
                                        EditButtonClass="green" />
                                    </div>
                                </div>
                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTab2" Text="Rateios">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="RATEIOS"
                                        EntityViewName="PORTAL_INT_RATEIO_SOLICITACAO.GRID"
                                        UserDefinedCriteriaWhereClause="A.SOLICITACAOITEM = @CAMPO(HANDLE)"
                                        UserDefinedDisableRowSelection="False"
                                        UserDefinedSelectColumnVisible="False"
                                        HideDeveloperCommands="False"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="True"
                                        SystemFilterOnly="False"
                                        UserDefinedPageSize="3"
                                        Mode="None"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        ShowTitle="False"
                                        ChromeState="Normal"
                                        PageWidgetHandle="3"/>
                                </div>

                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTab3" Text="Anexos">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="ANEXOS"
                                        EntityViewName="PORTAL_INT_ANEXO_SOLICITACAO.GRID"
                                        UserDefinedCriteriaWhereClause="A.SOLICITACAOITEM = @CAMPO(HANDLE)"
                                        UserDefinedDisableRowSelection="False"
                                        UserDefinedSelectColumnVisible="False"
                                        HideDeveloperCommands="False"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="True"
                                        SystemFilterOnly="False"
                                        UserDefinedPageSize="3"
                                        Mode="None"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        ShowTitle="False"
                                        ChromeState="Normal"
                                        PageWidgetHandle="3" />
                                 </div>

                            </erp:ErpTab>
                        </erp:ErpTabControl>
                    </div>
                </div>
            </div>
        
        </div>
    </div>

</asp:Content>
