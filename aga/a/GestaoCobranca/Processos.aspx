<%@ Page Title="Processos de cobrança" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoCobranca.Processos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PROCESSOSDECOBRANA" Title="Processos de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="GC_PROCESSOSCOBRANCA.CADASTROS.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/GestaoCobranca/Processo.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="GESTAO_COBRANCA_PROCESSOS" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(function(){
    $("#ctl00_Main_PROCESSOSDECOBRANA_FilterControl_GERAL > div > label > div > div").text("Data");

    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function (s, e) {
        $("#ctl00_Main_PROCESSOSDECOBRANA_FilterControl_GERAL > div > label > div > div").text("Data");
    });
});


$(function (){$('#ctl00_Main_PROCESSOSDECOBRANA .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" style="border-radius: 10px!important;margin: 0 7px 0 0!important;" onclick="exibirFiltro();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="ocultarFiltro(true);" style="border-radius: 10px!important;" id="labelOcultarFiltroFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');
$("#ctl00_Main_PROCESSOSDECOBRANA_FilterControl").hide();
});

var ocultarFiltro = () => {
	$("#ctl00_Main_PROCESSOSDECOBRANA_FilterControl").hide();
};

var exibirFiltro = () =>  {
	$("#ctl00_Main_PROCESSOSDECOBRANA_FilterControl").show();
}
              </script>
      </asp:Content>
    