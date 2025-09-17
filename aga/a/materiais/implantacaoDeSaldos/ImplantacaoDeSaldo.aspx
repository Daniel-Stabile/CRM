<%@ Page Title="Implantação de saldo de produtos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.implantacaoDeSaldos.ImplantacaoDeSaldo" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="IMPLANTAES" Title="Implantação de saldo de produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_IMPLANTACOES.IMPLANTACAODESALDO.GRID" DefaultFilterName="Padrão" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/materiais/implantacaoDeSaldos/ImplantacaoDeSaldoForm.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_IMPLANTACAODESALDO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    