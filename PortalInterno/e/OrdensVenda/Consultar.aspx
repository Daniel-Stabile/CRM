<%@ Page Title="Consultar Ordens de Vendas" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.OrdensVenda.ConsultarPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="ConsultaPedidosVenda"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_ORDENS_VENDA.GRID"
            UserDefinedCriteriaWhereClause=" (((A.USUARIOINCLUIU = @USUARIO) OR ((SELECT FILTRAUSUARIOOVINCLUIU FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO) = 'N'))) AND (A.EMPRESA = @EMPRESA) AND (A.FILIAL IN @FILIAIS) "
            Title="Ordens de venda >> Pesquisar ordens de venda"
            UserDefinedDisableRowSelection="True"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            DefaultFilterName="A confirmar"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            FormUrl="~/PortalInterno/e/OrdensVenda/ConsultarOrdem.aspx" />
    </div>
</asp:Content>
