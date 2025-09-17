<%@ Page Title="Aprova ordem de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">        
        protected override void LoadWebPartConnections()
        {

            AddWebPartStaticConnection("RESUMO->ITENS", "RESUMO", "ITENS");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            var entidade = RESUMO.GetEntity();

             ORDENSCONTAGEM_TITLE.Title = "Contagem " + entidade["NUMERO"].GetString();

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
                    ID="ORDENSCONTAGEM_TITLE" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:AjaxForm
                                runat="server"
                                ID="RESUMO"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause=""
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                FormMode="View"
                                HideDeveloperCommands="false"
                                EntityViewName="PORTAL_INT_ORDEMCONTAGEM.FORM" />
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row">
                            <wes:SimpleGrid ID="ITENS" runat="server"
                                EntityViewName="PORTAL_INT_ORDENSCONTAGEMITENS.GRID"
                                UserDefinedCriteriaWhereClause="A.ORDEMCONTAGEM = @CAMPO(HANDLE) AND A.SELECIONADA = 'S' "
                                SystemInstanceName="CORPORATIVO"
                                UserDefinedCommandsVisible="False"
                                DisplayRowCommand="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                Title="Itens >>"
                                ShowTitle="True"
								FormUrl="~/PortalInterno/e/Materiais/OrdensContagem/DetalhesLoteOrdemContagem.aspx"
                                HideDeveloperCommands="True" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
