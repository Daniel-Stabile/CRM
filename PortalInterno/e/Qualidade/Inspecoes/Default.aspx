<%@ Page Language="C#" Title="Inspeções" AutoEventWireup="true"
    Inherits="PortalInterno.Qualidade.Inspecoes.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
        
    <div class="row">
        <erp:ErpFilterForm runat="server"
            ID="FILTRO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_QUALIDADE_FILTROINSPECOES.FORM"
            Title="Filtro"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="false"
            CanDelete="false"
            ShowTitle="true"
            UserDefinedCriteriaWhereClause=""
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

    <div class="row">
    <erp:ErpSimpleGrid runat="server"
        ID="INSPECOES_GRID"
        SystemInstanceName="CORPORATIVO"
        EntityViewName="PORTALINTERNO_QUALIDADE_ORDENSINSPECAO.GRID"
        Title="Ordens de inspeção"
        UserDefinedCriteriaWhereClause="@WHERECLAUSE"
        UserDefinedDisableRowSelection="False"
        UserDefinedCommandsVisible="True"
        UserDefinedSelectColumnVisible="False"
        HideDeveloperCommands="False"
        CompanyFilterMode="CompanyAndBranch"
        DisplayRowCommand="True"
        FilterVisible="False"
        SystemFilterOnly="True"
        UserDefinedPageSize="5"
        Mode="None"
        CanInsert="False"
        CanUpdate="False"
        CanDelete="False"
        ShowTitle="True"
        ChromeState="Normal"
        PageWidgetHandle="2" />
    </div>

    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="LOTES_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_QUALIDADE_ORDEMINSPECAO_LOTES.GRID"
            Title="Lotes"
            UserDefinedCriteriaWhereClause="A.ORDEMINSPECAO = @CAMPO(HANDLE)"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="5"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="2" />
    </div>


</asp:Content>
