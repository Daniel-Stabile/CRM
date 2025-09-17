<%@ Page Title="Por status - Liberada" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Por status - Liberada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_QL_RESPOSTASFORNECEDOR.FORM" CanDelete="False" CanUpdate="True" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="QL_QUALIDADEFORNSTATUS__LIBERADA_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7597" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_QL_HISTORICORESPOSTAFORNECEDOR.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.RESPOSTAFORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5228_at7597_hsd760f0e6.aspx" UserDefinedDisableRowSelection="False" PageId="QL_QUALIDADEFORNSTATUS__LIBERADA_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7559" Title="Respostas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_QL_APLICACAOQUESTIONARIOFORNEC.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.RESPOSTAFORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4933_at7559_hs7447edd4.aspx" UserDefinedDisableRowSelection="False" PageId="QL_QUALIDADEFORNSTATUS__LIBERADA_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    