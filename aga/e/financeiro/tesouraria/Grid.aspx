<%@ Page Title="Tesouraria" Language="C#" CodeFile="~/aga/e/financeiro/tesouraria/Grid.aspx.cs" Inherits="tesourariaGridPage" %> 
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" 
          ID="GRIDTS_LANCAMENTOS" 
          Title="Tesouraria" 
          Subtitle="" 
          PortletCssClass="" 
          PortletLayout="Default" 
          BootstrapCols="12" 
          FontIcon="" 
          ShowTitle="true" 
          ProviderWidgetUniqueId="" 
          ChromeState="Normal" 
          CanDelete="False" 
          CanUpdate="False" 
          CanInsert="True" 
          EntityViewName="TS_LANCAMENTOS.TESOURARIA.GRID" 
          Mode="Selectable" 
          DefaultFilterName="Avançado"
          UserDefinedSelectColumnVisible="True" 
          UserDefinedPageSize="10" 
          SystemFilterOnly="False" 
          DisplayRowCommand="True" 
          CompanyFilterMode="OnlyCompany" 
          FormUrl="~/aga/e/financeiro/tesouraria/Form.aspx" 
          ShowExport="True" 
          UserDefinedDisableRowSelection="False" 
          PageWidgetHandle="22521" 
          Level="20" 
          Order="100"  />
        </div>
    
      </asp:Content>
    