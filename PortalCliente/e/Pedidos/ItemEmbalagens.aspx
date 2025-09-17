<%@ Page Title="Embalagens" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Pedidos.ItemEmbalagensPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">

    <div class="row">        
        <wes:SimpleGrid runat="server"
            ID="GridEmbalagens"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_DETALHESEMBALAGENS.GRID"
            Title="Embalagens >>"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            FilterVisible="False"
            UserDefinedPageSize="15"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />        
    </div>

    <div class="row">        
        <wes:AjaxForm runat="server"
            ID="FormItem"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_ITEMQTDEEMBALAGEM.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            UserDefinedCommandsVisible="True"
            CanInsert="False"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="False"
            Title="Comprar"
            ChromeState="Normal"
            PageWidgetHandle="1" />        
    </div>


</asp:Content>


