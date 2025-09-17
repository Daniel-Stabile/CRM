<%@ Page Title="Ordem de venda" Language="C#" CodeFile="~/aga/e/comercial/OrdensVenda/OrdemVenda.aspx.cs" Inherits="OrdemVendaPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="portlet light">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-3">
                <ul class="nav nav-tabs tabs-left">
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDEMDEVENDA" class="active"><a data-toggle="tab" href="#tabORDEMDEVENDA">Ordem de venda</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OUTRASINFORMAES"><a data-toggle="tab" href="#tabOUTRASINFORMAES">Outras informações</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONDIESDERECEBIMENTO"><a data-toggle="tab" href="#tabCONDIESDERECEBIMENTO">Cond. Receb. Parcelas</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DADOSFINANCEIROS"><a data-toggle="tab" href="#tabDADOSFINANCEIROS">Dados financeiros</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOCAISDERETIRADA"><a data-toggle="tab" href="#tabLOCAISDERETIRADA">Locais de Retirada</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOCAISDEENTREGA"><a data-toggle="tab" href="#tabLOCAISDEENTREGA">Locais de Entrega</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRANSPORTADORA"><a data-toggle="tab" href="#tabTRANSPORTADORA">Transportadora</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESADICIONAIS"><a data-toggle="tab" href="#tabINFORMAESADICIONAIS">Informações adicionais</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TEXTOASSINATURAS"><a data-toggle="tab" href="#tabTEXTOASSINATURAS">Texto assinaturas</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA">Auditoria</a></li>
                </ul>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="tabORDEMDEVENDA">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="ORDEMDEVENDA" Title="Ordem de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.DETALHE.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="10" />
                        </div>
                        <div class="row">
                            <wes:EditableGrid UserDefinedCriteriaWhereClause="A.ORDEMVENDA=@CAMPO(HANDLE)"
                                runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass=""
                                PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true"
                                ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Fixed" CanDelete="True"
                                CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDEMVENDAITENS.CUSTOM.GRID"
                                Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10"
                                SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany"
                                ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabOUTRASINFORMAES">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="OUTRASINFORMAES" Title="Outras informações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.OUTRASINFORMACOES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="13" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabCONDIESDERECEBIMENTO">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="CONDIESDERECEBIMENTO" Title="Condições de Recebimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_ORDEMVENDARECEBIMENTOS.DETALHE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t4082_at6341_hsc1076472.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="30" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabDADOSFINANCEIROS">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="DADOSFINANCEIROS" Title="Dados financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.DADOSFINANCEIROS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="30" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabLOCAISDERETIRADA">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="LOCAISDERETIRADA" Title="Locais de Retirada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.LOCALRETIRADA.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="40" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabLOCAISDEENTREGA">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="LOCAISDEENTREGA" Title="Locais de Entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.LOCALENTREGA.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="50" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabTRANSPORTADORA">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="TRANSPORTADORA" Title="Transportadora" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="false" CanUpdate="True" CanInsert="false" EntityViewName="CM_ORDENSVENDA.TRANSPORTADORA.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="110" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabINFORMAESADICIONAIS">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="INFORMAESADICIONAIS" Title="Informações adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.INFOSADICIONAIS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="120" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabASSINATURAS">
                        <div class="row">
                            <wes:EditableGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.ORDEMVENDA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="160" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabTEXTOASSINATURAS">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="TEXTOASSINATURAS" Title="Texto assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.ASSINATURAS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="170" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tabAUDITORIA">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDENSVENDA.AUDITORIA.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSVENDA_ORDEMVENDA" Level="20" Order="180" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        const atualizarCamposTraduzidosDestinatario = () => Benner.Search.updatePathFields($("#ctl00_Main_ORDEMDEVENDA_PageControl_LOCALENTREGA_LOCALENTREGA_ctl13_ctl01_select"), $("#ORDEMDEVENDA .portlet-body.form"));
        //Mapeando manualmente change do campo produtos, pois grid editável nao executa userInterface
        function eventoChange() {
            $('select[data-targetentity="PD_PRODUTOS"]').on('select2:select', function () {
                var lookup = $(this);
                $.ajax({
                    url: Benner.Page.getApplicationPath() + "api/changeProduto",
                    data: {
                        'handleOrdemVenda': $('[data-widget-id="ORDEMDEVENDA"] [data-field="HANDLE"] input').val(),
                        'handleProduto': lookup.val()
                    },
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        //Atualiza valor do campo unitário com valor do backend
                        $(lookup.parents('tr').find('.ValorUnitarioSelector')[0].children[0].children[0]).val(data.ValorUnitario);
                        //Caso o produto não tenha controle por variação, desabilita o campo variação , pois será preenchido automaticamente depois com o único valor possível.
                        if (!data.HabilitaVariacao) {
                            //Desabilita campo variacao e remove "Lupa" de search.
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).prop("disabled", true);
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).next().next().css("pointer-events","none");
                        }
                        else {
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).prop("disabled", false);
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).next().next().css("pointer-events","all");
                        }
                    },
                    error: function (req, status, error) {
                        console.log(error);
                    }
                });
            });
        };

        function mapearVariacoes() {
            $('select[data-targetentity="PD_PRODUTOS"]').each(function(e) {
                var lookup = $(this);
                $.ajax({
                    url: Benner.Page.getApplicationPath() + "api/mapearVariacoes",
                    data: {
                        'handleProduto': lookup.val()
                    },
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        //Caso o produto não tenha controle por variação, desabilita o campo variação , pois será preenchido automaticamente depois com o único valor possível.
                        if (!data) {
                            //Desabilita campo variacao e remove "Lupa" de search.
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).prop("disabled", true);
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).next().next().css("pointer-events","none");
                        }
                        else {
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).prop("disabled", false);
                            $(lookup.parents('tr').find('.ColunaVariacao')[0].children[0].children[0]).next().next().css("pointer-events","all");
                        }
                    },
                    error: function (req, status, error) {
                        console.log(error);
                    }
                });
             });
        }

        $(() => {
            eventoChange();
            mapearVariacoes();
            var pagina = Sys.WebForms.PageRequestManager.getInstance();

            if (!pagina.get_isInAsyncPostBack()) {
                eventoChange();
                mapearVariacoes();
                pagina.add_endRequest(atualizarCamposTraduzidosDestinatario);
            }
        });

    </script>
</asp:Content>
