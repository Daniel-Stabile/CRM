<%@ Page Title="Parâmetros" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMPARAMETROS" Title="Parâmetros da empresa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="GN_PARAMETROSCLOUD.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA" UserDefinedCommandsVisible="True" PageId="ERP_CADASTRO_PARAMETROSCLOUD" Level="20" Order="100"  />
        <wes:EditableGrid runat="server" ID="GRIDPARAMETROSPORBANCO" Title="Parâmetros por banco" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMPARAMETROS" ChromeState="Normal" EntityViewName="GN_PARAMETROSBANCOSCLOUD.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EMPRESA = @CAMPO(EMPRESA) AND A.PARAMETROCLOUD = @CAMPO(HANDLE)" PageId="ERP_CADASTRO_PARAMETROSCLOUD" Level="20" Order="200"  />
        </div>
    
      </asp:Content>
    