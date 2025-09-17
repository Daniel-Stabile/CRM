<%@ Page Title="Questão" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("QUESTAO->ANEXOS", "QUESTAO_FORM", "ANEXOS_GRID");
            AddWebPartStaticConnection("QUESTAO->INFO", "QUESTAO_FORM", "INFORMACOES_FORM");
        }
       
    </script>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" ID="TITULO" Title="Questão" Description="" />
            </div>
            <div class="portlet-body">

                <erp:ErpTabControl runat="server" ID="tabs" ShowBorder="false" RenderAsPortlet="false">
                    <erp:ErpTab runat="server" ID="tab_1_1" Text="Resposta">
                        <div class="row">
                            
                            <wes:AjaxForm runat="server"
                                ID="QUESTAO_FORM"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_QUESTIONARIO_QUESTAO.FORM"
                                IncludeRecordInRecentItems="False"
                                HideDeveloperCommands="False"
                                CanInsert="False"
                                CanUpdate="True"
                                CanDelete="False"
                                ShowTitle="False"
                                Title="Questão >>"
                                ChromeState="Normal"
                                PageWidgetHandle="3" />
                        </div>
                    </erp:ErpTab>

                    <erp:ErpTab runat="server" ID="ErpTab1" Text="Informações">
                        <div class="row">
                            <wes:AjaxForm runat="server"
                                ID="INFORMACOES_FORM"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_QUESTIONARIO_QUESTAO_INFORMACOES.FORM"
                                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(QUESTOES)"
                                IncludeRecordInRecentItems="False"
                                HideDeveloperCommands="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                Title="Informações>> "
                                ChromeState="Normal"
                                PageWidgetHandle="3" />
                        </div>
                    </erp:ErpTab>
                    
                    <erp:ErpTab runat="server" ID="tab_1_2" Text="Anexos">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="ANEXOS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_QUESTIONARIO_QUESTAO_ANEXOS.GRID"
                                UserDefinedCriteriaWhereClause="A.RESPOSTAFORNECEDOR = @CAMPO(RESPOSTAFORNECEDOR) AND A.APLICACAOQUESTIONARIO = @CAMPO(HANDLE)"
                                Title="Anexos"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                UserDefinedPageSize="10"
                                CanInsert="True"
                                CanUpdate="True"
                                CanDelete="True"
                                ShowTitle="False"
                                ChromeState="Normal"
                                PageWidgetHandle="1"
                                FormUrl="~/PortalFornecedores/e/Questionario/QuestaoAnexo.aspx" />
                        </div>
                    </erp:ErpTab>
                </erp:ErpTabControl>

            </div>
        </div>
    </div>



</asp:Content>
