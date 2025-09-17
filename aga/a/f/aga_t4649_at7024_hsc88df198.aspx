<%@ Page Title="Roteiros de manutenções preventivas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Roteiros de manutenções preventivas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_PARTEMANUTENCAOPREVENTIVA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_PARTES__ROTEIROS_MANUTENCAO_PREVENTIVA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7020" class="active"><a data-toggle="tab" href="#tabWIDGET_7020"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aguardando gerar OS")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7021"><a data-toggle="tab" href="#tabWIDGET_7021"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Com OS gerada")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7473"><a data-toggle="tab" href="#tabWIDGET_7473"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de planos não cumpridos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7020">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7020" Title="Aguardando gerar OS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_MF_PLANOPREVENTIVO.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ROTEIROMANUTENCAO IN 
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZAPLANOPREVENTIVO = 'S')
AND A.ORDEMSERVICO IS NULL AND (A.CONJUNTOMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4637_at7020_hs5fe365c0.aspx" UserDefinedDisableRowSelection="False" PageId="MF_PARTES__ROTEIROS_MANUTENCAO_PREVENTIVA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7021">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7021" Title="Com OS gerada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_PLANOPREVENTIVO.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ROTEIROMANUTENCAO IN 
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZAPLANOPREVENTIVO = 'S')
AND (A.ORDEMSERVICO IS NOT NULL) AND (A.ORDEMSERVICO NOT IN (SELECT HANDLE FROM MF_ORDEMSERVICOS WHERE STATUS = 3)) AND (A.CONJUNTOMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4637_at7021_hsd17b3114.aspx" UserDefinedDisableRowSelection="False" PageId="MF_PARTES__ROTEIROS_MANUTENCAO_PREVENTIVA_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7473">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7473" Title="Histórico de planos não cumpridos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_HISTORICOPLANONAOEXECUTADO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="UTILIZAPLANOPREVENTIVO = 'S'" FormUrl="~/aga/a/f/aga_t5148_at7473_hsbf5cbea5.aspx" UserDefinedDisableRowSelection="False" PageId="MF_PARTES__ROTEIROS_MANUTENCAO_PREVENTIVA_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    