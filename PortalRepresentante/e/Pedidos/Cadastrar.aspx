<%@ Page Title="Cadastrar pedidos" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Pedidos.CadastrarPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="GridPedidos"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_PEDIDOS.GRID"
                UserDefinedCriteriaWhereClause=" A.STATUS = 1 AND A.CLIENTE IN ( SELECT B.HANDLE FROM GN_PESSOAS B WHERE B.AGENTEVENDAS IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO) OR EXISTS (SELECT B.HANDLE FROM CM_PARAMETROSPORTALREPEMPRESA B WHERE B.EMPRESA = @EMPRESAMESTRE(CM_PARAMETROSPORTALREPEMPRESA) AND PERMITEBUSCARTODOSREPRES = 'S'))"
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
            DefaultFilterName=""
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalRepresentante/e/Pedidos/CadastrarItem.aspx" />
    </div>
</asp:Content>
