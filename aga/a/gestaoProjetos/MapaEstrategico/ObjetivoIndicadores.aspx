<%@ Page Title="Indicadores" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.Indicadores" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="INDICADORES" Title="Indicadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_OBJETIVOINDICADORES.INDICADORES.GRID" DefaultFilterName="Indicadores" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_OBJETIVOINDICADORES" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="PONTOSDECONTROLE" Title="Pontos de Controle" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INDICADORES" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GP_INDICADORPONTOSCONTROLE.OBJETIVO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_OBJETIVOINDICADORES" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    
    $('#ctl00_Main_PONTOSDECONTROLE .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarLotes" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarGridRodadas()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');
    
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(processarVisibilidadeGridRodadas);
    }
    processarVisibilidadeGridRodadas();
});

const processarVisibilidadeGridRodadas = () => {
    if ($("#VisibilidadeGridRodadas").val() == "False")
        ocultarGridRodadas();
    else
        exibirGridRodadas();
};

const exibirGridRodadas = () => {
	$("#PONTOSDECONTROLE").fadeIn();
	$('#INDICADORES').removeClass('col-md-12');
	$('#INDICADORES').addClass('col-md-6');
	$("#VisibilidadeGridRodadas").val("True");
};

const ocultarGridRodadas = () => {
	$("#PONTOSDECONTROLE").hide();
	$('#INDICADORES').removeClass('col-md-6');
	$('#INDICADORES').addClass('col-md-12');
	$("#VisibilidadeGridRodadas").val("False");
};

              </script>
      </asp:Content>
    