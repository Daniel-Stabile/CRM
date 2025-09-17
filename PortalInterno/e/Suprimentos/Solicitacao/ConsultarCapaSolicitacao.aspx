<%@ Page Title="Capa da solicitação" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("CAPA->OBSERVACOES", "CAPA", "OBSERVACOES");
            AddWebPartStaticConnection("CAPA->ITENS", "CAPA", "ITENS");
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);

            AtualizarLegenda();


        }

        protected void OnCommandExecutedCAPA(object sender, FormCommandExecuteArgs e)
        {
            AtualizarLegenda();
        }


        protected void AtualizarLegenda() 
        {
            var entidade = CAPA.GetEntity();
            string situacao;

            if (entidade == null)
                return;

            if(entidade["STATUS"].GetInt32() == 5)
                situacao = "Recusada";
            if(entidade["STATUS"].GetInt32() == 1 && !entidade["LIBERADA"].GetBoolean())
                situacao = "Em digitação";
            else if(entidade["STATUS"].GetInt32() == 3)
                situacao = "Em atendimento";
            else if(entidade["STATUS"].GetInt32() == 2)
                situacao = "Aprovada";
            else if(entidade["STATUS"].GetInt32() == 2)
                situacao = "Em atendimento";
            else if(entidade["STATUS"].GetInt32() == 6)
                situacao = "Cancelada";
            else if(entidade["STATUS"].GetInt32() == 4)
                situacao = "Atendida";
            else if(entidade["STATUS"].GetInt32() == 7)
                situacao = "Atendimento divergente";
            else
                situacao = "Aguard. aprovação";

            COTACAO_TITLE.Title = "Solicitação " + entidade["NUMERO"].GetString() + " - " + situacao;
        }

</script>

    <div class="erp-unbox">
        <div class="portlet light ">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" Title="Nada ainda" ID="COTACAO_TITLE" />
            </div>
             
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-5 erp-unbox">
                        <div class="row">
                            <wes:AjaxForm
                                ID="CAPA"
                                runat="server"
                                EntityViewName="PORTAL_INT_VISUALIZAR_CAPA_SOLICITACAO.FORM"
                                FormMode="View"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="false"
                                UserDefinedCommandsVisible="true"
                                UserDefinedCriteriaWhereClause=""
                                HideDeveloperCommands="false"
                                OnCommandExecuted="OnCommandExecutedCAPA"
                                EditButtonClass="green" />
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="row">
                            <wes:AjaxForm
                                ID="OBSERVACOES"
                                runat="server"
                                EntityViewName="PORTAL_INT_OBSERVACOES_CAPA_SOLICITACAO.FORM"
                                FormMode="ReadOnly"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="false"
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
