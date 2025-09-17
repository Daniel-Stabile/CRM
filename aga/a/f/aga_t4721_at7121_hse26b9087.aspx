<%@ Page Title="Formação de preços de venda no servidor - Todas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Formação de preços de venda no servidor - Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CM_SIMULACAOLISTAPRECOSERVIDOR.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CM_SIMULACAOLISTAPRECOSERVIDOR_PASTA__SIMULACAOLISTAPRECOSERVIDOR_TODAS_FORM" Level="20" Order="1"  />
        <wes:AjaxForm runat="server" ID="WIDGET_7123" Title="Simulação gerada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CM_SIMULACAOLISTAPRECOTABELAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EXECUCAONOSERVIDOR = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CM_SIMULACAOLISTAPRECOSERVIDOR_PASTA__SIMULACAOLISTAPRECOSERVIDOR_TODAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    