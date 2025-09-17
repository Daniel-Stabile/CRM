<%@ Page Title="Anexos da solicitação" Language="C#" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script runat="server">
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("ANEXO->ANEXOS", "ANEXO", "ANEXOS");
        }

    </script>
        <div class="portlet-body">
            <div class="row">
                <wesWidget:AjaxForm
                    ID="ANEXO"
                    runat="server"
                    EntityViewName="PORTAL_INT_ANEXO_CATALOGO.FORM"
                    DisplayLabels="True"
                    CanDelete="false"
                    CanUpdate="false"
                    Title="Anexos do catálogo"
                    CanInsert="true"
                    HideDeveloperCommands="true"
                    EditButtonClass="green" />
                <wesWidget:SimpleGrid
                    runat="server"
                    ID="ANEXOS"
                    BootstrapCols="12"
                    UserDefinedDisableRowSelection="True"
                    FormUrl=""
                    UserDefinedCriteriaWhereClause="A.CATALOGOFORNECIMENTO = @CAMPO(CATALOGOFORNECIMENTO)"
                    UserDefinedDataSourceParameters=""
                    DisplayRowCommand="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="10"
                    Mode="None"
                    UserDefinedSelectColumnVisible="False"
                    DefaultFilterName=""
                    CanInsert="true"
                    CanUpdate="False"
                    CanDelete="true"
                    ShowTitle="False"
                    ChromeState="Normal"
                    EntityViewName="PORTAL_INT_ANEXOS_CATALOGO.GRID"
                    PageWidgetHandle="108" />
            </div>       
        </div>
</asp:Content>
