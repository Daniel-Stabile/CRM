<%@ Page Title="Na filial" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Na filial</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1567"><a data-toggle="tab" href="#tabWIDGET_1567">Almoxarifados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6757"><a data-toggle="tab" href="#tabWIDGET_6757">Alternativos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6714"><a data-toggle="tab" href="#tabWIDGET_6714">Aplicações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6724"><a data-toggle="tab" href="#tabWIDGET_6724">Aplicações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2248"><a data-toggle="tab" href="#tabWIDGET_2248">Balancetes</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_239_7438"><a data-toggle="tab" href="#tabWIDGET_239_7438">Classificação NVE&gt;Atributos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2554"><a data-toggle="tab" href="#tabWIDGET_2554">Clientes</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7466"><a data-toggle="tab" href="#tabWIDGET_7466">Custos manufaturados no SPED</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6633"><a data-toggle="tab" href="#tabWIDGET_6633">Códigos de atividade</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2432"><a data-toggle="tab" href="#tabWIDGET_2432">Exclusivo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7131"><a data-toggle="tab" href="#tabWIDGET_7131">FCI</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2555"><a data-toggle="tab" href="#tabWIDGET_2555">Fornecedores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3568"><a data-toggle="tab" href="#tabWIDGET_3568">Imagens</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5336"><a data-toggle="tab" href="#tabWIDGET_5336">Insumos módulo exportação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3704"><a data-toggle="tab" href="#tabWIDGET_3704">Kanban</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5283"><a data-toggle="tab" href="#tabWIDGET_5283">Movimentos de bloqueio</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5284"><a data-toggle="tab" href="#tabWIDGET_5284">Movimentos de reserva</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7345"><a data-toggle="tab" href="#tabWIDGET_7345">Movimentos em pedido</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7347"><a data-toggle="tab" href="#tabWIDGET_7347">Movimentos trânsito almoxarifado</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7346"><a data-toggle="tab" href="#tabWIDGET_7346">Movimentos trânsito filiais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3904"><a data-toggle="tab" href="#tabWIDGET_3904">Municípios</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7163"><a data-toggle="tab" href="#tabWIDGET_7163">Média ponderada do preço</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3389"><a data-toggle="tab" href="#tabWIDGET_3389">Números de série</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3547"><a data-toggle="tab" href="#tabWIDGET_3547">Números de série inutilizados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2397"><a data-toggle="tab" href="#tabWIDGET_2397">Ordens de compra</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2396"><a data-toggle="tab" href="#tabWIDGET_2396">Ordens de produção</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3330"><a data-toggle="tab" href="#tabWIDGET_3330">Pauta COFINS</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3306"><a data-toggle="tab" href="#tabWIDGET_3306">Pauta IPI</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3331"><a data-toggle="tab" href="#tabWIDGET_3331">Pauta PIS</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6738"><a data-toggle="tab" href="#tabWIDGET_6738">Políticas comerciais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5337"><a data-toggle="tab" href="#tabWIDGET_5337">Processo Produtivo módulo exportação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2607"><a data-toggle="tab" href="#tabWIDGET_2607">Recebimentos fiscais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2615"><a data-toggle="tab" href="#tabWIDGET_2615">Requisições itens</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6747"><a data-toggle="tab" href="#tabWIDGET_6747">Substitutos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2430"><a data-toggle="tab" href="#tabWIDGET_2430">Substitutos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7523"><a data-toggle="tab" href="#tabWIDGET_7523">Tipos de documento habilitação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_239_7314"><a data-toggle="tab" href="#tabWIDGET_239_7314">Tipos de inspeção&gt;Ativos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_239_7315"><a data-toggle="tab" href="#tabWIDGET_239_7315">Tipos de inspeção&gt;Inativos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2149"><a data-toggle="tab" href="#tabWIDGET_2149">Variações</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Na filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="AGA_PD_PRODUTOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1567">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1567" Title="Almoxarifados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ALMOXARIFADOPRODUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1527_at1567_hs32565c61.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6757">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6757" Title="Alternativos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOALTERNATIVOPRODUTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PRODUTOPAI IN (SELECT
PRODUTOPAI FROM PD_PRODUTOS WHERE HANDLE =
@RASTRO(PD_PRODUTOS))" FormUrl="~/aga/a/f/aga_t4468_at6757_hs3e4bf5c4.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6714">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6714" Title="Aplicações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOAPLICACOES.GRID" CanDelete="True" CanUpdate="False" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4430_at6714_hsebbad8bf.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6724">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6724" Title="Aplicações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOAPLICACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4430_at6724_hsc3ac16a2.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2248">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2248" Title="Balancetes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_MOVIMENTACAOVARIACAOTOTAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1958_at2248_hscf542cc3.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_239_7438">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_239_7438" Title="Classificação NVE&gt;Atributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_NVEATRIBUTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (

