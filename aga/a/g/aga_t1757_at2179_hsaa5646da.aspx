<%@ Page Title="Ordens de venda - Todas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Ordens de venda - Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CM_ORDENSVENDA.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="( (A.USUARIOINCLUIU = @USUARIO)  OR ( (SELECT FILTRAUSUARIOOVINCLUIU FROM Z_GRUPOUSUARIOS WHERE HANDLE= @USUARIO) = 'N'))" FormUrl="~/aga/a/f/aga_t1757_at2179_hsaa5646da.aspx" UserDefinedDisableRowSelection="False" PageId="CM_PASTAORDENSVENDA__TODAS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    