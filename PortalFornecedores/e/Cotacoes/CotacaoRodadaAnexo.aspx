<%@ Page Title="Anexos da solicitação" Language="C#" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script runat="server">
    
        protected override void LoadWebPartConnections()
        {
        }
        
    </script>

     <style>
        .page-content {
            background: #F1F3FA;
        }

        .table > tbody > tr.ItemCancelado > td {
            text-decoration: line-through;
        }

       

    </style>


        <div class="portlet-body">
            <div class="row">
                <wesWidget:SimpleGrid
                    DisplayLabels="True"
                    runat="server"
                    Title="Anexos da rodada"
                    ID="ANEXOS"
                    BootstrapCols="12"
                    UserDefinedDisableRowSelection="True"
                    FormUrl=""
                    UserDefinedDataSourceParameters=""
                    DisplayRowCommand="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="10"
                    Mode="None"
                    UserDefinedSelectColumnVisible="False"
                    DefaultFilterName=""
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="True"
                    ChromeState="Normal"
                    EntityViewName="PORTAL_FOR_ANEXO_RODADA.GRID"
                    PageWidgetHandle="108" />
            </div>    
        </div>
</asp:Content>
