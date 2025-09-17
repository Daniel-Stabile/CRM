<%@ Page Title="Histórico de remanejamentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REMANEJAR.FILTRO.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTO_REMANEJAR_HISTORICO" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="ORIGEM" Title="Origem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REMANEJAR.HISTORICO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="12" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_REMANEJAR_HISTORICO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="DESTINO" Title="Destino" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REMANEJAR.HISTORICO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="12" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORIGEM = 'D'" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_REMANEJAR_HISTORICO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    