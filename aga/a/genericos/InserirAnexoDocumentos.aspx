<%@ Page Title="Anexar arquivo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ANEXARARQUIVO" Title="Anexar arquivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-file-o" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_VT_ARQUIVOANEXAR.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_INSERIRANEXODOCUMENTOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-folder-open-o" ShowTitle="true" ProviderWidgetUniqueId="ANEXARARQUIVO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_ARQUIVOSANEXOS.GESTAOCOBRANCA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTOFINANCEIRO IN (SELECT DOCUMENTO FROM FN_PARCELAS WHERE AP IN (@CAMPO(PARCELAS)))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_INSERIRANEXODOCUMENTOS" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    