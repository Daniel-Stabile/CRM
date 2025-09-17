<%@ Page Title="REG.M310 - CONTAS RELACIONADAS A PARTE A" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="REG.M310 - CONTAS RELACIONADAS A PARTE A" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_EDCF_LELALURCONTAS_A.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ECF_M300_ABAIXO__ECF_M310_LELALURCONTASA_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7675" Title="REG.M312 - NUMERO LANÇAMENTOS REL. CONTA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_EDCF_LELALURNUMEROLANCAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.LELALURCONTASA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5312_at7675_hs98e4e0c6.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ECF_M300_ABAIXO__ECF_M310_LELALURCONTASA_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    