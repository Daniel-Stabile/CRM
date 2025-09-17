<%@ Page Title="Estados da configuração de diferimento do ICMS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMTR_IMPOSTODIFERIMENTOICMSUF" Title="Estados da configuração de diferimento do ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_IMPOSTODIFERIMENTOICMSUF.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_DIFERIMENTOICMSUF_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="FAMLIADOPRODUTODACONFIGURAODEDIFERIMENTODOICMS" Title="Por família" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMTR_IMPOSTODIFERIMENTOICMSUF" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_IMPOSTODIFERIMENTOICMSFAM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.ESTADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/Tributos/Diferimento/DiferimentoICMSFamiliaProduto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_DIFERIMENTOICMSUF_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    