<%@ Page Title="F100 - Operações fiscais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMTR_F100AUTOMATICO" Title="F100 - Operações fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_F100AUTOMATICO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_G_TRF100AUTOMATICO_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="PROCESSOSREFERENCIADOS" Title="PROCESSOS REFERENCIADOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMTR_F100AUTOMATICO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_F100AUTOMATICOPROCESSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TRF100AUTOMATICO = @CAMPO(HANDLE)" FormUrl="~/Pages/TrF100AutomaticoProcessos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_G_TRF100AUTOMATICO_FORM" Level="20" Order="110"  />
        <wes:SimpleGrid runat="server" ID="CONTASCONTBEIS" Title="Contas Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMTR_F100AUTOMATICO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_F100AUTOMATICOCONTAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OPERACAOFISCALF100 = @CAMPO(HANDLE)" FormUrl="~/aga/a/tributos/contascontabeisform.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_G_TRF100AUTOMATICO_FORM" Level="20" Order="120"  />
        </div>
    
      </asp:Content>
    