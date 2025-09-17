<%@ Page Title="Parâmetro para Simulação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="PARMETRO" Title="Parâmetro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="LA_SIMULACAOPARAMETRO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_LALUR_SIMULACAOPARAMETRO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSOCIAES" class="active"><a data-toggle="tab" href="#tabASSOCIAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Associações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabASSOCIAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSOCIAES" Title="Associações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PARMETRO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="LA_SIMULACAOASSOCIACAOPARAM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.PARAMETRO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/Lalur/AssociacaoParametro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_LALUR_SIMULACAOPARAMETRO" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    