<%@ Page Title="Contratos - Monitor de assinaturas digitais" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.assinaturaDigital.Monitor" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PAINEL" Title="Contratos - Monitor de assinaturas digitais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CN_VTMONITORASSINATURADIGITAL.PAINEL.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_A_CONTRATOS_ASSINATURADIGITAL_MONITOR" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ULTIMAS_EXECUCOES" Title="Últimas execuções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="Z_PROCESSOS.MONITOR_ASSINATURA_DIGITAL_CONTRATOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.NOME LIKE 'Contratos - Sincronização assinaturas digitais%'" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_CONTRATOS_ASSINATURADIGITAL_MONITOR" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="DOCUMENTOS_EM_ASSINATURA" Title="Documentos em assinatura" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_MODELODOCUMENTOS.MONITOR_ASSINATURAS_DIGITAIS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (

SELECT MAX(CN_MODELODOCUMENTOS.HANDLE) AS HANDLE FROM CN_MODELODOCUMENTOS
JOIN CN_CONTRATOS ON CN_MODELODOCUMENTOS.CONTRATO = CN_CONTRATOS.HANDLE
LEFT JOIN CN_CONTRATOADITIVOS ON CN_MODELODOCUMENTOS.ADITIVO = CN_CONTRATOADITIVOS.HANDLE
WHERE CN_CONTRATOS.STATUS = 11 OR CN_CONTRATOADITIVOS.STATUS = 7
AND CN_MODELODOCUMENTOS.IDDOCUMENTOASSINATURADIGITAL IS NOT NULL
GROUP BY CN_MODELODOCUMENTOS.CONTRATO, CN_MODELODOCUMENTOS.ADITIVO, CN_CONTRATOS.NUMERO, CN_CONTRATOADITIVOS.NUMERO, CN_MODELODOCUMENTOS.DOCUMENTO
)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_CONTRATOS_ASSINATURADIGITAL_MONITOR" Level="20" Order="30"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
   setInterval(function () {
       Benner.Page.PAINEL.refresh();
   }, 10000); 
});
              </script>
        <style>
              #ULTIMAS_EXECUCOES th, td {
    white-space:nowrap !important;
}

#DOCUMENTOS_EM_ASSINATURA th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    