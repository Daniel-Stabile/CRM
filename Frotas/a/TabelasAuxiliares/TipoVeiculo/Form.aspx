<%@ Page Title="Cadastro tipo veiculo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="portlet light" style="margin: 15px 15px 5px 15px;">



            <div class="tabbable-line">
                <ul class="nav nav-tabs">
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_934" class="active"><a data-toggle="tab" href="#tabWIDGET_Geral"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Geral")%></a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_881" class="" id="AbaPessoas"><a data-toggle="tab" href="#tabWIDGET_Modelo"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Modelos")%></a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_881" class="" id="AbaAuditoria"><a data-toggle="tab" href="#tabWIDGET_Subtipo"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Subtipo")%></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tabWIDGET_Geral">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="TIPOVEICULO" Title="Tipo Veiculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOTIPOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CADASTRO_TIPO_VEICULO_FORM" Level="20" Order="10" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_Modelo">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="CADASTROMODELO" Title="Cadastro Modelo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TIPOVEICULO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOMODELOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CADASTRO_TIPO_VEICULO_FORM" Level="20" Order="20" />



                        </div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_Subtipo">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="SUBTIPO_1" Title="Subtipo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TIPOVEICULO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOSUBTIPOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Frotas/a/TabelasAuxiliares/TipoVeiculo/Subtipo/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_TIPO_VEICULO_FORM" Level="20" Order="40" />



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
