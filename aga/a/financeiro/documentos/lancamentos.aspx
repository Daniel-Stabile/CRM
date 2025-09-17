<%@ Page Title="Lançamentos de contas financeiras" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.Documentos.LancarContasFinanceiras" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:CommandsPanel runat="server" ID="PAINEL" Title="PAINEL" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="VALIDAR.LANCAR.GRID" VerticalOrientation="False" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_LANCAMENTOS" Level="20" Order="2"  />
        <wes:HtmlPanel runat="server" ID="DIVERGENCIAS" Title="Divergencias" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_LANCAMENTOS" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="LANCAMENTOS" Title="Lançamentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTOS.LANCAR.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_LANCAMENTOS" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="LANCAMENTO" Title="Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="LANCAMENTOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_LANCAMENTOS.LANCAR.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_LANCAMENTOS" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="CCS" Title="Centros de Custos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="LANCAMENTO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTOCC.LANCAR.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_LANCAMENTOS" Level="20" Order="30"  />
        <wes:AjaxForm runat="server" ID="CC" Title="CENTRO DE CUSTO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CCS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_LANCAMENTOCC.LANCAR.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_LANCAMENTOS" Level="20" Order="40"  />
        </div>
    
        <script type="text/javascript">
              
$(function () {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (!prm.get_isInAsyncPostBack()) {
        prm.add_endRequest(function (sender, args) {
            if ($('#CCS tr.active').length === 0)
                $('#CCS td:not(.column-action):first a').click();
            var formLancamentosHeight = $('#LANCAMENTO').height() - $('#LANCAMENTOS').height();
            var newHeight = $('#LANCAMENTOS .table-responsive').height() + formLancamentosHeight;
            $('#LANCAMENTOS .table-responsive').height(newHeight);
            $('#LANCAMENTOS .table-responsive').css("overflow-y", "auto");
            $('#LANCAMENTOS .table-responsive').css("min-height", "290px");

            var formLancamentoCCHeight = $('#CC').height() - $('#CCS').height();
            var newHeightCC = $('#CCS .table-responsive').height() + formLancamentoCCHeight;
            $('#CCS .table-responsive').height(newHeightCC);
            $('#CCS .table-responsive').css("overflow-y", "auto");
            $('#CCS .table-responsive').css("min-height", "210px");
            
            $('#ctl00_Main_PAINEL_toolbar').addClass('margin-bottom-5');
        });
    }
    SelecionaItemGrid();
});

function DesmarcarCC() {
    __doPostBack('ctl00$Main$CCS$btPreviousPage','');
}

function SelecionaItemGrid() {
    SelecionarPrimeiroLancamento();
}

function OcultarDivergencias() {
    $('#ctl00_Main_DIVERGENCIAS_UpdatePanel').hide();
}

function SelecionarPrimeiroLancamento() {
    if ($('table[id="ctl00_Main_LANCAMENTOS_SimpleGrid"]').children('tbody').has('tr[handle]').length > 0) {
        if (Benner.Page.LANCAMENTO.formViewMode != "Insert") {
            Benner.Page.LANCAMENTOS.select(0);
            SelecionarPrimeiroCentroCusto();    
        }
    }
}

function SelecionarPrimeiroCentroCusto() {
    if ($('table[id="ctl00_Main_CCS_SimpleGrid"]').children('tbody').has('tr[handle]').length > 0) {
        if (Benner.Page.CC.formViewMode != "Insert") {
            Benner.Page.CCS.select(0);
        }
    }
}

function FecharModal(){
    parent.Benner.ModalPage.hide();
}

              </script>
        <style>
              ul.break-lines{
            overflow: auto;
            height: 400px;
            min-width: 400px;

            }

              </style>
      </asp:Content>
    