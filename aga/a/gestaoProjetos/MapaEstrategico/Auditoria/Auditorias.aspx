<%@ Page Title="Auditorias" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GP_PLANEJAMENTOAUDITORIA.GRID" DefaultFilterName="Filtro Auditoria" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Auditoria/AuditoriaDetalhamento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_AUDITORIAS" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    $('#ctl00_Main_AUDITORIA .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltroAuditoria"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" class="toggle"> Exibir filtro </label><label style="margin-left: 3px;" class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroAuditoria"><input type="radio" id="toggleOcultarFiltroAuditoria" name="toggleFiltro" class="toggle"> Ocultar filtro </label></div>');

    var pagina = Sys.WebForms.PageRequestManager.getInstance();

    if (!pagina.get_isInAsyncPostBack()) {
        pagina.add_endRequest(processarVisibilidadeFiltro);
    }

    processarVisibilidadeFiltro();
});

const ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_AUDITORIA_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_AUDITORIA_FilterControl_FilterContainer').hide();

    $('#toggleOcultarFiltroAUDITORIA').prop('checked', true);
    $('#labelOcultarFiltroAUDITORIA').addClass('active');
    $('#labelExibirFiltroAUDITORIA').removeClass('active');

    sessionStorage.setItem('TOGGLE_FILTRO_AUDITORIA', "Oculto");
};

const exibirFiltro = () => {
    $('#ctl00_Main_AUDITORIA_FilterControl_FilterContainer').fadeIn(500);
    sessionStorage.setItem('TOGGLE_FILTRO_AUDITORIA', "Visivel");
    $("#HasFilterApplied_AUDITORIA").val("False");
};

const processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_AUDITORIA');

    if (estadoFiltro === "Oculto" || $("#HasFilterApplied_AUDITORIA").val() == "True")
        ocultarFiltro();
};

              </script>
      </asp:Content>
    