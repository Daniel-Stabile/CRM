<%@ Page Title="Cadastrar pedidos" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Pedidos.CadastrarPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
      
    <div class="row">        
        <wes:SimpleGrid runat="server"
            ID="GridPedidos"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_PEDIDOS.GRID"
            UserDefinedCriteriaWhereClause="A.CLIENTE = (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO) AND A.STATUS = 1 "
            Title="Pedidos >> pedidos em digitação"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            UserDefinedLinkVisible="True"
            HideDeveloperCommands="false"
            CompanyFilterMode="OnlyCompany"
            OnCommandExecute="GridPedidos_CommandExecute"
            DisplayRowCommand="True"
            SystemFilterOnly="True"
            DefaultFilterName="Número"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalCliente/e/Pedidos/CadastrarItem.aspx" />        
    </div>
</asp:Content>
