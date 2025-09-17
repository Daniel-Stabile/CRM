<%@ Page Title="Itens da requisição" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("REQUISICAOPAI->ITENSREQUISICAO", "REQUISICAOPAI", "ITENSREQUISICAO");
            AddWebPartStaticConnection("REQUISICAOPAI->COMANDOS_REQUISICAOPAI", "REQUISICAOPAI", "COMANDOS_REQUISICAOPAI");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);

            var entidade = REQUISICAOPAI.GetEntity();

            REQUISICAO_TITLE.Title = "Requisição " + entidade.Fields["NUMERO"].ToString() + " >> " + entidade.Fields["STATUS"].ToString();

        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            AddCellAdapter(new Benner.Corporativo.Wes.WebApp.GridCellStatusAdapter(ITENSREQUISICAO, "TIPO"));
        }

        protected void COMANDOS_REQUISICAOPAI_DataLoaded(object sender, EventArgs e)
        {
            ITENSREQUISICAO.ForceUpdate();
        }
</script>

    <style>
        #WidgetMasterRequisicao {
            display: none;
        }
    </style>

    <div class="row">
        <wes:AjaxForm
            runat="server"
            ID="REQUISICAOPAI"
            EntityViewName="PORTAL_INT_REQUISICOES_CADASTRAR.FORM"
            SystemInstanceName="CORPORATIVO"
            UserDefinedCommandsVisible="false"
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false" />
     </div>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="REQUISICAO_TITLE" />

            </div>

             <div class="row">
                <wes:CommandsPanel
                    runat="server"
                    ID="COMANDOS_REQUISICAOPAI"
                    EntityViewName="PORTAL_INT_REQUISICAOPAICOMANDOS.FORM"
                    UserDefinedCommandsVisible="True"
                    SystemInstanceName="CORPORATIVO"
                    OnDataLoaded="COMANDOS_REQUISICAOPAI_DataLoaded"                        
                    HideDeveloperCommands="False" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">

                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="ITENSREQUISICAO"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_INT_REQUISICOESITENSCADASTRO.GRID"
                                UserDefinedCriteriaWhereClause="A.REQUISICAOPAI = @CAMPO(HANDLE) AND TABTIPO IN (1,2)"
                                Title="Itens"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="false"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="true"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="True"
                                CanUpdate="True"
                                CanDelete="True"
                                ShowTitle="false"
                                ChromeState="Normal"
                                PageWidgetHandle="1"
                                FormUrl="~/PortalInterno/e/Suprimentos/Requisicoes/CadastrarRequisicaoEdit.aspx" />
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>
