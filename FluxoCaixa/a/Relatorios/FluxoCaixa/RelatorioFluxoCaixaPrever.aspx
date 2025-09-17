<%@ Page Title="Previsão do Relatório" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PARMETROSSELECIONADOS_1" Title="PARÂMETROS SELECIONADOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_VIRTUAL_REL_FLUXOCAIXA_VISUALIZACAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FX_PREV_RELATORIO" Level="20" Order="5"  />
        <wes:ReportViewer runat="server" ID="RELATRIODEFLUXODECAIXA" Title="Relatório de fluxo de caixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PARMETROSSELECIONADOS_1" ChromeState="Normal" ReportCode="FX.0001" ShowPageBorders="False" ShowToolBar="True" PageId="FX_PREV_RELATORIO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    