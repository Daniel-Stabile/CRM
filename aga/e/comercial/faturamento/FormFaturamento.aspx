<%@ Page Title="Faturamento" Language="C#" CodeFile="~/aga/e/comercial/faturamento/FormFaturamento.aspx.cs" Inherits="FormFaturamentoPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-md-5">
            <div class="tabbable tabbable-custom erp-border">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tabNF" data-toggle="tab" aria-expanded="true">Principal</a>
                    </li>
                    <li runat="server" id="TABNFE">
                        <a href="#tabNFe" data-toggle="tab" aria-expanded="true">NFe</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade active in" id="tabNF">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="NOTAFISCAL" Title="Nota fiscal" Subtitle="" DisplayCommandExecutedDefaultMessage="false" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.FATURAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22699" Level="20" Order="10" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabNFe">
                        <div class="row">
                            <wes:AjaxForm runat="server" ID="NOTAFISCALELETRONICA" Title="NFe" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="NOTAFISCAL" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFE.FATURAMENTO.FORM" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22699" Level="20" Order="10" />
                        </div>
                        <div class="tabbable tabbable-custom erp-border">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tabNFeletronica" data-toggle="tab" aria-expanded="true">NFe</a>
                                </li>
                                <li>
                                    <a href="#tabMDe" data-toggle="tab" aria-expanded="true">MDe</a>
                                </li>
                                <li>
                                    <a href="#tabConsultaPublica" data-toggle="tab" aria-expanded="true">Consulta pública</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="tabNFeletronica">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="NFELETRONICAEVENTOSNFE" Title="Histórico de eventos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOTAFISCAL" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFEEVENTOS.GRID" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE) AND A.EVENTO IN (1,2,3,4,5,6)" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageWidgetHandle="22699" Level="20" Order="20" />
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tabMDe">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="NFELETRONICAEVENTOSMDE" Title="Histórico de eventos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOTAFISCAL" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFEEVENTOS.GRID" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE) AND A.EVENTO IN (7,8,9,10)" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageWidgetHandle="22699" Level="20" Order="20" />
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tabConsultaPublica">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="NFECONSULTAPUBLICA" ToolTip="Informe as empresas ou pessoas que estão autorizadas a fazer o download do arquivo XML dessa NF-e na SEFAZ" Title="" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="NOTAFISCAL" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFECONSULTAS.GRID" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageWidgetHandle="22699" Level="20" Order="20" />
                                    </div>
                                </div>
                                <div class="row">
                                    <wes:SimpleGrid runat="server" ID="NFELETRONICALOGS" Title="Log de integração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOTAFISCALELETRONICA" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFELOGS.GRID" UserDefinedCriteriaWhereClause="A.DOCUMENTONFE = @CAMPO(HANDLE)" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageWidgetHandle="22699" Level="20" Order="30" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="tabbable tabbable-custom erp-border">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tabITENS" data-toggle="tab" aria-expanded="true">Itens</a>
                    </li>
                    <li>
                        <a href="#tabTRIBUTACAO" data-toggle="tab" aria-expanded="false">Tributação</a>
                    </li>
                    <li>
                        <a href="#tabRETENCOES" data-toggle="tab" aria-expanded="false">Retenções</a>
                    </li>
                    <li>
                        <a href="#tabCONTASFINANCEIRAS" data-toggle="tab" aria-expanded="false">Contas financeiras</a>
                    </li>
                    <li>
                        <a href="#tabCOMISSOES" data-toggle="tab" aria-expanded="false">Comissões</a>
                    </li>
                    <li>
                        <a href="#tabRECEBIMENTOS" data-toggle="tab" aria-expanded="false">Recebimentos</a>
                    </li>
                    <li id="TABCONTABILIZACAO" runat="server">
                        <a href="#tabCONTABILIZACAO" data-toggle="tab" aria-expanded="false">Contabilização</a>
                    </li>
                    <li id="TABORDENSVENDA" runat="server">
                        <a href="#tabORDENSVENDA" data-toggle="tab" aria-expanded="false">Ordens de venda</a>
                    </li>
                    <li id="TABITENSDEVOLVIDOS" runat="server">
                        <a href="#tabITENSDEVOLVIDOS" data-toggle="tab" aria-expanded="false">Itens devolvidos</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade active in" id="tabITENS">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="GRID_ITENS" BootstrapCols="12" ShowTitle="False" Title="" EntityViewName="CM_ITENS.FORMFATURAMENTO.GRID" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" ProviderWidgetUniqueId="NOTAFISCAL" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" PageWidgetHandle="57469" FormUrl="~/aga/e/comercial/faturamento/FormItemFaturamento.aspx" ToolTip="Clicar na linha para configurações avançadas." />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabTRIBUTACAO">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="GRID_TRIBUTACAO" BootstrapCols="12" ShowTitle="False" Title="" EntityViewName="CM_TRIBUTACOES.FORMFATURAMENTO.GRID" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" ProviderWidgetUniqueId="NOTAFISCAL" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/comercial/faturamento/TributosFaturamento.aspx" PageWidgetHandle="57469" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabRETENCOES">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="GRIDRETENCOES" BootstrapCols="12" ShowTitle="False" Title="" EntityViewName="FN_DOCUMENTOIMPOSTOS.FORMFATURAMENTO.GRID" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" ProviderWidgetUniqueId="NOTAFISCAL" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" PageWidgetHandle="57469" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabCONTASFINANCEIRAS">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="CONTASFINANCEIRAS" Title="Contas Financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="NOTAFISCAL" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CONTASFINANCEIRASFATURAMENTOCOMERCIAL.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_E_COMERCIAL_FATURAMENTO_FORMFATURAMENTO" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/e/financeiro/ContasFinanceiras/ContasFinanceiras.aspx" Level="20" Order="20" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabCOMISSOES">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="GRIDCOMISSOES" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="NOTAFISCAL" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="SQL_COM_NFECOMISSOES.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="False" UserDefinedCriteriaWhereClause="A.DOCUMENTO IN (SELECT HANDLE FROM FN_DOCUMENTOS WHERE DOCUMENTODIGITADO = @CAMPO(DOCUMENTODIGITADO))" Level="20" Order="10"  />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabRECEBIMENTOS">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="GRIDRECEBIMENTOS" BootstrapCols="12" ShowTitle="False" Title="" EntityViewName="CM_DOCUMENTORECEBIMENTOS.FORMFATURAMENTO.GRID" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" ProviderWidgetUniqueId="NOTAFISCAL" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" PageWidgetHandle="57469" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabCONTABILIZACAO">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="CONTABILIZAO" Title="Contabilização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CONTABILIZACAOFATURAMENTOCOMERCIAL.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_E_COMERCIAL_FATURAMENTO_FORMFATURAMENTO" ProviderWidgetUniqueId="NOTAFISCAL" UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(DOCUMENTOORIGEM)" Level="20" Order="10" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabORDENSVENDA">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="ORDENSVENDA" Title="Ordens de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_ORDENSVENDA.CONSULTA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="False" ProviderWidgetUniqueId="NOTAFISCAL" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DISTINCT(ORDEMVENDA) FROM CM_ORDEMVENDAITENS WHERE CM_ORDEMVENDAITENS.HANDLE IN (SELECT ORDEMVENDAITEM FROM CM_ORDEMVENDALIBERACOES WHERE ITEMNF IN(SELECT HANDLE FROM CM_ITENS WHERE DOCUMENTO = @CAMPO(HANDLE))))" Level="20" Order="10" />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tabITENSDEVOLVIDOS">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="ITENSDEVOLVIDOS" Title="Itens devolvidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="ITENSDEVOLVIDOS.CONSULTA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="False" ProviderWidgetUniqueId="NOTAFISCAL" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" Level="20" Order="10" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
