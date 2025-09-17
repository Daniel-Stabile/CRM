<%@ Page Title="R-4020 - Pagamentos/Créditos a Beneficiário Pessoa Jurídica" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.PortalReinf.a.Registro.Cadastro.CadastroR4020Page" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="R4020PAGAMENTOSCRDITOSABENEFICIRIOPESSOAJURDICA" Title="R-4020 - Pagamentos/Créditos a Beneficiário Pessoa Jurídica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4020.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4020_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="IDENTIFICAODORENDIMENTO" Title="Identificação do rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="R4020PAGAMENTOSCRDITOSABENEFICIRIOPESSOAJURDICA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_IDENTIFICACAORENDIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4020 =@CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4020/IdentificacaoRendimento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4020_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    