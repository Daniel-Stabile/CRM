<%@ Page Title="Código benefício NF-e" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CDIGOBENEFCIONFE" Title="Código benefício NF-e" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_BENEFICIOSFISCAISNFE.ITENSDAEMPRESA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_ITENSDAEMPRESA_CODIGOBENEFICIONFE_CODIGOBENEFICIONFE" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ESPEIFICAES" Title="Espeçificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CDIGOBENEFCIONFE" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTONVEESPECIFICACAO.ITENSDAEMPRESA.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/materiais/itensDaEmpresa/ClassificacaoNVE/Especificacoes/Especificacoes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_ITENSDAEMPRESA_CODIGOBENEFICIONFE_CODIGOBENEFICIONFE" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    