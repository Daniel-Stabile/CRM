<%@ Page Title="Anexos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
    
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            AddCellAdapter(new Benner.Corporativo.Wes.WebApp.GridCellLinkToImageAdapter
            {
                Grid = ANEXOS_GRID,
                FieldName = "DOCUMENTO",
                ImageClass = "fa fa-download"
            });
            
        }
    
    
    </script>

    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="ANEXOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_REQAQUISICOES_ANEXOS.GRID"
            Title="Anexos"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            UserDefinedPageSize="10"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>
