<%@ Page Title="Grupos de impostos retidos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Grupos de impostos retidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_LA_GRUPOCONTASIMPOSTORETIDO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LALUR__GRUPOIMPOSTOSRETIDOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5091" Title="Contas de impostos retidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_LA_IMPOSTORETIDOCONTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3073_at5091_hs32306d0f.aspx" UserDefinedDisableRowSelection="False" PageId="LALUR__GRUPOIMPOSTOSRETIDOS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7953" Title="Lançamentos contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CT_LANCAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 

SELECT RELACIONAMENTO.LANCAMENTOCONTABIL 
  FROM LA_GRUPOIMPOSTORETIDOLANCCONT RELACIONAMENTO 
 WHERE RELACIONAMENTO.GRUPOIMPOSTORETIDO = @TABELA(LA_GRUPOCONTASIMPOSTORETIDO)

)" FormUrl="~/aga/a/f/aga_t923_at7953_hsbcee79e0.aspx" UserDefinedDisableRowSelection="False" PageId="LALUR__GRUPOIMPOSTOSRETIDOS_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7954" Title="Lançamentos contábeis (sub conta)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CT_LANCAMENTOCC.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 

SELECT RELACIONAMENTO.LANCAMENTOCONTABILCC 
  FROM LA_GRUPOIMPOSTORETIDOLANCCONT RELACIONAMENTO 
 WHERE RELACIONAMENTO.GRUPOIMPOSTORETIDO = @TABELA(LA_GRUPOCONTASIMPOSTORETIDO)

)" FormUrl="~/aga/a/f/aga_t925_at7954_hs6b15745c.aspx" UserDefinedDisableRowSelection="False" PageId="LALUR__GRUPOIMPOSTOSRETIDOS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    