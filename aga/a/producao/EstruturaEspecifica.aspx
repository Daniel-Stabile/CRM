<%@ Page Title="Estrutura Específica" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.producao.ProducaoEstruturaEspecificaPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ITEMDAORDEMDEVENDA" Title="Item da Ordem de Venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="CM_ORDEMVENDAITENS.ESTRUTURAESPECIFICA.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_PRODUCAO_ESTRUTURAESPECIFICA" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ESTRUTURAESPECIFICA" class="active"><a data-toggle="tab" href="#tabESTRUTURAESPECIFICA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produtos da Estrutura Específica")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFASDAESTRUTURAESPECFICA"><a data-toggle="tab" href="#tabTAREFASDAESTRUTURAESPECFICA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas da Estrutura Específica")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabESTRUTURAESPECIFICA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ESTRUTURAESPECIFICA" Title="Produtos da Estrutura Específica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEMDAORDEMDEVENDA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ITEMESTRUTURAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMVENDAITEM = @CAMPO(HANDLE) AND A.PRODUTOPAI = @CAMPO(PRODUTO) AND A.VARIACAOPRODUTOPAI = @CAMPO(VARIACAO)" FormUrl="~/aga/a/Producao/EstruturaEspecifica.form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_ESTRUTURAESPECIFICA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFASDAESTRUTURAESPECFICA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFASDAESTRUTURAESPECFICA" Title="Tarefas da Estrutura Específica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEMDAORDEMDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ITEMESTRUTURATAREFAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMVENDAITEM = @CAMPO(HANDLE) AND A.PRODUTO= @CAMPO(PRODUTO) AND A.VARIACAO = @CAMPO(VARIACAO)" FormUrl="~/aga/a/Producao/EstruturaEspecificaTarefa/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_ESTRUTURAESPECIFICA" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    