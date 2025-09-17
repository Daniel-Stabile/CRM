<%@ Page Title="Devoluções" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PESSOA" Title="Pessoa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.INVISIVEL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="VISUALIZARDEVOLUCOES_GRIDPAGE" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="DEVOLUES" Title="Devoluções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PESSOA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="Q_TODASPARCELASDEV.DATASOURCE.GRID" DefaultFilterName="Padrão" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="VISUALIZARDEVOLUCOES_GRIDPAGE" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    