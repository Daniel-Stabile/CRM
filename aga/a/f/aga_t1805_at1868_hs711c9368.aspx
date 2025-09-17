<%@ Page Title="Cotações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_LC_AQUISICAOCOTACOESITEM.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_DO_ITEM_DA_AQUISICAO__COTACOES_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1876" Title="Entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_LC_COTACAOITEMENTREGAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.COTACAOITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1809_at1876_hsd7254afe.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DO_ITEM_DA_AQUISICAO__COTACOES_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1875" Title="Vencimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_LC_COTACAOITEMVENCIMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.COTACAOITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1807_at1875_hs7f1ad4ba.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DO_ITEM_DA_AQUISICAO__COTACOES_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    