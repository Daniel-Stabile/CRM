<%@ Page Title="Recursos recebidos para associação desportiva" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="RECURSOSRECEBIDOSPARAASSOCIAODESPORTIVA" Title="Recursos recebidos para associação desportiva" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_RECURSOSESPORTE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_RECURSOESPORTE" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DETALHAMENTODOSRECURSOSRECEBIDOS_1" class="active"><a data-toggle="tab" href="#tabDETALHAMENTODOSRECURSOSRECEBIDOS_1"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Detalhamento dos recursos recebidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSOSSEMRETENES"><a data-toggle="tab" href="#tabPROCESSOSSEMRETENES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Processos sem retenções")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabDETALHAMENTODOSRECURSOSRECEBIDOS_1">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DETALHAMENTODOSRECURSOSRECEBIDOS_1" Title="Detalhamento dos recursos recebidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECURSOSRECEBIDOSPARAASSOCIAODESPORTIVA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_RECURSOSESPORTEDETALHE_REPASSADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.RECURSOSESPORTE = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/RecursosEsporteDetalhesRepassado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_RECURSOESPORTE" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabPROCESSOSSEMRETENES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROCESSOSSEMRETENES" Title="Processos sem retenções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECURSOSRECEBIDOSPARAASSOCIAODESPORTIVA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_PROCESSOSSEMRETENCAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.RECURSO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/ProcessoSemRetencao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_RECURSOESPORTE" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    