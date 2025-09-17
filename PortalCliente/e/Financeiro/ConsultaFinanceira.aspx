<%@ Page Title="Títulos" Language="C#" Inherits="PortalCliente.Financeiro.ConsultaFinanceiraPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:HtmlPanel runat="server" ID="MESSAGEPANEL" Title="Message panel" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" HtmlBase64="PGRpdiBjbGFzcz0ibWVzc2FnZS1wYW5lbCIgaWQ9Im1lbnNhZ2VtT0siPgogICAgCjwvZGl2Pg==" PageId="PORTALCLIENTECONSULTADOCUMENTOS" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSDOCUMENTOSDEPAGAMENTO" Title="Documentos &gt;&gt; documentos de pagamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_CLI_FINANCEIRO_DOCUMENTOS.GRID" DefaultFilterName="Em aberto" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.ABRANGENCIA IN('N','T') AND A.ENTRADASAIDA = 'S' AND A.EHPREVISAO = 'N' AND A.PESSOA IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO) AND A.EMPRESA = @EMPRESA AND OPERACAOCANCELAMENTO IS NULL" FormUrl="~/PortalCliente/e/Financeiro/Documento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALCLIENTECONSULTADOCUMENTOS" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              function BaixarDANFE(handleDocumento) {
    var params = {
        handleDocumento
    }

    $.post(Benner.Page.getApplicationPath() + 'api/PortalCliente/BaixarDANFE', params)
        .done(function () {
            document.location.reload();
        })
        .fail(function () {
            CriarMensagemERRO();
        });
              }

            function BaixarXML(handleDocumento, campo) {    
    var params = {
        handleDocumento, campo
    }

    $.post(Benner.Page.getApplicationPath() + 'api/PortalCliente/BaixarXML', params)
        .done(function () {
            document.location.reload();
        });

}

function CriarMensagemOK() {
    $("#mensagemOK").append("<div id='ctl00_Main_FORMTS_LANCAMENTOS_MsgUser' class='alert alert-info'><button class='close' data-dismiss='alert'></button><span id='ctl00_Main_FORMTS_LANCAMENTOS_MsgUser_message'>A a&ccedil;&atilde;o foi executada</span></div>")
}
function CriarMensagemERRO() {
    $("#mensagemOK").append("<div id='ctl00_Main_FORMTS_LANCAMENTOS_MsgUser' class='alert alert-warning'><button class='close' data-dismiss='alert'></button><span id='ctl00_Main_FORMTS_LANCAMENTOS_MsgUser_message'>Ocorreu um problema ao enviar o e-mail.</span></div>")
}
              </script>
      </asp:Content>
    