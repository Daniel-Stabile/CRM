<%@ Page Title="Itens específicos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Itens específicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CM_ORDEMVENDAITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHESPECIFICO = 'S') AND (A.STATUS = 2) AND (A.PRODUTO IN (SELECT B.HANDLE FROM PD_PRODUTOS B WHERE B.TIPO=2))" FormUrl="~/aga/a/f/aga_t1944_at2616_hs7c163eb5.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PCP_PRODUCAO__ITENSESPECIFICOS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    