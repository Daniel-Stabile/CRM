<%@ Page Title="Produto" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.producao.EstruturaProdutos.EstruturaProdutosformPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="PRODUTO" Title="Produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTOVARIACOESMESTRE_ESTRUTURA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PR_ESTRUTURAS_PRODUTOFORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ESTRUTURA" class="active"><a data-toggle="tab" href="#tabESTRUTURA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comprados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFAS"><a data-toggle="tab" href="#tabTAREFAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabESTRUTURA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ESTRUTURA" Title="Comprados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PRODUTO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ESTRUTURASPRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARIACAOPRODUTOPAI = @CAMPO(HANDLE)
AND A.PRODUTOPAI = @CAMPO(CODIGOREFERENCIA)
AND A.PRODUTO IN(SELECT B.HANDLE FROM PD_PRODUTOS B
    WHERE B.HANDLE = A.PRODUTO
    AND B.TIPO IN (1,2,3,4,5,6)
    AND DATAFINAL &gt;= @AGORA)" FormUrl="~/aga/a/Producao/EstruturasProduto.form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PR_ESTRUTURAS_PRODUTOFORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PRODUTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ESTRUTURATAREFAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(CODIGOREFERENCIA)
AND A.VARIACAO =  @CAMPO(HANDLE)" FormUrl="~/aga/a/Producao/EstruturaTarefas.form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PR_ESTRUTURAS_PRODUTOFORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    