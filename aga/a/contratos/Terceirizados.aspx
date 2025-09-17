<%@ Page Title="Contratos Terceirizados" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.DocumentosTerceiros" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="TERCEIRIZADOS" Title="Terceirizados/Subcontratados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_FUNCIONARIOSTERCEIROS.CONTRATOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CONTRATOS_TERCEIRIZADOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TERCEIRIZADOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATODOCUMENTOS.CONTRATO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2218_at7988_hsf3846e7f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CONTRATOS_TERCEIRIZADOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    