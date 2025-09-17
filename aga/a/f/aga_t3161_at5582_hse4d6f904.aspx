<%@ Page Title="REG.C790: ANALÍTICO DOS DOCTOS. COTA ÚNI" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="REG.C790: ANALÍTICO DOS DOCTOS. COTA ÚNI" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_IMPOSTOANALITICO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_ABAIXO_C700_SAIDAS__REGISTRO_C790_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5581" Title="REG.C791: INF. DE ICMS ST POR UF" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_SERVICOCONSOLIDADOICMSST.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTOANALITICO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3182_at5581_hs9f8c2dd1.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_ABAIXO_C700_SAIDAS__REGISTRO_C790_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    