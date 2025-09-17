<%@ Page Title="Lan&ccedil;amentos tesouraria" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Financeiro.Tesouraria.LancamentosTesouraria, Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">        
        <div class="portlet light">        
          <div>
            <wes:AjaxForm runat="server" ID="LANAMENTOSTESOURARIACONTA" Title="Lan&ccedilamentos tesouraria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="VT_FN_TESOURARIA_GRID_SIMPLES_CONTA.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" Level="20" Order="20"  />
          </div>
          <div class="row">
            <wes:SimpleGrid runat="server" ID="LANAMENTOSTESOURARIA" Title="" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TS_LANCAMENTOS.CUSTOM.GRID" DefaultFilterName="Avancado" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCriteriaWhereClause="A.CONTATESOURARIA = @CAMPO(CONTA)" PageId="AGA_E_FINANCEIRO_TESOURARIA_CUSTOM_GRID" Level="20" Order="30"  />
          </div>
        </div>

        <script lang="javascript">	
            $(function (){
              $('#ctl00_Main_LANAMENTOSTESOURARIA .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn default" onclick="acaoVoltar()" id="labelVoltar"><i class="fa fa-chevron-circle-left"> </i> <input type="radio" id="toggleVoltar" name="toggleVoltar" value="" class="toggle"> Voltar </label><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');
              __doPostBack('ctl00$Main$LANAMENTOSTESOURARIA$FilterControl$FilterButton','');
            });
        
            var ocultarFiltro = () => {
                $("#ctl00_Main_LANAMENTOSTESOURARIA_FilterControl_FilterContainer").hide();
            };

            var exibirFiltro = () =>  {
                $("#ctl00_Main_LANAMENTOSTESOURARIA_FilterControl_FilterContainer").show();
            };

            const ProcessarVisibilidadeFiltro = () => {
              if ($('#EstadoFiltro').val() == "oculto")
                ocultarFiltro();
            };

            var acaoVoltar = () => {
              let searchParams = new URLSearchParams(window.location.search);
              if ((searchParams.has('date')) && (searchParams.has('type'))) {
                let paramDate = searchParams.get('date');
                let paramType = searchParams.get('type');
                window.location.replace(Benner.Page.getApplicationPath() + "PortalInterno/e/Tesouraria/ConsultarSaldosBancarios.aspx?i=PIFINCONSALDOSBANC&m=MAIN&date=" + paramDate + "&type=" + paramType);
              }
              else
                window.location.replace(Benner.Page.getApplicationPath() + "PortalInterno/e/Tesouraria/ConsultarSaldosBancarios.aspx?i=PIFINCONSALDOSBANC&m=MAIN");
            };

            const SetarValoresTiles = () => {
                var jsonValoresTiles = JSON.parse($("#JsonValoresTiles").val());

                $("#tileSaldoAnterior .details .number").text("R$ " + jsonValoresTiles.SaldoAnterior);
                $("#tileDebitos .details .number").text("R$ " + jsonValoresTiles.Debitos);
                $("#tileCreditos .details .number").text("R$ " + jsonValoresTiles.Creditos);
                $("#tileSaldoAtual .details .number").text("R$ " + jsonValoresTiles.SaldoAtual);

                $("#tileSaldoAnterior .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.SaldoAnterior) >= 0 ? "blue" : "red", true);
                $("#tileDebitos .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.Debitos) >= 0 ? "blue" : "red", true);
                $("#tileCreditos .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.Creditos) >= 0 ? "blue" : "red", true);
                $("#tileSaldoAtual .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.SaldoAtual) >= 0 ? "blue" : "red", true);

                $("#tileSaldoAnterior .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.SaldoAnterior) >= 0 ? "red" : "blue", false);
                $("#tileDebitos .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.Debitos) >= 0 ? "red" : "blue", false);
                $("#tileCreditos .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.Creditos) >= 0 ? "red" : "blue", false);
                $("#tileSaldoAtual .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.SaldoAtual) >= 0 ? "blue" : "red", true);
            };
        </script>
    
      </asp:Content>
    