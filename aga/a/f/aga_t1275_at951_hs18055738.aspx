<%@ Page Title="Conta bancária" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.genericos.ContaBancaria,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Conta bancária" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_CONTASTESOURARIA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_FINANCEIRO__CONTAS_BANCARIAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2991" class="active"><a data-toggle="tab" href="#tabWIDGET_2991"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Códigos de cobranca")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1148"><a data-toggle="tab" href="#tabWIDGET_1148"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Talonários")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CHAVESPIX"><a data-toggle="tab" href="#tabCHAVESPIX"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Chaves pix")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2991">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2991" Title="Códigos de cobranca" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_FN_CONTAIDENTIFICACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2281_at2991_hsd10b4a04.aspx" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_FINANCEIRO__CONTAS_BANCARIAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1148">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1148" Title="Talonários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="AGA_TS_TALONARIOS.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1409_at1148_hsebd4d1b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_FINANCEIRO__CONTAS_BANCARIAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabCHAVESPIX">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CHAVESPIX" Title="Chaves pix" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOACHAVEPIXCADASTRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTABANCARIATESOURARIA = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/ChavePixConta.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_FINANCEIRO__CONTAS_BANCARIAS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    