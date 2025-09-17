<%@ Page Title="Workflow - Usuários" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Workflow - Usuários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOUSUARIOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ADM_WORKFLOW__USUARIOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ADICIONARPERMISSES" class="active"><a data-toggle="tab" href="#tabADICIONARPERMISSES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Adicionar permissões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALADAS"><a data-toggle="tab" href="#tabALADAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alçadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FILTRODEREGISTROS"><a data-toggle="tab" href="#tabFILTRODEREGISTROS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filtro de registros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMPRESAS"><a data-toggle="tab" href="#tabEMPRESAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empresas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AGENDAS"><a data-toggle="tab" href="#tabAGENDAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Agendas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabADICIONARPERMISSES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="ADICIONARPERMISSES" Title="Adicionar permissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOUSUARIOGRUPOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE) AND A.GRUPO = @CAMPO(GRUPO)" PageId="ADM_WORKFLOW__USUARIOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabALADAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="ALADAS" Title="Alçadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOUSUARIOALCADAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE) " PageId="ADM_WORKFLOW__USUARIOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabFILTRODEREGISTROS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="FILTRODEREGISTROS" Title="Filtro de registros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_FILTROS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PERMISSAO = 'S')  AND A.USUARIO = @CAMPO(HANDLE)" PageId="ADM_WORKFLOW__USUARIOS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabEMPRESAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="EMPRESAS" Title="Empresas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOUSUARIOEMPRESAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE) AND A.GRUPO = @CAMPO(GRUPO)" PageId="ADM_WORKFLOW__USUARIOS_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabAGENDAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AGENDAS" Title="Agendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_AGENDAUSUARIOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t905_at451_hs6e2037db.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM_WORKFLOW__USUARIOS_FORM" Level="20" Order="80"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    