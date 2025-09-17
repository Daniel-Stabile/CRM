<%@ Page Title="Remessas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="REMESSAS" Title="Remessas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-file-text" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_CORREIOSREMESSAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/financeiro/RemessaCorreios.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ERP_FINANCEIRO_REMESSACORREIOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    