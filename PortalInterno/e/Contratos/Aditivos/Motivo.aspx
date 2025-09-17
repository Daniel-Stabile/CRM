<%@ Page Title="Contratos" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Contratos.Aditivos.MotivoAnexoPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">    
		<wes:AjaxForm 
            runat="server"
            ID="MOTIVO" 
            Title="Anexar arquivos"
            FormMode="Insert"
            BootstrapCols="12"
            UserDefinedCommandsVisible="True"
            IncludeRecordInRecentItems="False"
            CanInsert="true"
            CanUpdate="true"
            CanDelete="true"
            ShowTitle="True"
            ChromeState="Normal"
            HideDeveloperCommands="True"
            EntityViewName="PORTAL_INT_MOTIVOANEXO.FORM"
            PageWidgetHandle="110"  />
        </div>

    <div class="row">
		<wes:AjaxForm 
            runat="server"
            ID="ANEXO_FORM" 
            Title="Anexar arquivos"
            FormMode="Insert"
            BootstrapCols="12"
            UserDefinedCommandsVisible="True"
            UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLEORIGEM)" 
            IncludeRecordInRecentItems="False"
            CanInsert="true"
            CanUpdate="true"
            CanDelete="true"
            ShowTitle="True"
            ChromeState="Normal"
            HideDeveloperCommands="True"
            OnCommandExecuted="ANEXO_FORM_CommandExecuted"
            EntityViewName="PORTAL_INT_ANEXOADITIVO.FORM"
            PageWidgetHandle="110"  />
    </div>

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="ANEXO_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_ANEXOADITIVOTEMP.GRID"
            UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLEORIGEM)" 
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="true"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="True"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="True"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="False"
            Title=""
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>

</asp:Content>
