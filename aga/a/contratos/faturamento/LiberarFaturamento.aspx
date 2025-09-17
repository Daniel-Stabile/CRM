<%@ Page Title="Liberar para faturamento" Language="C#" Inherits="aga.a.contratos.faturamento.LiberarFaturamentoPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMFILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CN_FILTROFATURAMENTO.LIBERARFATURAMENTO.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.TIPO = 1)" UserDefinedCommandsVisible="True" PageId="LIBERARFATURAMENTO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="OBJETOS" Title="Liberar para Faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WEB_CN_LIBERACOESFATURAMENTO.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="LIBERARFATURAMENTO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              var prm = window.Sys.WebForms.PageRequestManager.getInstance();
if (!prm.get_isInAsyncPostBack()) {
    prm.add_endRequest(function () {
        Erp.associarCallbackEmGridSelecao('OBJETOS', 'Erp.contaItensChecadosEmGrid("OBJETOS", "top-PROCESSAR", "Liberar");');
        Erp.contaItensChecadosEmGrid('OBJETOS', 'top-PROCESSAR', 'Liberar');
    });
}

Erp.associarCallbackEmGridSelecao('OBJETOS', 'Erp.contaItensChecadosEmGrid("OBJETOS", "top-PROCESSAR", "Liberar");');

              </script>
        <style>
              #OBJETOS th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    