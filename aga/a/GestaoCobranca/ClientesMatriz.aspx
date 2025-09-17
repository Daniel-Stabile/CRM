<%@ Page Title="Clientes" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoCobranca.MatrizCliente" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CLIENTES" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.CADASTRO_COBRANCA.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="GESTAO_COBRANCA_CLIENTES_MATRIZ_COBRANCA" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(function (){$('#ctl00_Main_CLIENTES .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" style="border-radius: 10px!important;margin: 0 7px 0 0!important;" onclick="exibirFiltro();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="ocultarFiltro(true);" style="border-radius: 10px!important;" id="labelOcultarFiltroFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');
});

var ocultarFiltro = () => {
	$("#ctl00_Main_CLIENTES_FilterControl").hide();
};

var exibirFiltro = () =>  {
	$("#ctl00_Main_CLIENTES_FilterControl").show();
}
              </script>
      </asp:Content>
    