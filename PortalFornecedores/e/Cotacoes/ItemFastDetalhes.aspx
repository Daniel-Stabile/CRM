<%@ Page Title="Detalhes" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORM->ENTREGAS_GRID", "FORM", "ENTREGAS_GRID");
            AddWebPartStaticConnection("FORM->ITENSCOTACAO_ESPECIFICACAO_FORM", "FORM", "ITENSCOTACAO_ESPECIFICACAO_FORM");
            AddWebPartStaticConnection("FORM->ITENSCOTACAO_ANEXOSREQUISICAO_GRID", "FORM", "ITENSCOTACAO_ANEXOSREQUISICAO_GRID");
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            FORM.EnsureDataLoad();
            labTitulo.InnerText = "Produto " + FORM.GetEntity()["CODIGO"].GetString() + " >> " +
                                 FORM.GetEntity()["DESCRICAO"].GetString();
        }

    </script>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <div runat="server" id="labTitulo" class="caption">
                </div>
            </div>
            <div class="portlet-body">
                <erp:ErpTabControl runat="server" ID="tabs" ShowBorder="false" RenderAsPortlet="false">
                    <erp:ErpTab runat="server" ID="tab_1_1" Text="Cotação">
                        <div class="row">
                            <wes:AjaxForm runat="server"
                                ID="FORM"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_COTACAO_ITEM_DETALHES.FORM"
                                Title="Detalhes"
                                UserDefinedSelectColumnVisible="False"
                                IncludeRecordInRecentItems="False"
                                CompanyFilterMode="None"
                                HideDeveloperCommands="False"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="True"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                PageWidgetHandle="4" />
                        </div>

                    </erp:ErpTab>

                    <erp:ErpTab runat="server" ID="tab_1_2" Text="Entregas">
                        <div class="row">
                            
                            <wes:EditableGrid runat="server"
                                ID="ENTREGAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_COTACAO_ITEM_ENTREGAS.GRID"
                                UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
                                Title="Entregas >> informar as datas de entrega"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="True"
                                CanUpdate="True"
                                CanDelete="True"
                                ShowTitle="True"
                                ChromeState="Normal"
                                PageWidgetHandle="3" />
                        </div>
                        
                    </erp:ErpTab>


                    <erp:ErpTab runat="server" ID="tab_1_3" Text="Especificações">
                        <div class="row">
                            
                            <wes:AjaxForm runat="server"
                                ID="ITENSCOTACAO_ESPECIFICACAO_FORM"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_COTACAO_ITEM_ESPECIFICACAO.FORM"
                                Title="Especificações"
                                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                                UserDefinedSelectColumnVisible="False"
                                IncludeRecordInRecentItems="False"
                                CompanyFilterMode="None"
                                HideDeveloperCommands="False"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                PageWidgetHandle="4" />
                        </div>
                    </erp:ErpTab>


                    <erp:ErpTab runat="server" ID="tab_1_4" Text="Anexos">
                        <div class="row">
                            
                            <wes:SimpleGrid runat="server"
                                ID="ITENSCOTACAO_ANEXOSREQUISICAO_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_COTACAO_ITEM_REQUISICAO_ANEXOS.GRID"
                                UserDefinedCriteriaWhereClause="A.REQUISICAO IN(SELECT REQUISICAO FROM CP_COTACOESCAPAITENS WHERE REQUISICAOPRODUTO IN(SELECT REQUISICAOPRODUTO FROM CP_WEB_ITENSCOTACAO WHERE HANDLE = @CAMPO(HANDLE)))"
                                Title="Anexos"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="false"
                                ChromeState="Normal"
                                PageWidgetHandle="1" />
                        </div>
                    </erp:ErpTab>


                </erp:ErpTabControl>

            </div>
        </div>
    </div>

</asp:Content>
