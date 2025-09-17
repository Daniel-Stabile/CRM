<%@ Page Title="Cliente" Language="C#" Inherits="aga.e.Financeiro.AnaliseCredito.Geral" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="AnaliseClienteGeral" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CLIENTES" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" 
            OnCommandExecute="CLIENTES_CommandExecute"
            ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAS.ANALISECREDITO.GRID" 
            Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" 
            UserDefinedCriteriaWhereClause=" A.EHCLIENTE = 'S' "
            FormUrl="~/ERP/Financeiro/AnaliseCredito/Cliente.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="22326" Level="20" Order="10" />
    </div>
</asp:Content>
