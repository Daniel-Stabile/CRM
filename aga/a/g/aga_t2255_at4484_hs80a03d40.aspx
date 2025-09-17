<%@ Page Title="Cadastradas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_REQUISICOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.STATUS = 1) AND (A.TIPO=2))" FormUrl="~/aga/a/f/aga_t2255_at4484_hs80a03d40.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES_CONVENIOS__CADASTRADAS_GRID" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="CADASTRADAS" Title="Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_REQUISICOES.CADASTRAR.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.STATUS = 1) AND (A.TIPO=2))" FormUrl="~/aga/a/f/aga_t2255_at4484_hs80a03d40.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES_CONVENIOS__CADASTRADAS_GRID" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    