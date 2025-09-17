<%@ Page Title="Apurações" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("APURACOES_FRM->COMISSOES_GRID", "APURACOES_FRM", "COMISSOES_GRID");
        }
    </script>
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="APURACOES_FRM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_FN_DOCUMENTOCOMISSOESAPURACOES.FORM"
            Title="Apuração"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            UserDefinedCriteriaWhereClause=""
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

    <div class="row">
        <wes:SimpleGrid runat="server"
        ID="COMISSOES_GRID"
        SystemInstanceName="CORPORATIVO"
        EntityViewName="PORTAL_REP_COMISSOES_APURACOES.GRID"
        UserDefinedCriteriaWhereClause="A.APURACAO = @CAMPO(HANDLE)"
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
        Title="Comissões"
        ChromeState="Normal"
        PageWidgetHandle="2"/>
    </div>
</asp:Content>
