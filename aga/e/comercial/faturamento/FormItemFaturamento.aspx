<%@ Page Title="Item faturamento" Language="C#" CodeFile="~/aga/e/comercial/faturamento/FormItemFaturamento.aspx.cs" Inherits="faturamentoFormItemFaturamentoPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-md-5" style="padding: 0px">
            <wes:AjaxForm
                runat="server"
                ID="ITEMFATURAMENTO"
                Title="Item faturamento"
                Subtitle=""
                PortletCssClass=""
                PortletLayout="Default"
                BootstrapCols="12"
                FontIcon=""
                ShowTitle="false"
                ProviderWidgetUniqueId=""
                ChromeState="Normal"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                EntityViewName="CM_ITENS.FATURAMENTO.FORM"
                FormMode="View"
                IncludeRecordInRecentItems="False"
                UserDefinedCommandsVisible="true"
                Level="20"
                Order="10" />
        </div>

        <div style="padding-left: 30px !important; padding-right: 30px !important;" class="col-md-7">
            <div class="row">
                <div class="tabbable tabbable-custom erp-border">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tabENTREGAS" data-toggle="tab" aria-expanded="true">Entregas</a>
                        </li>
                        <li>
                            <a href="#tabTRIBUTOS" data-toggle="tab" aria-expanded="false">Tributos</a>
                        </li>
                        <li>
                            <a href="#tabIMPOSTOS" data-toggle="tab" aria-expanded="false">Impostos retidos</a>
                        </li>
                        <li>
                            <a href="#tabCUSTOS" data-toggle="tab" aria-expanded="false">Custos</a>
                        </li>
                        <li>
                            <a href="#tabCOMISSOES" data-toggle="tab" aria-expanded="false">Comissões</a>
                        </li>
                        <li>
                            <a href="#tabRATEIOS" data-toggle="tab" aria-expanded="false">Rateios</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="tabENTREGAS">
                            <div class="row">
                                <asp:HiddenField ID="ItemEntregaHandle" runat="server" Value="" Visible="true" ClientIDMode="Static"></asp:HiddenField>
                                <wes:EditableGrid runat="server" ID="ENTREGAS" Title="Entregas" PortletLayout="Default" BootstrapCols="12" ShowTitle="false" ProviderWidgetUniqueId="ITEMFATURAMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ITEMENTREGAS.FATURAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE) AND A.PRODUTO = @CAMPO(PRODUTO) AND A.VARIACAO = @CAMPO(VARIACAO)" Level="20" Order="20" />
                                <wes:EditableGrid runat="server" ID="ENTREGALOTES" Title="Lotes de entrega" PortletLayout="Default" BootstrapCols="12" ShowTitle="false" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ITEMENTREGALOTES.FATURAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="30" />
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tabTRIBUTOS">
                            <div class="row">
                                <wes:AjaxForm
                                    runat="server"
                                    ID="TRIBUTOS"
                                    Title="Tributos"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="CM_ITENS.FATURAMENTO.TRIBUTOS.FORM"
                                    FormMode="View"
                                    IncludeRecordInRecentItems="False"
                                    UserDefinedCommandsVisible="False"
                                    Level="20"
                                    Order="50" />
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tabIMPOSTOS">
                            <div class="row">
                                <wes:AjaxForm
                                    runat="server"
                                    ID="IMPOSTOS"
                                    Title="Tributo"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="CM_ITENS.FATURAMENTO.IMPOSTOSRETIDOS.FORM"
                                    FormMode="View"
                                    IncludeRecordInRecentItems="True"
                                    UserDefinedCommandsVisible="False"
                                    Level="20"
                                    Order="40" />
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tabCUSTOS">
                            <div class="row">
                                <wes:AjaxForm
                                    runat="server"
                                    ID="CUSTOS"
                                    Title="Custos"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="CM_ITENS.FATURAMENTO.CUSTOS.FORM"
                                    FormMode="View"
                                    IncludeRecordInRecentItems="False"
                                    UserDefinedCommandsVisible="False"
                                    Level="20"
                                    Order="60" />
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tabCOMISSOES">
                            <div class="row">
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="COMISSES"
                                    Title="Comissões"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="ITEMFATURAMENTO"
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="CM_ITEMCOMISSOES.FATURAMENTO.GRID"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="False"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="False"
                                    CompanyFilterMode="OnlyCompany"
                                    UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    Level="20"
                                    Order="30" />
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tabRATEIOS">
                            <div class="row">
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="CONTASFINANCEIRAS"
                                    Title="Contas Financeiras"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="ITEMFATURAMENTO"
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="CONTASFINANCEIRASITEMFATURAMENTOCOMERCIAL.DATASOURCE.GRID"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="False"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="False"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="False"
                                    UserDefinedDisableRowSelection="False"
                                    UserDefinedCriteriaWhereClause="A.LANCAMENTOITEMFAT = @CAMPO(HANDLE)"
                                    FormUrl="~/aga/e/financeiro/ContasFinanceiras/ContasFinanceiras.aspx"
                                    Level="20"
                                    Order="20" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .portlet.light {
            padding: 12px 15px 15px;
        }

        .nav-tabs li a {
            color: black !important;
        }
    </style>

    <script>
        $(document).on('click', 'span.selected-item', function (e) {
            console.log(e)
            e.stopPropagation();
        });

        $(document).on('click', 'input', function (e) {
            e.stopPropagation();
        });

        $(document).on('click', 'tr', function () {
            var trId = $(this).closest('tr').prop('id');

            if (trId.includes('ENTREGAS')) {
                var handle = $(this).closest("tr")[0].getAttribute('handle');

                if (handle != document.getElementById("ItemEntregaHandle").value) {
                    document.getElementById("ItemEntregaHandle").value = handle;
                    __doPostBack('ctl00$Main$ENTREGALOTES', 'refresh');
                }
            }
        });

        $(function () {
            var pagina = Sys.WebForms.PageRequestManager.getInstance();
            if (!pagina.get_isInAsyncPostBack()) {
                pagina.add_endRequest(BreakLine);
            }
            
            BreakLine();
        });

        function BreakLine() {
            $("[data-field='EHREPASSE']").before("<br/>");
            $("#ctl00_Main_TRIBUTOS_PageControl_PAGE_4_PAGE_4_ctl106_CLASSIFICACAOTRIBUTARIACOFINS_VALUE").parent().append("<br/>");
        }
    </script>

</asp:Content>