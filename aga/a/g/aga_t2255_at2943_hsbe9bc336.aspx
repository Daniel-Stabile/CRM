<%@ Page Title="Em aprovação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Em aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CN_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 2) AND (A.TIPO=1)" FormUrl="~/aga/a/f/aga_t2255_at2943_hsbe9bc336.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__EMAPROVACAO_GRID" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="EMAPROVACAO" Title="Em aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_REQUISICOES.EMAPROVACAO.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 2) AND (A.TIPO=1)" FormUrl="~/aga/a/f/aga_t2255_at2943_hsbe9bc336.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__EMAPROVACAO_GRID" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    