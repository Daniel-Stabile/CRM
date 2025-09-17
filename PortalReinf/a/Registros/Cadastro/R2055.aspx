<%@ Page Title="R-2055 - Aquisição de Produtor Rural" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.PortalReinf.a.Registro.Cadastro.CadastroR2055Page" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R2055AQUISIODEPRODUTORRURAL" Title="R-2055 - Aquisição de Produtor Rural" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2055.CUSTOM2.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTALREINF_A_REGISTROS_CADASTRO_R2055" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DETALHAMENTODAAQUISIODEPRODUTORRURAL" class="active"><a data-toggle="tab" href="#tabDETALHAMENTODAAQUISIODEPRODUTORRURAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Detalhamento da Aquisição de Produtor Rural")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSOJUDICIAL"><a data-toggle="tab" href="#tabPROCESSOJUDICIAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Processo Judicial")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabDETALHAMENTODAAQUISIODEPRODUTORRURAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DETALHAMENTODAAQUISIODEPRODUTORRURAL" Title="Detalhamento da Aquisição de Produtor Rural" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2055AQUISIODEPRODUTORRURAL" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2055DETALHEAQUISICAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R2055 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/AquisicaoProdutorRural.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALREINF_A_REGISTROS_CADASTRO_R2055" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabPROCESSOJUDICIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROCESSOJUDICIAL" Title="Processo Judicial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2055AQUISIODEPRODUTORRURAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2055PROCESSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R2055 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/ProcessoJudicial.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALREINF_A_REGISTROS_CADASTRO_R2055" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    