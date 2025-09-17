<%@ Page Title="Consultas fiscais - Filtros" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Tributos.ConsultasFiscaisFiltros, Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web.Wizards" TagPrefix="wiz" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <aga:AGAResource runat="server" Src="~/content/aga/css/wizard.css" />
    <aga:AGAResource runat="server" src="~/content/css/tributos/ConsultasFiscais.css" />

    <div>
        <div class="page-bar">
            <ul class="page-breadcrumb" style="color: #888;">
                <li>
                    <i class="fa fa-home"></i> <a href="../../a/modulos/tributos.aspx">Tributos</a>
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    Abrangência
                    <i class="fa fa-angle-right"></i>
                </li>
                <li id="BreadcrumbAgrupamentos" runat="server">
                    Agrupamentos
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    Filtros
                </li>
            </ul>
        </div>
	</div>

    <div class="portlet light">
        <div class="portlet-body">
            <wiz:WizardStateLoader runat="server" ID="WizardLoader" />
            <wiz:WizardProgressControl runat="server" ID="WizardSteps" FontIconStyle="false" Layout="Default" />
            <wiz:WizardMessagePanel runat="server" ID="MessagePanel" />

            <div class="row">
                <wes:AjaxForm runat="server" ID="FILTROS" Title="Filtros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="False" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_VTCONSULTAFISCALFILTRO.FORM" FormMode="Insert" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_E_TRIBUTOS_CONSULTASFISCAISFILTROS" Level="20" Order="10"  />
            </div>    

            <wiz:WizardCommands runat="server" ID="WizardCommands" />
        </div>
    </div>

    <aga:AGAResource runat="server" src="~/content/aga/js/wizard.js" />
    <aga:AGAResource runat="server" src="~/content/js/tributos/ConsultasFiscais.js" />

</asp:Content>
    