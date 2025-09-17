<%@ Page Title="Títulos vencidos" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Financeiro.ParcelasPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("PARCELAS_GRID->BAIXAS_GRID", "PARCELAS_GRID", "BAIXAS_GRID");
        }
               
    </script>

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="PARCELAS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_FINANCEIRO_PARCELAS.GRID"
            UserDefinedCriteriaWhereClause="A.VALORESBAIXADOS < A.VALOR AND A.VCTOPRORROGADO < @HOJE AND A.DOCUMENTO IN(SELECT D.HANDLE FROM FN_DOCUMENTOS D WHERE D.ABRANGENCIA IN('N','T') AND D.ENTRADASAIDA = 'S' AND D.EHPREVISAO = 'N' AND D.PESSOA IN (SELECT C.HANDLE FROM GN_PESSOAS C WHERE C.AGENTEVENDAS IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO))"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Parcelas"
            ChromeState="Normal"
            PageWidgetHandle="2" />
    </div>
    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="BAIXAS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_FINANCEIRO_PARCELA_BAIXAS.GRID"
            UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO IN(1,2,3,4,5,8,9,14,15,16,18,20,23)"
            UserDefinedDisableRowSelection="True"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Pagamentos"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>

</asp:Content>
