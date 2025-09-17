<%@ Page Title="R-2040 - Retenções - Recursos Rep. Assoc. Desportiva" Language="C#" Inherits="PortalReinf.a.Registro.Cadastro.R2040Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R2040RETENESRECURSOSREPASSOCDESPORTIVA" Title="R-2040 - Retenções - Recursos Rep. Assoc. Desportiva" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2040.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R2040_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECURSOSREPASSADOS" class="active"><a data-toggle="tab" href="#tabRECURSOSREPASSADOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recursos repassados")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabRECURSOSREPASSADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECURSOSREPASSADOS" Title="Recursos repassados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2040RETENESRECURSOSREPASSOCDESPORTIVA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_RECURSOSESPORTE_REPASSADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R2040 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/RecursosEsporteRepassado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R2040_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    