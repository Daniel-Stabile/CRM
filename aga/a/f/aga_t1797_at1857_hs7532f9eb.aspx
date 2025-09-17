<%@ Page Title="Aquisição" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Aquisicoes.MovimentacoesAquisicoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Aquisições</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2235"><a data-toggle="tab" href="#tabWIDGET_2235">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8048"><a data-toggle="tab" href="#tabWIDGET_8048">Divulgação fornecedores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3610"><a data-toggle="tab" href="#tabWIDGET_3610">Documentos emitidos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_3766"><a data-toggle="tab" href="#tabWIDGET_622_3766">Itens Aquisição&gt;Aditivados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_3649"><a data-toggle="tab" href="#tabWIDGET_622_3649">Itens Aquisição&gt;Cancelados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_3656"><a data-toggle="tab" href="#tabWIDGET_622_3656">Itens Aquisição&gt;Comprados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_3647"><a data-toggle="tab" href="#tabWIDGET_622_3647">Itens Aquisição&gt;Desertos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_3648"><a data-toggle="tab" href="#tabWIDGET_622_3648">Itens Aquisição&gt;Fracassados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_8144"><a data-toggle="tab" href="#tabWIDGET_622_8144">Itens Aquisição&gt;Não encerrados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_3646"><a data-toggle="tab" href="#tabWIDGET_622_3646">Itens Aquisição - Todos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="JULGAMENTOCOMERCIAL"><a data-toggle="tab" href="#tabJULGAMENTOCOMERCIAL">Julgamento - Comercial</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="JULGAMENTOHABILITAO"><a data-toggle="tab" href="#tabJULGAMENTOHABILITAO">Julgamento - Habilitação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="JULGAMENTOTECNICA"><a data-toggle="tab" href="#tabJULGAMENTOTECNICA">Julgamento - Tecnica</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_712_1097_3620"><a data-toggle="tab" href="#tabWIDGET_622_712_1097_3620">Julgamento&gt;Comercial&gt;Classificados&gt;Fornecedores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_712_1097_3621"><a data-toggle="tab" href="#tabWIDGET_622_712_1097_3621">Julgamento&gt;Comercial&gt;Desclassificados&gt;Fornecedores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_712_2211"><a data-toggle="tab" href="#tabWIDGET_622_712_2211">Julgamento&gt;Habilitação&gt;Habilitados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_712_2212"><a data-toggle="tab" href="#tabWIDGET_622_712_2212">Julgamento&gt;Habilitação&gt;Inabilitados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_712_2213"><a data-toggle="tab" href="#tabWIDGET_622_712_2213">Julgamento&gt;Técnica&gt;Classificados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_712_2214"><a data-toggle="tab" href="#tabWIDGET_622_712_2214">Julgamento&gt;Técnica&gt;Desclassificados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_622_3628"><a data-toggle="tab" href="#tabWIDGET_622_3628">Julgamento - Vencedores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOGPROCESSOS"><a data-toggle="tab" href="#tabLOGPROCESSOS">Log Processos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6093"><a data-toggle="tab" href="#tabWIDGET_6093">Log e-mail</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8215"><a data-toggle="tab" href="#tabWIDGET_8215">Ocorrências</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1865"><a data-toggle="tab" href="#tabWIDGET_1865">Participantes</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1886"><a data-toggle="tab" href="#tabWIDGET_1886">Requisições</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8217"><a data-toggle="tab" href="#tabWIDGET_8217">Responsáveis</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3618"><a data-toggle="tab" href="#tabWIDGET_3618">Retificações</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Aquisições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICOES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2235">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2235" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.RECURSO IS NULL) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1964_at2235_hs11bb6ac3.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8048">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8048" Title="Divulgação fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAODIVULGACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.AQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5525_at8048_hs3cdc7a0e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3610">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3610" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_LC_MODELODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.AQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2468_at3610_hs64d5f4c7.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_3766">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_3766" Title="Itens Aquisição&gt;Aditivados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVADO = 2) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at3766_hsc5eed75a.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_3649">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_3649" Title="Itens Aquisição&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (2,8) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at3649_hsffc11a16.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_3656">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_3656" Title="Itens Aquisição&gt;Comprados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
  ( A.ORDEMCOMPRAITEM IS NOT NULL ) OR ( A.CONTRATOITEM IS NOT NULL )
) OR
( A.STATUS = 7 ) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at3656_hs6bd14e1f.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_3647">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_3647" Title="Itens Aquisição&gt;Desertos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS=4 AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at3647_hs1c362785.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_3648">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_3648" Title="Itens Aquisição&gt;Fracassados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS=5 AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at3648_hsb07584c4.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_8144">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_8144" Title="Itens Aquisição&gt;Não encerrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS = 1 AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at8144_hs7ae7518d.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_3646">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_3646" Title="Itens Aquisição - Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_LC_AQUISICAOITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1801_at3646_hs85e7a36a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabJULGAMENTOCOMERCIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="JULGAMENTOCOMERCIAL" Title="Julgamento - Comercial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WIDGET_JULGAMENTO_COMERCIAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.AQUISICAO = @CAMPO(HANDLE)  AND JULGADOCOMERCIAL = 'S'" FormUrl="~/aga/a/aquisicoes/Julgamento/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="91"  /></div>
        </div>
        <div class="tab-pane" id="tabJULGAMENTOHABILITAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="JULGAMENTOHABILITAO" Title="Julgamento - Habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WIDGET_JULGAMENTO_HABILITACAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ARVOREHABILITACAO='S'  AND JULGADOHABILITACAO='S'  AND A.AQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/aquisicoes/Julgamento/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="93"  /></div>
        </div>
        <div class="tab-pane" id="tabJULGAMENTOTECNICA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="JULGAMENTOTECNICA" Title="Julgamento - Tecnica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WIDGET_JULGAMENTO_TECNICA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ARVORETECNICA='S' AND JULGADOTECNICA='S' AND A.AQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/aquisicoes/Julgamento/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="94"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_712_1097_3620">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_712_1097_3620" Title="Julgamento&gt;Comercial&gt;Classificados&gt;Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.DESCLASSIFICADO &lt;&gt; 'S' 
