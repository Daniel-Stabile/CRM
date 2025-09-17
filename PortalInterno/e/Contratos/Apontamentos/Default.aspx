<%@ Page Language="C#" Title="Apontamentos" AutoEventWireup="true"
    Inherits="PortalInterno.Contratos.Apontamentos.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="APONTAMENTOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_CONTRATOS_APONTAMENTOS.GRID"
            UserDefinedCriteriaWhereClause=""
            UserDefinedDisableRowSelection="true"
            UserDefinedCommandsVisible="true"
            UserDefinedSelectColumnVisible="false"
            HideDeveloperCommands="false"
            CompanyFilterMode="None"
            DisplayRowCommand="true"
            FilterVisible="false"
            SystemFilterOnly="true"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="false"
            CanUpdate="false"
            CanDelete="false"
            ShowTitle="true"
            Title="Apontamentos"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>

</asp:Content>
