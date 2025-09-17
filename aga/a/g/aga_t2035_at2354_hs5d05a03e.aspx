<%@ Page Title="Ativos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Ativos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'S'  AND A.ORIGINAL IS NULL AND A.STATUSCONTRATO = 2 AND A.RENEGOCIADO = 'N' AND TIPOREGISTRO = 1)" FormUrl="~/aga/a/f/aga_t2035_at2354_hs5d05a03e.aspx" UserDefinedDisableRowSelection="False" PageId="CM_PASTACONTRATOS__ATIVO_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    