AND A.DESCLASSIFICADODOCUMENTOS &lt;&gt; 'S' 
AND A.HANDLE IN (SELECT PARTICIPANTE FROM  LC_AQUISICAOCOTACOESITEM WHERE STATUS &lt;&gt; 2 AND AQUISICAO = A.AQUISICAO) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at3620_hsd2c5136.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_712_1097_3621">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_712_1097_3621" Title="Julgamento&gt;Comercial&gt;Desclassificados&gt;Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DESCLASSIFICADO = 'S' OR DESCLASSIFICADODOCUMENTOS = 'S')
OR A.HANDLE IN (SELECT PARTICIPANTE FROM  LC_AQUISICAOCOTACOESITEM
                 WHERE SELECIONADO &lt;&gt; 'S' 
                   AND A.DESCLASSIFICADO &lt;&gt; 'S' 
                   AND STATUS = 2 
                   AND AQUISICAO = A.AQUISICAO
                   AND AQUISICAOITEM NOT IN (SELECT AQUISICAOITEM FROM LC_AQUISICAOCOTACOESITEM 
                                              WHERE SELECIONADO = 'S'
                                                AND PARTICIPANTE = A.HANDLE ) ) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at3621_hs7543e8db.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_712_2211">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_712_2211" Title="Julgamento&gt;Habilitação&gt;Habilitados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ARVOREHABILITACAO='S' AND A.JULGADOHABILITACAO='S' AND HABILITADO='S') AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at2211_hscc9539ae.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_712_2212">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_712_2212" Title="Julgamento&gt;Habilitação&gt;Inabilitados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.ARVOREHABILITACAO='S' AND A.HABILITADO='N' AND JULGADOHABILITACAO='S')
OR (INABILITADOPORINVERSAO='S')) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at2212_hs13c4cb2a.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_712_2213">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_712_2213" Title="Julgamento&gt;Técnica&gt;Classificados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ARVORETECNICA='S' AND A.CLASSIFICADOTECNICA='S' AND JULGADOTECNICA='S') AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at2213_hs659bbee9.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="115"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_712_2214">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_712_2214" Title="Julgamento&gt;Técnica&gt;Desclassificados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ARVORETECNICA='S' AND A.CLASSIFICADOTECNICA='N' AND JULGADOTECNICA='S') AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at2214_hs37ca4ff3.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_622_3628">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_622_3628" Title="Julgamento - Vencedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PARTICIPANTE IN (SELECT HANDLE FROM GN_PESSOAS WHERE
EHFORNECEDOR = 'S' AND HANDLE IN (SELECT FORNECEDOR FROM CP_ORDENSCOMPRA WHERE 

AQUISICAO=@RASTRO(LC_AQUISICOES) AND FORNECEDOR IN (SELECT PARTICIPANTE FROM LC_AQUISICAOPARTICIPANTES 

WHERE AQUISICAO=@RASTRO(LC_AQUISICOES))))
OR 
A.PARTICIPANTE IN (SELECT HANDLE FROM GN_PESSOAS WHERE
EHFORNECEDOR = 'S' AND HANDLE IN (SELECT PARTICIPANTE FROM LC_AQUISICAOPARTICIPANTES WHERE 

AQUISICAO=@RASTRO(LC_AQUISICOES) AND HANDLE IN (SELECT PARTICIPANTE FROM LC_AQUISICAOCOTACOESITEM WHERE 

AQUISICAO=@RASTRO(LC_AQUISICOES) AND SELECIONADO='S'))) AND (A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at3628_hs60033741.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="125"  /></div>
        </div>
        <div class="tab-pane" id="tabLOGPROCESSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOGPROCESSOS" Title="Log Processos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="LC_LOGPROCESSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.AQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/aquisicoes/LogProcesso/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="129"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6093">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6093" Title="Log e-mail" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_GN_LOGEMAIL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TABELAORIGEM = 1799 AND (A.HANDLEORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3904_at6093_hsb3d9f3.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8215">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8215" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOOCORRENCIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.AQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5706_at8215_hsb0c96b39.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1865">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1865" Title="Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOPARTICIPANTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1803_at1865_hsa895532.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="155"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1886">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1886" Title="Requisições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_REQUISICOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.AQUISICAOGERADA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1792_at1886_hsf0f6000b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="200"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8217">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8217" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at8217_hs143c993d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="210"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3618">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3618" Title="Retificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_AQUISICAORETIFICACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2490_at3618_hsc1a50c51.aspx" UserDefinedDisableRowSelection="False" PageId="LC_PASTA_DE_AQUISICOES__TODAS_FORM" Level="20" Order="215"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    