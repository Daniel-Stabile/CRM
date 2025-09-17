<%@ Page Title="Empresas de Software" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="EMPRESASDESOFTWARE" Title="Empresas de Software" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_EMPRESASOFTWARES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.R1000 = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="REINF_EMPRESAS_SOFTWARE_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    