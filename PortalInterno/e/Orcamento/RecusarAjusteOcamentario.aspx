<%@ Page Title="Recusar ajuste orçamentário" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("ORCAMENTO->LANCAMENTOS", "ORCAMENTO", "LANCAMENTOS");
            AddWebPartStaticConnection("ORCAMENTO->HISTORICO", "ORCAMENTO", "HISTORICO");

        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);
            var entidade = ORCAMENTO.GetEntity();
            ORCAMENTO.Title = "Ajuste orçamentário " + entidade.Fields["NUMERO"].ToString() + " - " + entidade.Fields["TIPO"].ToString();
      
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
            <div class="portlet-body">
                <div class="row">
        <wes:AjaxForm runat="server" ID="ORCAMENTO" Title="ORCAMENTO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES.PORTAL_INT_RECUSAR_VERBA_ORCAMENTARIA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_INT_RECUSAR_ORCAMENTARIO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="HISTORICO" Title="HISTORICO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_APROVAR_VERBA_ORCAMENTARIA_HISTORICO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="PORTAL_INT_RECUSAR_ORCAMENTARIO" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="LANCAMENTOS" Title="Movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_VERBA_ORCAMENTARIA_LANCAMENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="3" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.ORCAMENTOAPROVACAO = @CAMPO(HANDLE) AND (A.ORIGEM = 'B' OR A.ORIGEM = 'C' OR A.ORIGEM = 'D' OR A.ORIGEM = 'E' OR A.ORIGEM = 'Q' OR A.ORIGEM = '1')" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_RECUSAR_ORCAMENTARIO" Level="20" Order="30"  />
        </div>
           </div>
        </div>
    </div>
</asp:content>
    