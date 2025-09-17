<%@ Page Title="NFe" Language="C#" Inherits="aga.a.comercial.faturamento.FormNFe,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMNFE" Title="NFe" Subtitle="informações do documento" PortletCssClass="" PortletLayout="Custom" BootstrapCols="12" FontIcon="fa fa-file" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFE.FATURAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_FATURAMENTO_FORM_NFE" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NFE" class="active"><a data-toggle="tab" href="#tabNFE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"NFe")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MDE"><a data-toggle="tab" href="#tabMDE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"MDe")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONSULTAPBLICA"><a data-toggle="tab" href="#tabCONSULTAPBLICA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Consulta pública")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOGDEINTEGRAO"><a data-toggle="tab" href="#tabLOGDEINTEGRAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Log de integração")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabNFE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="NFE" Title="NFe" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMNFE" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFEEVENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(DOCUMENTO) AND EVENTO IN (1,2,3,4,5,6)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_FATURAMENTO_FORM_NFE" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabMDE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MDE" Title="MDe" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMNFE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFEEVENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.EVENTO IN (7,8,9,10) AND A.DOCUMENTO = @CAMPO(DOCUMENTO)
" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_FATURAMENTO_FORM_NFE" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabCONSULTAPBLICA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONSULTAPBLICA" Title="Consulta pública" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMNFE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFECONSULTAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(DOCUMENTO)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_FATURAMENTO_FORM_NFE" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabLOGDEINTEGRAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOGDEINTEGRAO" Title="Log de integração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMNFE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFELOGS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="4" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DOCUMENTONFE = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_FATURAMENTO_FORM_NFE" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    