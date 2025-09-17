<%@ Page Title="Contratos de compra - Cancelados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contratos de compra - Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CN_CONTRATOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_2817" class="active"><a data-toggle="tab" href="#tabWIDGET_1362_2817"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Aprovados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_2816"><a data-toggle="tab" href="#tabWIDGET_1362_2816"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Aprovar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_3910"><a data-toggle="tab" href="#tabWIDGET_1362_3910"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Cadastrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_2814"><a data-toggle="tab" href="#tabWIDGET_1362_2814"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Cadastrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_2899"><a data-toggle="tab" href="#tabWIDGET_1362_2899"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Cancelados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_2815"><a data-toggle="tab" href="#tabWIDGET_1362_2815"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Em aprovação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_3449"><a data-toggle="tab" href="#tabWIDGET_1362_3449"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Rejeitados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_2998"><a data-toggle="tab" href="#tabWIDGET_1362_2998"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Suspensos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_2819"><a data-toggle="tab" href="#tabWIDGET_1362_2819"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Todos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4673"><a data-toggle="tab" href="#tabWIDGET_4673"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alertas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4678"><a data-toggle="tab" href="#tabWIDGET_4678"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_4731"><a data-toggle="tab" href="#tabWIDGET_1362_4731"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Aprovados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_4735"><a data-toggle="tab" href="#tabWIDGET_1362_4735"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Aprovar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_4730"><a data-toggle="tab" href="#tabWIDGET_1362_4730"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Cadastrados/em medição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_4732"><a data-toggle="tab" href="#tabWIDGET_1362_4732"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Cancelados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_4736"><a data-toggle="tab" href="#tabWIDGET_1362_4736"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Em aprovação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_4733"><a data-toggle="tab" href="#tabWIDGET_1362_4733"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Encerrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_4734"><a data-toggle="tab" href="#tabWIDGET_1362_4734"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Todos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4687"><a data-toggle="tab" href="#tabWIDGET_4687"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4681"><a data-toggle="tab" href="#tabWIDGET_4681"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes convênio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4666"><a data-toggle="tab" href="#tabWIDGET_4666"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4677"><a data-toggle="tab" href="#tabWIDGET_4677"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Condições de pagamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4679"><a data-toggle="tab" href="#tabWIDGET_4679"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Diário do contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4669"><a data-toggle="tab" href="#tabWIDGET_4669"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8338"><a data-toggle="tab" href="#tabWIDGET_8338"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos emitidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4688"><a data-toggle="tab" href="#tabWIDGET_4688"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4668"><a data-toggle="tab" href="#tabWIDGET_4668"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filiais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_8123"><a data-toggle="tab" href="#tabWIDGET_1362_8123"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Cadastradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_8125"><a data-toggle="tab" href="#tabWIDGET_1362_8125"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Canceladas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_8124"><a data-toggle="tab" href="#tabWIDGET_1362_8124"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Confirmadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_8126"><a data-toggle="tab" href="#tabWIDGET_1362_8126"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Encerradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1362_8127"><a data-toggle="tab" href="#tabWIDGET_1362_8127"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Todas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4665"><a data-toggle="tab" href="#tabWIDGET_4665"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6728"><a data-toggle="tab" href="#tabWIDGET_6728"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos inclusos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4680"><a data-toggle="tab" href="#tabWIDGET_4680"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens mestres")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4664"><a data-toggle="tab" href="#tabWIDGET_4664"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4676"><a data-toggle="tab" href="#tabWIDGET_4676"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4689"><a data-toggle="tab" href="#tabWIDGET_4689"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4683"><a data-toggle="tab" href="#tabWIDGET_4683"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liberações faturamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4684"><a data-toggle="tab" href="#tabWIDGET_4684"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas fiscais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4674"><a data-toggle="tab" href="#tabWIDGET_4674"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens compra geradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4667"><a data-toggle="tab" href="#tabWIDGET_4667"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4685"><a data-toggle="tab" href="#tabWIDGET_4685"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Premissas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4682"><a data-toggle="tab" href="#tabWIDGET_4682"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimentos físicos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4675"><a data-toggle="tab" href="#tabWIDGET_4675"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Renovações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4686"><a data-toggle="tab" href="#tabWIDGET_4686"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1362_2817">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_2817" Title="Aditivos&gt;Aprovados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2817_hs9bd7a29f.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_2816">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_2816" Title="Aditivos&gt;Aprovar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
 (A.STATUS = 2) AND 
