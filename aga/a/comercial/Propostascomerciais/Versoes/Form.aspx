<%@ Page Title="Versões" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMCM_CONTRATOVERSOES" Title="Versões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CM_CONTRATOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_CMCONTRATOVERSOES_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="GRIDCM_CONTRATOITENS" Title="Itens da proposta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMCM_CONTRATOVERSOES" ChromeState="Normal" EntityViewName="AGA_CM_CONTRATOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2038_at2359_hs3e884f47.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_CMCONTRATOVERSOES_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    