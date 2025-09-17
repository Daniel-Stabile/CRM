<%@ Page Title="Detalhes da ordem de venda" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="DETALHES_FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_ORDEMVENDADETALHES.FORM"
            UserDefinedCriteriaWhereClause=""
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Detalhes"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>
