<%@ Page Title="Tabelas auxiliares - Almoxarifados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Almoxarifados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_PD_ALMOXARIFADOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4215" class="active"><a data-toggle="tab" href="#tabWIDGET_4215"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Conjuntos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4177"><a data-toggle="tab" href="#tabWIDGET_4177"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de controle de reposição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4176"><a data-toggle="tab" href="#tabWIDGET_4176"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4175"><a data-toggle="tab" href="#tabWIDGET_4175"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Localizações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1251_1723"><a data-toggle="tab" href="#tabWIDGET_1251_1723"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens de contagem&gt;Cadastrada")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1251_1725"><a data-toggle="tab" href="#tabWIDGET_1251_1725"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens de contagem&gt;Canceladas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1251_1724"><a data-toggle="tab" href="#tabWIDGET_1251_1724"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens de contagem&gt;Confirmada")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1251_1726"><a data-toggle="tab" href="#tabWIDGET_1251_1726"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens de contagem&gt;Encerradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1251_1468"><a data-toggle="tab" href="#tabWIDGET_1251_1468"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições do almoxarifado&gt;Atendidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1251_1469"><a data-toggle="tab" href="#tabWIDGET_1251_1469"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições do almoxarifado&gt;Cancelados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1251_1467"><a data-toggle="tab" href="#tabWIDGET_1251_1467"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições do almoxarifado&gt;À atender")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_4215">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4215" Title="Conjuntos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_MA_RECURSOPARTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT PARTE FROM MF_HISTORICOLOCACAOPARTES 
WHERE PARTE = A.HANDLE AND ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS) AND TIPO = 2
AND DATA = (SELECT MAX(DATA) FROM MF_HISTORICOLOCACAOPARTES 
WHERE PARTE = A.HANDLE AND ALMOXARIFADO =  @RASTRO(PD_ALMOXARIFADOS) AND TIPO = 2 ))
AND PARTEPNEU = 1
AND RECURSO IS NULL
AND SITUACAO = 2 AND (A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2349_at4215_hsecf39937.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4177">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4177" Title="Histórico de controle de reposição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PD_ALMOXARIFADOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(PD_ALMOXARIFADOS))" FormUrl="~/aga/a/f/aga_t1951_at4177_hs2003a23b.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4176">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4176" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ALMOXARIFADOPRODUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1527_at4176_hs6a264905.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4175">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4175" Title="Localizações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ALMOXARIFADOLOCALIZACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1495_at4175_hs1d09dc4c.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1251_1723">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1251_1723" Title="Ordens de contagem&gt;Cadastrada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ORDENSCONTAGEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="STATUS = 1 AND (A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1626_at1723_hsd2640fc1.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1251_1725">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1251_1725" Title="Ordens de contagem&gt;Canceladas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ORDENSCONTAGEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="STATUS = 3 AND (A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1626_at1725_hs47818364.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1251_1724">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1251_1724" Title="Ordens de contagem&gt;Confirmada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ORDENSCONTAGEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="STATUS = 2 AND (A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1626_at1724_hs17aaa372.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1251_1726">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1251_1726" Title="Ordens de contagem&gt;Encerradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ORDENSCONTAGEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="STATUS = 4 AND (A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1626_at1726_hsb1a1ca9d.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1251_1468">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1251_1468" Title="Requisições do almoxarifado&gt;Atendidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(STATUS IN (4,8) AND QUANTIDADE &lt;= QUANTIDADEATENDIDA AND (TIPO = 'O' OR TIPO='T') AND ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS) AND ( @USUARIO IN (SELECT RESPONSAVEL FROM PD_ALMOXARIFADOS WHERE HANDLE = @RASTRO(PD_ALMOXARIFADOS) ) OR @USUARIO IN (SELECT ALMOXARIFE FROM PD_ALMOXARIFES WHERE ALMOXARIFADO  = @RASTRO(PD_ALMOXARIFADOS) ))) AND (A.ALMOXARIFADODESTINO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t868_at1468_hs82816aae.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1251_1469">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1251_1469" Title="Requisições do almoxarifado&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(STATUS = 5 AND (TIPO = 'O' OR TIPO='T') AND ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS) AND ( @USUARIO IN (SELECT RESPONSAVEL FROM PD_ALMOXARIFADOS WHERE HANDLE = @RASTRO(PD_ALMOXARIFADOS) ) OR @USUARIO IN (SELECT ALMOXARIFE FROM PD_ALMOXARIFES WHERE ALMOXARIFADO  = @RASTRO(PD_ALMOXARIFADOS) ))) AND (A.ALMOXARIFADODESTINO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t868_at1469_hs179322c4.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1251_1467">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1251_1467" Title="Requisições do almoxarifado&gt;À atender" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(STATUS = 2 AND QUANTIDADE &lt;&gt; QUANTIDADEATENDIDA AND (TIPO = 'O' OR TIPO='T') AND ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS) AND ( @USUARIO IN (SELECT RESPONSAVEL FROM PD_ALMOXARIFADOS WHERE HANDLE = @RASTRO(PD_ALMOXARIFADOS) ) OR @USUARIO IN (SELECT ALMOXARIFE FROM PD_ALMOXARIFES WHERE ALMOXARIFADO  = @RASTRO(PD_ALMOXARIFADOS) ))) AND (A.ALMOXARIFADODESTINO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t868_at1467_hs978251ba.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__PD_ALMOXARIFADOS_FORM" Level="20" Order="60"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    