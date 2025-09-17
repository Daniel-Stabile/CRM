<%@ Page Title="Gerador de cubos - Grupos de cubos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Gerador de cubos - Grupos de cubos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_Z_CUBOAGRUPAMENTOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ADM_CUBOS__AGRUPAMENTOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3018" Title="Cubos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_Z_AGRUPAMENTOCUBOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CUBO IN(SELECT X.HANDLE FROM Z_CUBOS X WHERE X.ACESSORESTRITO &lt;&gt; 'S' OR X.HANDLE IN(SELECT Z.CUBO FROM Z_CUBOUSUARIOS Z WHERE Z.USUARIO = @USUARIO))) AND (A.AGRUPAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2295_at3018_hs7d775b06.aspx" UserDefinedDisableRowSelection="False" PageId="ADM_CUBOS__AGRUPAMENTOS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    