<%@ Page Title="Cotações" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.Cotacoes.CotacoesPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {

        }
    </script>
    
    <style>
        .page-content {
            background: #fff;
        }
    </style>
    
    <div class="erp-unbox">

        <div class="row">
            
                <wes:SimpleGrid runat="server"
                    ID="COTACOES_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_FOR_COTACOES.GRID"
                    UserDefinedCriteriaWhereClause="A.FORNECEDOR IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
                    EmptyWhereClauseFilter="A.STATUS IN(2,3)"
                    Title="COTAÇÕES >>lista de todas cotações"
                    UserDefinedDisableRowSelection="True"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="True"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="15"
                    Mode="Selectable"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="True"
                    ChromeState="Normal"
                    PageWidgetHandle="1"
                    FormUrl="~/PortalFornecedores/e/Cotacoes/Cotacao.aspx" />
        </div>

    </div>

</asp:Content>
