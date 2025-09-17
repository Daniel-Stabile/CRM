<%@ Page Title="Associar despesas de NDC" Language="C#" Inherits="aga.a.contratos.apontamento.AssociarNotasPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ASSOCIARDESPESASNDC" Title="Associar despesas NDC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="FN_LANCAMENTOSNDC.ASSOCIARDESPESAS.CUSTOM.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/contratos/apontamentos/AssociarDespesasNDCNovo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APONTAMENTOS_ASSOCIARDESPESASNDC" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    