<%@ Page Title="Log envio boletos por e-mail" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LOGENVIOBOLETOSPOREMAIL" Title="Log envio boletos por e-mail" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_LOGEMAIL.PADRAO.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_CADASTROS_GERAIS_LOGEMAILENVIOBOLETO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="LOGDEENVIODEBOLETOPOREMAIL" Title="Log de envio de boleto por e-mail" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="9" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOGENVIOBOLETOSPOREMAIL" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_LOGEMAIL.PADRAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_CADASTROS_GERAIS_LOGEMAILENVIOBOLETO" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="3" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOGDEENVIODEBOLETOPOREMAIL" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_LOGEMAILANEXOS.PADRAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_CADASTROS_GERAIS_LOGEMAILENVIOBOLETO" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    