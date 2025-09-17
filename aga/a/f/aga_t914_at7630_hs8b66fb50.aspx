<%@ Page Title="Configurações contábeis - Demonstrações contábeis" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Demonstração contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_PLANOSGERENCIAIS.DEMONSTRACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7842" class="active"><a data-toggle="tab" href="#tabWIDGET_7842"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ajustes de exercícios anteriores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7835"><a data-toggle="tab" href="#tabWIDGET_7835"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7837"><a data-toggle="tab" href="#tabWIDGET_7837"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DFC")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7839"><a data-toggle="tab" href="#tabWIDGET_7839"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DLPA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7838"><a data-toggle="tab" href="#tabWIDGET_7838"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DMPL")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7836"><a data-toggle="tab" href="#tabWIDGET_7836"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DRE")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7841"><a data-toggle="tab" href="#tabWIDGET_7841"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DVA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7840"><a data-toggle="tab" href="#tabWIDGET_7840"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Papéis de trabalho")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7842">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7842" Title="Ajustes de exercícios anteriores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_PAPEISTRABALHOAJUSTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
 SELECT AJUSTE.HANDLE 
   FROM CT_PAPEISTRABALHOAJUSTES AJUSTE
   JOIN CT_PAPEISTRABALHO PAPELTRABALHO
     ON PAPELTRABALHO.HANDLE = AJUSTE.PAPELTRABALHO
  WHERE PAPELTRABALHO.PLANOGERENCIAL = @TABELA(CT_PLANOSGERENCIAIS)
)" FormUrl="~/aga/a/f/aga_t5030_at7842_hs307133e1.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7835">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7835" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTASGERENCIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t916_at7835_hs7a836a60.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7837">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7837" Title="Layout da DFC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LAYOUTDFC.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3696_at7837_hs695139f4.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7839">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7839" Title="Layout da DLPA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LAYOUTDLPA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4959_at7839_hs440ca71d.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7838">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7838" Title="Layout da DMPL" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LAYOUTDMPL.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4961_at7838_hs46daa475.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7836">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7836" Title="Layout da DRE" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_LAYOUTDRE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE) )" FormUrl="~/aga/a/f/aga_t3220_at7836_hs694b39e0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7841">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7841" Title="Layout da DVA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_LAYOUTDVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5026_at7841_hs78180be0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7840">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7840" Title="Papéis de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_PAPEISTRABALHO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANOGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5027_at7840_hs8980438e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__DEMONSTRACAOCONTABIL_FORM" Level="20" Order="45"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            /*var abas = $('ul.nav-tabs').find('li');
$(abas).removeClass('active').hide();

var panels = $('.tab-content').find('tab-pane');
$(panels).removeClass('active').hide();

$('[data-widget-id="WIDGET_7835"]').show().addClass('active');
$('#tabWIDGET_7835').addClass('active');

$('li[data-widget-id="WIDGET_7842"]').removeClass('active');
$('#tabWIDGET_7842').removeClass('active');

var texto = $('#ctl00_Main_FORMULARIO_formView_PageControl_GERAL_GERAL_EMITEDEMONSTRATIVO').text();

var prm = Sys.WebForms.PageRequestManager.getInstance();

// Load
$(document).ready(function() {
    $('li[data-widget-id="WIDGET_7835"]').trigger("click");
    
    if (!prm.get_isInAsyncPostBack()) {
    	prm.add_endRequest(function (sender, args) {
            if (contador == 1) {
    		    location.reload();
            }
	    });
    }
    
    switch ($.trim(texto)) {
	    case 'DRE - Demonstração do Resultado do Exercício':
	    	ExibirCampo('WIDGET_7836');

    	break;
    	case 'DLPA - Demonstração de Lucros ou Prejuízos Acumulados':
	    	ExibirCampo('WIDGET_7839');

	    break;
    	case 'DMPL - Demonstração das Mutações do Patrimônio Líquido':
	    	ExibirCampo('WIDGET_7838');

	    break;
	    case 'DVA - Demonstração do Valor Adicionado':
	        $('li[data-widget-id="WIDGET_7842"]').show().addClass('active');
            $('#tabWIDGET_7842').addClass('active');

	        $('[data-widget-id="WIDGET_7835"]').removeClass('active');
            $('#tabWIDGET_7835').removeClass('active');
        
	    	ExibirCampo('WIDGET_7835');
    		ExibirCampo('WIDGET_7840');
	    	ExibirCampo('WIDGET_7841');
		
	    break;
	    case 'DFC - Demonstração do Fluxo de Caixa':
	    	ExibirCampo('WIDGET_7840');
	    	ExibirCampo('WIDGET_7837');
	    break;
    }
});

//Encontra as abas escondendo-as
function ExibirCampo(id){
    var tabAtual = $('li[data-widget-id="'+id + '"]');
    $(tabAtual).show();
}
*/

            </script>
      </asp:Content>
    