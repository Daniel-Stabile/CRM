<%@ Page Title="Itens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_W_MENUITENS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="WEB_MENU__ITENS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5892" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_W_MENUITENS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMSUPERIOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3661_at5892_hse7df393a.aspx" UserDefinedDisableRowSelection="False" PageId="WEB_MENU__ITENS_FORM" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="WIDGET_6366" Title="Página" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_W_PAGINAS.FORM" CanDelete="False" CanUpdate="True" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE =(SELECT PAGINA FROM W_MENUITENS WHERE HANDLE = @RASTRO(W_MENUITENS))" UserDefinedCommandsVisible="True" PageId="WEB_MENU__ITENS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    