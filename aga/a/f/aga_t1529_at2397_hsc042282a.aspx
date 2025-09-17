<%@ Page Title="Ordens de compra" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Ordens de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_ORDENSCOMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PRODUTOS__ORDENSCOMPRA_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="ITENSDEOC" Title="Itens de OC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRAITENS.ITENSDAEMPRESA.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE) AND A.PRODUTO = @RASTRO(PD_PRODUTOS)
" FormUrl="~/aga/a/f/aga_t1530_at2617_hs214d7fe2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__ORDENSCOMPRA_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    