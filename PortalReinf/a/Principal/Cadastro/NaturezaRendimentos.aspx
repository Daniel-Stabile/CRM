<%@ Page Title="Natureza de Rendimentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="NATUREZADERENDIMENTOS" Title="Natureza de Rendimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_NATUREZASRENDIMENTOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_NATUREZARENDIMENTOS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="CDIGORECEITA" Title="Código de Receita" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NATUREZADERENDIMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_NATUREZASRENDIMENTOSCR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.NATUREZARENDIMENTO= @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Principal/Cadastro/CodigoReceita.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_NATUREZARENDIMENTOS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    