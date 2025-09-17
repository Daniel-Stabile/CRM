<%@ Page Title="Consulta de documentos" Language="C#" Inherits="aga.a.Financeiro.ConsultaDocumentosGridPage,Benner.Corporativo.Wes.WebApp" %>
<%@ Register Src="~/aga/e/financeiro/consultadocumentos/ConsultaDocumentos.ascx" TagName="Consulta" TagPrefix="cpa" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <cpa:Consulta ID="CONSULTA" runat="server" />
</asp:Content>
