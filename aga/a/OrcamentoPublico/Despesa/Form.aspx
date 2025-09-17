<%@ Page Title="Despesa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMOP_DESPESA" Title="Elemento de Despesa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_DESPESA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_DESPESA_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="SUBELEMENTOS" Title="Subelementos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMOP_DESPESA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_SUBELEMENTO_EM_OP_DESPESA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.DESPESA = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/SubElemento/FormEmElementoDespesa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_DESPESA_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    