<%@ Page Title="Consulta de documentos - Fiscal Saída" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Tributos.ConsultaDocumentoFiscalSaidaEntrada, Benner.Corporativo.Wes.WebApp" %>
<%@ Register Src="~/aga/e/tributos/documentos/ConsultaDocumentos.ascx" TagName="Consulta" TagPrefix="fiscsaida" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <fiscsaida:Consulta ID="CONSULTA" runat="server" />
</asp:Content>

    