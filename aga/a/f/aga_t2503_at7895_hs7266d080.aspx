<%@ Page Title="CPV" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="CPV" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CS_CPV.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_CS_CALCULOS__CPV_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7896" Title="Lançamentos da produção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CS_PRODUCAOAPONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ORDEMPRODUCAO IN(SELECT OP.HANDLE FROM PR_ORDENSPRODUCAO OP WHERE OP.VARIACAO = (SELECT V.VARIACAO FROM CS_CPV V WHERE V.HANDLE = @RASTRO(CS_CPV))) 
AND A.COMPETENCIA = (SELECT X.COMPETENCIA FROM CS_CALCULOS X WHERE X.HANDLE = @RASTRO(CS_CALCULOS))" FormUrl="~/aga/a/f/aga_t5410_at7896_hsb1b334d2.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_CS_CALCULOS__CPV_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    