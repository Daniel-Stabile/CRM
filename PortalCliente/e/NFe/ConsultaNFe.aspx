<%@ Page Title="Consulta de notas fiscais" Language="C#" Inherits="PortalCliente.NFe.ConsultaNFePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="NOTASFISCAISELETRONICA" Title="Notas Fiscais Eletrônica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_CLI_DOCUMENTOSNFE.GRID" DefaultFilterName="Todos" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DOCUMENTO IN (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.PESSOA IN (SELECT C.PESSOA FROM Z_GRUPOUSUARIOS C WHERE C.HANDLE = @USUARIO) AND B.EMPRESA = @EMPRESA)" FormUrl="~/PortalCliente/e/NFe/DetalhesNFe.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CONSULTADENOTASFISCAIS" Level="20" Order="2"  />
        </div>
    
        <script type="text/javascript">
              function BaixarDANFE(handleDocumento) {
    var params = {
        handleDocumento
    }

    $.post(Benner.Page.getApplicationPath() + 'api/PortalCliente/BaixarDANFE', params)
        .done(function () {
            document.location.reload();
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
              </script>
      </asp:Content>
    