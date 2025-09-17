<%@ Page Title="Itens do imobilizado" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTAL_INT_ATIVO_CONSULTAITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/PortalInterno/e/Ativo/Consulta/DetalhesItem.aspx" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_ITENSDOIMOBILIZADO" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    