<%@ Page Title="Parâmetros contábeis dos usuários" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="USURIOS" Title="Usuários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_Z_GRUPOUSUARIOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGE_PARAM_USER_CONTABIL" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="PARMETROSDOUSURIO" Title="Parâmetros do usuário - Contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="8" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="USURIOS" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="Z_GRUPOUSUARIOS.PARAMETROS.CONTABIL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGE_PARAM_USER_CONTABIL" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    