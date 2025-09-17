<%@ Page Title="Termos de uso e políticas de cookies" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="TERMOSDEUSOEPOLTICASDECOOKIES" Title="Termos de uso e Políticas de cookies" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="GN_POLITICASTERMOUSO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ADM_TERMOSUSOPOLITICASCOOKIES_FORM" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="PAPEIS" Title="Papéis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TERMOSDEUSOEPOLTICASDECOOKIES" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PAPEISTERMOUSO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.POLITICATERMOUSO = @CAMPO(HANDLE)" ShowExport="True" PageId="AGA_A_ADM_TERMOSUSOPOLITICASCOOKIES_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="HISTRICODETERMOSDEUSO" Title="Histórico de termos de uso" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TERMOSDEUSOEPOLTICASDECOOKIES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HISTORICOSTERMOUSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.POLITICATERMOUSO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_TERMOSUSOPOLITICASCOOKIES_FORM" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    