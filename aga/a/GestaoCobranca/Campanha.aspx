<%@ Page Title="Campanha de cobrança" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CAMPANHADECOBRANA" Title="Campanha de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GC_CAMPANHAS.CADASTROS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GC_CAMPANHA_COBRANCA" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="FAIXADEVALORES" Title="Faixa de valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CAMPANHADECOBRANA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GC_FAIXAVALORES.CADASTROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CAMPANHA = @CAMPO(HANDLE)" PageId="GC_CAMPANHA_COBRANCA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    