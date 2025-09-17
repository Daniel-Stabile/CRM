<%@ Page Title="Totalizadores do evento R-2010 para o evento R-5001" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="TOTALIZADORESDOEVENTOR2010" Title="Totalizadores do evento R-2010" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R5001TOTALIZADORR2010.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_TOTALIZADOR_R2010" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORSERVIOTOMADO" class="active"><a data-toggle="tab" href="#tabTOTALIZADORSERVIOTOMADO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizador serviço tomado")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTOTALIZADORSERVIOTOMADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORSERVIOTOMADO" Title="Totalizador serviço tomado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TOTALIZADORESDOEVENTOR2010" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_TOTALIZADORSERVICOTOMADO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" FormUrl="~/PortalReinf/a/Registros/TotalizadorServicoTomado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_TOTALIZADOR_R2010" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    