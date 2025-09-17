<%@ Page Title="Ordens de compra - Alterar prazos de entrega" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.ordensCompra.AlterarPrazoEntrega" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ALTERAONOSPRAZOSDEENTREGAEMORDENSDECOMPRA" Title="Alterar prazo de entrega em ordens de compra" Subtitle="Informe a nova data, selecione as entregas a serem alteradas e clique no botão 'Confirmar' para aplicar o novo prazo." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-calendar-check-o" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CP_VTALTERARPRAZOENTREGAOC.NOVADATA.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_ALTERARPRAZOENTREGA" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="ENTREGAS" Title="ENTREGAS" Subtitle="Utilize os filtros abaixo para selecionar as entregas desejadas." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-list" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRAENTREGA.ALTERARPRAZOENTREGA.GRID" DefaultFilterName="Padrão" Mode="SelectableRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT ENTREGA.HANDLE FROM CP_ORDENSCOMPRAENTREGA ENTREGA
JOIN CP_ORDENSCOMPRAITENS ITEM ON ITEM.HANDLE = ENTREGA.ORDENSCOMPRAITENS
JOIN CP_ORDENSCOMPRA OC ON OC.HANDLE = ITEM.ORDEMCOMPRA
WHERE OC.STATUS IN (1, 2, 3))" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_ALTERARPRAZOENTREGA" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(function (){
    $('#ctl00_Main_ENTREGAS .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');
});

var ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_ENTREGAS_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_ENTREGAS_FilterControl_FilterContainer').hide();
    
    $('#toggleOcultarFiltro').prop('checked', true);
    $('#labelOcultarFiltroFiltro').addClass('active');
    $('#labelExibirFiltro').removeClass('active');
};

var exibirFiltro = () => $('#ctl00_Main_ENTREGAS_FilterControl_FilterContainer').fadeIn(500);

var processarVisibilidadeFiltro = () => {
    var visibilidadeFiltro = $("input[name='toggleFiltro']:checked").val();
    if (visibilidadeFiltro === "Oculto")
        ocultarFiltro();  
};

              </script>
      </asp:Content>
    