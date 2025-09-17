<%@ Page Title="Carga de informações de movimentação fiscal ICMS/IPI" Language="C#" Inherits="aga.e.SPED.ICMSIPI.MovimentacoesICMSIPIPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <style>
        .altura {
            height: 100px !important;
        }

        .table tbody tr td {
            padding: 0px;
        }

        /*#tabDOCUMENTOSENTRADA .row,
        #tabDOCUMENTOSSAIDA .row,
        #tabINFORMACOESADICIONAIS .row,
        #tabPRODUCAO .row {
            position: relative;
            overflow: auto;
            height: 600px;
        }*/

        /*está na pagina principal sped.aspx*/
        /*.modal-full.modal-dialog {
            position: relative; 
            overflow: hidden; 
            width: 68%;
        }*/

    </style>

    <div class="row">
        <wes:AjaxForm runat="server" ID="CARGAMOVIMENTACOESFISCALICMSIPI" Title="Carga de informações das movimentações fiscais ICMS/IPI" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="ED_VTCARGAMOVIMENTACAOICMSIPI.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" CustomCommandsVisible="true" PredefinedCommandsVisible="true" PageId="AGA_A_SPED_ICMSIPI_MOVIMENTACOES" Level="20" Order="10" />
        <div class="col-md-7">
            <div class="portlet light">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs">
                        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSENTRADA" class=""><a data-toggle="tab" href="#tabDOCUMENTOSENTRADA">Documentos entrada</a></li>
                        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSSAIDA" class=""><a data-toggle="tab" href="#tabDOCUMENTOSSAIDA">Documentos saída</a></li>
                        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMACOESADICIONAIS" class="active"><a data-toggle="tab" href="#tabINFORMACOESADICIONAIS">Informações adicionais</a></li>
                        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PRODUCAO" class=""><a data-toggle="tab" href="#tabPRODUCAO">Produção</a></li>
                        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="BLOCOB" class=""><a data-toggle="tab" href="#tabBLOCOB">Bloco B</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane" id="tabDOCUMENTOSENTRADA">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="DOCUMENTOSENTRADA" Title="Documentos entrada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CARGADEINFORMAESDEMOVIMENTAOFISCALICMSIPI" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="ED_ITENSCARGA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.DOCUMENTOENTRADA = 'S')" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_SPED_EFD_ICMSIPI_MOVIMENTACOES" Level="20" Order="20" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tabDOCUMENTOSSAIDA">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="DOCUMENTOSSAIDA" Title="Documentos saída" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CARGADEINFORMAESDEMOVIMENTAOFISCALICMSIPI" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="ED_ITENSCARGA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.DOCUMENTOSAIDA = 'S')" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_SPED_EFD_ICMSIPI_MOVIMENTACOES" Level="20" Order="20" />
                            </div>
                        </div>
                        <div class="tab-pane active" id="tabINFORMACOESADICIONAIS">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="INFORMACOESADICIONAIS" Title="Informações adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CARGADEINFORMAESDEMOVIMENTAOFISCALICMSIPI" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="ED_ITENSCARGA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.INFORMACOESADICIONAIS = 'S')" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_SPED_EFD_ICMSIPI_MOVIMENTACOES" Level="20" Order="20" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tabPRODUCAO">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="PRODUCAO" Title="Produção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CARGADEINFORMAESDEMOVIMENTAOFISCALICMSIPI" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="ED_ITENSCARGA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.PRODUCAO = 'S')" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_SPED_EFD_ICMSIPI_MOVIMENTACOES" Level="20" Order="20" />
                            </div>
                        </div>                        
                        <div class="tab-pane" id="tabBLOCOB">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="BLOCOB" Title="Bloco B" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CARGADEINFORMAESDEMOVIMENTAOFISCALICMSIPI" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="ED_ITENSCARGA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.ISSBLOCOB = 'S')" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_SPED_EFD_ICMSIPI_MOVIMENTACOES" Level="20" Order="20" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var pagina = Sys.WebForms.PageRequestManager.getInstance();
        if (!pagina.get_isInAsyncPostBack()) {
            pagina.add_pageLoaded(function () {
                
            });
        }

        $("th > a").click(function(event){
            console.log("a click");
            event.stopPropagation();  
        });
    </script>

</asp:Content>
