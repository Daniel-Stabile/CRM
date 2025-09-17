<%@ Page Title="Detalhes da Solicitação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="K_WIDGETID_635744476148781227" Title="Detalhes da Solicitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="K_HD_CHAMADOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGEID_635744474361091227" Level="50" Order="10"  />
        <wes:SimpleGrid runat="server" ID="K_WIDGETID_635744477017171227" Title="Interações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_WIDGETID_635744476148781227" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_HD_CHAMADOS_INTERACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.CHAMADO = @CAMPO(HANDLE)" FormUrl="~/Pages/K_HD_CHAMADOS_INTERACOES/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGEID_635744474361091227" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    