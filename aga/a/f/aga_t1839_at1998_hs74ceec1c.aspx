<%@ Page Title="Centros de trabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Centros de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_PR_CENTROSTRABALHO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFAS" class="active"><a data-toggle="tab" href="#tabTAREFAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FERIADOSFOLGAS"><a data-toggle="tab" href="#tabFERIADOSFOLGAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Feriados/Folgas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEIS"><a data-toggle="tab" href="#tabRESPONSVEIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3463"><a data-toggle="tab" href="#tabWIDGET_3463"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Avisos processo produtivo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3438"><a data-toggle="tab" href="#tabWIDGET_3438"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Centros de custos diretos/indiretos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7211"><a data-toggle="tab" href="#tabWIDGET_7211"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Custos de absorção")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3437"><a data-toggle="tab" href="#tabWIDGET_3437"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Turnos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTAREFAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_TAREFACENTROTRABALHO.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CENTROTRABALHO = @CAMPO(HANDLE)" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="3"  /></div>
        </div>
        <div class="tab-pane" id="tabFERIADOSFOLGAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="FERIADOSFOLGAS" Title="Feriados/Folgas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_CENTROTRABALHOFERIADOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CENTROTRABALHO = @CAMPO(HANDLE)" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="5"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEIS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="RESPONSVEIS" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_CENTROTRABALHOINTEGRANTES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CENTROTRABALHO = @CAMPO(HANDLE)" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="7"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3463">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3463" Title="Avisos processo produtivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PR_AVISOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CENTROTRABALHO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2418_at3463_hse7af0b9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3438">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3438" Title="Centros de custos diretos/indiretos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CS_CUSTOCENTROSTRABALHO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CENTRODETRABALHO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2401_at3438_hs5d973b72.aspx" UserDefinedDisableRowSelection="False" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7211">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7211" Title="Custos de absorção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PR_CUSTOSMOD.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CENTROTRABALHO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4833_at7211_hsb43466e1.aspx" UserDefinedDisableRowSelection="False" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3437">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3437" Title="Turnos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PR_CENTROTRABALHOTURNOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CENTROTRABALHO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1853_at3437_hsd234018c.aspx" UserDefinedDisableRowSelection="False" PageId="PRODUCAO__CENTROSTRABALHO_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    