<%@ Page Title="Informações após salvar lançamento" Language="C#" Inherits="aga.a.contabil.cadastros.ImplantacaoSaldo.ImplantacaoSaldoInformacoesLancamentoPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="LANAMENTO" Title="Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_LANCAMENTOS.IMPLSALDOS.APOSLANCAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO_INFORMACOESLANCAMENTO" Level="20" Order="5"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LANAMENTOSCENTROSDECUSTOS" class="active"><a data-toggle="tab" href="#tabLANAMENTOSCENTROSDECUSTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamentos centros de custos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORIGEMDOSALDOINICIALDACONTACONTBIL"><a data-toggle="tab" href="#tabORIGEMDOSALDOINICIALDACONTACONTBIL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Origem do Saldo Inicial da Conta Contábil")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabLANAMENTOSCENTROSDECUSTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LANAMENTOSCENTROSDECUSTOS" Title="Lançamentos centros de custos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LANAMENTO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOCC.IMPLSALDOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.LANCAMENTO = @CAMPO(HANDLE) AND A.DOCUMENTO = @CAMPO(DOCUMENTO))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO_INFORMACOESLANCAMENTO" Level="20" Order="10"  />
    <wes:AjaxForm runat="server" ID="LANAMENTOS" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LANAMENTOSCENTROSDECUSTOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOCC.IMPLSALDOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO_INFORMACOESLANCAMENTO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabORIGEMDOSALDOINICIALDACONTACONTBIL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ORIGEMDOSALDOINICIALDACONTACONTBIL" Title="Origem do Saldo Inicial da Conta Contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LANAMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_ORIGEMSALDOCONTA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.LANCAMENTO = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO_INFORMACOESLANCAMENTO" Level="20" Order="30"  />
    <wes:AjaxForm runat="server" ID="ORIGEMDOSALDOINICIAL" Title="Origem do saldo inicial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORIGEMDOSALDOINICIALDACONTACONTBIL" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_ORIGEMSALDOCONTA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO_INFORMACOESLANCAMENTO" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    