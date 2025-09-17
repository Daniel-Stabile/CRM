<%@ Page Title="Itens do imobilizado" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Ativo.CamposPISCOFINSPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens do imobilizado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITENS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1006" class="active"><a data-toggle="tab" href="#tabWIDGET_1006"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Adições")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7449"><a data-toggle="tab" href="#tabWIDGET_7449"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6216"><a data-toggle="tab" href="#tabWIDGET_6216"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Componentes da composição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1970"><a data-toggle="tab" href="#tabWIDGET_1970"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Inventários")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_940"><a data-toggle="tab" href="#tabWIDGET_940"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ocorrências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3511"><a data-toggle="tab" href="#tabWIDGET_3511"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Reavaliações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTRATOS"><a data-toggle="tab" href="#tabCONTRATOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contratos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1006">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1006" Title="Adições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_AT_ITENS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @RASTRO(AT_ITENS)) AND (A.VALORBAIXADOINDICE  IS NULL OR A.VALORBAIXADOINDICE  &lt;   A.VALORINDICE)" FormUrl="~/aga/a/f/aga_t1255_at1006_hs738bc813.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7449">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7449" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_AT_ITEMANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5130_at7449_hsdda6e504.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6216">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6216" Title="Componentes da composição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_AT_ITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ITEMPRINCIPAL = @RASTRO(AT_ITENS) AND (A.ITEMPRINCIPAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1255_at6216_hsa85ec87c.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1970">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1970" Title="Inventários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_AT_ITEMINVENTARIOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1834_at1970_hs36c030cc.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_940">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_940" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_AT_OCORRENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1256_at940_hs782cc273.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3511">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3511" Title="Reavaliações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_AT_ITEMREAVALIACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2443_at3511_hs174b891a.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTRATOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTRATOS" Title="Contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_ITEMCONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1816_at942_hs8cef086e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_DO_IMOBILIZADO_FORM" Level="20" Order="130"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    