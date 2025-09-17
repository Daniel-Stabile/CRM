<%@ Page Title="Configurações PIS/COFINS - Por destinatário - Tipos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CONFIGURAESPISCOFINSPORDESTINATRIO" Title="Configurações PIS/COFINS - Por destinatário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCCONFIGURACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="A_TRIBUTOS_PISCOFINSDESTINATARIO_TIPOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="DESTINATRIOSTIPOS" Title="Destinatários - Tipos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CONFIGURAESPISCOFINSPORDESTINATRIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCCONFIGURACAOCATEGORIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONFIGURACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/tributos/PISCOFINSDestinatarioTiposCadastro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="A_TRIBUTOS_PISCOFINSDESTINATARIO_TIPOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    