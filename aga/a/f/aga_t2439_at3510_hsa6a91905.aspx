<%@ Page Title="Fracionamentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Fracionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITEMFRACIONAMENTOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_DO_ATIVO__FRACIONAMENTOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3523" Title="Contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTRATO FROM CM_CONTRATOITENS
WHERE PRODUTO IN (SELECT PRODUTO FROM AT_ITEMFRACIONAMENTOS WHERE HANDLE =@RASTRO(AT_ITEMFRACIONAMENTOS))) AND (A.EHCONTRATO = 'S'  AND A.ORIGINAL IS NULL )" FormUrl="~/aga/a/f/aga_t2035_at3523_hs8af3df19.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_DO_ATIVO__FRACIONAMENTOS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3522" Title="Fotos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_AT_ITEMFRACIONAMENTOFOTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FRACIONAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2440_at3522_hs42f15b08.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_DO_ATIVO__FRACIONAMENTOS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    