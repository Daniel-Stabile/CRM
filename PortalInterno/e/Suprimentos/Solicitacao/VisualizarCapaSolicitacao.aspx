<%@ Page Title="Capa da solicitação" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("TAREFA->CAPA", "TAREFA", "CAPA");                    
            AddWebPartStaticConnection("CAPA->OBSERVACOES", "CAPA", "OBSERVACOES");
            AddWebPartStaticConnection("CAPA->ITENS", "CAPA", "ITENS");                    
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);

            COTACAO_TITLE.Title = "Solicitação " + CAPA.GetEntity()["NUMERO"].GetString();
        }
</script>

    <style>
        #WFTAREFA {
            display: none;
        }

    </style>

    <div class="row" id="WFTAREFA">
		<wes:AjaxForm 
            runat="server"
            ID="TAREFA" 
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
            EntityViewName="PORTAL_GERAL_WFTAREFAS_ESCONDIDO.FORM"
            PageWidgetHandle="110"  />
    </div>


    <div class="erp-unbox">
        <div class="portlet light ">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" Title="Nada ainda" ID="COTACAO_TITLE" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-6 erp-unbox">
                        <div class="row">
                            <wes:AjaxForm
                                ID="CAPA"
                                runat="server"
                                EntityViewName="PORTAL_INT_VISUALIZAR_CAPA_SOLICITACAO.FORM"
                                FormMode="View"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT DISTINCT SOLICITACAO FROM K9_WF_SOLICITACAO WHERE HANDLE = @CAMPO(HANDLEDADORELEVANTE) )"
                                HideDeveloperCommands="false"
                                EditButtonClass="green" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <wes:AjaxForm
                                ID="OBSERVACOES"
                                runat="server"
                                EntityViewName="PORTAL_INT_OBSERVACOES_CAPA_SOLICITACAO.FORM"
                                FormMode="ReadOnly"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                HideDeveloperCommands="false"
                                EditButtonClass="green" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <wes:SimpleGrid runat="server"
                        ID="ITENS"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTAL_INT_VISUALIZAR_ITENS_SOLICITACAO.GRID"
                        UserDefinedCriteriaWhereClause="A.SOLICITACAO = @CAMPO(HANDLE)"
                        Title="Itens da solicitação"
                        UserDefinedDisableRowSelection="False"
                        UserDefinedCommandsVisible="True"
                        UserDefinedSelectColumnVisible="false"
                        HideDeveloperCommands="False"
                        CompanyFilterMode="None"
                        DisplayRowCommand="True"
                        FilterVisible="false"
                        SystemFilterOnly="True"
                        UserDefinedPageSize="10"
                        Mode="None"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="True"
                        FormUrl="~/PortalInterno/e/Suprimentos/Solicitacao/VisualizarItemSolicitacao.aspx"
                        ChromeState="Normal"
                            />
                </div>

                
            </div>
        
        </div>
    </div>

</asp:Content>
