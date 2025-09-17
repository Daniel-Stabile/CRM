<%@ Page Title="Categoria de fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Categorias de fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_CATEGORIASFORNECEDORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/g/aga_t842_at1076_hs1166832a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__CATEGORIA_DE_FORNECEDORES_GRID" Level="20" Order="1"  />
        <wes:AjaxForm runat="server" ID="CATEGORIADEFORNECEDORES" Title="Detalhes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GRID" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_CATEGORIASFORNECEDORES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FINANCEIRO__CATEGORIA_DE_FORNECEDORES_GRID" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    