SELECT B.HANDLE
  FROM PD_PRODUTOS
       INNER JOIN TR_TIPIS ON (TR_TIPIS.HANDLE = PD_PRODUTOS.CLASSIFICACAOTIPI)
       INNER JOIN TR_NVEATRIBUTO B ON (B.NCM = TR_TIPIS.HANDLE)
 WHERE PD_PRODUTOS.HANDLE = @RASTRO(PD_PRODUTOS)
   AND PD_PRODUTOS.TRIBUTACAO = 1

UNION

SELECT B.HANDLE
  FROM PD_PRODUTOS
       INNER JOIN PD_FAMILIASPRODUTOS ON (PD_FAMILIASPRODUTOS.HANDLE = PD_PRODUTOS.FAMILIA)
       INNER JOIN TR_TIPIS ON (TR_TIPIS.HANDLE = PD_FAMILIASPRODUTOS.CLASSIFICACAOTIPI)
       INNER JOIN TR_NVEATRIBUTO B ON (B.NCM = TR_TIPIS.HANDLE)
 WHERE PD_PRODUTOS.HANDLE = @RASTRO(PD_PRODUTOS)
   AND PD_PRODUTOS.TRIBUTACAO = 2

)" FormUrl="~/aga/a/f/aga_t5091_at7438_hsc5a59b6a.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2554">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2554" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_VARIACAOCLIENTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1509_at2554_hs6539420c.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7466">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7466" Title="Custos manufaturados no SPED" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_CUSTOMANUFATURADOSPED.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5142_at7466_hs32c8323b.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6633">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6633" Title="Códigos de atividade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOCODIGOATIVIDADE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4311_at6633_hsab048ff.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2432">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2432" Title="Exclusivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOEXCLUSIVO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2052_at2432_hsb8721c20.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7131">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7131" Title="FCI" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOVARIACAOFCI.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4723_at7131_hsc80c3b72.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2555">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2555" Title="Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_VARIACAOFORNECEDORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1506_at2555_hsf9bc8a4b.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3568">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3568" Title="Imagens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_IMAGENS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PD_PRODUTOS') AND A.HANDLEORIGEM = @RASTRO(PD_PRODUTOS))" FormUrl="~/aga/a/f/aga_t2464_at3568_hs20601112.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5336">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5336" Title="Insumos módulo exportação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_IE_PRODUTOINSUMOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3275_at5336_hsed3c4496.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3704">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3704" Title="Kanban" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOKANBAN.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2514_at3704_hsda29579d.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5283">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5283" Title="Movimentos de bloqueio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_MOVIMENTACAOHISTORICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTACAO IN(SELECT HANDLE FROM PD_CODIGOSMOVIMENTACAO WHERE ALMOXBLOQ &gt; 1) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1971_at5283_hse16d7f81.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5284">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5284" Title="Movimentos de reserva" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_MOVIMENTACAOHISTORICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTACAO IN(SELECT HANDLE FROM PD_CODIGOSMOVIMENTACAO WHERE ALMOXRESE &gt; 1) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1971_at5284_hs9550a9f1.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7345">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7345" Title="Movimentos em pedido" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_MOVIMENTACAOHISTORICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTACAO IN(SELECT HANDLE FROM PD_CODIGOSMOVIMENTACAO WHERE ALMOXEMPE &gt; 1) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1971_at7345_hs905597c4.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7347">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7347" Title="Movimentos trânsito almoxarifado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_MOVIMENTACAOHISTORICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTACAO IN(SELECT HANDLE FROM PD_CODIGOSMOVIMENTACAO WHERE ALMOXTRANALMOX &gt; 1) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1971_at7347_hsa11f0af.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7346">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7346" Title="Movimentos trânsito filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_MOVIMENTACAOHISTORICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTACAO IN(SELECT HANDLE FROM PD_CODIGOSMOVIMENTACAO WHERE ALMOXTRANFILIAL &gt; 1) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1971_at7346_hs4c5f120.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3904">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3904" Title="Municípios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOMUNICIPIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2599_at3904_hs926dadb.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7163">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7163" Title="Média ponderada do preço" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOMEDIAPRECOS.GRID" CanDelete="True" CanUpdate="False" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4752_at7163_hsee5af423.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="115"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3389">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3389" Title="Números de série" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTONUMEROSDESERIE.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(STATUS = 1) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2399_at3389_hs7b8e0cf5.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3547">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3547" Title="Números de série inutilizados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTONUMEROSDESERIE.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(STATUS=2) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2399_at3547_hs310c867f.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="125"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2397">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2397" Title="Ordens de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT ORDEMCOMPRA FROM CP_ORDENSCOMPRAITENS WHERE PRODUTO = @RASTRO(PD_PRODUTOS) )" FormUrl="~/aga/a/f/aga_t1529_at2397_hsc042282a.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2396">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2396" Title="Ordens de produção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PR_ORDENSPRODUCAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1835_at2396_hs1a32a3ea.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="135"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3330">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3330" Title="Pauta COFINS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOPAUTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(TIPOPAUTA = 2) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2375_at3330_hsc5764413.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3306">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3306" Title="Pauta IPI" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOPAUTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(TIPOPAUTA =1) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2375_at3306_hs1dc3ee70.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="145"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3331">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3331" Title="Pauta PIS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOPAUTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(TIPOPAUTA =3) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2375_at3331_hsda0dcc4c.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6738">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6738" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6738_hs4be264da.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="155"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5337">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5337" Title="Processo Produtivo módulo exportação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_IE_PRODUTOPROCESSOPRODUTIVO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3276_at5337_hsb3ede013.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2607">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2607" Title="Recebimentos fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_ITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO IN(SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.TIPOREGISTRO=3 AND B.DOCUMENTOORIGEM IS NOT NULL)) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1756_at2607_hs4be54d81.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="165"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2615">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2615" Title="Requisições itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t868_at2615_hs8e7437b0.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="170"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6747">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6747" Title="Substitutos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOSUBSTITUTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2050_at6747_hsc1b1f03f.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="175"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2430">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2430" Title="Substitutos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOSUBSTITUTOS.GRID" CanDelete="True" CanUpdate="False" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2050_at2430_hs1f2719d4.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="180"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7523">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7523" Title="Tipos de documento habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_DOCUMENTOHABILITACAOITEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PRODUTO = @RASTRO(PD_PRODUTOS) AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5169_at7523_hs7792293d.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="185"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_239_7314">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_239_7314" Title="Tipos de inspeção&gt;Ativos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_QL_TIPOINSPECAOPRODUTO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PRODUTO = @RASTRO(PD_PRODUTOS)
AND A.ROTEIROINSPECAO IN (SELECT ROTEIROINSPECAO FROM PD_PRODUTOS                            WHERE HANDLE = @RASTRO(PD_PRODUTOS)) 
AND A.FORNECEDOR IS NULL 
AND A.ATIVO = 'S' 
AND A.FORNECEDOR IS NULL 
AND A.REQUISICAO IS NULL
AND A.ORDEMCOMPRAITEM IS NULL  
AND A.ROTEIRO IS NULL AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4883_at7314_hs6bf2ea0c.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="190"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_239_7315">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_239_7315" Title="Tipos de inspeção&gt;Inativos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_QL_TIPOINSPECAOPRODUTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PRODUTO = @RASTRO(PD_PRODUTOS)
AND A.FORNECEDOR IS NULL 
AND A.ATIVO = 'N' 
AND A.FORNECEDOR IS NULL 
AND A.REQUISICAO IS NULL
AND A.ORDEMCOMPRAITEM IS NULL  
AND A.ROTEIRO IS NULL AND (A.PRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4883_at7315_hs3f467f62.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="195"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2149">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2149" Title="Variações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOVARIACOESMESTRE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CODIGOREFERENCIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1483_at2149_hsf880db27.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__FILIAIS_SO_LEITURA__ITENSDAFILIAL_FORM" Level="20" Order="200"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    