<%@ Page Title="Fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_PESSOAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_924" class="active"><a data-toggle="tab" href="#tabWIDGET_924"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Avalistas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_751"><a data-toggle="tab" href="#tabWIDGET_751"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contatos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_923"><a data-toggle="tab" href="#tabWIDGET_923"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contratos factoring")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7171"><a data-toggle="tab" href="#tabWIDGET_7171"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos de habilitação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6626"><a data-toggle="tab" href="#tabWIDGET_6626"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico SERASA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_279_8278"><a data-toggle="tab" href="#tabWIDGET_279_8278"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Integração com FR&gt;Receita Federal")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_279_8277"><a data-toggle="tab" href="#tabWIDGET_279_8277"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Integração com FR&gt;Receita Federal")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_279_8276"><a data-toggle="tab" href="#tabWIDGET_279_8276"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Integração com FR&gt;Sintegra")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4394"><a data-toggle="tab" href="#tabWIDGET_4394"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Limites de crédito")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2564"><a data-toggle="tab" href="#tabWIDGET_2564"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Locais de entrega")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3392"><a data-toggle="tab" href="#tabWIDGET_3392"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ocorrências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6734"><a data-toggle="tab" href="#tabWIDGET_6734"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Políticas comerciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7332"><a data-toggle="tab" href="#tabWIDGET_7332"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regimes especiais de tributação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1980"><a data-toggle="tab" href="#tabWIDGET_1980"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regiões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5286"><a data-toggle="tab" href="#tabWIDGET_5286"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Relacionamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_727"><a data-toggle="tab" href="#tabWIDGET_727"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Sócios")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1979"><a data-toggle="tab" href="#tabWIDGET_1979"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Telefones")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_924">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_924" Title="Avalistas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_GN_PESSOAVALISTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1241_at924_hs32d2e1a7.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_751">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_751" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t728_at751_hs37287c85.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_923">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_923" Title="Contratos factoring" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FC_CONTRATOSFACTORING.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1240_at923_hs609d1b99.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7171">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7171" Title="Documentos de habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOADOCUMENTOSHABILITACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4756_at7171_hse436083b.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6626">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6626" Title="Histórico SERASA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAHISTORICOSERASA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4305_at6626_hs771bf0d7.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_279_8278">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_279_8278" Title="Integração com FR&gt;Receita Federal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_FRRETORNOSRECEITACPF.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT MAX(S.HANDLE) FROM GN_FRRETORNOSRECEITACPF S WHERE S.PESSOA = @RASTRO(GN_PESSOAS)) AND (A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_279_8277">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_279_8277" Title="Integração com FR&gt;Receita Federal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_FRRETORNOSRECEITACNPJ.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT MAX(S.HANDLE) FROM GN_FRRETORNOSRECEITACNPJ S WHERE S.PESSOA = @RASTRO(GN_PESSOAS)) AND (A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_279_8276">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_279_8276" Title="Integração com FR&gt;Sintegra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_FRRETORNOSSINTEGRA.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT MAX(S.HANDLE) FROM GN_FRRETORNOSSINTEGRA S WHERE S.PESSOA = @RASTRO(GN_PESSOAS)) AND (A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4394">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4394" Title="Limites de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASLIMITESCREDITO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2738_at4394_hs1e5057c8.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2564">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2564" Title="Locais de entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAENDERECOSENTREGA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1372_at2564_hsaf9d53dd.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3392">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3392" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAOCORRENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t867_at3392_hs390d8b85.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6734">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6734" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6734_hs81ab7d98.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7332">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7332" Title="Regimes especiais de tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASREGIMESESPECIAIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4970_at7332_hsad93c4b2.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1980">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1980" Title="Regiões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAREGIOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1770_at1980_hs40f371fa.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5286">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5286" Title="Relacionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARELACIONAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3256_at5286_hs92dc6e0e.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_727">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_727" Title="Sócios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASOCIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.SOCIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t901_at727_hs930a668a.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1979">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1979" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOATELEFONES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1206_at1979_hs5cbbe887.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__FORNECEDORES_FORM" Level="20" Order="90"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    