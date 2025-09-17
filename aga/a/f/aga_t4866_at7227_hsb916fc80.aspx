<%@ Page Title="Documentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_TR_DECEXPINDIRETADOCUMENTOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TR_DECEXPINDIRETADOCUMENTOS__TR_DECEXPINDIRETADOCUMENTOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7226" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_DECEXPINDIRETAITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ITEMSPED IN ( SELECT ITEM.HANDLE 
                  FROM ED_DOCUMENTOITENS ITEM
                  JOIN TR_DECEXPINDIRETADOCUMENTOS DOCUMENTO
                    ON DOCUMENTO.DOCUMENTO = ITEM.DOCUMENTOORIGEM
                 WHERE DOCUMENTO.HANDLE = @RASTRO(TR_DECEXPINDIRETADOCUMENTOS) ) AND (A.DECEXPINDIRETADOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4868_at7226_hs3b673bbe.aspx" UserDefinedDisableRowSelection="False" PageId="TR_DECEXPINDIRETADOCUMENTOS__TR_DECEXPINDIRETADOCUMENTOS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7225" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_DECEXPINDIRETAITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ITEMCORPORATIVO IN ( SELECT ITEM.HANDLE 
                         FROM CM_ITENS ITEM
                         JOIN TR_DECEXPINDIRETADOCUMENTOS DOCUMENTO
                           ON DOCUMENTO.DOCUMENTO = ITEM.DOCUMENTO
                        WHERE DOCUMENTO.HANDLE = @RASTRO(TR_DECEXPINDIRETADOCUMENTOS) ) AND (A.DECEXPINDIRETADOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4868_at7225_hs3f6b664b.aspx" UserDefinedDisableRowSelection="False" PageId="TR_DECEXPINDIRETADOCUMENTOS__TR_DECEXPINDIRETADOCUMENTOS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    