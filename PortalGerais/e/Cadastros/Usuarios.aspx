<%@ Page Title="Usuários" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {

        }
    </script>

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="GridUsuarios"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_GER_USUARIOS.GRID"
            UserDefinedCriteriaWhereClause="A.PESSOA IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
            Title="Usuários>>cadastro de usuários do portal"
            UserDefinedDisableRowSelection="False"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            SystemFilterOnly="False"
            UserDefinedPageSize="20"
            Mode="None"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            FormUrl="~/PortalGerais/e/Cadastros/CadastroUsuario.aspx" />
    </div>
</asp:Content>
