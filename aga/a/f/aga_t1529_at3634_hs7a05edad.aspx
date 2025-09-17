<%@ Page Title="Ordens de compra" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Ordens de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CP_ORDENSCOMPRA.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_VENCEDORES_OC__ORDENSCOMPRA_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3631" Title="Recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3 OR A.STATUS = 2 OR A.STATUS IS NULL) AND (A.ORDEMCOMPRA=@RASTRO(CP_ORDENSCOMPRA)) AND (A.ORDEMCOMPRA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1584_at3631_hsfeaccc88.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_VENCEDORES_OC__ORDENSCOMPRA_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    