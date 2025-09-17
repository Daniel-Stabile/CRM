<%@ Page Title="Ciclos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.MapaEstrategico" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMGP_PLANEJAMENTOCICLOS" Title="Ciclo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOCICLOS.PLANEJAMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOCICLOS_FORM" Level="20" Order="100"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PONTOSDECONTROLE" class="active"><a data-toggle="tab" href="#tabPONTOSDECONTROLE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pontos de Controle")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ESCALAS"><a data-toggle="tab" href="#tabESCALAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Escalas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ATRIBUTOSINDICADORES"><a data-toggle="tab" href="#tabATRIBUTOSINDICADORES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atributos Indicadores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPONTOSDECONTROLE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PONTOSDECONTROLE" Title="Pontos de Controle" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMGP_PLANEJAMENTOCICLOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_CICLOPONTOSCONTROLE.PLANEJAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CICLO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Ciclos/PontosControle.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOCICLOS_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabESCALAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ESCALAS" Title="Escalas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMGP_PLANEJAMENTOCICLOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_CICLOESCALAS.PLANEJAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CICLO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Ciclos/Escalas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOCICLOS_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabATRIBUTOSINDICADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ATRIBUTOSINDICADORES" Title="Atributos Indicadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMGP_PLANEJAMENTOCICLOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_CICLOATRIBUTOSINDICADORES.PLANEJAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CICLO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Cadastro/Ciclo/AtributoIndicador.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOCICLOS_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMGP_PLANEJAMENTOCICLOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOANEXOS.CICLOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CICLO= @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Ciclo/Anexo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOCICLOS_FORM" Level="20" Order="140"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    