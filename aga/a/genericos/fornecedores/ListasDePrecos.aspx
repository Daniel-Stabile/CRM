<%@ Page Title="Listas de preços" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LISTADEPREOS" Title="Lista de preços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_LISTASPRECOS.LISTASDEPRECOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/e/genericos/fornecedores/ListaDePrecos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_FORNECEDORES_LISTASDEPRECOS" Level="20" Order="10"  />
        </div>
    
        <style>
              #LISTADEPREOS th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    