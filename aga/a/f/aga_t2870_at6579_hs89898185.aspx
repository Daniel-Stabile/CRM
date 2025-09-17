<%@ Page Title="Itens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_PR_ORDEMINDUSTRIALIZADOITENS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_CONSULTA_INDUSTRIALIZADO__ITENS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5069" Title="Ordem de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT ORDEMCOMPRA FROM CP_ORDENSCOMPRAITENS WHERE HANDLE IN(SELECT ORDEMCOMPRAITEM FROM PR_ORDEMINDUSTRIALIZADOITENS WHERE HANDLE =  @RASTRO(PR_ORDEMINDUSTRIALIZADOITENS)))" FormUrl="~/aga/a/f/aga_t1529_at5069_hsba2de824.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_CONSULTA_INDUSTRIALIZADO__ITENS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5070" Title="Requisições de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CP_REQUISICOESPAI.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT REQUISICAOPAI FROM CP_REQUISICOES WHERE HANDLE IN(SELECT REQUISICAO FROM PR_ORDEMINDUSTRIALIZADOITENS WHERE HANDLE =  @RASTRO(PR_ORDEMINDUSTRIALIZADOITENS)))" FormUrl="~/aga/a/f/aga_t2311_at5070_hs7ceffa20.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_CONSULTA_INDUSTRIALIZADO__ITENS_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6182" Title="Simples remessa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_PR_INSUMOSENVIADOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT A.HANDLE 
  FROM PR_INSUMOSENVIADOS A, 
             CM_ITENS B, 
             PR_ORDEMINDUSTRIALIZADOITENS C 
WHERE A.ITEMNF = B.HANDLE 
     AND A.ORDEMINDUSTRIALIZADOITEM = C.HANDLE 
     AND C.ORDEMINDUSTRIALIZADO = @RASTRO(PR_ORDEMINDUSTRIALIZADOS)
     AND C.HANDLE = @RASTRO(PR_ORDEMINDUSTRIALIZADOITENS)) AND (A.ORDEMINDUSTRIALIZADOITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3035_at6182_hsd84b856d.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_CONSULTA_INDUSTRIALIZADO__ITENS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    