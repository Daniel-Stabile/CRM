<%@ Page Title="Configurações comerciais - Categorias de agentes de vendas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Configurações comerciais - Categorias de agentes de vendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_CATEGORIASREPRESENTANTES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__CATEGORIAS_DE_AGENTES_DE_VENDAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_711" Title="Representantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_GN_PESSOAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHAGENTEVENDAS='S') AND (A.CATEGORIAAGENTEVENDAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t717_at711_hs6d3a6682.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__CATEGORIAS_DE_AGENTES_DE_VENDAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    