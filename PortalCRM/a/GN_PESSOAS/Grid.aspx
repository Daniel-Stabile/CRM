<%@ Page Title="Relação Suspect/Prospect/Customer" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDWIDGET_635709321723147103" Title="Relação de Suspect/Prospect/Customer" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="GN_PESSOAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" DefaultFilterName="PADRAO" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOCRM  IS NOT NULL" FormUrl="~/PortalCRM/a/GN_PESSOAS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="GRIDPAGEID_635709321723147103" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    