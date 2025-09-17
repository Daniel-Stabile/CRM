<%@ Page Title="Apuração PIS/COFINS" Language="C#" Inherits="aga.e.Tributos.Apuracoes.ApuracaoPC,Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="APURAOPISCOFINS_1" Title="Apuração PIS / COFINS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_VTAPURACAOPC.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageWidgetHandle="58465" Level="20" Order="5" />
    </div>
    <div class="row">
        <div class="col-md-12">
            <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                <erp:ErpTab runat="server" ID="ErpTab1" Text="Contribuição de período">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="CONTRIBUIODOPERODOM200_NAOCUMULATIVA" Title="Valor da contribuição não cumulativa (M200/M600)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOCONSOLIDACAO-NAOCUMULATIVA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.HANDLE=-1" ShowExport="True" UserDefinedDisableRowSelection="True" PageWidgetHandle="58473" Level="20" Order="25" />
                        </div>
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="CONTRIBUIODOPERODOM200_CUMULATIVA" Title="Valor da contribuição cumulativa (M200/M600)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOCONSOLIDACAO-CUMULATIVA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.HANDLE=-1" ShowExport="True" UserDefinedDisableRowSelection="True" PageWidgetHandle="58473" Level="20" Order="25" />
                        </div>
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="TR_PCAPURACAODETALHAMENTOCONTR" Title="Detalhamento da contribuição (M210/M610)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TR_PCAPURACAODETALHAMENTOCONTR.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/DetalhamentoContribuicaoM210M260.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58485" Level="20" Order="35" UserDefinedCriteriaWhereClause="A.HANDLE=-1" />
                        </div>
                        <erp:ErpTabControl runat="server" ID="ErpTabControl2" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="ErpTab7" Text="Cooperativas - Composição da base cálculo (M211/M611)">
                                <div class="row">
                                    <wes:SimpleGrid runat="server" ID="COOPERATIVASCOMPOSIODABASECLCULOM211" Title="Cooperativas - Composição da base cálculo (M211/M611)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TR_PCAPURACAODETALHAMENTOCONTR" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="TR_PCAPURACAOCOOPERATIVAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/CooperativasComposicaoBaseCalculoM211M611.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58486" Level="20" Order="45" />
                                </div>
                            </erp:ErpTab>
                            <erp:ErpTab runat="server" ID="ErpTab12" Text="Ajustes da base de cálculo (M215/M615)">
                                <div class="row">
                                    <wes:SimpleGrid runat="server" ID="AJUSTEBASECALCULOM215M615" Title="Ajustes da base de cálculo (M215/M615)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TR_PCAPURACAODETALHAMENTOCONTR" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOAJUSTEBASECALCULO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.APURACAODETALHAMENTOCONTR = @CAMPO(HANDLE)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/AjustesBaseCalculoM215M615.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58486" Level="20" Order="45" />
                                </div>
                            </erp:ErpTab>
                            <erp:ErpTab runat="server" ID="ErpTab9" Text="Ajustes da contribuição apurada (M220/M620)">
                                <div class="row">
                                    <wes:SimpleGrid runat="server" ID="AJUSTESDACONTRIBUIOAPURADAM220" Title="Ajustes da contribuição apurada (M220/M620)" UserDefinedCriteriaWhereClause="A.DETALHAMENTO = @CAMPO(HANDLE) AND A.COMPOSICAOAJUSTEPISCOFINS = 2" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TR_PCAPURACAODETALHAMENTOCONTR" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOAJUSTES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/AjustesContribuicaoM220M620.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58488" Level="20" Order="65" />
                                </div>
                            </erp:ErpTab>
							<erp:ErpTab runat="server" ID="ErpTab8" Text="Informações adicionais de diferimento (M230/M630)">
                                <div class="row">
                                    <wes:SimpleGrid runat="server" ID="INFORMAESADICIONAISDEDIFERIMENTOM230" Title="Informações adicionais de diferimento (M230/M630)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TR_PCAPURACAODETALHAMENTOCONTR" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAODIFERIMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58487" Level="20" Order="55" />
                                </div>
                            </erp:ErpTab>
                        </erp:ErpTabControl>
                    </div>
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="ErpTab2" Text="Receita bruta para rateio">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="RECEITABRUTAPARARATEIO" Title="Receita bruta para rateio" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/ReceitaBruta0111.aspx" UserDefinedCriteriaWhereClause="A.HANDLE = -1" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="TR_PCAPURACAORECEITABRUTA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58489" Level="20" Order="75" />
                    </div>

                    
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="ErpTabRetencoes" Text="Retenções">
                    <div class="row">
                       <%-- <wes:SimpleGrid runat="server" ID="RETENCOES" Title="Retenções" UserDefinedCriteriaWhereClause="A.HANDLE = -1" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCSALDORETENCOES.APURACAOPISCONFINS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58493" Level="20" Order="115" />--%>
                        <wes:SimpleGrid runat="server" ID="RETENCOESDINAMICA" Title="Retenções Dinamica" UserDefinedSelectColumnVisible ="false" UserDefinedDisableRowSelection="true" DisplayRowCommand="True"/>
                    </div>

                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab3" Text="Crédito do período">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="CRDITORELATIVOAOPERODOM100M500" Title="Crédito relativo ao período (M100/M500)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/CreditoPeriodoM100M500.aspx" UserDefinedCriteriaWhereClause="A.HANDLE = -1" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TR_PCAPURACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58490" Level="20" Order="85" />
                    </div>
                    <erp:ErpTabControl runat="server" ID="ErpTabControl3" ShowBorder="true" RenderAsPortlet="false">
                        <erp:ErpTab runat="server" ID="ErpTab10" Text="Detalhamento da base de cálculo do crédito (M105/M505)">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="DETALHAMENTODABASEDECLCULODOCRDITOM105M505" Title="Detalhamento da base de cálculo do crédito (M105/M505)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/DetalhamentoBaseCalculoCreditoM105M505.aspx" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CRDITORELATIVOAOPERODOM100M500" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="TR_PCAPURACAODETALHAMENTOBASE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58491" Level="20" Order="95" />
                            </div>
                        </erp:ErpTab>
                        <erp:ErpTab runat="server" ID="ErpTab11" Text="Ajustes do crédito apurado (M110/M510)">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="AJUSTESDOCRDITOAPURADOM110M510" Title="Ajustes do crédito apurado (M110/M510)" UserDefinedCriteriaWhereClause="A.APURACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/AjustesCreditoApuradoM110M510.aspx" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CRDITORELATIVOAOPERODOM100M500" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOAJUSTES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58492" Level="20" Order="105" />
                            </div>
                        </erp:ErpTab>
                    </erp:ErpTabControl>
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="ErpTab4" Text="Controle dos créditos">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="CONTROLEDOSCRDITOS11001500" Title="Controle dos créditos (1100/1500)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/ControleCreditos11001500.aspx" UserDefinedCriteriaWhereClause="A.HANDLE = -1" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="TR_PCCONTROLECREDITO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58493" Level="20" Order="115" />
                    </div>

                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab5" Text="PIS - Folha de salários">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="PISFOLHAM350" Title="PIS - Folha de salários (M350)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/PISFolhaSalariosM350.aspx" UserDefinedCriteriaWhereClause="A.HANDLE = -1" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOFOLHAPAGAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58493" Level="20" Order="115" />
                    </div>

                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab6" Text="Receitas não tributadas">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="RECEITASNAOTRIBUTADASM400M800" Title="Receitas não tributadas (M400/M800)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/ReceitasNaoTributadasM400M800.aspx" UserDefinedCriteriaWhereClause="A.HANDLE = -1" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TR_PCAPURACAOISENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58493" Level="20" Order="115" />
                    </div>
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="DETALHAMENTODASRECEITASM410M4810" Title="Detalhamento das receitas (M410/M810)" FormUrl="~/aga/a/tributos/Apuracoes/ApuracaoPC/DetalhamentoReceitasM410M810.aspx" UserDefinedCriteriaWhereClause="" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="RECEITASNAOTRIBUTADASM400M800" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TR_PCAPURACAOISENTODETALHES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58493" Level="20" Order="115" />
                    </div>

                </erp:ErpTab>

            </erp:ErpTabControl>
        </div>
    </div>
</asp:Content>

