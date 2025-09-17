<%@ Page Language="C#" Title="Detalhes do apontamento" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <script runat="server">
           
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("DETALHES_FORM->OBJETOS_GRID", "DETALHES_FORM", "OBJETOS_GRID");
            AddWebPartStaticConnection("OBJETOS_GRID->OBJETO_FORM", "OBJETOS_GRID", "OBJETO_FORM");
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            tabObjetos.SetWidgetTickSource(OBJETOS_GRID);
        }     
    </script>

    <erp:ErpTabControl runat="server" ID="tabPages">

        <erp:ErpTab runat="server" ID="tabDetalhes" Text="Detalhes">
            <div class="row">
                <erp:ErpFilterForm runat="server"
                    ID="DETALHES_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_APONTAMENTO_DETALHES.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="False"
                    UserDefinedCriteriaWhereClause=""
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>

        <erp:ErpTab runat="server" ID="tabObjetos" Text="Itens/Objetos">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="OBJETOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_APONTAMENTO_OBJETOS.GRID"
                    UserDefinedCriteriaWhereClause="A.APONTAMENTO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Itens"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>

            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="OBJETO_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_APONTAMENTO_OBJETO.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="true"
                    Title="Detalhes"
                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>

    </erp:ErpTabControl>
</asp:Content>
