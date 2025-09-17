<%@ Page Title="Usuários" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.SiteSettings.GroupUsersFormPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="USUARIO" Title="Usuário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_GRUPOUSUARIOS.TEC.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GROUPUSERSFORM" Level="15" Order="100"  />
      <div class="col-md-6"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PAPEISATRIBUIDOS" class="active"><a data-toggle="tab" href="#tabPAPEISATRIBUIDOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Papéis atribuídos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FILTRODEREGISTRO"><a data-toggle="tab" href="#tabFILTRODEREGISTRO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filtro de registro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMPRESAS"><a data-toggle="tab" href="#tabEMPRESAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empresas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESTRIESDEACESSO"><a data-toggle="tab" href="#tabRESTRIESDEACESSO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Restrições de acesso")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPAPEISATRIBUIDOS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="PAPEISATRIBUIDOS" Title="Papéis atribuídos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="USUARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_PAPELATRIBUICOES.USUARIO.PAPEL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE) AND A.TIPOOBJETO = 2" PageId="GROUPUSERSFORM" Level="15" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabFILTRODEREGISTRO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FILTRODEREGISTRO" Title="Filtro de registro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="USUARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="Z_FILTROS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE) AND A.CATEGORIA = 2" FormUrl="~/SiteSettings/RecordsFilter/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GROUPUSERSFORM" Level="15" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabEMPRESAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EMPRESAS" Title="Empresas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="USUARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="Z_GRUPOUSUARIOEMPRESAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE) AND A.GRUPO = @CAMPO(GRUPO)" FormUrl="~/SiteSettings/GroupUsers/ZGrupoUsuarioEmpresas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GROUPUSERSFORM" Level="15" Order="130"  />
    <wes:EditableGrid runat="server" ID="FILIAIS" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="EMPRESAS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_GRUPOUSUARIOEMPRESAFILIAIS.TEC.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(USUARIO) AND A.GRUPO = @CAMPO(GRUPO) AND A.EMPRESA = @CAMPO(EMPRESA)" PageId="GROUPUSERSFORM" Level="15" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabRESTRIESDEACESSO">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="RESTRIESDEACESSO" Title="Restrições de acesso" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="USUARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_ACESSORESTRICOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" KeepSelectionWhenFilter="True" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @CAMPO(HANDLE)" ShowExport="True" PageId="GROUPUSERSFORM" Level="15" Order="150"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            $(document).ready(function() {
    $("[href='#tabRESTRIESDEACESSO']").append('<div class="label-title-help"><i class="fa-duotone fa-circle-question fa-fw help-tooltip"  data-original-title="Intervalos para acessar o sistema."></i></div>');
});

            </script>
      </asp:Content>
    