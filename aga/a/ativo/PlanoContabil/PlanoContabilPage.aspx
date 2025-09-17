<%@ Page Title="Plano de Contas Contábil" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PLANOCONTASCONTABIL" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.IMOBILIZADO = 2" FormUrl="~/aga/a/Ativo/PlanoContabil/ContaForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ATIVO_PLANOCONTABIL_PLANOCONTABILPAGE" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="CONTACONTABILATIVO" Title="Conta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PLANOCONTASCONTABIL" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CT_CONTAS.ATIVO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_ATIVO_PLANOCONTABIL_PLANOCONTABILPAGE" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    