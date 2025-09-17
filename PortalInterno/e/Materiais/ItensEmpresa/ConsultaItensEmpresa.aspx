<%@ Page Title="Itens de Empresa" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Materiais.ItensEmpresa.ConsultaItensEmpresaPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="CONSULTA_PRODUTO_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CONSULTAITENSEMPRESA.GRID"
            UserDefinedCriteriaWhereClause="A.ATIVO = 'S'"
            Title="Produtos da empresa >> "
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="False"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="CompanyAndBranch"
            DisplayRowCommand="False"
            DefaultFilterName=""
            SystemFilterOnly="True"
            UserDefinedPageSize="20"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Materiais/ItensEmpresa/DetalhesProduto.aspx" />
    </div>
</asp:Content>
