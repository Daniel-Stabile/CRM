<%@ Page Title="Inf. Financeiras/Contábeis" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FINALIDADE" Title="Finalidade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_FINALIDADES.INFORMACOES_CONTABEIS.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="PORTAL_INT_PARAMETORSMOVIMENTACAO" Level="20" Order="0"  />
        <wes:AjaxForm runat="server" ID="WIDGETID_636259447258564292" Title="Inf. Financeiras/Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FINALIDADE" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_PARAMETROS_MOVIMENTACAO_FINALIDADE.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT PARAMETROS FROM CP_FINALIDADEPARAMETROS WHERE EMPRESAPARAMETROS = @EMPRESA 
AND FINALIDADE = @CAMPO(HANDLE))" UserDefinedCommandsVisible="False" PageId="PORTAL_INT_PARAMETORSMOVIMENTACAO" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    