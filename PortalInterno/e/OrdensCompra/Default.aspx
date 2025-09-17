<%@ Page Title="Ordens compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.OrdensCompra.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FILTRO->ORDENSCOMPRA_GRID", "FILTRO", "ORDENSCOMPRA_GRID");
            AddWebPartStaticConnection("ORDENSCOMPRA_GRID->ORDENSCOMPRAITENS_GRID", "ORDENSCOMPRA_GRID", "ORDENSCOMPRAITENS_GRID");
        }
    </script>

    
    <script type="text/javascript">
        $(window).on('load', function () {
				var url_string = window.location.href
				var url = new URL(url_string);
				var c = url.searchParams.get("OC");
				console.log(c);
				if (c != null)
					document.getElementsByClassName('btn blue btn-save command-action predef-action editable')[0].click();
            })
        
        
    </script>

    <div class="row">
        <erp:ErpFilterForm runat="server"
            ID="FILTRO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_ORDEMCOMPRA_FILTRO.FORM"
            Title="Filtro"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCriteriaWhereClause=""
            ChromeState="Normal"
			DisplayCommandExecutedDefaultMessage="False"
            PageWidgetHandle="1" />
    </div>

    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="ORDENSCOMPRA_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_ORDENSCOMPRA.GRID"
            Title="Ordens de compra"
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
			DisplayCommandExecutedDefaultMessage="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="2" />
    </div>


    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="ORDENSCOMPRAITENS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_ITENSORDEMCOMPRA.GRID"
            UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE)"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="False"
			DisplayCommandExecutedDefaultMessage="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Itens"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>
</asp:Content>
