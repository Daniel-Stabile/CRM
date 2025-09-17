<%@ Page Title="Orçamento Histórico" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ORAMENTOS" Title="Orçamentos em Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="fa fa-history" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_VERSOESORCAMENTOS.HISTORICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ESTADO = 'H'" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTO_HISTORICO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="VERSESORAMENTOS" Title="Versões Orçamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ORAMENTOS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_VERSOESORCAMENTOS.HISTORICO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTO_HISTORICO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    