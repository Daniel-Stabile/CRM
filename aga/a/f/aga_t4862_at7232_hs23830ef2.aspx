<%@ Page Title="Documentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_TR_DECEXPDIRETADOCUMENTOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TR_DECEXPDIRETADOCUMENTO__TR_DECEXPDIRETADOCUMENTOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7231" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_DECEXPDIRETAITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ITEMSPED IN ( SELECT ITEM.HANDLE 
                         FROM ED_DOCUMENTOITENS ITEM
                         JOIN TR_DECEXPDIRETADOCUMENTOS DOCUMENTO
                           ON DOCUMENTO.DOCUMENTO = ITEM.DOCUMENTOORIGEM
                        WHERE DOCUMENTO.HANDLE = @RASTRO(TR_DECEXPDIRETADOCUMENTOS) ) AND (A.DECEXPDIRETADOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4864_at7231_hsf7f52a81.aspx" UserDefinedDisableRowSelection="False" PageId="TR_DECEXPDIRETADOCUMENTO__TR_DECEXPDIRETADOCUMENTOS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7230" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_DECEXPDIRETAITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ITEMCORPORATIVO IN ( SELECT ITEM.HANDLE 
                         FROM CM_ITENS ITEM
                         JOIN TR_DECEXPDIRETADOCUMENTOS DOCUMENTO
                           ON DOCUMENTO.DOCUMENTO = ITEM.DOCUMENTO
                        WHERE DOCUMENTO.HANDLE = @RASTRO(TR_DECEXPDIRETADOCUMENTOS) ) AND (A.DECEXPDIRETADOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4864_at7230_hse376db7f.aspx" UserDefinedDisableRowSelection="False" PageId="TR_DECEXPDIRETADOCUMENTO__TR_DECEXPDIRETADOCUMENTOS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    