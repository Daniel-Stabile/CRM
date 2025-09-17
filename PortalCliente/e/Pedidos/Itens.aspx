<%@ Page Title="Itens" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Pedidos.ItensPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
<div class="row">

    <script runat="server">
  
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("Filtro->Itens", "FormFiltro", "GridItens");
        }


       
    </script>

    <style>
        /* Não mostrar "Operação executada" */
        .alert-info {
            display: none;
        }

        th.AlignmentRight {
            text-align: right;
            padding-right: 6px;
        }

        td.AlignmentRight {
            text-align: right;
        }
    </style>

    <div class="row">         
        <wes:AjaxForm runat="server"
            ID="FormFiltro"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_PESQUISAPRODUTOS.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            UserDefinedCommandsVisible="true"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            Title="Seleção de itens >>"
            ChromeState="Normal"
            PageWidgetHandle="1"
            OnCommandExecuted="FormFiltro_CommandExecuted"/>        
    </div>

    <div class="row"> 
        
        <wes:EditableGrid runat="server"
            ID="GridItens"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_INCLUSAOPRODUTOS.GRID"
            Description="Itens encontrados (limite de 100 itens)"
            UserDefinedCriteriaWhereClause="A.IDENTIFICADOR = @CAMPO(IDENTIFICADOR)"
            UserDefinedDisableRowSelection="False"
            UserDefinedSelectColumnVisible="False"
            UserDefinedCommandsVisible="True"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            FormUrl="TESTE"
            DisplayRowCommand="True"
            SystemFilterOnly="False"
            UserDefinedPageSize="50"
            Mode="None"
            CanInsert="False"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="False"
            ChromeState="Normal"
            PageWidgetHandle="2"
            OnCommandExecuted="GridItens_CommandExecuted" />
        
    </div>
  </div>


</asp:Content>


