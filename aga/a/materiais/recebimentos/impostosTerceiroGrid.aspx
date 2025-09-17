<%@ Page Title="Retenção de terceiros" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.Recebimentos.ImpostosTerceirosPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="SELEODETERCEIROS" Title="Seleção de terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="FN_DOCIMPOSTOTERCEIROSTEMP.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE= @CAMPO(RETENCAO)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FN_DOCUMENTOIMPOSTOSTERCEIROS_GRID" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="EDITARTERCEIROS" Title="Editar terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="SELEODETERCEIROS" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="FN_DOCIMPOSTOTERCEIROSTEMP.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="FN_DOCUMENTOIMPOSTOSTERCEIROS_GRID" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    