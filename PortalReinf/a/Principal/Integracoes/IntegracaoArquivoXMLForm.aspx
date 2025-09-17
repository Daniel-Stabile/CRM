<%@ Page Title="Integração arquivo XML" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INTEGRAOARQUIVOXML" Title="Integração arquivo XML" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INTEGRACAOARQUIVO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_INTEGRACAO_ARQUIVO_XML_FORM" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="TANQUEDEINTEGRAO" Title="Tanque de integração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INTEGRACAOXML.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = ( SELECT TANQUEWS FROM REINF_INTEGRACAOARQUIVO WHERE HANDLE = @TABELA(REINF_INTEGRACAOARQUIVO) )" UserDefinedCommandsVisible="True" PageId="REINF_INTEGRACAO_ARQUIVO_XML_FORM" Level="20" Order="20"  />
        <wes:AjaxForm runat="server" ID="EVENTONOREINFAUDITORIA" Title="Evento no REINF (auditoria)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_AUDITORIAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = ( SELECT AUDITORIA FROM REINF_INTEGRACAOXML WHERE HANDLE= ( SELECT TANQUEWS FROM REINF_INTEGRACAOARQUIVO WHERE HANDLE = @TABELA(REINF_INTEGRACAOARQUIVO) ) )" UserDefinedCommandsVisible="True" PageId="REINF_INTEGRACAO_ARQUIVO_XML_FORM" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    