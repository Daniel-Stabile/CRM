<%@ Page Title="Crédito PIS/COFINS - Ativo Imobilizado - Aquisição" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Crédito PIS/COFINS - Ativo Imobilizado - Aquisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_TR_PCCREDITOATIVOAQUISICAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TR_CREDITO_PIS_COFINS_ATIVO_IMOBILIZADO__AQUISICAO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6674" Title="Processos referenciados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_PCCREDITOATIVOAQUISPROCESSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CREDITO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4384_at6674_hs50b5e6cf.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TR_CREDITO_PIS_COFINS_ATIVO_IMOBILIZADO__AQUISICAO_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    