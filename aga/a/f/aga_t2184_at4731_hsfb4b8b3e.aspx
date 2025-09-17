<%@ Page Title="Apontamentos/medições - Aprovados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Apontamentos/medições - Aprovados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_APONTAMENTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4398" class="active"><a data-toggle="tab" href="#tabWIDGET_4398"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2887"><a data-toggle="tab" href="#tabWIDGET_2887"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2829"><a data-toggle="tab" href="#tabWIDGET_2829"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3908"><a data-toggle="tab" href="#tabWIDGET_3908"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Municípios")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3001"><a data-toggle="tab" href="#tabWIDGET_3001"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas NDC associadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3798"><a data-toggle="tab" href="#tabWIDGET_3798"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas fiscais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3292"><a data-toggle="tab" href="#tabWIDGET_3292"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens de compra geradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3747"><a data-toggle="tab" href="#tabWIDGET_3747"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimentos físicos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_4398">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4398" Title="Documentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT DOCUMENTOCONVENIO FROM  CN_APONTAMENTOOBJETOS  
 WHERE APONTAMENTO = @RASTRO(CN_APONTAMENTOS) )" FormUrl="~/aga/a/f/aga_t1216_at4398_hs14965b89.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2887">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2887" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_APONTAMENTOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_APONTAMENTOS))" FormUrl="~/aga/a/f/aga_t1951_at2887_hs8890ce6d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2829">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2829" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOOBJETOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.APONTAMENTO  IN (@RASTRO(CN_APONTAMENTOS))" FormUrl="~/aga/a/f/aga_t2226_at2829_hsf7c83b3b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3908">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3908" Title="Municípios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOMUNICIPIOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.APONTAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2601_at3908_hsef5f450.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3001">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3001" Title="Notas NDC associadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_LANCAMENTOSNDC.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLEAPONTAMENTO  IN (@RASTRO(CN_APONTAMENTOS))" FormUrl="~/aga/a/f/aga_t1593_at3001_hs3d8a9d1e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3798">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3798" Title="Notas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DOCUMENTO FROM CM_ITENS 
WHERE HANDLE IN (SELECT ITEMNF FROM CN_LIBERACOESFATURAMENTO WHERE
APONTAMENTO = @RASTRO(CN_APONTAMENTOS)))" FormUrl="~/aga/a/f/aga_t1216_at3798_hs3a560b6b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3292">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3292" Title="Ordens de compra geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.APONTAMENTOGERADOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1529_at3292_hsd27bd2ef.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3747">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3747" Title="Recebimentos físicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.APONTAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1584_at3747_hsa29a25b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOAPONTAMENTOS__CONFIRMADOS_FORM" Level="20" Order="45"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    