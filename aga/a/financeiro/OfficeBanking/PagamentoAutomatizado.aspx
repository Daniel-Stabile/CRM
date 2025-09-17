<%@ Page Title="Pagamento Automatizado" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.OfficeBanking.PagamentoAutomatizado" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PAGAMENTOAUTOMATIZADO" Title="Pagamento automatizado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REMESSAS_PAGAMENTO_AUTOMATIZADO.DATASOURCE.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_PAGAMENTOAUTOMATIZADO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              var ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_PAGAMENTOAUTOMATIZADO_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_PAGAMENTOAUTOMATIZADO_FilterControl_FilterContainer').hide();
    
    $('#labelOcultarFiltro').addClass('active');
    $('#labelExibirFiltro').removeClass('active');
    $('#labelOcultarFiltro').css('display', 'none');
    $('#labelExibirFiltro').css('display', '');
    
    sessionStorage.setItem('TOGGLE_FILTRO_PAGAMENTOAUTOMATIZADO', "Oculto");
};

var exibirFiltro = () => {
    $('#ctl00_Main_PAGAMENTOAUTOMATIZADO_FilterControl_FilterContainer').fadeIn(500);
    $("#HasFilterApplied_PagamentoAutomatizado").val("False");
    
    $('#labelOcultarFiltro').css('display', '');
    $('#labelExibirFiltro').css('display', 'none');
    
    sessionStorage.setItem('TOGGLE_FILTRO_PAGAMENTOAUTOMATIZADO', "Visivel");
};

var processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_PAGAMENTOAUTOMATIZADO');
    
    if (estadoFiltro === "Oculto" || $("#HasFilterApplied_PagamentoAutomatizado").val() == "True")
        ocultarFiltro();
};


const botoesControle = () => {
    $('#ctl00_Main_PAGAMENTOAUTOMATIZADO_toolbar').append('<a class="btn custom-action command-action blue active" style="display: none" onclick="exibirFiltro();" id="labelExibirFiltro"> Exibir filtro </a><a class="btn custom-action command-action blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltro"> Ocultar filtro </a>');
};

$(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(processarVisibilidadeFiltro);
        pagina.add_endRequest(botoesControle);
    }
    
    processarVisibilidadeFiltro();
    botoesControle();
});

              </script>
      </asp:Content>
    