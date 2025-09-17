<%@ Page Title="Consultar Pedidos" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Pedidos.ConsultarPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="ConsultaPedidosVenda"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_PEDIDOSVENDA.GRID"
            UserDefinedCriteriaWhereClause="A.AGENTEVENDAS = (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
            Title="Pedidos >> consulta de pedidos"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            DefaultFilterName="Todos"
            SystemFilterOnly="False"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalRepresentante/e/Pedidos/ConsultarDetalhes.aspx" />
    </div>
</asp:Content>
