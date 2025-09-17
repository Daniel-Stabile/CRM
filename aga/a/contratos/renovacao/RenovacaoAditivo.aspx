<%@ Page Title="Renovação" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.contratos.Renovacao.RenovacaoAditivo" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RENOVAO" Title="Renovação de contrato por aditivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATORENOVACAO_ADITIVO.GRID" DefaultFilterName="Filtro" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE = -1" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_CONTRATOS_RENOVACAO_ADITIVO" Level="20" Order="20"  />
        </div>
    
        <style>
              .dataFimSugerido > * {
  width: 100px;
}

              </style>
      </asp:Content>
    