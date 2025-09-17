<%@ Page Title="Cálculos" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CALCULOS" Title="Cálculos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTAL_INT_ATIVO_CALCULOSITEM.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="15" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_ATIVO_CALCULOSITEM" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    