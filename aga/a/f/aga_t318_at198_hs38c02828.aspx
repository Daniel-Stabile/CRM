<%@ Page Title="Tabelas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabela" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOTABELAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ADM_GRUPOS_DE_SEGURANCA__TABELAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_200" Title="Campos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOTABELACAMPOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.GRUPOTABELA = @CAMPO(HANDLE) AND A.GRUPO = @CAMPO(GRUPO) " FormUrl="~/aga/a/f/aga_t320_at200_hs2b2ca13b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM_GRUPOS_DE_SEGURANCA__TABELAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    