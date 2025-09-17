<%@ Page Title="Excluir liberações" Language="C#" Inherits="aga.a.contratos.faturamento.ExcluirLiberacoesPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMFILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CN_FILTROFATURAMENTO.EXCLUIRLIBERACOES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.TIPO = 3)" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_FATURAMENTO_EXCLUIRLIBERACOES" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="OBJETOS" Title="Excluir Faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CN_LIBERACOESFATURAMENTO.GERARNOTASFISCAIS.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_CONTRATOS_FATURAMENTO_EXCLUIRLIBERACOES" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              var prm = window.Sys.WebForms.PageRequestManager.getInstance();
if (!prm.get_isInAsyncPostBack()) {
    prm.add_endRequest(function () {
        Erp.associarCallbackEmGridSelecao('OBJETOS', 'Erp.contaItensChecadosEmGrid("OBJETOS", "top-PROCESSAR", "Excluir");');
        Erp.contaItensChecadosEmGrid('OBJETOS', 'top-PROCESSAR', 'Excluir');
    });
}

Erp.associarCallbackEmGridSelecao('OBJETOS', 'Erp.contaItensChecadosEmGrid("OBJETOS", "top-PROCESSAR", "Excluir");');

              </script>
        <style>
              #OBJETOS th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    