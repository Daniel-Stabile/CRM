<%@ Page Title="Cadastradas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_QL_ORDENSINSPECAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=1) AND (A.TIPOORDEM = 1) AND (A.GRUPOINSPECAO IN (SELECT QL_GRUPOSINSPECAO.HANDLE FROM QL_GRUPOSINSPECAO WHERE QL_GRUPOSINSPECAO.HANDLE IN (SELECT QL_INSPECIONADORES.GRUPOINSPECAO FROM QL_INSPECIONADORES WHERE QL_INSPECIONADORES.USUARIO = @USUARIO)))" FormUrl="~/aga/a/f/aga_t2081_at4572_hscbca2dd9.aspx" UserDefinedDisableRowSelection="False" PageId="QL_ORDENSINSPECAO__MANUAIS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    