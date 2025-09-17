<%@ Page Title="Conjuntos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Conjuntos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_RECURSOPARTES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ALMOXARIFADOS_FROTAS__CONJUNTOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3931" class="active"><a data-toggle="tab" href="#tabWIDGET_3931"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de desgastes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3926"><a data-toggle="tab" href="#tabWIDGET_3926"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de localizações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7084"><a data-toggle="tab" href="#tabWIDGET_7084"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de manutenções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7025"><a data-toggle="tab" href="#tabWIDGET_7025"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de lubrificações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7024"><a data-toggle="tab" href="#tabWIDGET_7024"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de manutenções preventivas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3931">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3931" Title="Histórico de desgastes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="AGA_MF_PARTEDESGASTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2617_at3931_hs33cda74d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS_FROTAS__CONJUNTOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3926">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3926" Title="Histórico de localizações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_MF_HISTORICOLOCACAOPARTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2623_at3926_hs7c33e6f3.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS_FROTAS__CONJUNTOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7084">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7084" Title="Histórico de manutenções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_MF_ORDEMSERVICOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT ORDEMSERVICO FROM MF_ORDEMPRODUTOINTERNOS WHERE CONJUNTO = @RASTRO(MA_RECURSOPARTES))
OR A.HANDLE IN (SELECT ORDEMSERVICO FROM MF_ORDEMSERVICOPRODUTOS WHERE PARTE  = @RASTRO(MA_RECURSOPARTES))
OR A.HANDLE IN (SELECT ORDEMSERVICO FROM MF_ORDEMSERVICOINTERNOS WHERE CONJUNTO =  @RASTRO(MA_RECURSOPARTES))" FormUrl="~/aga/a/f/aga_t2619_at7084_hs30313909.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS_FROTAS__CONJUNTOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7025">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7025" Title="Roteiros de lubrificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_PARTEMANUTENCAOPREVENTIVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.MANUTENCAO IN
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARPLANOLUBRIFICACAO = 'S') AND (A.CONJUNTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4649_at7025_hsc74536.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS_FROTAS__CONJUNTOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7024">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7024" Title="Roteiros de manutenções preventivas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_PARTEMANUTENCAOPREVENTIVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.MANUTENCAO IN
(SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZAPLANOPREVENTIVO= 'S') AND (A.CONJUNTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4649_at7024_hsc88df198.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS_FROTAS__CONJUNTOS_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    