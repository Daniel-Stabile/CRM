<%@ Page Title="Aditivo inclusão de novos itens/objetos" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">

    <script runat="server">
                           
        protected override void OnPreRenderComplete(EventArgs e) 
        {
            base.OnPreRenderComplete(e);
            var entidade = GERAL.GetEntity();


            TITULO.Title = "Itens incluídos >> Aditivo: " + entidade.Fields["ADITIVO"].ToString() + " - Contrato: " + entidade.Fields["CONTRATO"].ToString();

        }

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("GERAL->DADOS_FINANCEIROS", "GERAL", "DADOS_FINANCEIROS");
            AddWebPartStaticConnection("GERAL->ENTREGAS", "GERAL", "ENTREGAS");            
            

        }
        


    
    </script>

    <style>
        .page-content{
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
                    ID="TITULO" />
            </div>


            <div class="portlet-body">
                <erp:ErpTabControl runat="server" ID="tabControl2" ShowBorder="true" RenderAsPortlet="false">

                    <erp:ErpTab runat="server" ID="tabAssinatures" Text="Geral">
                        <div class="row">
		                    <wes:AjaxForm 
                                runat="server"
                                ID="GERAL" 
                                Title=""
                                FormMode="ReadOnly"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause="" 
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                HideDeveloperCommands="True"
                                EntityViewName="PORTAL_INT_ADITIVO_NOVO_OBJETO.FORM"
                                PageWidgetHandle="110"  />
                        </div>
                    </erp:ErpTab>

                    <erp:ErpTab runat="server" ID="tabFinanceiro" Text="Dados financeiros">
                        <div class="row">
		                    <wes:AjaxForm 
                                runat="server"
                                ID="DADOS_FINANCEIROS" 
                                Title=""
                                FormMode="ReadOnly"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                HideDeveloperCommands="True"
                                EntityViewName="PORTAL_INT_ADITIVO_NOVO_OBJETO_DADOS_FINANCEIROS.FORM"
                                PageWidgetHandle="110"  />
                        </div>
                    </erp:ErpTab>

                    <erp:ErpTab runat="server" ID="ErpTab1" Text="Entregas">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="ENTREGAS"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_INT_ADITIVO_NOVOS_OBJETOS_ENTREGAS.GRID"
                                UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(ADITIVO) AND A.OBJETO = @CAMPO(HANDLE)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="True"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                Title=""
                                FormUrl=""
                                ChromeState="Normal"
                                PageWidgetHandle="3" />
                        </div>
                    </erp:ErpTab>

                </erp:ErpTabControl>
            </div>
        </div>
    </div>
</asp:content>
