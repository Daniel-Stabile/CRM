<%@ Page Title="Clientes" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDCLIENTES" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_GN_PESSOAS.CLIENTE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" DefaultFilterName="Filtro padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EHCLIENTE = 'S'  AND A.EMPRESA = @EMPRESA" FormUrl="~/Erp/Cadastro/Cliente.aspx" UserDefinedDisableRowSelection="False" PageId="ERP_A_CADASTRO_CLIENTES" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    