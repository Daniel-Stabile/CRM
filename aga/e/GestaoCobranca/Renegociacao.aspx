<%@ Page Title="Renegociação" Language="C#" CodeFile="~/aga/e/GestaoCobranca/Renegociacao.aspx.cs" Inherits="GestaoCobrancaRenegociacaoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PARMETROS" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="GC_SIMULACOES.AGENDA_WEB.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GESTAO_COBRANCA_RENEGOCIACAO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="TITULOS" Title="Títulos em renegociação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PARMETROS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.RENEGOCIACAO_COBRANCA_BANCARIA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (@CAMPO(PARCELASDARENEGOCIACAO))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAO_COBRANCA_RENEGOCIACAO" Level="20" Order="20"  />

        <div id="tiles_customizados" style="display:none">
	        <div class='col-lg-2 col-md-4 col-sm-4'>
	            <div class='form-group'>
		            <label class='control-label name column-nowrap'>
			            <div class='label-form'>
				        <div class='label-title' title='TOTALVENCIDO'> Total vencido</div>
			            </div>
		            </label>
		            <span data-field='TOTALVENCIDO' data-label='Total vencido' data-type='currency'>
			        <input readonly  name='tile_totalvencidos' type='text' value='0,00' id='tile_totalvencidos' class='form-control campoCorp auto-numeric tile_customizado' titlefieldname='TOTALVENCIDOS' data-a-sep='' data-a-dec=',' data-m-dec='2' data-v-min='-9999999999999.99' data-v-max='9999999999999.99'>
		            </span>
	            </div>
	        </div>
	        <div class='col-lg-2 col-md-4 col-sm-4'>
	            <div class='form-group'>
		            <label class='control-label name column-nowrap'>
			            <div class='label-form'>
				        <div class='label-title' title='MORA'> Juros mora</div>
			            </div>
		            </label>
		            <span data-field='MORA' data-label='Total vencido' data-type='currency'>
			        <input readonly  name='tile_MORA' type='text' value='0,00' id='tile_MORA' class='form-control campoCorp auto-numeric tile_customizado' titlefieldname='MORA' data-a-sep='' data-a-dec=',' data-m-dec='2' data-v-min='-9999999999999.99' data-v-max='9999999999999.99'>
		            </span>
	            </div>
	        </div>
	        <div class='col-lg-2 col-md-4 col-sm-4'>
	            <div class='form-group'>
		            <label class='control-label name column-nowrap'>
			            <div class='label-form'>
				        <div class='label-title' title='MULTA'> Multa</div>
			            </div>
		            </label>
		            <span data-field='MULTA' data-label='Total vencido' data-type='currency'>
			        <input readonly  name='tile_MULTAS' type='text' value='0,00' id='tile_MULTAS' class='form-control campoCorp auto-numeric tile_customizado' titlefieldname='MULTAS' data-a-sep='' data-a-dec=',' data-m-dec='2' data-v-min='-9999999999999.99' data-v-max='9999999999999.99'>
		            </span>
	            </div>
	        </div>
	        <div class='col-lg-2 col-md-4 col-sm-4'>
	            <div class='form-group'>
		            <label class='control-label name column-nowrap'>
			            <div class='label-form'>
				        <div class='label-title' title='JUROSFIN'> Juros fin.</div>
			            </div>
		            </label>
		            <span data-field='JUROSFIN' data-label='Total vencido' data-type='currency'>
			        <input readonly  name='tile_JUROSFIN' type='text' value='0,00' id='tile_JUROSFIN' class='form-control campoCorp auto-numeric tile_customizado' titlefieldname='JUROSFIN' data-a-sep='' data-a-dec=',' data-m-dec='2' data-v-min='-9999999999999.99' data-v-max='9999999999999.99'>
		            </span>
	            </div>
	        </div>
	        <div class='col-lg-2 col-md-4 col-sm-4'>
	            <div class='form-group'>
		            <label class='control-label name column-nowrap'>
			            <div class='label-form'>
				        <div class='label-title' title='VALORTOTAL'> Valor total</div>
			            </div>
		            </label>
		            <span data-field='VALORTOTAL' data-label='Total vencido' data-type='currency'>
			        <input readonly name='tile_VALORTOTAL' type='text' value='0,00' id='tile_VALORTOTAL' class='form-control campoCorp auto-numeric tile_customizado' titlefieldname='VALORTOTAL' data-a-sep='' data-a-dec=',' data-m-dec='2' data-v-min='-9999999999999.99' data-v-max='9999999999999.99'>
		            </span>
	            </div>
	        </div>
	        <div class='col-lg-2 col-md-4 col-sm-4'>
	            <div class='form-group'>
		            <label class='control-label name column-nowrap'>
			            <div class='label-form'>
				            <div class='label-title' title='VALORPARCELA'> Valor parcela</div>
			            </div>
		            </label>
		            <span data-field='VALORPARCELA' data-label='Total vencido' data-type='currency'>
			        <input readonly name='tile_VALORPARCELA' type='text' value='0,00' id='tile_VALORPARCELA' class='form-control campoCorp auto-numeric tile_customizado' titlefieldname='VALORPARCELA' data-a-sep='' data-a-dec=',' data-m-dec='2' data-v-min='-9999999999999.99' data-v-max='9999999999999.99'>
		            </span>
	            </div>
	        </div>
        </div>
        <wes:SimpleGrid runat="server" ID="PARCELASGERADAS" Title="Parcelas geradas" UserDefinedDisableRowSelection="true" UserDefinedPageSize="50"/>
    </div>
    
        <style>
            #ctl00_Main_PARMETROS_PageControl_GERAL_GERAL > div{
                display: grid;
                grid-template-columns: repeat(6, auto);
            }
            #ctl00_Main_PARMETROS_PageControl_GERAL_GERAL > div:nth-child(11n):before{
                content: " ";
            }
            #ctl00_Main_PARMETROS_PageControl_GERAL_GERAL > div:before{
                content: normal;
            }
            /*#ctl00_Main_PARMETROS_PageControl_GERAL_GERAL > div>div:first-child{
                grid-column-end: 3!important;
                grid-column-start: 1!important;
            }
            #ctl00_Main_PARMETROS_PageControl_GERAL_GERAL > div>div:nth-last-child(2) {
                width:50%!important;
            }*/
            #ctl00_Main_PARMETROS_PageControl_GERAL_GERAL > div div{
                width: 100%;
            }
            .label-form{
                display: flex;
            }
            #ctl00_Main_PARMETROS_toolbar a{
                display: none!important;
            }
            #field_CMD_GERARPARCELAS{
                border-radius: 10px!important;
                width: 100%;
            }
            .wes-invisible{
                display: none;
            }
            .wes-visible{
                display: unset!important;
            }
            #containerSimulacoes a{
                border-radius: 10px!important;
                margin-right: 5px;
            }
            #ctl00_Main_TITULOS_SimpleGrid  th{
                text-align: left;
            }
            #ctl00_Main_TITULOS_SimpleGrid  td{
                text-align: left;
            }
            .tile_customizado{
                border-radius: 10px!important;
            }
        </style>

        <script type="text/javascript">

            $(function () {
                criarBotoesSimulacao();
                var campos = $("#tiles_customizados");
                $("#tiles_customizados").remove();
                $("#portlet_PARCELASGERADAS > div.portlet-title").after(campos);
            })


            function fecharGridParcelas(mostarBotoes) {
                
                debugger;
                if(!document.querySelector("#portlet_TITULOS > div.portlet-title > div.tools > a").classList.contains('expand'))
                    document.querySelector("#portlet_TITULOS > div.portlet-title > div.tools > a").click();

                if (mostarBotoes) {
                    $(".wes-invisible").addClass("wes-visible");
                }
            }

            function esconderBotoes(efetivado) {
                criarBotoesSimulacao();
                $("#field_CMD_GERARPARCELAS").addClass("wes-invisible");
                if (!efetivado)
                    $("#field_CMD_EFETIVAR").removeClass("wes-invisible");
            }

            function criarBotoesSimulacao() {
                if($("#containerSimulacoes").length == 0)
                    $("#portlet_PARCELASGERADAS").append("<div id='containerSimulacoes'><div id='botoesSimulacao'><a id='field_CMD_CANCELAR' href='javascript:__doPostBack(\"ctl00$Main$PARMETROS\",\"Cancel\")' class='btn grey-silver btn-cancel command-action predef-action editable' title='Esc'>Cancelar</a><a id='field_CMD_SALVAR' href='javascript:__doPostBack(\"ctl00$Main$PARMETROS\",\"Save\")' class='btn blue btn-save command-action predef-action editable wes-invisible' title='Ctrl + Enter'>Salvar simulação</a><a id='field_CMD_EFETIVAR' class='btn command-action custom-action btn command-action blue wes-invisible' style='' href='javascript:__doPostBack(\"ctl00$Main$PARMETROS\",\"CMD_EFETIVAR\")'>Efetivar simulação</a></div></div>");
            }

        </script>
      </asp:Content>
    