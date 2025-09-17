<%@ Page Title="Itens Requisição" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Aquisicoes.ItensRequisicoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Itens Requisição</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1880"><a data-toggle="tab" href="#tabWIDGET_1880">Fornecedores sugeridos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2569"><a data-toggle="tab" href="#tabWIDGET_2569">Ocorrências no item</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens Requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_REQUISICAOITENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__REQUISICAOITENS_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1880">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1880" Title="Fornecedores sugeridos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_REQUISICAOFORNECEDORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1812_at1880_hs81a74388.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__REQUISICAOITENS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2569">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2569" Title="Ocorrências no item" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_STATUS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'LC_REQUISICAOITENS') AND A.HANDLEREGISTROORIGEM = @RASTRO(LC_REQUISICAOITENS) AND DATAINCLUSAO &gt;= (SELECT DATA FROM LC_REQUISICOES WHERE HANDLE = @RASTRO(LC_REQUISICOES) ))" FormUrl="~/aga/a/f/aga_t1951_at2569_hs3660b91c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__REQUISICAOITENS_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    