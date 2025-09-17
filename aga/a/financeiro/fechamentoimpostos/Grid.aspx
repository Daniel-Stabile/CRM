<%@ Page Title="Fechamento de base de cálculo dos impostos retidos pela baixa" Language="C#" Inherits="aga.a.Financeiro.FechamentoImpostos,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMFILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="WEB_FN_FILTROFECHAMENTOIMPOSTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="WEB_A_FINANCEIRO_FECHAMENTOIMPOSTOS_GRID" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="GRIDFORNECEDORESEIMPOSTOS" Title="Fornecedores e impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMFILTRO" ChromeState="Normal" EntityViewName="WEB_FN_FECHAIMPOSTOSRETENCAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" PageId="WEB_A_FINANCEIRO_FECHAMENTOIMPOSTOS_GRID" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="GRIDDOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GRIDFORNECEDORESEIMPOSTOS" ChromeState="Normal" EntityViewName="WEB_FN_FECHAIMPOSTOSRETENCAO.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" PageId="WEB_A_FINANCEIRO_FECHAMENTOIMPOSTOS_GRID" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    