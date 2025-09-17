<%@ Page Title="Atributos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMGP_PLANEJAMENTOATRIBUTOS" Title="Atributo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOATRIBUTOS.PLANEJAMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.PLANEJAMENTOESTRATEGICO = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOATRIBUTOS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMGP_PLANEJAMENTOATRIBUTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOANEXOS.ATRIBUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATRIBUTO = @CAMPO(HANDLE) AND 
A.PLANEJAMENTOESTRATEGICO = @CAMPO(PLANEJAMENTOESTRATEGICO)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Anexos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOATRIBUTOS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    