<%@ Page Title="Conta bancária" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Conta Bancária" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_CONTASTESOURARIA.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="CARGA_DE_AGENCIAS_BANCARIAS__CONTAS_BANCARIAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CARTEIRAT" class="active"><a data-toggle="tab" href="#tabCARTEIRAT"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Carteira válida")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2991"><a data-toggle="tab" href="#tabWIDGET_2991"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Códigos de cobranca")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1148"><a data-toggle="tab" href="#tabWIDGET_1148"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Talonários")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CHAVESPIX"><a data-toggle="tab" href="#tabCHAVESPIX"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Chaves PIX")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCARTEIRAT">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="CARTEIRAT" Title="Carteira válida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_CONTATESCARTEIRASVALIDAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTATESOURARIA = @CAMPO(HANDLE)" PageId="CARGA_DE_AGENCIAS_BANCARIAS__CONTAS_BANCARIAS_FORM" Level="20" Order="5"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2991">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2991" Title="Códigos de cobranca" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_CONTAIDENTIFICACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2281_at2991_hsd10b4a04.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_AGENCIAS_BANCARIAS__CONTAS_BANCARIAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1148">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1148" Title="Talonários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_TS_TALONARIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1409_at1148_hsebd4d1b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_AGENCIAS_BANCARIAS__CONTAS_BANCARIAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCHAVESPIX">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CHAVESPIX" Title="Chaves PIX" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOACHAVEPIXCADASTRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTABANCARIATESOURARIA = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/ChavePixConta.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_AGENCIAS_BANCARIAS__CONTAS_BANCARIAS_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    