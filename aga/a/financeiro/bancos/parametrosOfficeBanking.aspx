<%@ Page Title="Parâmetros Office Banking" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="BANCO" Title="Parâmetros de home banking" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_BANCOS.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HOMEBANKINGFINALIDADES" class="active"><a data-toggle="tab" href="#tabHOMEBANKINGFINALIDADES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Finalidades")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HBCOBRANACARTEIRAS"><a data-toggle="tab" href="#tabHBCOBRANACARTEIRAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobrança - Carteiras")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HBCRTICASDERETORNO"><a data-toggle="tab" href="#tabHBCRTICASDERETORNO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobrança - Críticas de retorno")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HBCOBRANAESPCIE"><a data-toggle="tab" href="#tabHBCOBRANAESPCIE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobrança - Espécie")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HBCOBRANAFORMATOSCNAB"><a data-toggle="tab" href="#tabHBCOBRANAFORMATOSCNAB"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobrança - Formatos CNAB")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HBCOBRANAINSTRUES"><a data-toggle="tab" href="#tabHBCOBRANAINSTRUES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobrança - Instruções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HBCOBRANAOCORRNCIADEREMESSA"><a data-toggle="tab" href="#tabHBCOBRANAOCORRNCIADEREMESSA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobrança - Ocorrência de remessa")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HBCOBRANACRTICADERETORNO"><a data-toggle="tab" href="#tabHBCOBRANACRTICADERETORNO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobrança - Ocorrência de retorno")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabHOMEBANKINGFINALIDADES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HOMEBANKINGFINALIDADES" Title="Finalidades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBFINALIDADES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BANCO = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/bancos/homeBankingFinalidades.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabHBCOBRANACARTEIRAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HBCOBRANACARTEIRAS" Title="Cobrança - Carteiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_BANCOHBCARTEIRAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BANCO = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/CadastroHBCarteiras.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabHBCRTICASDERETORNO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HBCRTICASDERETORNO" Title="Cobrança - Críticas de retorno" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBCRITICASRETORNO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ENTIDADE = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/bancos/CadastroHBCriticasDeRetorno.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabHBCOBRANAESPCIE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HBCOBRANAESPCIE" Title="Cobrança - Espécie" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBESPECIETITULOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BANCO = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/bancos/CadastroHBEspecie.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabHBCOBRANAFORMATOSCNAB">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HBCOBRANAFORMATOSCNAB" Title="Cobrança - Formatos CNAB" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOTIPOARQUIVOCNAB.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BANCO = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/bancos/CadastroFormatosCNAB.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabHBCOBRANAINSTRUES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HBCOBRANAINSTRUES" Title="Cobrança - Instruções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBINSTRUCOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BANCO = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/bancos/CadastroHBInstrucoes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabHBCOBRANAOCORRNCIADEREMESSA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HBCOBRANAOCORRNCIADEREMESSA" Title="Cobrança - Ocorrência de remessa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBOCORRENCIASREMESSA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BANCO = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/bancos/CadastroHBOcorrenciaRemessa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabHBCOBRANACRTICADERETORNO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HBCOBRANACRTICADERETORNO" Title="Cobrança - Ocorrência de retorno" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BANCO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBOCORRENCIARETORNO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BANCO = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/bancos/CadastroHBOcorrenciaRetorno.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BANCOS_PARAMETROSOFFICEBANKING" Level="20" Order="90"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    