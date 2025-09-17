<%@ Page Title="Arquivos texto - 03.04 - Itens merc. e serv. (E) terceiro" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Arquivos texto - 03.04 - Itens merc. e serv. (E) terceiro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IN_NOTASITENS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__ITENSMERCSERV_E_TERC_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6074" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_IN_IMPOSTOITEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3900_at6074_hs84c48a7.aspx" UserDefinedDisableRowSelection="False" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__ITENSMERCSERV_E_TERC_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    