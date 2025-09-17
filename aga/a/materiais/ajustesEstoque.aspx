<%@ Page Title="Ajustes de estoque" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="AJUSTESESTOQUE" Title="Ajustes Estoque" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_BAIXASDIRETAS.AJUSTES_ESTOQUE.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONFIRMADO = 'N' AND A.USUARIOINCLUIU = @USUARIO" FormUrl="~/aga/a/materiais/cadastroAjusteEstoque.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PD_AJUSTES_ESTOQUE" Level="20" Order="5"  />
        </div>
    
      </asp:Content>
    