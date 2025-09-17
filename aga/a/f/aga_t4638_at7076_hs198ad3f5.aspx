<%@ Page Title="Roteiros de rodízio de pneus" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Roteiros de rodízio de pneus" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_VEICULOMANUTENCAOPREVENTIVA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_VEICULOS__RODIZIO_PNEUS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7077" Title="Aguardando gerar OS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_MF_PLANOPREVENTIVO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ROTEIROMANUTENCAO IN 
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARODIZIOPNEU = 'S')
AND A.ORDEMSERVICO IS NULL AND (A.VEICULOMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4637_at7077_hs4812dbf9.aspx" UserDefinedDisableRowSelection="False" PageId="MF_VEICULOS__RODIZIO_PNEUS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7078" Title="Com OS gerada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_MF_PLANOPREVENTIVO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ROTEIROMANUTENCAO IN 
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARODIZIOPNEU = 'S')
AND (A.ORDEMSERVICO IS NOT NULL) AND (A.ORDEMSERVICO NOT IN (SELECT HANDLE FROM MF_ORDEMSERVICOS WHERE STATUS = 3)) AND (A.VEICULOMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4637_at7078_hsc3ee6cc2.aspx" UserDefinedDisableRowSelection="False" PageId="MF_VEICULOS__RODIZIO_PNEUS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    