<%@ Page Title="Portal de compras - Publicação de arquivos/manuais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Portal de compras - Publicação de arquivos/manuais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_PUBLICACAOARQUIVOSWEB.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CP_WEB_PORTALCOMPRAS__GNPUBLICACAOARQUIVOSWEBCOMPRAS_FORM" Level="20" Order="1"  />
        <wes:EditableGrid runat="server" ID="FORNECEDORESVLIDOS" Title="Fornecedores válidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PUBLICACAOARQUIVOFORNECEDOR_FORNECEDORESVALIDOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" PageId="CP_WEB_PORTALCOMPRAS__GNPUBLICACAOARQUIVOSWEBCOMPRAS_FORM" Level="20" Order="2"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7519" Title="Download de arquivos/manuais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_GN_PUBLICACAOARQUIVODOWNLOAD.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ARQUIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4948_at7519_hs17d49ce7.aspx" UserDefinedDisableRowSelection="False" PageId="CP_WEB_PORTALCOMPRAS__GNPUBLICACAOARQUIVOSWEBCOMPRAS_FORM" Level="20" Order="3"  />
        </div>
    
      </asp:Content>
    