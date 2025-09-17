<%@ Page Title="Consulta de parcelas" Language="C#" Inherits="PortalCliente.Financeiro.ParcelasPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WIDGETID_636120404664631900" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTAL_CLI_PARCELAS_CONSULTA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" DefaultFilterName="Em aberto" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO  IN (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.ABRANGENCIA IN('N','T') AND B.ENTRADASAIDA = 'S' AND B.EHPREVISAO = 'N' AND B.PESSOA IN (SELECT C.PESSOA FROM Z_GRUPOUSUARIOS C WHERE C.HANDLE = @USUARIO))" UserDefinedDisableRowSelection="False" PageId="PORTAL_CLI_PARCELAS_CONSULTA" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    