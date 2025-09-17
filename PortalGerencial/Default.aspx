<%@ Page Language="C#" Title="Início" AutoEventWireup="true" Inherits="PortalCRM.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="wes" %>
<%@ Register Src="~/uc/TopBar.ascx" TagName="TopBar" TagPrefix="wes" %>
<%@ Register Src="~/uc/TopBarMainContent.ascx" TagName="TopBarMainContent" TagPrefix="wes" %>
<%@ Register Src="~/uc/HeadSection.ascx" TagName="HeadSection" TagPrefix="wes" %>
<%@ Register Src="~/uc/SidePanel.ascx" TagName="SidePanel" TagPrefix="wes" %>
<%@ Register Src="~/uc/WesManager.ascx" TagName="WesManager" TagPrefix="wes" %>
<%@ Register TagPrefix="wes" Namespace="Benner.Tecnologia.Wes.Components.WebApp" Assembly="Benner.Tecnologia.Wes.Components.WebApp, Version=2008.0.0.0, Culture=neutral, PublicKeyToken=f2db26731026fd37" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script runat="server" >
        protected void Page_Load(object sender, System.EventArgs e)
        {
            Response.Redirect("~/PortalGerencial/indicadores.aspx", false);
        }
    </script>
</asp:Content>
