<%@ Page Language="C#" Title="Início" MasterPageFile="~/default.master" Inherits="Benner.Tecnologia.Wes.Components.WebApp.DefaultPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components"
    TagPrefix="Benner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script>
		$(document).ready(function() {
		    ExibirMenusPaginaDefault();		
		});		
    </script>
</asp:Content>
