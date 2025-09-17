<%@ Page Title="Identificação do Rendimento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="IDENTIFICAODANATUREZADORENDIMENTO" Title="Identificação da Natureza do Rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_IDENTIFICACAORENDIMENTO_R4040_CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4040_IDENTIFICACAORENDIMENTO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="INFORMAESDEPAGAMENTOSABENEFICIRIOSNOIDENTIFICADOS" Title="Informações de Pagamentos a Beneficiários não Identificados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="IDENTIFICAODANATUREZADORENDIMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4040INFOPAGAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4040IDENTIFICACAORENDIMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4040/InfoPagamento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4040_IDENTIFICACAORENDIMENTO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    