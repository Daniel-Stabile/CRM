<%@ Page Title="Detalhamento Centro de Manutenção" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CENTRODEMANUTENO" Title="Centro de Manutenção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MA_FORMCENTROSMANUTENCAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_A_TABELASAUXILIARES_CENTROMANUTENCAO_FORM" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              /*$(document).ready(function () {
    $("#COMPLEMENTOBORRACHARIA").hide();
    $("#ABASTECIMENTO").hide();
    
    if (typeof document.getElementById('ctl00_Main_CENTRODEMANUTENO_PageControl_GERAL_GERAL_TIPODESTINO') == 'undefined') {
        mostraComplementosConsulta();
        
    } else {
        mostraComplementos();
    }
});


function mostraComplementos() {
    $("#COMPLEMENTOBORRACHARIA").hide();
    $("#ABASTECIMENTO").hide();
    
    var destino = $('#ctl00_Main_CENTRODEMANUTENO_PageControl_GERAL_GERAL_TIPODESTINOselect').val();
    
    console.log(destino);

    if (destino == 1) {
        $("#ABASTECIMENTO").show();
    } else if (destino == 2 || destino == 3) {
        console.log("entrou no if");
        $("#COMPLEMENTOBORRACHARIA").show();
    }
}

function mostraComplementosConsulta() {
    console.log('consulta');
    
    var campoDestino = document.getElementById('ctl00_Main_CENTRODEMANUTENO_PageControl_GERAL_GERAL_TIPODESTINO');
    var destino = campoDestino.value;
    
    if (destino == "Abastecimento") {
        document.getElementById('COMPLEMENTOBORRACHARIA').style.display = "none";
        document.getElementById('ABASTECIMENTO').style.display = "block";
    } else if (destino == "Borracharia" || destino == "Manutenção Frotas") {
        document.getElementById('COMPLEMENTOBORRACHARIA').style.display = "block";
        document.getElementById('ABASTECIMENTO').style.display = "none";
    }
}
*/



              </script>
      </asp:Content>
    