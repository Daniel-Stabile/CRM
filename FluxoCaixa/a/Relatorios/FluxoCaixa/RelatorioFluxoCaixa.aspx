<%@ Page Title="Relatório de Fluxo de Caixa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:ReportViewer runat="server" ID="RELATRIODEFLUXODECAIXA" Title="Relatório de Fluxo de Caixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" ReportCode="FX.0001" ShowPageBorders="False" ShowToolBar="False" PageId="FLUXOCAIXA_A_RELATORIO_FLUXOCAIXA_EXIBICAO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    