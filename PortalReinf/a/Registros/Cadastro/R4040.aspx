<%@ Page Title="R-4040 - Pagamentos/Créditos a Beneficiários Não Identificados" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.PortalReinf.a.Registro.Cadastro.CadastroR4040Page" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="R4040PAGAMENTOSCRDITOSABENEFICIRIOSNOIDENTIFICADOS" Title="R-4040 - Pagamentos/Créditos a Beneficiários não Identificados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4040.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4040_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="IDENTIFICAODANATUREZADORENDIMENTO" Title="Identificação da Natureza do Rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="R4040PAGAMENTOSCRDITOSABENEFICIRIOSNOIDENTIFICADOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_IDENTIFICACAORENDIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4040  = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4040/IdentificacaoRendimento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4040_FORM" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    