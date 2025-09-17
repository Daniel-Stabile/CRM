<%@ Page Title="R-4010 - Pagamentos/Créditos a Beneficiário Pessoa Física" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.PortalReinf.a.Registro.Cadastro.CadastroR4010Page" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R4010PAGAMENTOSCRDITOSABENEFICIRIOPESSOAFSICA" Title="R-4010 - Pagamentos/Créditos a Beneficiário Pessoa Física" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4010_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IDENTIFICAODORENDIMENTO" class="active"><a data-toggle="tab" href="#tabIDENTIFICAODORENDIMENTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Identificação do Rendimento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IDENTIFICAODOSDEPENDENTESDOBENEFICIRIO"><a data-toggle="tab" href="#tabIDENTIFICAODOSDEPENDENTESDOBENEFICIRIO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Identificação dos Dependentes do Beneficiário")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IDENTIFICAODAOPERADORADOPLANOPRIVADOEMPRESARIALDEASSISTNCIASADE"><a data-toggle="tab" href="#tabIDENTIFICAODAOPERADORADOPLANOPRIVADOEMPRESARIALDEASSISTNCIASADE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Identificação da Operadora do Plano Privado Empresarial de Assistência à Saúde")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabIDENTIFICAODORENDIMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IDENTIFICAODORENDIMENTO" Title="Identificação do Rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R4010PAGAMENTOSCRDITOSABENEFICIRIOPESSOAFSICA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_IDENTIFICACAORENDIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/IdentificacaoRendimento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabIDENTIFICAODOSDEPENDENTESDOBENEFICIRIO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IDENTIFICAODOSDEPENDENTESDOBENEFICIRIO" Title="Identificação dos Dependentes do Beneficiário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R4010PAGAMENTOSCRDITOSABENEFICIRIOPESSOAFSICA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010DEPENDENTEBENEF.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/DependenteBeneficiario.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabIDENTIFICAODAOPERADORADOPLANOPRIVADOEMPRESARIALDEASSISTNCIASADE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IDENTIFICAODAOPERADORADOPLANOPRIVADOEMPRESARIALDEASSISTNCIASADE" Title="Identificação da Operadora do Plano Privado Empresarial de Assistência à Saúde" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R4010PAGAMENTOSCRDITOSABENEFICIRIOPESSOAFSICA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010IDEPLANOSAUDE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010 = @CAMPO(HANDLE) " FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/IdePlanoSaude.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    