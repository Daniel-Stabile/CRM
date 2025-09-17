<%@ Page Title="Contas a receber - Documentos do contas a receber" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contas a receber - Documentos do contas a receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FN_DOCUMENTOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1032" class="active"><a data-toggle="tab" href="#tabWIDGET_1032"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comissões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_974"><a data-toggle="tab" href="#tabWIDGET_974"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas gerenciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1036"><a data-toggle="tab" href="#tabWIDGET_1036"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos retidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1105"><a data-toggle="tab" href="#tabWIDGET_1105"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações de transporte")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_897"><a data-toggle="tab" href="#tabWIDGET_897"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parcelas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1059"><a data-toggle="tab" href="#tabWIDGET_1059"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tributos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1032">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1032" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_FN_DOCUMENTOCOMISSOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="PARCELA IS NULL AND (A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t969_at1032_hs4b33a5b7.aspx" UserDefinedDisableRowSelection="False" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_974">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_974" Title="Contas gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_LANCAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PARCELA IS NULL AND (A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1274_at974_hs3764f830.aspx" UserDefinedDisableRowSelection="False" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1036">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1036" Title="Impostos retidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOIMPOSTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1217_at1036_hs58c07b34.aspx" UserDefinedDisableRowSelection="False" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1105">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1105" Title="Informações de transporte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOTRANSPORTE.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1380_at1105_hs8759f303.aspx" UserDefinedDisableRowSelection="False" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_897">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_897" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_PARCELAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1218_at897_hs1425ddae.aspx" UserDefinedDisableRowSelection="False" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1059">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1059" Title="Tributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOTRIBUTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1333_at1059_hs591eff0c.aspx" UserDefinedDisableRowSelection="False" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_FORM" Level="20" Order="35"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    