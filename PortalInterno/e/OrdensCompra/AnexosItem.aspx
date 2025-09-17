<%@ Page Title="Anexos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
   <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="ANEXOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_ANEXOSITEMORDEMCOMPRA.GRID"
            Title="Anexos"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            UserDefinedPageSize="5"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>
</asp:Content>
