<%@ Page Title="DFC - Demonstrativo do Fluxo de Caixa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="DFC" Title="DFC - Demonstrativo do Fluxo de Caixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="WEB_CT_DEMONSTRACOES.DFC.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.DEMONSTRATIVO=6" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_DEMONSTRACOES_DFC" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    