(
(A.ALCADA IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C WHERE 

B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO 

AND B.ATIVO = 'S')) 
OR
(A.ALCADA IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, 

CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND 
((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 

'S'))
)
) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2816_hs92bc9e4c.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_3910">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_3910" Title="Aditivos&gt;Cadastrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 1) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at3910_hscd587541.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_2814">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_2814" Title="Aditivos&gt;Cadastrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 1) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2814_hsb96ecffa.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_2899">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_2899" Title="Aditivos&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 4) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2899_hs3f6bf8db.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_2815">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_2815" Title="Aditivos&gt;Em aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 2) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2815_hs2af431e8.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_3449">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_3449" Title="Aditivos&gt;Rejeitados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 5) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at3449_hsfe33c929.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_2998">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_2998" Title="Aditivos&gt;Suspensos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 5) AND (A.ORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1907_at2998_hsb7c4689c.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_2819">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_2819" Title="Aditivos&gt;Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2819_hs4c4a1979.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4673">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4673" Title="Alertas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOALERTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2272_at4673_hsac0db2.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4678">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4678" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRESTACAOCONTA IS NULL) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2493_at4678_hs3264fc3b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_4731">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_4731" Title="Apontamentos/medições&gt;Aprovados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 3)" FormUrl="~/aga/a/f/aga_t2184_at4731_hsfb4b8b3e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_4735">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_4735" Title="Apontamentos/medições&gt;Aprovar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND 
(
 (A.STATUS = 2) AND 
(
(A.GRUPOASSINATURAS IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C WHERE 

B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO 

AND B.ATIVO = 'S')) 
OR
(A.GRUPOASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, 

CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND 
((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 

'S'))
)
)" FormUrl="~/aga/a/f/aga_t2184_at4735_hs4390d4ce.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_4730">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_4730" Title="Apontamentos/medições&gt;Cadastrados/em medição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 1)" FormUrl="~/aga/a/f/aga_t2184_at4730_hs7babfe29.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_4732">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_4732" Title="Apontamentos/medições&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 5)" FormUrl="~/aga/a/f/aga_t2184_at4732_hsf0ebc452.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_4736">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_4736" Title="Apontamentos/medições&gt;Em aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 2)" FormUrl="~/aga/a/f/aga_t2184_at4736_hsa7edf5f4.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_4733">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_4733" Title="Apontamentos/medições&gt;Encerrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 4)" FormUrl="~/aga/a/f/aga_t2184_at4733_hs5180268.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_4734">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_4734" Title="Apontamentos/medições&gt;Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2184_at4734_hsbdc4bfd9.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4687">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4687" Title="Assinantes contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOASSINANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ADITIVO IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2151_at4687_hs1bffd4cc.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4681">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4681" Title="Assinantes convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_ASSINANTESCONVENIO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2498_at4681_hs5fd12eff.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4666">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4666" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULA IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at4666_hs89e17604.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4677">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4677" Title="Condições de pagamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOENTREGAPARCELAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2246_at4677_hseed27433.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="115"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4679">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4679" Title="Diário do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATODIARIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2495_at4679_hsb71623c.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4669">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4669" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATODOCUMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2218_at4669_hsa7ed6d7.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="125"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8338">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8338" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2499_at8338_hs751ec876.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4688">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4688" Title="Documentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT DOCUMENTOCONVENIO FROM  CN_APONTAMENTOOBJETOS  
 WHERE APONTAMENTO IN ( SELECT HANDLE FROM  CN_APONTAMENTOS  WHERE CONTRATO = @RASTRO(CN_CONTRATOS)))" FormUrl="~/aga/a/f/aga_t1216_at4688_hs9f025b43.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="135"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4668">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4668" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOFILIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2182_at4668_hs49f09da5.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_8123">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_8123" Title="Glosas e Multas&gt;Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (1) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8123_hsef953cf.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="145"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_8125">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_8125" Title="Glosas e Multas&gt;Canceladas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (3) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8125_hs80e95e80.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_8124">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_8124" Title="Glosas e Multas&gt;Confirmadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (2) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8124_hsfc83f95d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="155"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_8126">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_8126" Title="Glosas e Multas&gt;Encerradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (4) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8126_hs58bdb22e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1362_8127">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1362_8127" Title="Glosas e Multas&gt;Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8127_hs956adf97.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="165"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4665">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4665" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_CONTRATOS))" FormUrl="~/aga/a/f/aga_t1951_at4665_hs18bedbc8.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="170"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6728">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6728" Title="Impostos inclusos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOIMPOSTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4449_at6728_hs63ccb4f4.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="175"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4680">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4680" Title="Itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOMESTRE.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2496_at4680_hs83389e0.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="180"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4664">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4664" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at4664_hsfbf38cbb.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="185"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4676">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4676" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at4676_hs5a2cb66d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="190"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4689">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4689" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at4689_hsf75757c5.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="195"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4683">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4683" Title="Liberações faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_LIBERACOESFATURAMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2557_at4683_hsfe617065.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="200"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4684">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4684" Title="Notas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DOCUMENTO FROM CM_ITENS 
WHERE HANDLE IN (SELECT ITEMNF FROM CN_LIBERACOESFATURAMENTO WHERE
CONTRATO = @RASTRO(CN_CONTRATOS)))" FormUrl="~/aga/a/f/aga_t1216_at4684_hsfd4215b5.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="205"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4674">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4674" Title="Ordens compra geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATOGERADOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1529_at4674_hs9fc57ae0.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="210"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4667">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4667" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOPESSOAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2135_at4667_hs7043204e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="215"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4685">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4685" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOPREMISSAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2224_at4685_hsfacf1c4a.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="220"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4682">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4682" Title="Recebimentos físicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @TABELA(CN_CONTRATOS) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1584_at4682_hs14e1daf6.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="225"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4675">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4675" Title="Renovações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1907_at4675_hs66fdba13.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="230"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4686">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4686" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at4686_hs78760ab2.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CANCELADO_FORM" Level="20" Order="235"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    