<%@ Page Title="Parâmetros do módulo SPED" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Parâmetros do módulo SPED" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PARAMETROFILIAIS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_FILIAIS__PARAMETROS_DO_MODULO_SPED_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1956_6667" Title="Carga de movimentações ICMS/IPI&gt;Documentos de entrada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PARAMETROSCARGAINFORMACOES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
  (TIPOESCRITURACAO = 1) 
AND 
  (SUPORTADOCARGAMOVIMENTACAO = 'S')
AND 
  (CODIGOCARGA LIKE '1%')
)" FormUrl="~/aga/a/f/aga_t4375_at6667_hseb03f8f3.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_FILIAIS__PARAMETROS_DO_MODULO_SPED_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1956_6668" Title="Carga de movimentações ICMS/IPI&gt;Documentos de saída" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PARAMETROSCARGAINFORMACOES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
  (TIPOESCRITURACAO = 1) 
AND 
  (SUPORTADOCARGAMOVIMENTACAO = 'S')
AND 
  (CODIGOCARGA LIKE '2%')
)" FormUrl="~/aga/a/f/aga_t4375_at6668_hs973a2317.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_FILIAIS__PARAMETROS_DO_MODULO_SPED_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1956_6669" Title="Carga de movimentações ICMS/IPI&gt;Outras informações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PARAMETROSCARGAINFORMACOES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
  (TIPOESCRITURACAO = 1) 
AND 
  (SUPORTADOCARGAMOVIMENTACAO = 'S')
AND 
  (
     (CODIGOCARGA LIKE '3%')
   OR
     (CODIGOCARGA LIKE '4%')
   OR
     (CODIGOCARGA LIKE '5%')
   OR
     (CODIGOCARGA LIKE '6%')
  )
)" FormUrl="~/aga/a/f/aga_t4375_at6669_hsa881145f.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_FILIAIS__PARAMETROS_DO_MODULO_SPED_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1956_7963" Title="Carga de movimentações ICMS/IPI&gt;Produção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PARAMETROSCARGAINFORMACOES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
  (TIPOESCRITURACAO = 1) 
AND 
  (SUPORTADOCARGAMOVIMENTACAO = 'S')
AND 
  (CODIGOCARGA LIKE '7%')
)" FormUrl="~/aga/a/f/aga_t4375_at7963_hs950c0ea1.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_FILIAIS__PARAMETROS_DO_MODULO_SPED_FORM" Level="20" Order="25"  />
        </div>
    
      </asp:Content>
    