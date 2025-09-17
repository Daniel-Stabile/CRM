<%@ Page Title="Consultas fiscais - Resultado" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Tributos.ConsultasFiscaisResultado, Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web.Wizards" TagPrefix="wiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
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
                    <i class="fa fa-angle-right"></i>
                </li>
                <li>
                    Resultado
                </li>
            </ul>
        </div>
	</div>

    <div class="portlet light">
        <div class="portlet-body form">

            <aga:AGAResource runat="server" Src="~/content/aga/css/wizard.css" />
            <aga:AGAResource runat="server" src="~/content/css/tributos/ConsultasFiscais.css" />
            <wiz:WizardStateLoader runat="server" ID="WizardLoader" />
            <wiz:WizardProgressControl runat="server" ID="WizardSteps" FontIconStyle="false" Layout="Default" />
            <wiz:WizardMessagePanel runat="server" ID="MessagePanel" />

            <asp:MultiView ID="multiViewResultado" ActiveViewIndex="0" runat="server">
                <asp:View runat="server" ID="viewICMS">
                    <wes:ActionView runat="server" ID="ConsultasFiscaisICMSForm" Title="Consultas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" Controller="ConsultasFiscais" Action="ICMS" PageId="AGA_E_TRIBUTOS_CONSULTASFISCAIS" Level="20" Order="30"  />    
                </asp:View>
                <asp:View runat="server" ID="viewPIS">
                    <wes:ActionView runat="server" ID="ConsultasFiscaisPISForm" Title="Consultas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" Controller="ConsultasFiscais" Action="PIS" PageId="AGA_E_TRIBUTOS_CONSULTASFISCAIS" Level="20" Order="30"  />
                </asp:View>
                <asp:View runat="server" ID="viewCOFINS">
                    <wes:ActionView runat="server" ID="ConsultasFiscaisCOFINSForm" Title="Consultas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" Controller="ConsultasFiscais" Action="COFINS" PageId="AGA_E_TRIBUTOS_CONSULTASFISCAIS" Level="20" Order="30"  />
                </asp:View>
            </asp:MultiView>
    
            <wiz:WizardCommands runat="server" ID="WizardCommands"/>
            <aga:AGAResource runat="server" src="~/content/aga/js/wizard.js" />
            <aga:AGAResource runat="server" src="~/Content/js/jquery.table2excel.js" />
            <aga:AGAResource runat="server" src="~/Content/js/tableHeadFixer.js" />
            <aga:AGAResource runat="server" src="~/content/js/tributos/ConsultasFiscais.js" />
        </div>
    </div>

</asp:Content>
