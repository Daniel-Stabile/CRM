<%@ Page Title="Documento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="DOCUMENTO" Title="Documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_SIMULACAODOCUMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_SIMULACAO_DOCUMENTOS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="LANAMENTOS" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_SIMULACAOLANCAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Contabil/Simulacao/Documentos/Lancamento/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_SIMULACAO_DOCUMENTOS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    