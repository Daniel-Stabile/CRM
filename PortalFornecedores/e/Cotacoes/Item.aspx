<%@ Page Title="Cotação" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.Cotacoes.ItemPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORM->ENTREGAS_GRID", "FORM", "ENTREGAS_GRID");
            AddWebPartStaticConnection("FORM->ESPECIFICACAO_FORM", "FORM", "ESPECIFICACAO_FORM");
            AddWebPartStaticConnection("FORM->ANEXOSREQUISICAO_GRID", "FORM", "ANEXOSREQUISICAO_GRID");
            AddWebPartStaticConnection("RESUMO_VIEW", "FORM", "RESUMO_VIEW");
            AddWebPartStaticConnection("FORM->ANEXOSITEM_GRID", "FORM", "ANEXOSITEM_GRID");         
            AddWebPartStaticConnection("FORM->IMAGEMPRODUTO", "FORM", "IMAGEMPRODUTO");    
        }

    </script>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <div runat="server" id="labTitulo" class="caption">
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    
                    <erp:SimpleCardView
                        ID="RESUMO_VIEW"
                        runat="server"
                        EntityViewName="PORTAL_FOR_COTACAO_ITEM_QUANTIDADE.FORM"
                        DisplayLabels="True"
                        ColumnCount="2" />
                    
                </div>

                <erp:ErpTabControl runat="server" ID="tabs" ShowBorder="false" RenderAsPortlet="false">
                    <erp:ErpTab runat="server" ID="tab_1_1" Text="Cotação">
                        <div class="row">
                            
                            <wes:AjaxForm runat="server"
                                ID="FORM"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_COTACAO_ITEM.FORM"
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
                                Title="Entregas"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="True"
                                CanUpdate="True"
                                CanDelete="True"
                                ShowTitle="False"
                                ChromeState="Normal"
                                PageWidgetHandle="3" />
                            
                        </div>
                    </erp:ErpTab>

                    <erp:ErpTab runat="server" ID="ErpTab1" Text="Anexos">
                        <div class="row">
                            
                            <wes:SimpleGrid runat="server"
                                ID="ANEXOSITEM_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_COTACAO_ITEM_ANEXOS.GRID"
                                UserDefinedCriteriaWhereClause="A.COTACAOITEM = @CAMPO(HANDLE)"
                                Title="Anexos"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="True"
                                CanUpdate="True"
                                CanDelete="True"
                                ShowTitle="false"
                                FormUrl="~/PortalFornecedores/a/Cotacoes/CotacaoItemAnexo.aspx"
                                ChromeState="Normal"
                                PageWidgetHandle="1" />
                        </div>
                    </erp:ErpTab>

                    <erp:ErpTab runat="server" ID="Tab_1_5" Text="Imagem">
                        <div class="row">
                            <wes:AjaxForm runat="server"
                                ID="IMAGEMPRODUTO"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_PRODUTOS_IMAGEM.FORM"
                                UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT PRODUTO FROM CP_REQUISICAOPRODUTOS WHERE HANDLE IN(SELECT REQUISICAOPRODUTO FROM CP_COTACOESCAPAITENS WHERE REQUISICAOPRODUTO IN(SELECT REQUISICAOPRODUTO FROM CP_WEB_ITENSCOTACAO WHERE HANDLE = @CAMPO(HANDLE))))"
                                Title="Imagem"
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

                    <erp:ErpTab runat="server" ID="tab_1_4" Text="Inf. para o fornecedor">
                        <div class="row">
                            
                            <wes:AjaxForm runat="server"
                                ID="ESPECIFICACAO_FORM"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_COTACAO_ITEM_ESPECIFICACAO.FORM"
                                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                                Title="Especificações"
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
                            <wes:SimpleGrid runat="server"
                                ID="ANEXOSREQUISICAO_GRID"
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
                                EmptyDataText=" "
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
