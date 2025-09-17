<%@ Page Title="Tabela 01 – Natureza de Rendimentos - Carga" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.PortalReinf.a.Principal.Tabelas.PageNaturezaRendimentosTemp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CARGANATUREZARENDIMENTOS" Title="Carga Natureza Rendimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_NATUREZASRENDIMENTOSTMP.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="300" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CODIGO NOT IN (SELECT CODIGO FROM REINF_NATUREZASRENDIMENTOS)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="REINF_NATUREZARENDIMENTOS_TEMPORARIA" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    