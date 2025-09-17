<%@ Page Title="Parâmetros comerciais da filial" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="FILIAIS" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_FILIAIS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PARAMETROS_FILIAL" Level="20" Order="10"  />
      <div class="col-md-8"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARMETROSCOMERCIAISDAFILIAL" class="active"><a data-toggle="tab" href="#tabPARMETROSCOMERCIAISDAFILIAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros comerciais da filial")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPARMETROSCOMERCIAISDAFILIAL">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PARMETROSCOMERCIAISDAFILIAL" Title="Parâmetros comerciais da filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FILIAIS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.FILIAL = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_PARAMETROS_FILIAL" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    