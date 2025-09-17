<%@ Page Title="Consultar requisições" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            AddCellAdapter(new Benner.Corporativo.Wes.WebApp.GridCellStatusAdapter(GridConsultaRequisicao, "STATUS"));
        }  
    </script>

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="GridConsultaRequisicao"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_REQUISICOES_CADASTRAR.GRID" 
            Title="Requisições >> requisições em digitação" 
            UserDefinedCriteriaWhereClause=" A.EMPRESA = @EMPRESA AND A.FILIAL IN @FILIAIS AND A.USUARIOINCLUIU = @USUARIO AND (A.STATUS = 1 OR A.STATUS IS NULL) AND A.LIBERADA = 'N' "
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            UserDefinedLinkVisible="True"
            HideDeveloperCommands="false"
            CompanyFilterMode="OnlyCompany"
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
            FormUrl="~/PortalInterno/e/Suprimentos/Requisicoes/CadastrarRequisicao.aspx"/>
    </div>
</asp:Content>
