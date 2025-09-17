<%@ Page Title="Relatórios contábeis" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<script runat="server">

</script>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="row">
                
                <wes:CommandsPanel runat="server"
                    ID="RESUMO_COMANDOS"
                    EntityViewName="PORTAL_INT_CONTABIL_RELATORIOS.GRID"
                    UserDefinedCommandsVisible="true"
                    Title="Relatórios >>"
                    SystemInstanceName="CORPORATIVO" />
            </div>
        </div>
    </div>

</asp:Content>
