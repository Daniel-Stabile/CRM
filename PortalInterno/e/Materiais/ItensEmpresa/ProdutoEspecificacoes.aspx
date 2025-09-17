<%@ Page Title="Documento" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="ESPECIFICACOES_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_DETALHEPRODUTO_ESPECIFICACAO.FORM"
            Title="Especificações >>"
            IncludeRecordInRecentItems="false"
            UserDefinedCommandsVisible="false"
            HideDeveloperCommands="true"
            ShowTitle="true"
            CompanyFilterMode="None"
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false" />
    </div>
</asp:Content>
