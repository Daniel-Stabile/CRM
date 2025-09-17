<%@ Page Title="Indicadores" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.IndicadoresObjetivo" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="INDICADOR" Title="Indicador" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_OBJETIVOINDICADORES.OBJETIVO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GP_OBJETIVOINDICADORES_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PONTOSDECONTROLE" class="active"><a data-toggle="tab" href="#tabPONTOSDECONTROLE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pontos de Controle")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ATRIBUTOSINDICADORES"><a data-toggle="tab" href="#tabATRIBUTOSINDICADORES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atributos Indicadores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="USURIOSMEDIO"><a data-toggle="tab" href="#tabUSURIOSMEDIO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Usuários Medição")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPONTOSDECONTROLE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PONTOSDECONTROLE" Title="Pontos de Controle" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INDICADOR" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_INDICADORPONTOSCONTROLE.OBJETIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Indicadores/PontosDeControleForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVOINDICADORES_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabATRIBUTOSINDICADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ATRIBUTOSINDICADORES" Title="Atributos Indicadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INDICADOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_INDICADORATRIBUTOS.OBJETIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Indicadores/AtributoIndicadoresForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVOINDICADORES_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INDICADOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOANEXOS.INDICADOROBJETIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE) AND A.OBJETIVO = @CAMPO(OBJETIVO)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Indicadores/AnexosForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVOINDICADORES_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabUSURIOSMEDIO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="USURIOSMEDIO" Title="Usuários Medição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INDICADOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_INDICADORUSUARIOSMEDICAO.INDICADORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Indicadores/UsuarioMedicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVOINDICADORES_FORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    