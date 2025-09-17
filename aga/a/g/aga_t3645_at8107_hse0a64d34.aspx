<%@ Page Title="Tipos integrações - WS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Tipos integrações - WS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_ESTRUTURAINTEGRACAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPO IN (5, 6, 7, 8, 9, 20, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 38, 40)" FormUrl="~/aga/a/f/aga_t3645_at8107_hse0a64d34.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM_CARGA_INTEGRACOES__TIPOS_INTEGRACOES_WS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    