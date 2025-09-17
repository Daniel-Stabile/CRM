<%@ Page Title="R-1000 - Identificação do Contribuinte" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="REINF_REGISTRO_R1000_FORM" Title="R-1000 - Informações do Contribuinte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="REINF_R1000.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R1000_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REINF_REGISTRO_EMPRESASOFTWARE" class="active"><a data-toggle="tab" href="#tabREINF_REGISTRO_EMPRESASOFTWARE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empresas de Software")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabREINF_REGISTRO_EMPRESASOFTWARE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REINF_REGISTRO_EMPRESASOFTWARE" Title="Empresas de Software" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REINF_REGISTRO_R1000_FORM" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_EMPRESASOFTWARES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R1000 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/EmpresaSoftware.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R1000_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    