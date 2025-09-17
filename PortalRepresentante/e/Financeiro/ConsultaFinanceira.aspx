<%@ Page Title="Títulos" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Financeiro.ConsultaFinanceiraPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="TITULOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_FINANCEIRO_DOCUMENTOS.GRID"
            UserDefinedCriteriaWhereClause="A.ABRANGENCIA IN('N','T') AND A.ENTRADASAIDA = 'S' AND A.EHPREVISAO = 'N' AND A.AGENTEVENDAS = (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
            Title="Documentos >> documentos de pagamento"
            UserDefinedDisableRowSelection="True"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            DefaultFilterName="Em aberto"
            SystemFilterOnly="True"
            UserDefinedPageSize="20"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" 
            FormUrl="~/PortalRepresentante/e/Financeiro/Documento.aspx" />
    </div>

</asp:Content>
