<%@ Page Title="Documentos de Importação" Language="C#" Inherits="aga.a.comercial.faturamento.DocumentoImportacao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSDEIMPORTAO" Title="Documentos de Importação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOIMPORTACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_FATURAMENTO_DOCUMENTOIMPORTACAO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="DOCUMENTODEIMPORTAO" Title="Documento Importação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOSDEIMPORTAO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOIMPORTACAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_FATURAMENTO_DOCUMENTOIMPORTACAO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              setTimeout(() => Benner.Grid.DOCUMENTOSDEIMPORTAO.select(0),100)
              </script>
      </asp:Content>
    