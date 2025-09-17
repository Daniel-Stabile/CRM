<%@ Page Title="Estados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Estados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ESTADOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TRIBUTOS__ESTADOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5862" class="active"><a data-toggle="tab" href="#tabWIDGET_5862"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alíquotas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5863"><a data-toggle="tab" href="#tabWIDGET_5863"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"GNRE Códigos da Receita")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6311"><a data-toggle="tab" href="#tabWIDGET_6311"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"GNRE Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5864"><a data-toggle="tab" href="#tabWIDGET_5864"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"GNRE Produtos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5862">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5862" Title="Alíquotas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(IMPOSTO IS NULL) AND (FAMILIA IS NULL) AND (PRODUTO IS NULL) AND (VARIACAO IS NULL) AND (A.ESTADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t829_at5862_hs3ba2c713.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS__ESTADOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5863">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5863" Title="GNRE Códigos da Receita" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_GNRECODIGORECEITAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3636_at5863_hse5331642.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS__ESTADOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6311">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6311" Title="GNRE Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_GNREPESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4087_at6311_hs6a79dbf3.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS__ESTADOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5864">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5864" Title="GNRE Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_GNREPRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3637_at5864_hs433fc43c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS__ESTADOS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    