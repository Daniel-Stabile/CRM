<%@ Page Title="Textos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Texto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_MALADIRETA.CADASTRO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PARAMETROS_FINANCEIROS__MALADIRETA_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="LAYOUTS" Title="Layouts" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_MALADIRETALAYOUT.CADASTRO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.MALADIRETA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t1771_at4211_hs3a534aFF.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PARAMETROS_FINANCEIROS__MALADIRETA_FORM" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    