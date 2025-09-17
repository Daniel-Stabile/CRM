<%@ Page Title="Árvore" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Árvore" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOARVORES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ADM_GRUPOS_DE_SEGURANCA__ARVORES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_998" class="active"><a data-toggle="tab" href="#tabWIDGET_998"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comandos a esconder")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5076"><a data-toggle="tab" href="#tabWIDGET_5076"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comandos a liberar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2901"><a data-toggle="tab" href="#tabWIDGET_2901"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Árvore tabelas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_998">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_998" Title="Comandos a esconder" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_Z_GRUPOARVORECOMANDOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PERMISSAO = 'E' AND (A.GRUPOARVORE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1278_at998_hs115bd18d.aspx" UserDefinedDisableRowSelection="False" PageId="ADM_GRUPOS_DE_SEGURANCA__ARVORES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5076">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5076" Title="Comandos a liberar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_Z_GRUPOARVORECOMANDOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PERMISSAO = 'L' AND (A.GRUPOARVORE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1278_at5076_hsb016bb42.aspx" UserDefinedDisableRowSelection="False" PageId="ADM_GRUPOS_DE_SEGURANCA__ARVORES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2901">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2901" Title="Árvore tabelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_Z_GRUPOARVORETABELAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t2232_at2901_hsa0dbaf7d.aspx" UserDefinedDisableRowSelection="False" PageId="ADM_GRUPOS_DE_SEGURANCA__ARVORES_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    