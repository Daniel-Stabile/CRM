<%@ Page Title="Consultar contratos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.consultas.Contratos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CAPA" class="active"><a data-toggle="tab" href="#tabCAPA">Capa</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS"><a data-toggle="tab" href="#tabITENS">Itens</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabCAPA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CAPA" Title="Capa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.CONSULTA_CONTRATOS_ITENS.GRID" DefaultFilterName="Padrão" Mode="SelectableRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_CONTRATOS_CONSULTAS_CONTRATOS" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOOBJETOS.CONSULTA_CONTRATOS_ITENS.GRID" DefaultFilterName="Padrão" Mode="SelectableRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_CONTRATOS_CONSULTAS_CONTRATOS" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
        <script type="text/javascript">
              const OcultarFiltro = (fadeOut, campo) => {
    var widget = $(campo).parents('.widget-body');
    var painelFiltro = widget.find('[id$="_FilterControl_FilterContainer"]');
    
    if (fadeOut)
        painelFiltro.fadeOut(500);
    else
        painelFiltro.hide();
        
    widget.find('#toggleOcultarFiltro').prop('checked', true);
    widget.find('#labelOcultarFiltro').addClass('active');
    widget.find('#labelExibirFiltro').removeClass('active');
};

const ExibirFiltro = (campo) => $(campo).parents('.widget-body').find('.filter-search-form').fadeIn(500);

const ProcessarVisibilidadeFiltro = () => {
    InserirBotoesOcultarExibirFiltro();
    
    var fadeout = $('#OcultarComFadeout').val() == "true";
    
    if ($('#EstadoFiltroCapa').val() == "oculto")
            OcultarFiltro(fadeout, $('#CAPA').find('#labelOcultarFiltro'));  
            
    if ($('#EstadoFiltroItens').val() == "oculto")
            OcultarFiltro(fadeout, $('#ITENS').find('#labelOcultarFiltro'));
    
    $('#OcultarComFadeout').val("false");
};

const InserirBotoesOcultarExibirFiltro = () => {
    $('[id$="_toolbar"]').each(function(index) {
        var botoesJaInseridos = $(this).has("#labelExibirFiltro").length > 0;
    
        if (!botoesJaInseridos)
            $(this).append('<div style="float: right;" class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="ExibirFiltro(this);" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="OcultarFiltro(true, this);" id="labelOcultarFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');
    });
};

            </script>
      </asp:Content>
    