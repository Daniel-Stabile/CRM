<%@ Page Title="Itens da filial" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.genericos.ItensDaFilial" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ITENSDAFILIAL" Title="Itens da filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="AGA_PD_PRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t807_at1836_hsd655c67e.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_GENERICOS_ITENSDAFILIAL" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    $('#ctl00_Main_ITENSDAFILIAL .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" class="toggle"> Ocultar filtro </label></div>');
    
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
        pagina.add_endRequest(processarVisibilidadeFiltro);
        
    processarVisibilidadeFiltro();
});

var ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_ITENSDAFILIAL_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_ITENSDAFILIAL_FilterControl_FilterContainer').hide();
    
    $('#toggleOcultarFiltro').prop('checked', true);
    $('#labelOcultarFiltroFiltro').addClass('active');
    $('#labelExibirFiltro').removeClass('active');
    
    sessionStorage.setItem('TOGGLE_FILTRO_ITENS_DA_FILIAL', "Oculto");
};

var exibirFiltro = () => {
    $('#ctl00_Main_ITENSDAFILIAL_FilterControl_FilterContainer').fadeIn(500);
    sessionStorage.setItem('TOGGLE_FILTRO_ITENS_DA_FILIAL', "Visivel");
    $("#HasFilterApplied").val() == "False";
};

var processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_ITENS_DA_FILIAL');
    
    if (estadoFiltro === "Oculto" || $("#HasFilterApplied").val() == "True")
        ocultarFiltro();  
};

              </script>
      </asp:Content>
    