<%@ Page Title="Aprovar ordens de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">


    <script runat="server">        
        protected override void LoadWebPartConnections()
        {

            AddWebPartStaticConnection("RESUMO->ITENS", "RESUMO", "ITENS");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            //var entidade = RESUMO.GetEntity();

             //ORDENSCONTAGEM_TITLE.Title = "Contagem " + entidade["NUMERO"].GetString();

        }
        
    </script>


    <wes:FixedWebPartZone runat="server" ID="ItemZone" Visible="false">
        <ZoneTemplate>
            <wes:AjaxForm
                runat="server"
                ID="RESUMO"
                BootstrapCols="12"
                UserDefinedCommandsVisible="True"
                IncludeRecordInRecentItems="False"
                CanInsert="False"
                CanUpdate="False"
                CanDelete="False"
                ShowTitle="False"
                ChromeState="Normal"
                FormMode="View"
                HideDeveloperCommands="false"
                EntityViewName="PORTAL_INT_ORDENSCONTAGEMITENS.FORM" />
        </ZoneTemplate>
    </wes:FixedWebPartZone>

    <wes:FixedWebPartZone runat="server" ID="ConsultasPedidosVendaZone">
        <ZoneTemplate>
            <wes:SimpleGrid runat="server"
                ID="ITENS"
                SystemInstanceName="CORPORATIVO"
                EntityViewName="PORTAL_INT_ORDENSCONTAGEMLOTEITENS.GRID"
                Title="Lotes"
                UserDefinedDisableRowSelection="False"
                UserDefinedCommandsVisible="True"
                UserDefinedSelectColumnVisible="True"
                HideDeveloperCommands="False"
                CompanyFilterMode="None"
                DisplayRowCommand="False"
                FilterVisible="false"
                SystemFilterOnly="True"
                UserDefinedPageSize="10"
                UserDefinedCriteriaWhereClause="A.ORDEMCONTAGEM IN (SELECT HANDLE FROM PD_ORDENSCONTAGEMITENS WHERE HANDLE = @CAMPO(HANDLE) )"
                Mode="None"
                CanInsert="False"
                CanUpdate="False"
                CanDelete="False"
                ShowTitle="True"
                EmptyDataText="Este item não controla lotes."
                ChromeState="Normal"
                PageWidgetHandle="1" />
        </ZoneTemplate>
    </wes:FixedWebPartZone>
</asp:Content>
