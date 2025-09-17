<%@ Page Title="Requisições" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Requisições</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2618"><a data-toggle="tab" href="#tabWIDGET_2618">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1851"><a data-toggle="tab" href="#tabWIDGET_1851">Itens da requisição</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2057"><a data-toggle="tab" href="#tabWIDGET_2057">Itens da requisição</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2570"><a data-toggle="tab" href="#tabWIDGET_2570">Ocorrências nos ítens</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8352"><a data-toggle="tab" href="#tabWIDGET_8352">Termo de referência</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Requisições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="AGA_LC_REQUISICOES.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_DE_TIPOS_DE_REQUISICAO__REQUISICOES_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2618">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2618" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_REQUISICAOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2106_at2618_hs58a6abf8.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_TIPOS_DE_REQUISICAO__REQUISICOES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1851">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1851" Title="Itens da requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_REQUISICAOITENS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1795_at1851_hsd604ec21.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_TIPOS_DE_REQUISICAO__REQUISICOES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2057">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2057" Title="Itens da requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_REQUISICAOITENS.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1795_at2057_hs58282a27.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_TIPOS_DE_REQUISICAO__REQUISICOES_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2570">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2570" Title="Ocorrências nos ítens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLE IN (SELECT HANDLE FROM PD_STATUS WHERE HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'LC_REQUISICAOITENS') AND HANDLEREGISTROORIGEM IN (SELECT HANDLE FROM LC_REQUISICAOITENS WHERE REQUISICAO= @RASTRO(LC_REQUISICOES) ) AND DATAINCLUSAO &gt;= (SELECT DATA FROM LC_REQUISICOES WHERE HANDLE = @RASTRO(LC_REQUISICOES) )))" FormUrl="~/aga/a/f/aga_t1951_at2570_hsdecce62f.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_TIPOS_DE_REQUISICAO__REQUISICOES_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8352">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8352" Title="Termo de referência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_TR.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLE IN (SELECT TERMOREFERENCIA FROM LC_REQUISICOES WHERE HANDLE = @RASTRO(LC_REQUISICOES)))" FormUrl="~/aga/a/f/aga_t5780_at8352_hsfb9569b8.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_TIPOS_DE_REQUISICAO__REQUISICOES_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    