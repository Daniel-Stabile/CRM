<%@ Page Title="EFD - Contribuições - Majoração alíquota importação - COFINS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="EFD - Contribuições - Majoração alíquota importação - COFINS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_TR_PARAMETROSMAJORACAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ABAIXO_TABELAS_AUX_EFD_CONTRIB__MAJORACAOALIQUOTAIMPORTACAOCOFINS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6852" Title="Alíquotas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_TR_PARAMETROSMAJORACAOALIQUOTA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PARAMETROMAJORACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4594_at6852_hs687f9c65.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ABAIXO_TABELAS_AUX_EFD_CONTRIB__MAJORACAOALIQUOTAIMPORTACAOCOFINS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    