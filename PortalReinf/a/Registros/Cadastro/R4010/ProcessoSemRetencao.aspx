<%@ Page Title="Informações de Processos Relacionados a não Retenção de Tributos ou a Depósitos Judiciais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOS" Title="Informações de Processos Relacionados a não Retenção de Tributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010PROCESSOSEMRETENCAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4010_PROCESSOSEMRETENCAO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="DETALHAMENTODASDEDUESCOMEXIGIBILIDADESUSPENSA" Title="Detalhamento das Deduções com Exigibilidade Suspensa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010DEDUCOESSUSPENSA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010PROCESSOSEMRETENCAO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/DeducoesSuspensa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_PROCESSOSEMRETENCAO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    