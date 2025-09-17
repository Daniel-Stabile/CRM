<%@ Page Title="Renovação" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.contratos.Renovacao.RenovacaoAditivoSoftware" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RENOVAO" Title="Renovação de contrato por aditivo de software" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATOOBJETO_RENOVACAO_SOFTWARE.GRID" DefaultFilterName="Filtro" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE = -1" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_CN_RENOVACAO_ADITIVO_SOFTWARE" Level="20" Order="10"  />
        </div>
    
        <style>
              .dataEditavelGrid {
    min-width: 120px;
}

              </style>
      </asp:Content>
    