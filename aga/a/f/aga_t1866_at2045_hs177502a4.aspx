<%@ Page Title="Ordens de viagem" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Ordens de viagem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_OV_TIPOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ORDEM_DE_VIAGEM__ORDENSVIAGEM_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_2046" Title="Ordens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_OV_ORDENSVIAGEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((AREA IN (SELECT AREA FROM OV_AREASUSUARIOS WHERE USUARIO = @USUARIO)) OR ( (SELECT COUNT(*) FROM OV_AREASUSUARIOS WHERE USUARIO = @USUARIO) = 0)) AND (A.TIPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1406_at2046_hs8a6facfb.aspx" UserDefinedDisableRowSelection="False" PageId="ORDEM_DE_VIAGEM__ORDENSVIAGEM_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    