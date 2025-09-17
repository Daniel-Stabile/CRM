<%@ Page Title="Nota Fiscal de Serviço" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMNOTAFISCALDESERVICO" Title="Nota Fiscal de Serviço" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_NOTAFISCALSERVICO.AUTORIZADA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="ERP_A_NFS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="GRIDITENSDANOTAFISCALDESERVICO" Title="Itens da Nota Fiscal de Serviço" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMNOTAFISCALDESERVICO" ChromeState="Normal" EntityViewName="CLOUD_NOTAFISCALSERVICO.ITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO=@CAMPO(HANDLE)" UserDefinedDisableRowSelection="False" PageId="ERP_A_NFS_FORM" Level="20" Order="150"  />
        </div>
    
      </asp:Content>
    