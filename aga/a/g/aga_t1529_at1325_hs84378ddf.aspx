<%@ Page Title="Ordens de compra - Cadastradas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Ordens de compra - Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.LIBERADA &lt;&gt; 'S' OR A.LIBERADA IS NULL) AND (A.STATUS=1 OR A.STATUS = 7) AND (A.USUARIOINCLUIU = @USUARIO))" FormUrl="~/aga/a/f/aga_t1529_at1325_hs84378ddf.aspx" UserDefinedDisableRowSelection="False" PageId="ORDENS_DE_COMPRA__CADASTRADAS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    