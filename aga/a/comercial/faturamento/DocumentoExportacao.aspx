<%@ Page Title="Documentos de exportação" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.faturamento.DocumentoExportacao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSDEEXPORTAO" Title="Documentos de exportação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOEXPORTACAO.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_FATURAMENTO_DOCUMENTOEXPORTACAO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="DOCUMENTOEXPORTAO" Title="Documento exportação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOSDEEXPORTAO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOEXPORTACAO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_FATURAMENTO_DOCUMENTOEXPORTACAO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              setTimeout(() => Benner.Grid.DOCUMENTOSDEEXPORTAO.select(0),100)
              </script>
      </asp:Content>
    