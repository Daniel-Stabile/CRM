<%@ Page Title="Item Desmontagem" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMPR_ORDEMDESMONTAGEMITENS" Title="Item Desmontagem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMDESMONTAGEMITENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_PRODUCAO_ORDEMDESMONTAGEMITENS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMPR_ORDEMDESMONTAGEMITENS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMDESMONTAGEMITEMLOTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMDESMONTAGEMITEM = @CAMPO(HANDLE)" FormUrl="~/aga/a/producao/Ordemdesmontagemitemlotes/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_ORDEMDESMONTAGEMITENS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    