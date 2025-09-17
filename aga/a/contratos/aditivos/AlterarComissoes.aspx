<%@ Page Title="Alterar comissões" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ALTERARCOMISSES" Title="Alterar comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ADITIVOOBJETOCOMISSOES.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="a.tipo = 2" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_ADITIVOS_ALTERARCOMISSOES" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="ALTERARCOMISSES_1" Title="Alterar comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ALTERARCOMISSES" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ADITIVOOBJETOCOMISSOES.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_ADITIVOS_ALTERARCOMISSOES" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    