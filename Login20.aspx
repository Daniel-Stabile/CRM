<%@ Page Language="C#" EnableViewState="false" EnableTheming="false" Theme="LoginErp" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.LoginPage" %>

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
    <%-- INICIO THEME LOGIN BLUR--%>
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
    <footer id="menu_infos">
		<div id="infos_sys"> 
			<a href="https://www.testesbenner.com/novidades/erp0604/" target="_blank">ERP 06.04</a>
			<a href="https://www.benner.com.br/tecnologia/liberacoes/230/" target="_blank">Tecnologia 23.0</a>
			<a href="https://www.benner.com.br/tecnologia/liberacoes/" target="_blank">Histórico versões Tec.</a>
		</div>
        <span id="icon_infos"/>
    </footer>
    <%-- FIM THEME LOGIN BLUR--%>
    <wes:ScriptsLogin runat="server" />
</body>
</html>

<script> 
	var menu_infos = document.getElementById("menu_infos");
	var icon_infos = document.getElementById("icon_infos");
	var infos_sys = document.getElementById("infos_sys");
	
	menu_infos.addEventListener("mouseover", () => {
		infos_sys.style.display = "flex"
		icon_infos.style.animation = "none" 
	})

	menu_infos.addEventListener("mouseout", () => {
		setTimeout(() => {
			infos_sys.style.display = "none" 
		}, 100)
		icon_infos.style.animation = "" 

	}) 

	infos_sys.addEventListener("mouseover", () => {
		icon_infos.style.animation = "none" 
	})

</script>
