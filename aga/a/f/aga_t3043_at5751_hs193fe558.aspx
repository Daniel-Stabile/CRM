<%@ Page Title="DIOPS - Cadastral" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="DIOPS - Cadastral" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSPERIODOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5752" class="active"><a data-toggle="tab" href="#tabWIDGET_5752"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Administradores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5756"><a data-toggle="tab" href="#tabWIDGET_5756"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Controlada/coligada")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5757"><a data-toggle="tab" href="#tabWIDGET_5757"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Dependências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5750"><a data-toggle="tab" href="#tabWIDGET_5750"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operadora")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5753"><a data-toggle="tab" href="#tabWIDGET_5753"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Representantes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5758"><a data-toggle="tab" href="#tabWIDGET_5758"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRUPODEACIONISTAS"><a data-toggle="tab" href="#tabGRUPODEACIONISTAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Grupo de Acionistas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5752">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5752" Title="Administradores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_ANSADMINISTRADORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3454_at5752_hsb269ca3d.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5756">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5756" Title="Controlada/coligada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_ANSCONTROLADAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3460_at5756_hsdb24677a.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5757">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5757" Title="Dependências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_ANSDEPENDENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3461_at5757_hs7d9024ea.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5750">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_5750" Title="Operadora" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_ANSOPERADORAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5753">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5753" Title="Representantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_ANSREPRESENTANTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3455_at5753_hsc3be15bf.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5758">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5758" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_ANSRESPONSAVEIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3463_at5758_hs2f4ec0e7.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabGRUPODEACIONISTAS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="GRUPODEACIONISTAS" Title="Grupo de Acionistas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSGRUPOACIONISTAS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.PERIODO = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="70"  />
    <wes:SimpleGrid runat="server" ID="ACIONISTAS_1" Title="Acionistas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GRUPODEACIONISTAS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_ANSACIONISTAS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="5" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.GRUPO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t3458_at5755_hsb73b14d6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__CADASTRAL_FORM" Level="20" Order="60"  /></div>
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
    