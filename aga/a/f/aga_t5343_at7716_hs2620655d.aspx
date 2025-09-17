<%@ Page Title="Arbitrado - T120 - Apuração da Base de Cálculo IRPJ" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Arbitrado - T120 - Apuração da Base de Cálculo IRPJ" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_EDCF_LAFORMASAPURACAO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ECF_ARBITRADO__ECF_T030_PERIODOS_T120_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7712" Title="REG.T120 - APURAÇÃO DA BASE CÁLCULO IRPJ" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_EDCF_LAAPURACAOIRPJ.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.LAFORMASAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5344_at7712_hs3e6e547a.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ECF_ARBITRADO__ECF_T030_PERIODOS_T120_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    