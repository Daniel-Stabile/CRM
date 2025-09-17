<%@ Page Title="REG.C860: EQUIPAMENTO SAT - CF-E (59) - Não gerados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="REG.C860: EQUIPAMENTO SAT - CF-E (59) - Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFDPC_SAIDAS_REGISTROC860__ED_CARGA_EFDPC_SAIDAS_REGISTROC860NGR_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8200" Title="REG.C870: RESUMO DIÁRIO - PIS/COFINS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
 SELECT ITEM.HANDLE 
   FROM ED_PCDOCUMENTOITENS ITEM 
   JOIN ED_CLASSIFICACOESTRIBUTARIAS PIS ON PIS.HANDLE = ITEM.CSTPIS
   JOIN ED_CLASSIFICACOESTRIBUTARIAS COFINS ON COFINS.HANDLE = ITEM.CSTCOFINS
  WHERE PIS.CODIGO &lt;&gt; 3 AND COFINS.CODIGO &lt;&gt; 3
) AND (A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4003_at8200_hs9fddfde.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFDPC_SAIDAS_REGISTROC860__ED_CARGA_EFDPC_SAIDAS_REGISTROC860NGR_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8204" Title="REG.C880: RESUMO DIÁRIO - UNIDADE MEDIDA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
 SELECT ITEM.HANDLE 
   FROM ED_PCDOCUMENTOITENS ITEM 
   JOIN ED_CLASSIFICACOESTRIBUTARIAS PIS ON PIS.HANDLE = ITEM.CSTPIS
   JOIN ED_CLASSIFICACOESTRIBUTARIAS COFINS ON COFINS.HANDLE = ITEM.CSTCOFINS
  WHERE PIS.CODIGO = 3 AND COFINS.CODIGO = 3
) AND (A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4003_at8204_hs374326e5.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFDPC_SAIDAS_REGISTROC860__ED_CARGA_EFDPC_SAIDAS_REGISTROC860NGR_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8201" Title="REG.C890: PROCESSOS REFERENCIADOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOPROCESSO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4082_at8201_hsd9ea9b80.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFDPC_SAIDAS_REGISTROC860__ED_CARGA_EFDPC_SAIDAS_REGISTROC860NGR_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    