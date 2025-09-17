<%@ Page Title="Visita" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_636068544052164512" Title="Visita" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CM_VISITA.FORM" CanDelete="True" CanUpdate="True" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_REP_VISITAS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_636068551988907934" Title="Avaliações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGETID_636068544052164512" ChromeState="Normal" EntityViewName="PORTAL_REP_CM_VISITAAVALIACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.VISITA = @CAMPO(HANDLE)" FormUrl="~/PortalRepresentante/a/Visitas/Avaliacao.aspx" UserDefinedDisableRowSelection="False" PageId="PORTAL_REP_VISITAS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    