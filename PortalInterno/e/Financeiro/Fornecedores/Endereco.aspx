<%@ Page Title="Endereço" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {

        }        
    </script>

    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FORMHANDLE"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_FORNECEDOR_ENDERECO.FORM"
            Title="Alterar endereço >> alteração de dados"
            UserDefinedSelectColumnVisible="False"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            CanInsert="False"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            UserDefinedCommandsVisible="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

</asp:Content>
