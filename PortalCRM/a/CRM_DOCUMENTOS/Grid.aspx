<%@ Page Title="Documentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDWIDGET_635709302762151198" Title="Relação de Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CRM_DOCUMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA" FormUrl="~/PortalCRM/a/CRM_DOCUMENTOS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="GRIDPAGEID_635709302762151198" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    