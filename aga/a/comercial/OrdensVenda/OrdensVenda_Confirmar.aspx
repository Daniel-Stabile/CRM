<%@ Page Title="Ordens de venda a confirmar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ORDENSDEVENDA" Title="Ordens de venda" Subtitle="A confirmar" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CM_ORDENSVENDA.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 1 AND A.LIBERADOCONFIRMACAO = 'S'" FormUrl="~/aga/a/comercial/OrdensVenda/OrdemVenda.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDENSVENDA_CONFIRMAR" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    