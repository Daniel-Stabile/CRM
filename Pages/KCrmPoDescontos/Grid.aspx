<%@ Page Title="Descontos em Oportunidades" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="K_GRIDK_CRM_PO_DESCONTOS" Title="Descontos em Oportunidades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="K_CRM_PO_DESCONTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Pages/KCrmPoDescontos/AvaliarDesconto.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_KCRMPODESCONTOS_GRID" Level="50" Order="100"  />
        </div>
    
      </asp:Content>
    