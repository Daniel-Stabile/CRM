<%@ Page Title="Confirmar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Confirmar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_LL_LEILOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 1 AND A.LIBERADOCONFIRMACAO = 'S' AND ( (A.CONFIRMANTE = @USUARIO)  OR (@USUARIO IN (SELECT USUARIOAUTORIZADO
FROM CP_GRUPOALCADASUSUARIOS
 WHERE GRUPO = A.GRUPOASSINATURAS AND USUARIO = A.CONFIRMANTE) )))" FormUrl="~/aga/a/f/aga_t2187_at2759_hs1dd67138.aspx" UserDefinedDisableRowSelection="False" PageId="LL_PASTALEILOES__CONFIRMAR_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    