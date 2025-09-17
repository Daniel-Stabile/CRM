<%@ Page Title="RVS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="RVS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_TR_SSRVS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="SS_LOTES_ASSOCIACAO__SS_LOTES_RVS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8463" Title="Operações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_SSRVSOPERACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT TR_SSLOTESASSOCIACAO.LIGACAO FROM TR_SSLOTESASSOCIACAO WHERE TR_SSLOTESASSOCIACAO.TIPO = 7 AND TR_SSLOTESASSOCIACAO.LOTE = @RASTRO(TR_SSLOTES) ) 
AND A.RVS = @RASTRO(TR_SSRVS) AND (A.RVS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4625_at8463_hs52a11e4c.aspx" UserDefinedDisableRowSelection="False" PageId="SS_LOTES_ASSOCIACAO__SS_LOTES_RVS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8464" Title="Retificação Operações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_SSRVSRETIFICACAOOPERACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT TR_SSLOTESASSOCIACAO.LIGACAO FROM TR_SSLOTESASSOCIACAO WHERE TR_SSLOTESASSOCIACAO.TIPO = 9 AND TR_SSLOTESASSOCIACAO.LOTE = @RASTRO(TR_SSLOTES) ) 
AND A.RVS = @RASTRO(TR_SSRVS) AND (A.RVS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5825_at8464_hs57c5ae0a.aspx" UserDefinedDisableRowSelection="False" PageId="SS_LOTES_ASSOCIACAO__SS_LOTES_RVS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    