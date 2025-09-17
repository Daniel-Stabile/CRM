<%@ Page Title="Contratos de compra - Aprovados" Language="C#" Inherits="aga.a.contratos.aga_t1907_at2381_hs7e37d176Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contratos de compra - Aprovados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_2817" class="active"><a data-toggle="tab" href="#tabWIDGET_2405_2817"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Aprovados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_2816"><a data-toggle="tab" href="#tabWIDGET_2405_2816"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Aprovar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_2814"><a data-toggle="tab" href="#tabWIDGET_2405_2814"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Cadastrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_3910"><a data-toggle="tab" href="#tabWIDGET_2405_3910"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Cadastrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_2899"><a data-toggle="tab" href="#tabWIDGET_2405_2899"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Cancelados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_2815"><a data-toggle="tab" href="#tabWIDGET_2405_2815"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Em aprovação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_3449"><a data-toggle="tab" href="#tabWIDGET_2405_3449"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Rejeitados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_2998"><a data-toggle="tab" href="#tabWIDGET_2405_2998"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Suspensos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_2819"><a data-toggle="tab" href="#tabWIDGET_2405_2819"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos&gt;Todos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7992"><a data-toggle="tab" href="#tabWIDGET_7992"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alertas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7997"><a data-toggle="tab" href="#tabWIDGET_7997"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_4731"><a data-toggle="tab" href="#tabWIDGET_2405_4731"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Aprovados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_4735"><a data-toggle="tab" href="#tabWIDGET_2405_4735"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Aprovar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_4730"><a data-toggle="tab" href="#tabWIDGET_2405_4730"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Cadastrados/em medição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_4732"><a data-toggle="tab" href="#tabWIDGET_2405_4732"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Cancelados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_4736"><a data-toggle="tab" href="#tabWIDGET_2405_4736"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Em aprovação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_4733"><a data-toggle="tab" href="#tabWIDGET_2405_4733"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Encerrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_4734"><a data-toggle="tab" href="#tabWIDGET_2405_4734"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos/medições&gt;Todos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8006"><a data-toggle="tab" href="#tabWIDGET_8006"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8000"><a data-toggle="tab" href="#tabWIDGET_8000"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes convênio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7985"><a data-toggle="tab" href="#tabWIDGET_7985"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7996"><a data-toggle="tab" href="#tabWIDGET_7996"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Condições de pagamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7998"><a data-toggle="tab" href="#tabWIDGET_7998"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Diário do contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7988"><a data-toggle="tab" href="#tabWIDGET_7988"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8340"><a data-toggle="tab" href="#tabWIDGET_8340"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos emitidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8007"><a data-toggle="tab" href="#tabWIDGET_8007"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7987"><a data-toggle="tab" href="#tabWIDGET_7987"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filiais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_8123"><a data-toggle="tab" href="#tabWIDGET_2405_8123"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Cadastradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_8125"><a data-toggle="tab" href="#tabWIDGET_2405_8125"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Canceladas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_8124"><a data-toggle="tab" href="#tabWIDGET_2405_8124"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Confirmadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_8126"><a data-toggle="tab" href="#tabWIDGET_2405_8126"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Encerradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2405_8127"><a data-toggle="tab" href="#tabWIDGET_2405_8127"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e Multas&gt;Todas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7984"><a data-toggle="tab" href="#tabWIDGET_7984"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8009"><a data-toggle="tab" href="#tabWIDGET_8009"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos inclusos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7999"><a data-toggle="tab" href="#tabWIDGET_7999"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens mestres")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8008"><a data-toggle="tab" href="#tabWIDGET_8008"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7995"><a data-toggle="tab" href="#tabWIDGET_7995"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7983"><a data-toggle="tab" href="#tabWIDGET_7983"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8002"><a data-toggle="tab" href="#tabWIDGET_8002"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liberações faturamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8003"><a data-toggle="tab" href="#tabWIDGET_8003"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas fiscais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7993"><a data-toggle="tab" href="#tabWIDGET_7993"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens compra geradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7986"><a data-toggle="tab" href="#tabWIDGET_7986"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8004"><a data-toggle="tab" href="#tabWIDGET_8004"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Premissas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8001"><a data-toggle="tab" href="#tabWIDGET_8001"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimentos físicos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7994"><a data-toggle="tab" href="#tabWIDGET_7994"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Renovações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8091"><a data-toggle="tab" href="#tabWIDGET_8091"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8005"><a data-toggle="tab" href="#tabWIDGET_8005"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2405_2817">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_2817" Title="Aditivos&gt;Aprovados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2817_hs9bd7a29f.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_2816">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_2816" Title="Aditivos&gt;Aprovar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
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
) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2816_hs92bc9e4c.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_2814">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_2814" Title="Aditivos&gt;Cadastrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 1) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2814_hsb96ecffa.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_3910">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_3910" Title="Aditivos&gt;Cadastrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 1) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at3910_hscd587541.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_2899">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_2899" Title="Aditivos&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 4) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2899_hs3f6bf8db.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_2815">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_2815" Title="Aditivos&gt;Em aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 2) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2815_hs2af431e8.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_3449">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_3449" Title="Aditivos&gt;Rejeitados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 5) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at3449_hsfe33c929.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_2998">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_2998" Title="Aditivos&gt;Suspensos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 5) AND (A.ORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1907_at2998_hsb7c4689c.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_2819">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_2819" Title="Aditivos&gt;Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2819_hs4c4a1979.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7992">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7992" Title="Alertas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOALERTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2272_at7992_hs3ab02b6f.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7997">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7997" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRESTACAOCONTA IS NULL) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2493_at7997_hs44796d85.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_4731">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_4731" Title="Apontamentos/medições&gt;Aprovados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 3)" FormUrl="~/aga/a/f/aga_t2184_at4731_hsfb4b8b3e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_4735">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_4735" Title="Apontamentos/medições&gt;Aprovar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND 
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
)" FormUrl="~/aga/a/f/aga_t2184_at4735_hs4390d4ce.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_4730">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_4730" Title="Apontamentos/medições&gt;Cadastrados/em medição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 1)" FormUrl="~/aga/a/f/aga_t2184_at4730_hs7babfe29.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_4732">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_4732" Title="Apontamentos/medições&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 5)" FormUrl="~/aga/a/f/aga_t2184_at4732_hsf0ebc452.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_4736">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_4736" Title="Apontamentos/medições&gt;Em aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 2)" FormUrl="~/aga/a/f/aga_t2184_at4736_hsa7edf5f4.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_4733">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_4733" Title="Apontamentos/medições&gt;Encerrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS) AND (A.STATUS = 4)" FormUrl="~/aga/a/f/aga_t2184_at4733_hs5180268.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_4734">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_4734" Title="Apontamentos/medições&gt;Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2184_at4734_hsbdc4bfd9.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8006">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8006" Title="Assinantes contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOASSINANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ADITIVO IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2151_at8006_hsc9f90e69.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8000">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8000" Title="Assinantes convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_ASSINANTESCONVENIO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2498_at8000_hsb3bbcd39.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7985">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7985" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULA IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at7985_hs809a3af7.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7996">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7996" Title="Condições de pagamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOENTREGAPARCELAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2246_at7996_hs94ffbb15.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="115"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7998">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7998" Title="Diário do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATODIARIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2495_at7998_hs2d2a8fb.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7988">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7988" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATODOCUMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2218_at7988_hsf3846e7f.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="125"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8340">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8340" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2499_at8340_hse9282dc6.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8007">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8007" Title="Documentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT DOCUMENTOCONVENIO FROM  CN_APONTAMENTOOBJETOS  
 WHERE APONTAMENTO IN ( SELECT HANDLE FROM  CN_APONTAMENTOS  WHERE CONTRATO = @RASTRO(CN_CONTRATOS)))" FormUrl="~/aga/a/f/aga_t1216_at8007_hscecd5037.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="135"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7987">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7987" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOFILIAIS.GRID" CanDelete="False" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2182_at7987_hs7017fef7.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_8123">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_8123" Title="Glosas e Multas&gt;Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (1) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8123_hsef953cf.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="145"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_8125">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_8125" Title="Glosas e Multas&gt;Canceladas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (3) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8125_hs80e95e80.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_8124">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_8124" Title="Glosas e Multas&gt;Confirmadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (2) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8124_hsfc83f95d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="155"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_8126">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_8126" Title="Glosas e Multas&gt;Encerradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (4) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8126_hs58bdb22e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2405_8127">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2405_8127" Title="Glosas e Multas&gt;Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8127_hs956adf97.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="165"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7984">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7984" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_CONTRATOS))" FormUrl="~/aga/a/f/aga_t1951_at7984_hse399f4b4.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="170"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8009">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8009" Title="Impostos inclusos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOIMPOSTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4449_at8009_hscd8dbd0d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="175"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7999">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7999" Title="Itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOMESTRE.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2496_at7999_hsf80ed7a.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="180"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8008">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8008" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at8008_hs2cd45d99.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="185"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7995">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7995" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at7995_hs5504c36.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="190"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7983">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7983" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at7983_hs60409fa0.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="195"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8002">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8002" Title="Liberações faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_LIBERACOESFATURAMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2557_at8002_hsb15b325e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="200"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8003">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8003" Title="Notas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DOCUMENTO FROM CM_ITENS 
WHERE HANDLE IN (SELECT ITEMNF FROM CN_LIBERACOESFATURAMENTO WHERE
CONTRATO = @RASTRO(CN_CONTRATOS)))" FormUrl="~/aga/a/f/aga_t1216_at8003_hs1e066cbd.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="205"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7993">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7993" Title="Ordens compra geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATOGERADOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1529_at7993_hs5238a698.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="210"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7986">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7986" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOPESSOAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2135_at7986_hsb5097a15.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="215"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8004">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8004" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOPREMISSAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2224_at8004_hs83d7a947.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="220"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8001">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8001" Title="Recebimentos físicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @TABELA(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t1584_at8001_hs845dd722.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="225"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7994">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7994" Title="Renovações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1907_at7994_hscfc6953a.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="230"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8091">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8091" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at8091_hs4a387a50.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="235"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8005">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8005" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at8005_hs5f5e1f28.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS__CONFIRMADO_FORM" Level="20" Order="240"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    