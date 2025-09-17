<%@ Page Title="R-2030 - Recursos Recebidos por Assoc. Desportiva" Language="C#" Inherits="PortalReinf.a.Registro.Cadastro.R2030Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R2030RECURSOSRECEBIDOSPORASSOCDESPORTIVA" Title="R-2030 - Recursos Recebidos por Assoc. Desportiva" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2030.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R2030_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECURSOSRECEBIDOS" class="active"><a data-toggle="tab" href="#tabRECURSOSRECEBIDOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recursos recebidos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabRECURSOSRECEBIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECURSOSRECEBIDOS" Title="Recursos recebidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2030RECURSOSRECEBIDOSPORASSOCDESPORTIVA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_RECURSOSESPORTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R2030 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/RecursosEsporte.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R2030_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    