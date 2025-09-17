<%@ Page Title="Início" Language="C#"
Inherits="aga.e.Tributos.InicioPage,Benner.Corporativo.Wes.WebApp" %> <%@
Register Assembly="Benner.Tecnologia.Wes.Components.WebApp"
Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %> <%@
Register Assembly="Benner.Tecnologia.Wes.Components"
Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %> <%@ Register
Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components"
TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
  <link
    href="../../../Content/custom/fullcalendar/core/main.css"
    rel="stylesheet"
  />

  <script
    src="../../../Content/custom/fullcalendar/rrule/rrule.min.js"
  ></script>
  <script src="../../../Content/custom/fullcalendar/core/main.js"></script>
  <script src="../../../Content/custom/fullcalendar/daygrid/main.js"></script>
  <script src="../../../Content/custom/fullcalendar/rrule/main.min.js"></script>
  <script
    src="../../../Content/custom/fullcalendar/interaction/main.js"
  ></script>

  <%--<div class="row">
    <wes:CommandsPanel
      runat="server"
      ID="TRIBUTOSCOMANDOS"
      Title="Tributos comandos"
      Subtitle=""
      PortletCssClass=""
      PortletLayout="Default"
      BootstrapCols="12"
      FontIcon=""
      ShowTitle="false"
      ProviderWidgetUniqueId=""
      ChromeState="Fixed"
      CanDelete="True"
      CanUpdate="True"
      CanInsert="True"
      EntityViewName="WEB_TR_MODULO.CUSTOM.FORM"
      VerticalOrientation="False"
      PageId="MENU_TRIBUTOS"
      Level="20"
      Order="10"
    />
  </div>--%>

  <div id="dashboardTributosApp">
    <tributos-dashboard-tributos></tributos-dashboard-tributos>
  </div>

  <style>
    #portlet_TRIBUTOSCOMANDOS { padding: 10px 15px 4px; } .dashboard-stat2 {
    padding-bottom: 10px; } .dashboard-stat2 .display { margin: 0; }
  </style>
  <script>
	ExibirMenusModuloTributos();
    var app = new window.Vue({ el: '#dashboardTributosApp', store:
    Benner.DashboardTributosStore });
  </script>
</asp:Content>
