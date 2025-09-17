<%@ Page Title="Cadastros - I050 - Plano de Contas Contábil" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cadastros - I050 - Plano de Contas Contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PLANOVERSOES.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_FCONT_CADASTROS__PLANO_DE_CONTAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6508" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.DATAINCLUSAO &lt;= (SELECT PER.DATAFINAL FROM ED_PERIODOS PER WHERE PER.HANDLE = @RASTRO(ED_PERIODOS)) AND (A.VERSAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3229_at6508_hscfa1a73c.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_FCONT_CADASTROS__PLANO_DE_CONTAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    