<%@ Page Title="Segunda via Boletos" Language="C#" CodeFile="~/PortalCliente/e/Financeiro/SegundaViaBoletos.aspx.cs" Inherits="FinanceiroSegundaViaBoletosPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="SEGUNDAVIABOLETOS" Title="Segunda via boletos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTALCLIENTE_FN_PARCELAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO IN (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.ABRANGENCIA IN('N','T') AND B.ENTRADASAIDA = 'S' AND B.EHPREVISAO = 'N' AND B.PESSOA IN (SELECT C.PESSOA FROM Z_GRUPOUSUARIOS C WHERE C.HANDLE = @USUARIO))
AND ((A.VALOR - A.VALORESBAIXADOS) &gt; 0) AND (A.NUMEROBANCO IS NOT NULL)
" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALCLIENTE_A_FINANCEIRO_SEGUNDAVIABOLETOS" Level="20" Order="10"  />
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
    