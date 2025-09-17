<%@ Page Title="Fornecedores" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
    
        <wes:SimpleGrid runat="server"
            ID="FORECEDORES_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_FORNECEDORES.GRID"
            UserDefinedCriteriaWhereClause=" A.EHFORNECEDOR = 'S' "
            Title="Fornecedores >>"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="CompanyAndBranch"
            DisplayRowCommand="False"
            DefaultFilterName=""
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Financeiro/Fornecedores/DetalhesFornecedor.aspx" />
    </div>
    
</asp:Content>
