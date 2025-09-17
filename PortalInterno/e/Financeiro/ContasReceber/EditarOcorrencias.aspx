<%@ Page Title="Ocorrência" Language="C#" AutoEventWireup="true" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FormItem"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CONTAS_PAGAR_RECEBER_OCORRENCIAS.FORM"
            IncludeRecordInRecentItems="True"
            Title="Editar ocorrências >>"
            UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTO = 7"
            HideDeveloperCommands="True"                                
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

</asp:Content>


