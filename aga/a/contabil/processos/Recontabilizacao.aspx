<%@ Page Title="Recontabilização" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTROSRECONTABILIZAO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_RECONTABILIZACAO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_RECONTABILIZACAO" Level="20" Order="10"  />
        <wes:ActionView runat="server" ID="MOVIMENTOSRECONTABILIZAR" Title="Movimentos a recontabilizar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTROSRECONTABILIZAO" ChromeState="Fixed" Controller="MovimentosRecontabilizar" Action="Movimento" PageId="AGA_A_CONTABIL_RECONTABILIZACAO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              $(function(){
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (!prm.get_isInAsyncPostBack()) {
    
        prm.add_endRequest(function (sender, args) {
            var tblResultados = $('#ctl00_Main_MOVIMENTOSRECONTABILIZAR_ctl04').find('table');
            if (tblResultados.length === 0) {
                ExibirMensagemErro(true);
            }
        });
    }
    
    var htmlMensagem = '<div id="ctl00_Main_BALANOPATRIMONIAL_1_MsgUser" class="alert alert-warning"><button class="close" data-dismiss="alert"></button><span id="ctl00_Main_BALANOPATRIMONIAL_1_MsgUser_message">{0}</span></div>'
    
    function ExibirMensagemErro(exibir){
        if (exibir) {
            $('#ctl00_Main_FILTROSRECONTABILIZAO_toolbar').after(htmlMensagem.replace('{0}', $('#ctl00_Main_MOVIMENTOSRECONTABILIZAR_ctl04')[0].innerText));
            
            $('#ctl00_Main_BALANOPATRIMONIAL_1_MsgUser').show();
            
            $('#ctl00_Main_MOVIMENTOSRECONTABILIZAR_ctl04')[0].innerText = '';
        }
        else{
            $('#ctl00_Main_BALANOPATRIMONIAL_1_MsgUser').hide();
        }
    }
    
    ExibirMensagemErro(false);
});

function RecontabilizarDocumentos() {
	var temCheckado = $('tbody td input:checkbox:checked', $('#tblDados')).length > 0;
	
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: Benner.Page.getApplicationPath() + 'MovimentosRecontabilizar/RecontabilizarDocumentos',
        data: { origem: parseFloat($('#ctl00_Main_FILTROSRECONTABILIZAO_PageControl_GERAL_GERAL_ORIGEMselect').val()) },
        cache: false,
        success: function (data) {
            if (data === true) {
                Benner.ModalMessage.alert('Sucesso!','Recontabilização executada com sucesso.', function(){});
            }
            else {
                Benner.ModalMessage.alert('Atenção!',data, function(){});
            }
        },
        error: function (xhr, textStatus, error) {
            console.log(error);
        },
        complete: function () {
        }
    });
}

              </script>
        <style>
              span.dtr-title {
    display: inline-block !important;
    min-width: 130px !important;
    font-weight: 400 !important;
    color: #333;
}
.dtr-data{color: #525E64;}
li{
    list-style-type: none !important;
    font-size: 12px!important;
    
}

#tblDados th{ width:auto!important}
#tblDados th, #tblDados td{font-size: 12px!important;}

              </style>
      </asp:Content>
    