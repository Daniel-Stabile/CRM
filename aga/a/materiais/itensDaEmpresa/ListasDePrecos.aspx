<%@ Page Title="Produto - Listas de preços" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.itensDaEmpresa.ListasDePrecos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LISTASDEPREOS" Title="Listas de preços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_LISTAPRECOPRODUTOS.LISTAS_PRECOS.GRID" DefaultFilterName="Padrão" Mode="SelectableRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.LISTA IN (SELECT HANDLE FROM CM_LISTASPRECOS WHERE TIPO = 'V')" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_MATERIAIS_ITENSDAEMPRESA_LISTASDEPRECOS" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    $('#ctl00_Main_LISTASDEPREOS .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltroPrecosProdutos"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroPrecosProdutos"><input type="radio" id="toggleOcultarFiltroPrecosProdutos" name="toggleFiltro" class="toggle"> Ocultar filtro </label></div>');
    
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
        pagina.add_endRequest(processarVisibilidadeFiltro);
        
    processarVisibilidadeFiltro();
});

var ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_LISTASDEPREOS_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_LISTASDEPREOS_FilterControl_FilterContainer').hide();
    
    $('#toggleOcultarFiltroPrecosProdutos').prop('checked', true);
    $('#labelOcultarFiltroPrecosProdutos').addClass('active');
    $('#labelExibirFiltroPrecosProdutos').removeClass('active');
    
    sessionStorage.setItem('TOGGLE_FILTRO_PRECOSPRODUTOS', "Oculto");
};

var exibirFiltro = () => {
    $('#ctl00_Main_LISTASDEPREOS_FilterControl_FilterContainer').fadeIn(500);
    sessionStorage.setItem('TOGGLE_FILTRO_PRECOSPRODUTOS', "Visivel");
    $("#HasFilterApplied_ListasDePrecos").val("False");
};

var processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_PRECOSPRODUTOS');
    
    if (estadoFiltro === "Oculto" || $("#HasFilterApplied_ListasDePrecos").val() == "True")
        ocultarFiltro();  
};

              </script>
      </asp:Content>
    