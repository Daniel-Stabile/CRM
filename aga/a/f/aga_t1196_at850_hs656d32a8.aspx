<%@ Page Title="Home banking (cobrança) - Ocorrência de retorno" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Home banking (cobrança) - Ocorrência de retorno" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_BANCOHBOCORRENCIARETORNO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_HOME_BANKING_COBRANCA__OCORRENCIA_DE_RETORNO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_4637" Title="Criticas de retorno" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBCRITICASRETORNO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OCORRENCIARETORNO = @CAMPO(HANDLE) AND  A.ENTIDADE=  @CAMPO(BANCO))" FormUrl="~/aga/a/f/aga_t1384_at4637_hs581e98cb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_HOME_BANKING_COBRANCA__OCORRENCIA_DE_RETORNO_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    