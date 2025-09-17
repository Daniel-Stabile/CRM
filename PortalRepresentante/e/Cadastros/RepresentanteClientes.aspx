<%@ Page Title="Dados dos clientes" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="CLIENTES_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_CLIENTES.GRID"
                UserDefinedCriteriaWhereClause="A.EHCLIENTE = 'S'AND ( AGENTEVENDAS IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO) OR EXISTS (SELECT B.HANDLE FROM CM_PARAMETROSPORTALREPEMPRESA B WHERE B.EMPRESA = @EMPRESAMESTRE(CM_PARAMETROSPORTALREPEMPRESA) AND PERMITEBUSCARTODOSREPRES = 'S'))"
            Title="Clientes >>"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            DefaultFilterName="Cliente"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalRepresentante/e/Cadastros/DetalhesCliente.aspx" />
    </div>
    
</asp:Content>
