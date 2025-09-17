<%@ Page Title="Consultas na web" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Consultas na web" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_W_CONSULTAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="PORTAIS__ADM_CONSULTAS_NA_WEB_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_2525" Title="Campos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_W_CONSULTACAMPOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONSULTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2076_at2525_hs2c216ed0.aspx" UserDefinedDisableRowSelection="False" PageId="PORTAIS__ADM_CONSULTAS_NA_WEB_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_2527" Title="Links" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_W_CAMPOSLINKS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONSULTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2077_at2527_hs935091f1.aspx" UserDefinedDisableRowSelection="False" PageId="PORTAIS__ADM_CONSULTAS_NA_WEB_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    