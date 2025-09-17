<%@ Page Title="Requisições de movimentação do item - Confirmar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Requisições de movimentação do item - Confirmar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITEMMOVIMENTACAOREQUISICOES.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_MOVIMENTACAOREQUISICOES__CONFIRMAR_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8192" Title="Movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_AT_ITEMMOVIMENTACAOAPROVACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMMOVIMENTACAOREQUISICAO = @RASTRO(AT_ITEMMOVIMENTACAOREQUISICOES))" FormUrl="~/aga/a/f/aga_t5683_at8192_hs178a213e.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_MOVIMENTACAOREQUISICOES__CONFIRMAR_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    