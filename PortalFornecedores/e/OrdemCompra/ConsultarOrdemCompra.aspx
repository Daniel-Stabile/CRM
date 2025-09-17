<%@ Page Title="Ordens compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.OrdemCompra.ConsultarOrdemCompraPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    
    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="GridOrdemCompra"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_ORDENSCOMPRA.GRID"
            UserDefinedCriteriaWhereClause="A.STATUS IN(2,3,4,5) AND A.FORNECEDOR IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
            Title="Ordens compra >> geradas para fornecedor"
            UserDefinedDisableRowSelection="True"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            DefaultFilterName="Todas"
            SystemFilterOnly="True"
            UserDefinedPageSize="20"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalFornecedores/e/OrdemCompra/OrdemCompra.aspx" />        
    </div>

</asp:Content>
