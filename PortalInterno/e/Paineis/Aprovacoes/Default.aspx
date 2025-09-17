<%@ Page Language="C#" Title="Aprovações" AutoEventWireup="true"
    Inherits="PortalInterno.Paineis.Aprovacoes.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <h3 class="page-title" runat="server" id="panelCaption">
        Itens pendentes de confirmação
    </h3>

    <div class="row" runat="server" id="tileHolder"></div>


</asp:Content>
