<%@ Page Language="C#" Title="Detalhes da inspeção" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

            <div class="row">
                <erp:ErpFilterForm runat="server"
                    ID="DETALHES_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_QUALIDADE_ORDEMINSPECAO.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="true"
                    Title="Detalhes"
                    UserDefinedCriteriaWhereClause=""
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>

</asp:Content>
