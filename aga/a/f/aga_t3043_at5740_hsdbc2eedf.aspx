<%@ Page Title="DIOPS - Financeiro - Mensal" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Financeiro - Mensal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSPERIODOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__MENSAL_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1673_5743" class="active"><a data-toggle="tab" href="#tabWIDGET_1673_5743"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atividades Operacionais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1673_5744"><a data-toggle="tab" href="#tabWIDGET_1673_5744"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atividades de Investimento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1673_5745"><a data-toggle="tab" href="#tabWIDGET_1673_5745"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atividades de Financiamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8295"><a data-toggle="tab" href="#tabWIDGET_8295"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de envio")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1673_5743">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1673_5743" Title="Atividades Operacionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSFCATIVIDADESOPER.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__MENSAL_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1673_5744">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1673_5744" Title="Atividades de Investimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSFCATIVIDADESINV.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__MENSAL_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1673_5745">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1673_5745" Title="Atividades de Financiamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSFCATIVIDADESFIN.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__MENSAL_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8295">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8295" Title="Histórico de envio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="AGA_CT_LOG.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5758_at8295_hs2023a873.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__MENSAL_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            $(function(){

var cmp = $('input[type="radio"][value="'+getParameterByName('tipo')+'"]');
if (cmp.length > 0) {
 cmp.trigger('click');
 setTimeout(function() {$('[data-field="TIPO"]').find(':input[type="radio"]').attr('disabled', true)}, 1000);
}

})

function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

            </script>
      </asp:Content>
    