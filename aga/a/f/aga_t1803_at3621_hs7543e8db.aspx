<%@ Page Title="Desclassificados - Fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Desclassificados - Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_PASTA_COMERCIAL_DESCLASSIFICADOS__FORNECEDORES_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3695" Title="Ítens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE NOT IN (SELECT AQUISICAOITEM FROM LC_AQUISICAOCOTACOESITEM WHERE PARTICIPANTE=@RASTRO(LC_AQUISICAOPARTICIPANTES) AND AQUISICAOITEM =A.HANDLE AND SELECIONADO = 'S')" FormUrl="~/aga/a/f/aga_t1801_at3695_hsb23fc84d.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_COMERCIAL_DESCLASSIFICADOS__FORNECEDORES_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    