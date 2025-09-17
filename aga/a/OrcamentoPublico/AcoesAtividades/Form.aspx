<%@ Page Title="Cadastramento de Ação da Atividade" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMOP_ACOESPROJETOS" Title="Ação da Atividade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESATIVIDADES.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="100"  />
    <wes:SimpleGrid runat="server" ID="CLASSIFICAOORAMENTRIADAAO" Title="Classificação orçamentária da ação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMOP_ACOESPROJETOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_EM_OP_ACOESPROJETOS_ATIVIDADE.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ATIVIDADE = @CAMPO(ATIVIDADE) AND A.ACOESPROJETOS = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoOrcamentariaAtividade/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="105"  /><div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PEDIDOSEMPENHO"><a data-toggle="tab" href="#tabPEDIDOSEMPENHO"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos Empenho")%></span></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMPENHOS"><a data-toggle="tab" href="#tabEMPENHOS"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empenhos")%></span></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AJUSTES"><a data-toggle="tab" href="#tabAJUSTES"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ajustes")%></span></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIQUIDAOREQFISCAL"><a data-toggle="tab" href="#tabLIQUIDAOREQFISCAL"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liquidação Req. Fiscal")%></span></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIQUIDAOCPA"><a data-toggle="tab" href="#tabLIQUIDAOCPA"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liquidação CPA")%></span></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PAGAMENTOS"><a data-toggle="tab" href="#tabPAGAMENTOS"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pagamentos")%></span></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane" id="tabPEDIDOSEMPENHO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PEDIDOSEMPENHO" Title="Pedidos Empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause=" A.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) AND A.VERSAO IN (SELECT X.HANDLE FROM CT_VERSOESORCAMENTOS X WHERE X.HANDLE = @CAMPO(VERSAO))" FormUrl="~/aga/a/orcamento/empenhos/PedidosEmpenhos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabEMPENHOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EMPENHOS" Title="Empenhos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_EMPENHOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause=" A.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) AND A.VERSAO IN (SELECT X.HANDLE FROM CT_VERSOESORCAMENTOS X WHERE X.HANDLE = @CAMPO(VERSAO))" FormUrl="~/aga/a/orcamento/empenhoscadastro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabAJUSTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AJUSTES" Title="Ajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOS_EM_OP_ACOESPROJETOS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) 
AND A.VERSAO = @CAMPO(VERSAO) 
AND A.ORIGEM IN ('B','C','D','E','Q','1','5','6')" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabLIQUIDAOREQFISCAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LIQUIDAOREQFISCAL" Title="Liquidação Req. Fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS_EM_OP_ACOESPROJETOS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="@DATAPARTE(ANO,A.DATAENTRADA) = @DATAPARTE(ANO,@CAMPO(ANO)) AND  A.HANDLE IN ( SELECT L.DOCUMENTO FROM FN_LANCAMENTOS L
LEFT JOIN FN_LANCAMENTOCC LCC ON LCC.LANCAMENTO = L.HANDLE
WHERE   A.ABRANGENCIA = 'R'  AND  (L.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) OR LCC.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) ) )" FormUrl="~/aga/e/materiais/recebimentos/RecebimentoFiscal/RecebimentoFiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabLIQUIDAOCPA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LIQUIDAOCPA" Title="Liquidação CPA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.CONSULTADOCUMENTOS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="@DATAPARTE(ANO,A.DATAENTRADA) = @DATAPARTE(ANO,@CAMPO(ANO)) AND A.HANDLE IN ( SELECT L.DOCUMENTO FROM FN_LANCAMENTOS L
LEFT JOIN FN_LANCAMENTOCC LCC ON LCC.LANCAMENTO = L.HANDLE
WHERE   A.ABRANGENCIA = 'N'  AND  (L.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) OR LCC.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) ) )" FormUrl="~/aga/e/financeiro/zoomdedocumentos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabPAGAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PAGAMENTOS" Title="Pagamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.ZOOMDEDOCUMENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VALORESBAIXADOS &gt; 0 AND A.HANDLE  IN ( SELECT L.PARCELA FROM FN_LANCAMENTOS L
LEFT JOIN FN_LANCAMENTOCC LCC ON LCC.LANCAMENTO = L.HANDLE
LEFT JOIN FN_DOCUMENTOS D ON A.DOCUMENTO = D.HANDLE
WHERE @DATAPARTE(ANO,D.DATAENTRADA) = @DATAPARTE(ANO,@CAMPO(ANO)) AND  D.ABRANGENCIA IN ('T','N') AND ( D.STATUS = 2 OR ( D.STATUS = 1 AND D.ENTRADASAIDA NOT IN ('I','O')) ) AND ( L.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) OR LCC.ACOESPROJETOS = @CAMPO(ACOESPROJETOS) )  )" FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="170"  /></div>
        </div>
      </div>
    </div>
  </div>
        </div>
    <wes:SimpleGrid runat="server" ID="ANDAMENTOSDAAO" Title="Andamentos da ação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMOP_ACOESPROJETOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACAOANDAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ATIVIDADE = @CAMPO(ATIVIDADE) AND A.ACOESPROJETOS = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/AcaoAndamentos/Atividade/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESATIVIDADES_FORM" Level="20" Order="110"  /></div>
      </asp:Content>
    