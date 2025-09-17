<%@ Page Title="Exclusão de compensação" Language="C#" Inherits="aga.a.Financeiro.ExclusaoCompensacao,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="EXCLUSAOCOMPENSACAO" Title="Exclusão compensação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="EXCLUSAOCOMPENSACAO.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_COMPENSACOES_EXCLUSAO" Level="20" Order="10"  />
        </div>
    
        <style>
              #ctl00_Main_EXCLUSAOCOMPENSACAO_FilterActionsCol{
    padding-top: 24px;
}

              </style>
      </asp:Content>
    