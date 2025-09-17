<%@ Page Title="Centros de custo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Centros de custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CS_CONTABILIDADERATEIOCC.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_CS_CALCULOS__TOTAISCONTABILIDADE_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7893" Title="Centros trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CS_CONTABILIDADEPRODUCAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CENTROCUSTO = (SELECT X.CENTROCUSTO FROM CS_CONTABILIDADERATEIOCC X WHERE X.HANDLE = @RASTRO(CS_CONTABILIDADERATEIOCC))
AND 
A.COMPETENCIA = (SELECT Y.COMPETENCIA FROM CS_CONTABILIDADERATEIOCC Y WHERE Y.HANDLE = @RASTRO(CS_CONTABILIDADERATEIOCC))
AND 
A.FILIAL = (SELECT Z.FILIAL FROM CS_CONTABILIDADERATEIOCC Z WHERE Z.HANDLE = @RASTRO(CS_CONTABILIDADERATEIOCC))" FormUrl="~/aga/a/f/aga_t5411_at7893_hs6a1e2484.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_CS_CALCULOS__TOTAISCONTABILIDADE_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7892" Title="Lançamentos contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CS_CONTABILIDADE.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CENTRO = (SELECT X.CENTROCUSTO FROM CS_CONTABILIDADERATEIOCC X WHERE X.HANDLE = @RASTRO(CS_CONTABILIDADERATEIOCC))
AND 
A.COMPETENCIA = (SELECT Y.COMPETENCIA FROM CS_CONTABILIDADERATEIOCC Y WHERE Y.HANDLE = @RASTRO(CS_CONTABILIDADERATEIOCC))
AND 
A.FILIAL = (SELECT Z.FILIAL FROM CS_CONTABILIDADERATEIOCC Z WHERE Z.HANDLE = @RASTRO(CS_CONTABILIDADERATEIOCC))" FormUrl="~/aga/a/f/aga_t2502_at7892_hsaecf7494.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_CS_CALCULOS__TOTAISCONTABILIDADE_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    