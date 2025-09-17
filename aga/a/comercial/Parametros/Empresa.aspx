<%@ Page Title="Parâmetros comerciais da empresa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="PARMETROSCOMERCIAISDAEMPRESA" Title="Parâmetros comerciais da empresa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_PARAMETROSEMPRESA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_PARAMETROS_EMPRESA" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OPERAESPARAMETASDEVENDA" class="active"><a data-toggle="tab" href="#tabOPERAESPARAMETASDEVENDA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações para metas de venda")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabOPERAESPARAMETASDEVENDA">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OPERAESPARAMETASDEVENDA" Title="Operações para metas de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PARMETROSCOMERCIAISDAEMPRESA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_PARAMETROOPERACAOMETAVENDA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.PARAMETROCOMERCIALEMPRESA = @CAMPO(HANDLE)" PageId="AGA_A_COMERCIAL_PARAMETROS_EMPRESA" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    