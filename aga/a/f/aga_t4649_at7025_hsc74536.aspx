<%@ Page Title="Roteiros de lubrificações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Roteiros de lubrificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_PARTEMANUTENCAOPREVENTIVA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_PARTES__ROTEIROS_DE_LUBRIFICACOES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7018" class="active"><a data-toggle="tab" href="#tabWIDGET_7018"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aguardando gerar OS")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7019"><a data-toggle="tab" href="#tabWIDGET_7019"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Com OS gerada")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7474"><a data-toggle="tab" href="#tabWIDGET_7474"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de planos não cumpridos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7018">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7018" Title="Aguardando gerar OS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_MF_PLANOPREVENTIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ROTEIROMANUTENCAO IN 
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARPLANOLUBRIFICACAO = 'S') AND A.ORDEMSERVICO IS NULL AND (A.CONJUNTOMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4637_at7018_hsbce06bfb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_PARTES__ROTEIROS_DE_LUBRIFICACOES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7019">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7019" Title="Com OS gerada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_MF_PLANOPREVENTIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ROTEIROMANUTENCAO IN 
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARPLANOLUBRIFICACAO = 'S') AND (A.ORDEMSERVICO IS NOT NULL) AND (A.ORDEMSERVICO NOT IN (SELECT HANDLE FROM MF_ORDEMSERVICOS WHERE STATUS = 3)) AND (A.CONJUNTOMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4637_at7019_hs3be1130a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_PARTES__ROTEIROS_DE_LUBRIFICACOES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7474">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7474" Title="Histórico de planos não cumpridos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_MF_HISTORICOPLANONAOEXECUTADO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="UTILIZAPLANOLUBRIFICACAO = 'S'" FormUrl="~/aga/a/f/aga_t5148_at7474_hs504d28dc.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_PARTES__ROTEIROS_DE_LUBRIFICACOES_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    