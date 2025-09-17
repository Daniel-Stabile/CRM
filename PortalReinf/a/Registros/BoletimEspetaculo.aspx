<%@ Page Title="Boletim do Espetáculo Desportivo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="BOLETIMDOESPETCULODESPORTIVO" Title="Boletim do Espetáculo Desportivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_BOLETIMESPETACULO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_BOLETIMESPETACULO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECEITADAVENDADEINGRESSOS" class="active"><a data-toggle="tab" href="#tabRECEITADAVENDADEINGRESSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Receita da venda de ingressos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OUTRASRECEITASDOESPETCULO"><a data-toggle="tab" href="#tabOUTRASRECEITASDOESPETCULO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Outras receitas do espetáculo")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabRECEITADAVENDADEINGRESSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECEITADAVENDADEINGRESSOS" Title="Receita da venda de ingressos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BOLETIMDOESPETCULODESPORTIVO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_RECEITAINGRESSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BOLETIM = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/ReceitaIngressos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_BOLETIMESPETACULO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabOUTRASRECEITASDOESPETCULO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OUTRASRECEITASDOESPETCULO" Title="Outras receitas do espetáculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BOLETIMDOESPETCULODESPORTIVO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_OUTRASRECEITAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BOLETIM = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/OutrasReceitas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_BOLETIMESPETACULO" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    