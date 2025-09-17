<%@ Page Title="Ajustes" Language="C#" Inherits="AjustesGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="VERSO" Title="Versão Oficial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_VERSOESORCAMENTOS_OFICIAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT B.VERSAOPADRAOORCAMENTO FROM FN_PARAMETROS B WHERE B.EMPRESA = @EMPRESA )" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_AJUSTES_GRID" Level="20" Order="5"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AJUSTES" class="active"><a data-toggle="tab" href="#tabAJUSTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Todos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SUPLEMTAES"><a data-toggle="tab" href="#tabSUPLEMTAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Suplementações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REMANEJAMENTOS"><a data-toggle="tab" href="#tabREMANEJAMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Remanejamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIBERAES"><a data-toggle="tab" href="#tabLIBERAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liberações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANULAES"><a data-toggle="tab" href="#tabANULAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anulações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="BLOQUEIOS"><a data-toggle="tab" href="#tabBLOQUEIOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Bloqueios")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabAJUSTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AJUSTES" Title="Todos" Subtitle="ORÇAMENTÁRIOS" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES_VISAOGERAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/OrcamentoPublico/Ajustes/Visualizar.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_AJUSTES_GRID" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabSUPLEMTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SUPLEMTAES" Title="Suplementações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES_VISAOGERAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 4" FormUrl="~/aga/a/OrcamentoPublico/Ajustes/Visualizar.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_AJUSTES_GRID" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabREMANEJAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REMANEJAMENTOS" Title="Remanejamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES_VISAOGERAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 1" FormUrl="~/aga/a/OrcamentoPublico/Ajustes/Visualizar.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_AJUSTES_GRID" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabLIBERAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LIBERAES" Title="Liberações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES_VISAOGERAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 3" FormUrl="~/aga/a/OrcamentoPublico/Ajustes/Visualizar.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_AJUSTES_GRID" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabANULAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANULAES" Title="Anulações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES_VISAOGERAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 5" FormUrl="~/aga/a/OrcamentoPublico/Ajustes/Visualizar.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_AJUSTES_GRID" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabBLOQUEIOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="BLOQUEIOS" Title="Bloqueios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES_VISAOGERAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 2" FormUrl="~/aga/a/OrcamentoPublico/Ajustes/Visualizar.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_AJUSTES_GRID" Level="20" Order="60"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <style>
            .title-green {
    color: #303C8E !important;
}

.title-red {
      color: #AA1F2B !important;
}

            </style>
      </asp:Content>
    