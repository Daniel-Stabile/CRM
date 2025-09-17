<%@ Page Title="Informações relativas às deduções do rendimento tributável" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INFORMAESRELATIVASSDEDUESDORENDIMENTOTRIBUTVEL" Title="Informações relativas às deduções do rendimento tributável" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010RENDIMENTTRIBUTAVEL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4010_RENDIMENTOTRIBUTAVEL" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="INFORMAODOSDEPENDENTESEBENEFICIRIOSDAPENSOALIMENTCIA" Title="Informação dos Dependentes e Beneficiários da Pensão Alimentícia" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INFORMAESRELATIVASSDEDUESDORENDIMENTOTRIBUTVEL" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010PENSAOALIMENTICIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010RENDIMENTTRIBUTAVEL = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/PensaoAlimenticia.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_RENDIMENTOTRIBUTAVEL" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    