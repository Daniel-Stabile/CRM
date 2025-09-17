<%@ Page Title="Informações de Dependente do Plano de Saúde Coletivo Empresarial" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INFORMAESDEDEPENDENTEDOPLANODESADEEMPRESARIAL" Title="Informações de Dependente do Plano de Saúde Empresarial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010INFODEPENDENTEPLANO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4010_INFODEPENDENTEPLANO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="INFORMAODEREEMBOLSODODEPENDENTEDOPLANODESADEEMPRESARIAL" Title="Informação de Reembolso do Dependente do Plano de Saúde Empresarial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INFORMAESDEDEPENDENTEDOPLANODESADEEMPRESARIAL" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010INFOREEMBDEPENDENTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010INFODEPENDENTEPLANO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/InfoReembolsoDependente.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_INFODEPENDENTEPLANO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    