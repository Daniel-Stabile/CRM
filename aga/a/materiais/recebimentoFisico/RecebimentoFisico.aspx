<%@ Page Title="Recebimento físico" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.RecebimentoFisico" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RECEBIMENTOFSICO" Title="Recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_RECEBIMENTOFISICOPAI.GRID" DefaultFilterName="Filtro" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/materiais/recebimentoFisico/RecebimentoFisicoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_AGA_A_MATERIAIS_RECEBIMENTOFISICO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    