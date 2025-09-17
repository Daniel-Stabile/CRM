<%@ Page Title="Preview da nota" Language="C#" Inherits="aga.a.comercial.faturamento.PreviewnotaPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PREVIEWDANOTA" Title="Preview da nota" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.FATURAMENTO.PREVIEWNOTA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = 1605" UserDefinedCommandsVisible="True" PageId="COMERCIAL_PREVIEW_NOTA" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              function AtribuirDownloadXML(urlDestino) {
    var selector = document.querySelectorAll("[id$=CMD_XML]");
    if (selector.length > 0) {
        var el;
        for (el in selector) {
            el.attr('target', '_blank');
            el.href = urlDestino;
        }
    }
}

$(function(){
    if(ObterValorQueryString('c') === 'Emitida'){
        $('a[id*="CMD_EMITIR"]').hide();
    }
})

              </script>
      </asp:Content>
    