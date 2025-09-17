<%@ Page Title="Unidades de transporte" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="UNIDADESDETRANSPORTE" Title="Unidades de transporte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFEUNIDADETRANSPORTE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_MDFE_UNIDADESTRANSPORTE" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="UNIDADESDECARGA" class="active"><a data-toggle="tab" href="#tabUNIDADESDECARGA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Unidades de carga")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LACRES"><a data-toggle="tab" href="#tabLACRES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lacres")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabUNIDADESDECARGA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="UNIDADESDECARGA" Title="Unidades de carga" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="UNIDADESDETRANSPORTE" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFEUNIDADECARGA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.UNIDADETRANSPORTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/UnidadesCarga.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFE_UNIDADESTRANSPORTE" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabLACRES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LACRES" Title="Lacres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="UNIDADESDETRANSPORTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFELACRE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.UNIDADETRANSPORTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/Lacres.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFE_UNIDADESTRANSPORTE" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    