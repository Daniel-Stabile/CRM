<%@ Page Title="Balancete Diário - I300 - Balancete Diário" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Balancete Diário - I300 - Balancete Diário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_BALANCETESDIARIOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_ECD_BALANCETE_DIARIO__BALANCETE_DIARIO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5476" Title="I310 - Detalhes do Balancete Diário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_BALANCETEDIARIODETALHES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BALANCETE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3239_at5476_hs3ded5ea7.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_BALANCETE_DIARIO__BALANCETE_DIARIO_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    