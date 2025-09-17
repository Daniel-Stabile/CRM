<%@ Page Title="Mútuos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Mútuos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CO_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.METODOCALCULO = 1 AND ((A.EMPRESA1 = @EMPRESA AND A.FILIAL1 IN @FILIAIS) OR (A.EMPRESA2 = @EMPRESA AND A.FILIAL2 IN @FILIAIS)) )" FormUrl="~/aga/a/f/aga_t1423_at1188_hs3d63fb6.aspx" UserDefinedDisableRowSelection="False" PageId="CO_PASTA_CONTRATOS__MUTUOS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    