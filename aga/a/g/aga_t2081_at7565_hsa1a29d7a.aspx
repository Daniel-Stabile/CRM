<%@ Page Title="Aprovadas condicional" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Aprovadas condicional" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_QL_ORDENSINSPECAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=6) AND (A.GRUPOINSPECAO IN (SELECT D.HANDLE FROM QL_GRUPOSINSPECAO D WHERE D.HANDLE IN (SELECT E.GRUPOINSPECAO FROM QL_INSPECIONADORES E WHERE E.USUARIO = @USUARIO)))" FormUrl="~/aga/a/f/aga_t2081_at7565_hsa1a29d7a.aspx" UserDefinedDisableRowSelection="False" PageId="QL_ORDENSINSPECAO__APROVADACONDICIONAL_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    