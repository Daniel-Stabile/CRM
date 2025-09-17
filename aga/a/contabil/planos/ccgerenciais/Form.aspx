<%@ Page Title="Centro de Custo Gerenciais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CENTRODECUSTO" Title="Centros de Custo Gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_PLANOSCCGERENCIAIS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CT_PLANOS_CENTROS_DE_CUSTO_GERENCIAIS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="CENTROSDECUSTOGERENCIAS" Title="Centros de Custo Gerencias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CENTRODECUSTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CCGERENCIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contabil/planos/ccgerenciais/niveis/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_PLANOS_CENTROS_DE_CUSTO_GERENCIAIS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    