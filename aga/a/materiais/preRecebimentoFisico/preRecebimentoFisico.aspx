<%@ Page Title="Pré-recebimento físico" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.preRecebimentoFisico.PreRecebimentoFisicoGrid" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PRRECEBIMENTOFSICO" Title="Pré-recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CP_PRERECEBIMENTONFES.PRERECEBIMENTO.GRID" DefaultFilterName="Pré-recebimento físico" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FILIAL IN @FILIAIS" FormUrl="~/aga/a/materiais/preRecebimentoFisico/preRecebimentoFisicoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_PRERECEBIMENTOFISICO_PRERECEBIMENTOFISICO" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              const OcultarFiltro = (fadeOut, campo) => {
    var widget = $(campo).parents('.widget-body');
    var painelFiltro = widget.find('[id$="_FilterControl_FilterContainer"]');
    
    if (fadeOut)
        painelFiltro.fadeOut(500);
    else
        painelFiltro.hide();
    
    $('#EstadoFiltro').val("oculto");
    widget.find('#toggleOcultarFiltro').prop('checked', true);
    widget.find('#labelOcultarFiltro').addClass('active');
    widget.find('#labelExibirFiltro').removeClass('active');
};

const ExibirFiltro = (campo) => {
    $(campo).parents('.widget-body').find('.filter-search-form').fadeIn(500);
    $('#EstadoFiltro').val("visivel");
};

const ProcessarVisibilidadeFiltro = () => {
    InserirBotoesOcultarExibirFiltro();
    
    var fadeout = $('#OcultarComFadeout').val() == "true";
    
    if ($('#EstadoFiltro').val() == "oculto")
        OcultarFiltro(fadeout, $('#PRRECEBIMENTOFSICO').find('#labelOcultarFiltro'));  
            
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
        <style>
              .colunaArquivoXML {
    min-width: 120px;
}

.alert-request-confirmation p {
	white-space: pre-line;
}

              </style>
      </asp:Content>
    