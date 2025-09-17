<%@ Page Title="Operação comercial" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Operação comercial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_OPERACOESFATURAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__OPERACOES_FATURAMENTO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7342" class="active"><a data-toggle="tab" href="#tabWIDGET_7342"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações Faturamento Diferimento ICMS")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7355"><a data-toggle="tab" href="#tabWIDGET_7355"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Consulta pública NFe")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OPERAESPADRES"><a data-toggle="tab" href="#tabOPERAESPADRES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Descrições padrões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TEXTOSPADRES"><a data-toggle="tab" href="#tabTEXTOSPADRES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Textos padrões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OPERAES"><a data-toggle="tab" href="#tabOPERAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OPERAESVLIDASITENS"><a data-toggle="tab" href="#tabOPERAESVLIDASITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações válidas itens")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7342">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7342" Title="Operações Faturamento Diferimento ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_OPERACOESFATURAMENTODIFICMS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OPERACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4994_at7342_hs3b46b3e4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__OPERACOES_FATURAMENTO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7355">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7355" Title="Consulta pública NFe" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_CONSULTANFE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OPERACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5010_at7355_hse490ccd4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__OPERACOES_FATURAMENTO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabOPERAESPADRES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OPERAESPADRES" Title="Descrições padrões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_OPERACAODESCRICOESPADROES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OPERACAOFATURAMENTO = @CAMPO(HANDLE))" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__OPERACOES_FATURAMENTO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabTEXTOSPADRES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="TEXTOSPADRES" Title="Textos padrões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_OPERACAOTEXTOSPADROES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OPERACAOFATURAMENTO = @CAMPO(HANDLE))" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__OPERACOES_FATURAMENTO_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabOPERAES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OPERAES" Title="Operações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_OPERACAODOCUMENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OPERACAOCOMERCIAL = @CAMPO(HANDLE))" ShowExport="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__OPERACOES_FATURAMENTO_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabOPERAESVLIDASITENS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OPERAESVLIDASITENS" Title="Operações válidas itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_OPERACAOITENS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OPERACAOCOMERCIAL = @CAMPO(HANDLE))" ShowExport="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__OPERACOES_FATURAMENTO_FORM" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    