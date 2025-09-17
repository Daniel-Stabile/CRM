<%@ Page Title="Naturezas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Naturezas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_NATUREZASFISCAIS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PLANO_NATUREZAFISCAL__NATUREZAFISCAL_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6208" class="active"><a data-toggle="tab" href="#tabWIDGET_6208"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Códigos de ajuste CFOP")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6071"><a data-toggle="tab" href="#tabWIDGET_6071"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Modelos Fiscais Permitidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1094"><a data-toggle="tab" href="#tabWIDGET_1094"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tributos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6208">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6208" Title="Códigos de ajuste CFOP" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_CODIGOSAJUSTECFOP.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.NATUREZAFISCAL = @CAMPO(HANDLE)) AND (A.PLANOFISCAL = @CAMPO(PLANO) )" FormUrl="~/aga/a/f/aga_t3994_at6208_hs7d66e047.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PLANO_NATUREZAFISCAL__NATUREZAFISCAL_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6071">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6071" Title="Modelos Fiscais Permitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_MODELOSNATUREZASFISCAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.NATUREZAFISCAL = @CAMPO(HANDLE)) AND (A.PLANOFISCAL= @CAMPO(PLANO))
" FormUrl="~/aga/a/f/aga_t3889_at6071_hs1480cb5d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PLANO_NATUREZAFISCAL__NATUREZAFISCAL_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1094">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1094" Title="Tributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOTRIBUTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.NATUREZAFISCAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1333_at1094_hsdfec0516.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PLANO_NATUREZAFISCAL__NATUREZAFISCAL_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    