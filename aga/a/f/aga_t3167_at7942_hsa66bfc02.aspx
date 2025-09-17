<%@ Page Title="REG.D365: TOTALIZADORES PARCIAIS RED. Z" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="REG.D365: TOTALIZADORES PARCIAIS RED. Z" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_ECFREDUCAOZTOTAIS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_ABAIXO_D355_SAIDAS__REG_D365_SAIDAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7944" Title="REG.D370: COMPLEMENTO DOCS. INFORMADOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_ECFREDUCAOZTOTAISCOMP.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REDUCAOZTOTAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3198_at7944_hs288eaa56.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_ABAIXO_D355_SAIDAS__REG_D365_SAIDAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    