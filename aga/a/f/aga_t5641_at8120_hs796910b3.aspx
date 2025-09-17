<%@ Page Title="ECF - Escrituração Contábil Fiscal - Y540 - Receita dos Estabelecimentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="ECF - Escrituração Contábil Fiscal - Y540 - Receita dos Estabelecimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_EDCF_PARAMETROSRECEITA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ABAIXO_TABELAS_AUX_ECF__CONFIG_ECF_PARAMETROS_RECEITA_CNAE_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8121" Title="Contas contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_EDCF_PARAMETROSRECEITACONTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PARAMETROSRECEITA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5642_at8121_hse5be0f1c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ABAIXO_TABELAS_AUX_ECF__CONFIG_ECF_PARAMETROS_RECEITA_CNAE_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    