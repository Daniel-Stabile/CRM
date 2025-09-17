<%@ Page Title="Observações do documento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="OBSERVAESDODOCUMENTO" Title="Observações do documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOOBSERVACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_OBSERVACAO_OBSERVACOESDOCUMENTO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="OBSERVAESDODOCUMENTO_1" Title="Observações do documento" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="OBSERVAESDODOCUMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOOBSERVACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_OBSERVACAO_OBSERVACOESDOCUMENTO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              $(function () {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
	if (!pagina.get_isInAsyncPostBack()) {
	    pagina.add_endRequest(CriaSpanTexto);
		pagina.add_endRequest(AtualizaTexto);
	}
    
	AtualizaTexto();
});


function AtualizaTexto() {
if(typeof $('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val() !== "undefined"){
    $('#QtdCaracteres').text( $('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val().length + "/255");
        if($('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val().length > 255){
            $('#QtdCaracteres').addClass("text-danger");
        }
        if($('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val().length < 255){
            $('#QtdCaracteres').removeClass("text-danger");
        }
    }
    $('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').on('keyup', (e) => {
        $('#QtdCaracteres').text( $('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val().length + "/255");
        if($('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val().length > 255){
            $('#QtdCaracteres').addClass("text-danger");
        }
        if($('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val().length < 255){
            $('#QtdCaracteres').removeClass("text-danger");
        }
    });
}

function CriaSpanTexto(){
    if(typeof $('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL_OBSERVACAOCOMPLEMENTAR').val() !== "undefined"){
    $('#ctl00_Main_OBSERVAESDODOCUMENTO_1_PageControl_GERAL_GERAL:first-child').append("<span id='QtdCaracteres' class='float-right'>0/255<\span>");
    }
}

              </script>
        <style>
              .float-right{
    float: right;
}

              </style>
      </asp:Content>
    