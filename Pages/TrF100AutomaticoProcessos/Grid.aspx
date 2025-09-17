<%@ Page Title="F100 - PROCESSOS REFERENCIADOS" Language="C#" CodeFile="~/Pages/TrF100AutomaticoProcessos/Grid.aspx.cs" Inherits="TrF100AutomaticoProcessosGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDTR_F100AUTOMATICOPROCESSOS" Title="F100 - PROCESSOS REFERENCIADOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_F100AUTOMATICOPROCESSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Pages/TrF100AutomaticoProcessos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_TRF100AUTOMATICOPROCESSOS_GRID" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    