<%@ Page Title="Contas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL_ATIVO__CONTAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1075" class="active"><a data-toggle="tab" href="#tabWIDGET_1075"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operação Contábil")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1093"><a data-toggle="tab" href="#tabWIDGET_1093"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1097"><a data-toggle="tab" href="#tabWIDGET_1097"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totais do cálculo por conta")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1072"><a data-toggle="tab" href="#tabWIDGET_1072"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totais do cálculo por centro de custos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1075">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1075" Title="Operação Contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_OPERACAOCONTA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE)) AND 
( (
       CRITERIOCALCULO IN (SELECT HANDLE
                             FROM AT_CRITERIOSCALCULO
                            WHERE EMPRESA = @EMPRESA )
         AND  ( SELECT CRITERIOCALCULOPADRAO
                  FROM AT_PARAMETROS
                 WHERE EMPRESA = @EMPRESA) &gt; 0
)
 OR
   
   
(  OPERACAOCONTABIL IN  (
                SELECT HANDLE
                  FROM GN_OPERACOESCONTABEIS
                 WHERE ( SELECT COUNT(HANDLE)
                               FROM AT_PARAMETROS
                               WHERE EMPRESA = @EMPRESA
                               AND CRITERIOCALCULOPADRAO IS NOT NULL
                        ) = 0 
                   AND EMPRESA = @EMPRESAMESTRE(GN_OPERACOESCONTABEIS)
                        )

) )" FormUrl="~/aga/a/f/aga_t1350_at1075_hs7b4d5012.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL_ATIVO__CONTAS_FORM" Level="20" Order="5"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1093">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1093" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1255_at1093_hsd209a6d4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL_ATIVO__CONTAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1097">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1097" Title="Totais do cálculo por conta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_AT_CONTATOTAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1368_at1097_hs382fd481.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL_ATIVO__CONTAS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1072">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1072" Title="Totais do cálculo por centro de custos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_GRUPOTOTAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1346_at1072_hs8f441f1f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL_ATIVO__CONTAS_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    