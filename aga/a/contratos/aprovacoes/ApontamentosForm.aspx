<%@ Page Title="Apontamento_Aprovacoes" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="APONTAMENTOSMEDIES" Title="Apontamentos/Medições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_APONTAMENTOS.CONTRATOSAPROVACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_APROVACOES_APONTAMENTOSFORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITENSOBJETOS" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="APONTAMENTOSMEDIES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_APONTAMENTOOBJETOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2226_at2829_hsf7c83b3b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APROVACOES_APONTAMENTOSFORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    