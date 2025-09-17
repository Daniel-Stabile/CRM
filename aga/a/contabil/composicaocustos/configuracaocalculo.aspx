<%@ Page Title="Cálculo composição de custos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CLCULO" Title="Cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CONTAGERENCIALORCAMENTARIAS.CONFIGURACAO_CALCULO_CUSTOS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.PLANOGERENCIAL = @CAMPO(PLANO) AND A.CONTAGERENCIAL = @CAMPO(HANDLE) AND A.PLANOORCAMENTARIO = @CAMPO(PLANO)" UserDefinedCommandsVisible="True" PageId="CT_CONTAGERENCIALORCAMENTARIAS_CONFIGURACAOCALCULOCUSTOFORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    