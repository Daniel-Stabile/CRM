<%@ Page Title="Fluxos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Fluxos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_Z_WFPROCESSOMODELOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="Z_WFPROCESSOS__PROCESSOMODELOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_4617" Title="Papéis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_Z_WFMODELOPAPEIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.MODELO = (SELECT MODELO FROM Z_WFPROCESSOMODELOS WHERE HANDLE = @RASTRO(Z_WFPROCESSOMODELOS))" FormUrl="~/aga/a/f/aga_t2828_at4617_hs53f8d721.aspx" UserDefinedDisableRowSelection="False" PageId="Z_WFPROCESSOS__PROCESSOMODELOS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    