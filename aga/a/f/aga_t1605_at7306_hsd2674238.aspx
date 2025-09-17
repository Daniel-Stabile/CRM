<%@ Page Title="Tipos de inspeção" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tipos de inspeção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_QL_TIPOINSPECAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="QL_TIPOINSPECAOPAI__TIPOSINSPECAO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_2613" Title="Dependências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_QL_TIPOINSPECAODEPENDENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOINSPECAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2104_at2613_hsd4174d2c.aspx" UserDefinedDisableRowSelection="False" PageId="QL_TIPOINSPECAOPAI__TIPOSINSPECAO_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1481" Title="Motivos de rejeição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_QL_MOTIVOSREJEICAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOINSPECAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1606_at1481_hsd4064931.aspx" UserDefinedDisableRowSelection="False" PageId="QL_TIPOINSPECAOPAI__TIPOSINSPECAO_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    