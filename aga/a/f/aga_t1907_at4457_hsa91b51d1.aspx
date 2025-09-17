<%@ Page Title="Contratos de convênio - Em elaboração" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contratos de convênio - Em elaboração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2973" class="active"><a data-toggle="tab" href="#tabWIDGET_2973"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alertas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3662"><a data-toggle="tab" href="#tabWIDGET_3662"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3899"><a data-toggle="tab" href="#tabWIDGET_3899"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3686"><a data-toggle="tab" href="#tabWIDGET_3686"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes convênio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2650"><a data-toggle="tab" href="#tabWIDGET_2650"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3670"><a data-toggle="tab" href="#tabWIDGET_3670"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Diário do contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2812"><a data-toggle="tab" href="#tabWIDGET_2812"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8341"><a data-toggle="tab" href="#tabWIDGET_8341"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos emitidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2737"><a data-toggle="tab" href="#tabWIDGET_2737"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filiais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2436"><a data-toggle="tab" href="#tabWIDGET_2436"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6730"><a data-toggle="tab" href="#tabWIDGET_6730"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos inclusos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3676"><a data-toggle="tab" href="#tabWIDGET_3676"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens mestres")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2112"><a data-toggle="tab" href="#tabWIDGET_2112"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4499"><a data-toggle="tab" href="#tabWIDGET_4499"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3469"><a data-toggle="tab" href="#tabWIDGET_3469"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2679"><a data-toggle="tab" href="#tabWIDGET_2679"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3891"><a data-toggle="tab" href="#tabWIDGET_3891"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Premissas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3894"><a data-toggle="tab" href="#tabWIDGET_3894"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2973">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2973" Title="Alertas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CN_CONTRATOALERTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2272_at2973_hsf1113c60.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3662">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3662" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRESTACAOCONTA IS NULL) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2493_at3662_hs771dc1be.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3899">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3899" Title="Assinantes contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOASSINANTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ADITIVO IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2151_at3899_hs12d9379.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3686">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3686" Title="Assinantes convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_ASSINANTESCONVENIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2498_at3686_hsf2bcb0c0.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2650">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2650" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULA IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at2650_hs9c04616f.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3670">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3670" Title="Diário do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATODIARIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2495_at3670_hs58c7e73d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2812">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2812" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATODOCUMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2218_at2812_hs59988364.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8341">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8341" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2499_at8341_hs2f639048.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2737">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2737" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOFILIAIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2182_at2737_hs527816db.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2436">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2436" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_CONTRATOS))" FormUrl="~/aga/a/f/aga_t1951_at2436_hs3836ab9d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6730">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6730" Title="Impostos inclusos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOIMPOSTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4449_at6730_hs749b5480.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3676">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3676" Title="Itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOMESTRE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2496_at3676_hs9343b4b5.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2112">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2112" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at2112_hs705100bf.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4499">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4499" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at4499_hs2c84fb0b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3469">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3469" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at3469_hs8986a30a.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2679">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2679" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOPESSOAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2135_at2679_hs2d2716b2.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3891">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3891" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOPREMISSAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2224_at3891_hs239526c2.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3894">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3894" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at3894_hsac1f681e.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIOS__EMELABORACAO_FORM" Level="20" Order="95"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    