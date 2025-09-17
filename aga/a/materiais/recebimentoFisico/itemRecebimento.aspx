<%@ Page Title="Item - Recebimento Físico" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.recebimentoFisico.ItemRecebimento" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ITEM" Title="Item" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_RECEBIMENTOFISICO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.RECEBIMENTOFISICOPAI = @RASTRO(CP_RECEBIMENTOFISICOPAI)" UserDefinedCommandsVisible="True" PageId="PAGES_AGA_A_MATERIAIS_RECEBIMENTOFISICO_ITEMRECEBIMENTO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="LOTES_1" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITEM" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_RECEBIMENTOFISICOLOTE.LOTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.RECEBIMENTOFISICO = @RASTRO(CP_RECEBIMENTOFISICO)" FormUrl="~/aga/a/materiais/recebimentoFisico/RecebimentoFisicoLoteForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_AGA_A_MATERIAIS_RECEBIMENTOFISICO_ITEMRECEBIMENTO" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    