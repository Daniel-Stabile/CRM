<%@ Page Title="Catálogo" Language="C#" Inherits="PortalInterno.Suprimentos.Catalogo.ConsultarItensCatalogo, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

        <div class="portlet-body">
            <div class="row">
                <wesWidget:AjaxForm
                    ID="CAPA"
                    runat="server"
                    EntityViewName="PORTAL_INT_VISUALIZAR_CATALOGO.FORM"
                    DisplayLabels="True"
                    CanDelete="false"
                    CanUpdate="false"
                    Title="Itens do catálogo"
                    CanInsert="false"
                    HideDeveloperCommands="false"
                    FormMode="View"
                    EditButtonClass="green" />

                <wesWidget:SimpleGrid
                    runat="server"
                    ID="ITENS"
                    BootstrapCols="12"
                    UserDefinedDisableRowSelection="True"
                    FormUrl="~/PortalInterno/a/Suprimentos/Catalogo/VisualizarItemCatalogo.aspx"
                    UserDefinedCriteriaWhereClause="A.CATALOGOFORNECIMENTO = @CAMPO(HANDLE) AND A.STATUS = 1"
                    UserDefinedDataSourceParameters=""
                    DisplayRowCommand="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="20"
                    Mode="Selectable"
                    UserDefinedSelectColumnVisible="False"
                    DefaultFilterName=""
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    EntityViewName="PORTAL_INT_CONSULTA_ITENS_CATALOGO.GRID"
                    PageWidgetHandle="108" />
            </div>       
        </div>
</asp:Content>
