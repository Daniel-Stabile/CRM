<%@ Page Title="Comparação de propostas" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Suprimentos.cotacoes.ComparadorPropostas" %>  
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
  <div class="row">
    <div id="app" class="col-md-12">
      <div id="navegadorNaoSuportado" class="note note-danger note-bordered" style="display: none;">
        <h3>Ops!</h3>
        <p>O navegador atual não tem suporte para acessar esta página e visualizar a Comparação de Propostas, recomendamos a utilização do Google Chrome.</p>
      </div>
      <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <span class="caption-subject font-green-sharp bold uppercase">Comparação de propostas</span>
            </div>
        </div>
        <div class="portlet-body">
          <suprimentos-cotacoes-comparador-propostas></suprimentos-cotacoes-comparador-propostas>
        </div>
      </div>
      </div>
    </div>    
  </div>

  <script>        
    var app = new window.Vue({
        el: '#app',
        store: Benner.Corporativo.Suprimentos.Cotacoes.ComparadorPropostasStore
    });

    $(document).ready(function() {
        verificarSeBrowserEhSuportado();
        app.$store.commit('setDadosComparadorProposta', JSON.parse($("#JsonDataGridComparacaoPropostas").val()))
    });

    function verificarSeBrowserEhSuportado() {
        var ua =
            window.navigator.userAgent;
        var msie = ua.indexOf("MSIE ");
        if (!(msie > 0 ||
                !!navigator.userAgent.match(/Trident.*rv\:11\./)))
            $("#navegadorNaoSuportado").hide();
        else $("#navegadorNaoSuportado").show();
        return false;
    }
  </script>

</asp:Content>