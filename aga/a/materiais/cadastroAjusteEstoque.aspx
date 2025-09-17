<%@ Page Title="Ajuste de estoque" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.CadastroAjusteEstoque" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="AJUSTEDEESTOQUE" Title="Ajuste de estoque" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_BAIXASDIRETAS.AJUSTES_ESTOQUE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PD_AJUSTE_ESTOQUE" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="AJUSTEDEESTOQUE" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_BAIXADIRETALOTES.AJUSTE_ESTOQUE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BAIXADIRETA = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/ajustesEstoqueLote.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PD_AJUSTE_ESTOQUE" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    