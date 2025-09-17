<%@ Page Title="Lotes da implantação de saldo" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.implantacaoDeSaldos.ImplantacaoDeSaldoLotes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LOTESDAIMPLANTAODESALDOS" Title="Lotes da implantação de saldos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_IMPLANTACAOITEMLOTES.IMPLANTACAODESALDO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_IMPLANTACAODESALDOS_IMPLANTACAODESALDOLOTES" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="LOTESFORMULRIO" Title="Lotes - Formulário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOTESDAIMPLANTAODESALDOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_IMPLANTACAOITEMLOTES.IMPLANTACAODESALDO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_IMPLANTACAODESALDOS_IMPLANTACAODESALDOLOTES" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    