<%@ Page Title="Ocorrências Parcelas Contas Receber" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PARCELASCONTASRECEBER" Title="Parcelas Contas Receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.OCORRENCIAPARCELAS.GRID" DefaultFilterName="Filtro CRE" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/financeiro/parcelas/OcorrenciasCRE.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_OCORRENCIA_PARCELASCRE" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="OCORRNCIAS" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PARCELASCONTASRECEBER" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_MOVIMENTACOES.OCORRENCIAPARCELAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO = 7" FormUrl="~/ERP/Financeiro/OcorrenciaParcelas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_OCORRENCIA_PARCELASCRE" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    