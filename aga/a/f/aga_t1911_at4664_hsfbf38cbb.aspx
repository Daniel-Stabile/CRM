<%@ Page Title="Itens/objetos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATOOBJETOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2820" class="active"><a data-toggle="tab" href="#tabWIDGET_2820"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5941"><a data-toggle="tab" href="#tabWIDGET_5941"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comissões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4399"><a data-toggle="tab" href="#tabWIDGET_4399"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6727"><a data-toggle="tab" href="#tabWIDGET_6727"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Faixa de valores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4373"><a data-toggle="tab" href="#tabWIDGET_4373"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do patrimônio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3796"><a data-toggle="tab" href="#tabWIDGET_3796"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liberações faturamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6741"><a data-toggle="tab" href="#tabWIDGET_6741"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Períodos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3340"><a data-toggle="tab" href="#tabWIDGET_3340"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2810"><a data-toggle="tab" href="#tabWIDGET_2810"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6767"><a data-toggle="tab" href="#tabWIDGET_6767"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Reajustes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2807"><a data-toggle="tab" href="#tabWIDGET_2807"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Reajustes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3746"><a data-toggle="tab" href="#tabWIDGET_3746"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimentos físicos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7911"><a data-toggle="tab" href="#tabWIDGET_7911"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições de compra")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2820">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2820" Title="Aditivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t1910_at2820_hsdfdd9c8d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5941">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5941" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOCOMISSOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3712_at5941_hsb7c8239d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4399">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4399" Title="Documentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT DOCUMENTOCONVENIO FROM  CN_APONTAMENTOOBJETOS  
 WHERE APONTAMENTO IN ( SELECT HANDLE FROM  CN_APONTAMENTOS  WHERE CONTRATO = @RASTRO(CN_CONTRATOS) AND HANDLE IN (SELECT APONTAMENTO FROM CN_APONTAMENTOOBJETOS WHERE OBJETO = @RASTRO(CN_CONTRATOOBJETOS)  )
))" FormUrl="~/aga/a/f/aga_t1216_at4399_hs1f4b0010.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6727">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6727" Title="Faixa de valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOFAIXAVALOR.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4448_at6727_hsf3861720.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4373">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4373" Title="Itens do patrimônio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOPATRIMONIO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="REDUZIDO IS NULL OR REDUZIDO = 'N' AND (A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2728_at4373_hs775271a4.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3796">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3796" Title="Liberações faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_LIBERACOESFATURAMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2557_at3796_hsd6fdc444.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6741">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6741" Title="Períodos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOITEMPERIODOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CNITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2068_at6741_hsed0c00c9.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3340">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3340" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOENTREGAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2217_at3340_hscd8115ef.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2810">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2810" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOENTREGAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2217_at2810_hs509037a4.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6767">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6767" Title="Reajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOREAJUSTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2154_at6767_hs78ac91ba.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2807">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2807" Title="Reajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOREAJUSTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2154_at2807_hsdddf970b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3746">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3746" Title="Recebimentos físicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @TABELA(CN_CONTRATOS) AND A.CONTRATOOBJETO = @TABELA(CN_CONTRATOOBJETOS) AND (A.CONTRATOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1584_at3746_hs519231d8.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7911">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7911" Title="Requisições de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT REQITEM.ITEMREQUISICAO FROM CN_ITEMREQUISICAOITEMCONTRATO REQITEM WHERE REQITEM.STATUS = 2 AND REQITEM.HANDLE IN (SELECT ITENSREQ.ITEMREQUISICAOITEMCONTRATO FROM CN_ITENSCONTRATOREQUISICAO ITENSREQ WHERE ITENSREQ.ITEMCONTRATO = @RASTRO(CN_CONTRATOOBJETOS) ) )" FormUrl="~/aga/a/f/aga_t868_at7911_hsff8059de.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_SL__OBJETOS_FORM" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    