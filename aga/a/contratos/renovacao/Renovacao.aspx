<%@ Page Title="Renovação" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.contratos.Renovacao.Renovacao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RENOVAO" Title="Renovação de contrato por cópia" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATORENOVACAO.GRID" DefaultFilterName="Filtro" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="True" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.HANDLE = -1" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_CONTRATOS_RENOVACAO" Level="20" Order="20"  />
        </div>
    
        <style>
              .dataEditavelGrid {
    min-width: 120px;
}

              </style>
      </asp:Content>
    