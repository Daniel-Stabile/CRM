<%@ Page Title="Usuários" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Usuários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_Z_GRUPOUSUARIOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ADM__USUARIOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1820" class="active"><a data-toggle="tab" href="#tabWIDGET_1820"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Adicionar permissões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_451"><a data-toggle="tab" href="#tabWIDGET_451"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Agendas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1995"><a data-toggle="tab" href="#tabWIDGET_1995"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alçadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1001"><a data-toggle="tab" href="#tabWIDGET_1001"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empresas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2524"><a data-toggle="tab" href="#tabWIDGET_2524"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filtro de registros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7588"><a data-toggle="tab" href="#tabWIDGET_7588"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Integrar lembrete")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7112"><a data-toggle="tab" href="#tabWIDGET_7112"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Permissões do mód. manutenção de frotas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TERMOSDEUSO"><a data-toggle="tab" href="#tabTERMOSDEUSO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Termos de Uso")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1820">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1820" Title="Adicionar permissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_Z_GRUPOUSUARIOGRUPOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.USUARIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1763_at1820_hs4eb5a2ba.aspx" UserDefinedDisableRowSelection="False" PageId="ADM__USUARIOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_451">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_451" Title="Agendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_AGENDAUSUARIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.USUARIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t905_at451_hs6e2037db.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__USUARIOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1995">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1995" Title="Alçadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_Z_GRUPOUSUARIOALCADAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.USUARIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1863_at1995_hs5d6637a1.aspx" UserDefinedDisableRowSelection="False" PageId="ADM__USUARIOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1001">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1001" Title="Empresas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOUSUARIOEMPRESAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.USUARIO = @CAMPO(HANDLE)) AND A.GRUPO = @CAMPO(GRUPO)  " FormUrl="~/aga/a/f/aga_t1281_at1001_hs2aca00ff.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__USUARIOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2524">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2524" Title="Filtro de registros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_Z_FILTROS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(PERMISSAO = 'S') AND (A.USUARIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t631_at2524_hs8e935239.aspx" UserDefinedDisableRowSelection="False" PageId="ADM__USUARIOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7588">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_7588" Title="Integrar lembrete" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PARAMETROSLEMBRETES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.USUARIO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="ADM__USUARIOS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7112">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_7112" Title="Permissões do mód. manutenção de frotas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_USUARIOPERMISSOES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.TIPOREGISTRO = 1 AND (A.USUARIO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="ADM__USUARIOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabTERMOSDEUSO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="TERMOSDEUSO" Title="Termos de Uso" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_USUARIOTERMOUSO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT MAX(HANDLE) FROM GN_USUARIOTERMOUSO WHERE USUARIO = @CAMPO(HANDLE) )" UserDefinedCommandsVisible="False" PageId="ADM__USUARIOS_FORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    