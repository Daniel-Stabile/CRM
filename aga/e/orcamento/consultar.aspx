<%@ Page Title="Consultar orçamento" Language="C#" CodeFile="~/aga/e/orcamento/consultar.aspx.cs" Inherits="orcamentoconsultarPage" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
   <div class="row">
      <div id="app" class="col-md-12">
        <div id="navegadorNaoSuportado" class="note note-danger note-bordered" style="display: none;">
            <h3>Ops!</h3>
            <p>O navegador atual não tem suporte para acessar esta página e visualizar o relatório Gerenciais, recomendamos a utilização do Google Chrome.</p>
        </div>
        <div class="portlet light">
          <div class="portlet-title">
            <div class="caption">
              <span class="caption-subject font-green-sharp bold uppercase"> Consultar orçamento</span>
            </div>
            <div class="actions" style="display: none;">
              <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="Expandir/Fechar"> </a>
            </div>
          </div>
          <div class="portlet-body" style="height: auto;">
            <div class="">
              <orcamento-consulta 
                plano="<%= Plano %>" 
                versao-orcamento="<%= VersaoOrcamento %>" 
                data-inicio="<%= DataInicio %>"
                data-fim="<%= DataFim %>" />
            </div>
          </div>
        </div>	     
      </div>
   </div>
   <script src="../../../Content/apps/orcamento/consultar.js"></script>
   <script>  

    $(document).ready(function () {
        verificarSeBrowserEhSuportado();
        configuraData();
    });

    function configuraData() {
        $('.filtro-gerenciais-right-actions input[name="start"]').attr("readonly", "readonly").css("background-color", "white");
        $('.filtro-gerenciais-right-actions input[name="end"]').attr("readonly", "readonly").css("background-color", "white");
    }

    function verificarSeBrowserEhSuportado() {
        var ua = window.navigator.userAgent;
        var msie = ua.indexOf("MSIE ");

        if (!(msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)))
          $("#navegadorNaoSuportado").hide();
        else
          $("#navegadorNaoSuportado").show();

        return false;
    }
</script>
</asp:Content>