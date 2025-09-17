<%@ Page Title="Parte B - Controle das contas - Lançamentos sem reflexo na parte A" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Parte B - Controle das contas - Lançamentos sem reflexo na parte A" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_EDCF_LEFORMASAPURACAO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ECF_REAL_LACS_PARTE_B__ECF_M030_PERIODOS_M410_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7667" Title="REG.M410 - LANÇ S/ REFLEXO PARTE A" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_EDCF_LELANCAMENTOSPARTE_B.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CODIGOTRIBUTO = 'C' AND (A.LEFORMASAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5308_at7667_hsda3cacd8.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ECF_REAL_LACS_PARTE_B__ECF_M030_PERIODOS_M410_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    