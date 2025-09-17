<%@ Page Title="Questionários" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {

        }

        protected override void OnInit(EventArgs e)
        {
            var statusAdapter = new Benner.Corporativo.Wes.WebApp.GridCellStatusAdapter(QUESTIONARIOS_GRID, "STATUS");
            statusAdapter.StatusList["Pendente na web"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Warning;
            statusAdapter.StatusList["Aguardando liberação"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Primary;
            statusAdapter.StatusList["Liberada"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Success;
            statusAdapter.StatusList["Reprovada"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Danger;
            statusAdapter.StatusList["Reenviada web"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Warning;

            AddCellAdapter(statusAdapter);

            base.OnInit(e);
        }                                                                                                                                                                                                                                                                                                              
    </script>

    <style>
        .page-content {
            background: #fff;
        }
    </style>

    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="QUESTIONARIOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_QUESTIONARIO.GRID"
            Title="Questionários >> "
            UserDefinedCriteriaWhereClause="A.ORIGEM = 1 AND A.FORNECEDOR IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            DefaultFilterName="Pendentes"
            SystemFilterOnly="True"
            UserDefinedPageSize="20"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalFornecedores/e/Questionario/Questionario.aspx" />        
    </div>


</asp:Content>
