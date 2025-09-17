<%@ Page Title="Clientes" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.genericos.pessoas.clientes.Clientes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAS.CUSTOM.CLIENTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.EHCLIENTE = 'S'" FormUrl="~/aga/a/genericos/pessoasclientes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_GRID" Level="20" Order="1"  />
        </div>
    
        <style>
              #GRID th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    