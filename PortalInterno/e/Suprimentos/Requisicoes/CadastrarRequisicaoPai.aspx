<%@ Page Title="Capa da requisição" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="REQUISICAO_FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_REQUISICOES_CADASTRAR.FORM"
            UserDefinedCriteriaWhereClause=""
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            Title="Requisição pai >> cadastro da capa de requisição"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>
