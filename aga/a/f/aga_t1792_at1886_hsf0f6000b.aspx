<%@ Page Title="Requisições" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Requisições</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2619"><a data-toggle="tab" href="#tabWIDGET_2619">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1858"><a data-toggle="tab" href="#tabWIDGET_1858">Itens Requisição</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3659"><a data-toggle="tab" href="#tabWIDGET_3659">Itens cancelados na aquisição</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2571"><a data-toggle="tab" href="#tabWIDGET_2571">Ocorrências nos ítens</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8353"><a data-toggle="tab" href="#tabWIDGET_8353">Termo de referência</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Requisições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_REQUISICOES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_DE_AQUISICAO__LEITURA__AQUISICAOREQUISICOES_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2619">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2619" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_REQUISICAOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2106_at2619_hs10e4ddcc.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_AQUISICAO__LEITURA__AQUISICAOREQUISICOES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1858">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1858" Title="Itens Requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_REQUISICAOITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1795_at1858_hse851f722.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_AQUISICAO__LEITURA__AQUISICAOREQUISICOES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3659">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3659" Title="Itens cancelados na aquisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS=2 AND A.REQUISICAOITEM IN (SELECT  HANDLE FROM LC_REQUISICAOITENS WHERE REQUISICAO=@RASTRO(LC_REQUISICOES)) AND (A.NUMEROREQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at3659_hs60987fe0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_AQUISICAO__LEITURA__AQUISICAOREQUISICOES_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2571">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2571" Title="Ocorrências nos ítens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_STATUS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLE IN (SELECT HANDLE FROM PD_STATUS WHERE HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'LC_REQUISICAOITENS') AND HANDLEREGISTROORIGEM IN (SELECT HANDLE FROM LC_REQUISICAOITENS WHERE REQUISICAO= @RASTRO(LC_REQUISICOES) ) AND DATAINCLUSAO &gt;= (SELECT DATA FROM LC_REQUISICOES WHERE HANDLE = @RASTRO(LC_REQUISICOES) )))" FormUrl="~/aga/a/f/aga_t1951_at2571_hsf4d5fc5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_AQUISICAO__LEITURA__AQUISICAOREQUISICOES_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8353">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8353" Title="Termo de referência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_TR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLE IN (SELECT TERMOREFERENCIA FROM LC_REQUISICOES WHERE HANDLE = @RASTRO(LC_REQUISICOES)))" FormUrl="~/aga/a/f/aga_t5780_at8353_hsc8de2338.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_AQUISICAO__LEITURA__AQUISICAOREQUISICOES_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    