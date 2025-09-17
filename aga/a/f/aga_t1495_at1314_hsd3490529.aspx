<%@ Page Title="Localizações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Localizações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOLOCALIZACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ALMOXARIFADOS__LOCALIZACOES_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6215" Title="Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="AGA_PD_PRODUTOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT PRODUTO FROM PD_ALMOXARIFADOPRODUTOLOCALIZA WHERE LOCALIZACAO = @TABELA(PD_ALMOXARIFADOLOCALIZACOES))
OR 
A.HANDLE IN (SELECT PRODUTO FROM PD_ALMOXARIFADOPRODUTOS WHERE LOCALIZACAO = @TABELA(PD_ALMOXARIFADOLOCALIZACOES))" FormUrl="~/aga/a/f/aga_t807_at6215_hs7cb5d935.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__LOCALIZACOES_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    