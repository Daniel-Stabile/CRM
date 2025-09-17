<%@ Page Title="EFD ICMS/IPI - Parâmetros conta contábil" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="EFD ICMS/IPI - Parâmetros conta contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_TR_MODELOSFISCAISPARAMETROS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_PARAMETROS_MODELO_FISCAL__PARAMETROSCONTACONTABIL_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5738" Title="Operações do modelo fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_MODELOSFISCAISOPERACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.MODELO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3440_at5738_hsbdababab.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PARAMETROS_MODELO_FISCAL__PARAMETROSCONTACONTABIL_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    