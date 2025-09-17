<%@ Page Title="Destinatário" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Pedidos.DestinatarioPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("THE_GRID", "GridEnderecos", "FormEnderecos");
    }
</script>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <style>
        /* Não mostrar "Operação executada" */
        .alert-info {
            display: none;
        }
    </style>
    
    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="GridEnderecos"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_ENDERECOENTREGA.GRID"
            UserDefinedDisableRowSelection="False"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            UserDefinedPageSize="5"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Endereços de entrega >>"
            ChromeState="Normal"
            PageWidgetHandle="3" />
        
    </div>

    <hr />

    <div class="row">
        
        <wes:AjaxForm runat="server"
            ID="FormEnderecos"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_ENDERECOENTREGA.FORM"
            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"
            UserDefinedCommandsVisible="True"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="0"
            Title="Endereço de entrega >> selecionado"
            OnCommandExecute="FormEnderecos_CommandExecute" />
        
    </div>


</asp:Content>


