<%@ Page Title="Movimentações contábeis - Contabilizações consolidadas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Movimentações contábeis - Contabilizações consolidadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_CONSOLIDADOR.FORM" CanDelete="False" CanUpdate="True" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_MOVIMENTACOES_CONTABEIS__CONTABILIZACOES_CONSOLIDADAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3851" Title="Consolidados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CT_CONSOLIDADOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONSOLIDADOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2408_at3851_hsfde1e72f.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_MOVIMENTACOES_CONTABEIS__CONTABILIZACOES_CONSOLIDADAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    