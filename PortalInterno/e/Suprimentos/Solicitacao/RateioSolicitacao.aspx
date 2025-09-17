<%@ Page Title="Rateio da solicitação" Language="C#" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script runat="server">
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RATEIO->RATEIOS", "RATEIO", "RATEIOS");
        }

    </script>
        <div class="portlet-body">
            <div class="row">
                <wesWidget:AjaxForm
                    ID="RATEIO"
                    runat="server"
                    EntityViewName="PORTAL_INT_RATEIO_SOLICITACAO.FORM"
                    DisplayLabels="True"
                    CanDelete="false"
                    CanUpdate="false"
                    Title="Rateio da solicitação"
                    CanInsert="true"
                    HideDeveloperCommands="False"
                    EditButtonClass="green" />
                <wesWidget:SimpleGrid
                    runat="server"
                    ID="RATEIOS"
                    BootstrapCols="12"
                    UserDefinedDisableRowSelection="True"
                    FormUrl=""
                    UserDefinedCriteriaWhereClause="A.SOLICITACAOITEM = @CAMPO(SOLICITACAOITEM)"
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
                    EntityViewName="PORTAL_INT_RATEIO_SOLICITACAO.GRID"
                    PageWidgetHandle="108" />
            </div>       
        </div>
</asp:Content>
