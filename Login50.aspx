<%@ Page Language="C#" EnableViewState="false" EnableTheming="false" Theme="CrmBenner" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.LoginPage" %>

<%@ Register Src="~/uc/Login.ascx" TagName="Login" TagPrefix="wes" %>
<%@ Register Src="~/uc/HeadSectionLogin.ascx" TagName="HeadSectionLogin" TagPrefix="wes" %>
<%@ Register Src="~/uc/HeadSectionApp.ascx" TagName="HeadSectionApp" TagPrefix="wes" %>
<%@ Register Src="~/uc/ScriptsLogin.ascx" TagName="ScriptsLogin" TagPrefix="wes" %>

<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="pt">
<!--<![endif]-->
<head runat="server">    
    <wes:HeadSectionLogin runat="server" />
    <wes:HeadSectionApp runat="server" />
    <title>Autenticação</title>
</head>
<body class="login">
    <%-- INICIO THEME CRM BENNER--%>
    <div class="background-full">
    </div>
    <div class="content">
        <div class="logo"></div>
        <wes:Login ID="wesLogin" runat="server" />
    </div>
    <div class="copyright">
	    <script type="text/javascript">
            document.write(new Date().getFullYear());
        </script> &copy; Benner Sistemas.
    </div>
    <div class="tecnologia">
        <a href="https://www.benner.com.br/tecnologia/liberacoes/220/" target="_blank">Tecnologia 22.0</a>
    </div>
    <%-- FIM THEME CRM BENNER--%>
    <wes:ScriptsLogin runat="server" />
</body>
</html>
