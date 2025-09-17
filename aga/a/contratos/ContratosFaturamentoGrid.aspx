<%@ Page Title="Contratos de faturamento" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.faturamento.AdicionarBadgesStatusFaturamento" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONTRATOSDEFATURAMENTO" Title="Contratos de faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOS_FATURAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="EXISTS(SELECT HANDLE FROM CN_TIPOSCONTRATOS T WHERE T.TIPO = 2 AND T.HANDLE = A.TIPOCONTRATO)" FormUrl="~/aga/a/contratos/ContratoFaturamentoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOSFATURAMENTO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    