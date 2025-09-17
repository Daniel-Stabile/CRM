<%@ Page Title="Acompanhamento de assinatura digital" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ACOMPANHAMENTOASSINATURADIGITAL" Title="Assinaturas digitais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_MODELODOCUMENTOS.ACOMPANHAMENTO_ASSINATURA_DIGITAL.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_ACOMPANHAMENTOASSINATURASDIGITAIS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ASSINANTES" Title="ASSINANTES" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ACOMPANHAMENTOASSINATURADIGITAL" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOASSINANTES.ACOMPANHAMENTO_ASSINATURA_DIGITAL.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(@~CAMPO(ADITIVO) = -1 AND A.HANDLE IN (SELECT HANDLE FROM CN_CONTRATOASSINANTES WHERE CONTRATO = @CAMPO(CONTRATO))) 

OR 

(@~CAMPO(ADITIVO) &gt; -1 AND A.HANDLE IN (SELECT HANDLE FROM CN_CONTRATOASSINANTES WHERE ADITIVO = @CAMPO(ADITIVO)))" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_CONTRATOS_ACOMPANHAMENTOASSINATURASDIGITAIS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    