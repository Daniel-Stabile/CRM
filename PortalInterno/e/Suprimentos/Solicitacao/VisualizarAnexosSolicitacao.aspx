<%@ Page Title="Anexos da solicitação" Language="C#" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="portlet-body">
        <div class="row">
            <wesWidget:SimpleGrid
                runat="server"
                ID="ANEXOS"
                BootstrapCols="12"
                UserDefinedDisableRowSelection="True"
                FormUrl=""
                Title ="Anexos da solicitação"
                UserDefinedDataSourceParameters=""
                DisplayRowCommand="False"
                SystemFilterOnly="False"
                UserDefinedPageSize="10"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                DefaultFilterName=""
                CanInsert="false"
                CanUpdate="False"
                CanDelete="false"
                ShowTitle="true"
                EmptyDataText="Sem anexos"
                ChromeState="Normal"
                EntityViewName="PORTAL_INT_ANEXO_SOLICITACAO.GRID"
                PageWidgetHandle="108" />
        </div>       
    </div>
</asp:Content>
