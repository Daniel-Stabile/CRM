<%@ Page Title="Operação fiscal" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="OPERAOFISCAL_1" Title="Complemento de operações fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCOPERACOESFISCAIS.OPERACAOFISCAL.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DOCUMENTOFINANCEIRO = @RASTRO(FN_DOCUMENTOS)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_OPERACAOFISCAL_OPERACAOFISCAL" Level="20" Order="20"  />
        <wes:AjaxForm runat="server" ID="OPERAOFISCAL" Title="Operação fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="OPERAOFISCAL_1" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCOPERACOESFISCAIS.OPERACAOFISCAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.DOCUMENTOFINANCEIRO = @RASTRO(FN_DOCUMENTOS)" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_OPERACAOFISCAL_OPERACAOFISCAL" Level="20" Order="40"  />
        </div>
    
      </asp:Content>
    