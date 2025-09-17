<%@ Page Title="Consultas fiscais - Agrupamentos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Tributos.ConsultasFiscaisAgrupamentos, Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.UI" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="cc1" %>
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
                <li>
                    Agrupamentos
                </li>
            </ul>
        </div>
	</div>

    <div class="portlet light">
        <div class="portlet-body">
            <wiz:WizardStateLoader runat="server" ID="WizardLoader" />
            <wiz:WizardProgressControl runat="server" ID="WizardSteps" FontIconStyle="false" Layout="Default" />
            <wiz:WizardMessagePanel runat="server" ID="MessagePanel" />

            <asp:UpdatePanel ID="updatePanelFilter" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="erros" CssClass="alert alert-danger" runat="server" Visible="false">
                        <asp:Label ID="lbErrorMessage" CssClass="" runat="server" Text=""></asp:Label>
                    </asp:Panel>

                    <div class="portlet light ignore-autofocus portletAgrupamento">
                        <div class="portlet-body form">

                            <asp:LinkButton ID="clearConditionButton" CssClass="btn default command-action predef-action" OnClick="ClearConditionButton_Click" runat="server"><i class="fa fa-eraser btn-action"></i>Limpar condições</asp:LinkButton>

                            <div class="table-responsive table-scroll filter-control">
                                <asp:Table ID="table" runat="server" CssClass="filter-conditions" />
                            </div>

                        </div>
                    </div>         
                </ContentTemplate>
            </asp:UpdatePanel>

            <wiz:WizardCommands runat="server" ID="WizardCommands" />
        </div>
    </div>

    <aga:AGAResource runat="server" src="~/content/aga/js/wizard.js" />
    <aga:AGAResource runat="server" src="~/content/js/tributos/ConsultasFiscais.js" />

</asp:Content>