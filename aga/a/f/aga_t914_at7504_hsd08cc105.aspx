<%@ Page Title="Planos - Contas gerenciais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Conta gerencial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_PLANOSGERENCIAIS.GERENCIAL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_PLANOS__CONTAS_GERENCIAIS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5938" class="active"><a data-toggle="tab" href="#tabWIDGET_5938"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DFC")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7327"><a data-toggle="tab" href="#tabWIDGET_7327"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DLPA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7326"><a data-toggle="tab" href="#tabWIDGET_7326"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DMPL")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5278"><a data-toggle="tab" href="#tabWIDGET_5278"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DRE")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7374"><a data-toggle="tab" href="#tabWIDGET_7374"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Layout da DVA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7373"><a data-toggle="tab" href="#tabWIDGET_7373"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Papéis de trabalho")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5938">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5938" Title="Layout da DFC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_LAYOUTDFC.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3696_at5938_hsb91035b3.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__CONTAS_GERENCIAIS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7327">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7327" Title="Layout da DLPA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LAYOUTDLPA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4959_at7327_hsb4d8e32.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__CONTAS_GERENCIAIS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7326">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7326" Title="Layout da DMPL" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LAYOUTDMPL.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4961_at7326_hsad7b8e32.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__CONTAS_GERENCIAIS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5278">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5278" Title="Layout da DRE" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LAYOUTDRE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3220_at5278_hsfe6b1ee9.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__CONTAS_GERENCIAIS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7374">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7374" Title="Layout da DVA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LAYOUTDVA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5026_at7374_hs6af83944.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__CONTAS_GERENCIAIS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7373">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7373" Title="Papéis de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PAPEISTRABALHO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PLANOGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5027_at7373_hscc57a66d.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__CONTAS_GERENCIAIS_FORM" Level="20" Order="45"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            //Esconde todas as abas que contenham o texto 'invisível'
function EsconderItens() {
    
    var contexto = $('#ctl00_Main_FORMULARIO').next();
    
    $('.pull-right').hide();
    $("a:contains('(invisível)')").closest('li').hide();
    var primeiroItemAtivo = $("li:not([style$='display: none;'])", contexto).first().find('a');
    
    
    
    if (primeiroItemAtivo.length > 0) {
        primeiroItemAtivo.trigger('click')
    } else {
        contexto.hide();
    }
    
    
}

$(function(){
    
    EsconderItens();
    
})

Sys.Application.add_init(appl_init);
function appl_init() {
    var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
    pgRegMgr.add_endRequest(EsconderItens);
}

            </script>
        <style>
            .negrito{
    
    font-weight: bold;
    
}

            </style>
      </asp:Content>
    