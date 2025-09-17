<%@ Page Title="Cálculo da CSLL - N660 - Cálculo Mensal por Estimativa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cálculo da CSLL - N660 - Cálculo Mensal por Estimativa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_EDCF_LRFORMASAPURACAO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ECF_CALCULO_IRPJ__ECF_N030_PERIODOS_N660_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7701" Title="REG.N660 - CÁLCULO MENSAL POR ESTIMATIVA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_EDCF_LRCALCULOCSLLESTIMATIVA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.LRFORMASAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5332_at7701_hs1206ad3.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ECF_CALCULO_IRPJ__ECF_N030_PERIODOS_N660_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    