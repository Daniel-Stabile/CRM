<%@ Page Title="Aditivos - Cadastrados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Aditivos - Cadastrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOADITIVOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8337" class="active"><a data-toggle="tab" href="#tabWIDGET_8337"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4400"><a data-toggle="tab" href="#tabWIDGET_4400"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes do aditivo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3728"><a data-toggle="tab" href="#tabWIDGET_3728"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Capa do contrato/convênio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2891"><a data-toggle="tab" href="#tabWIDGET_2891"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8342"><a data-toggle="tab" href="#tabWIDGET_8342"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos emitidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3897"><a data-toggle="tab" href="#tabWIDGET_3897"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2889"><a data-toggle="tab" href="#tabWIDGET_2889"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6257"><a data-toggle="tab" href="#tabWIDGET_6257"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liberar parcelas suspensas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3681"><a data-toggle="tab" href="#tabWIDGET_3681"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Novos itens mestres")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2890"><a data-toggle="tab" href="#tabWIDGET_2890"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Novos itens/objetos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_8337">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8337" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CN_CONTRATOADITIVOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5559_at8337_hs1002b25a.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4400">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4400" Title="Assinantes do aditivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOASSINANTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(NOT(A.ADITIVO IS NULL)) AND (A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2151_at4400_hsdb684e6d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3728">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3728" Title="Capa do contrato/convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOCAPACONTRATO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE) )" FormUrl="~/aga/a/f/aga_t2529_at3728_hsfaf8df48.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2891">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2891" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOCLAUSULAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULAADITIVO IS NULL AND (A.ADITIVO = @CAMPO(HANDLE) AND A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t2231_at2891_hs82c69b9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8342">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8342" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2499_at8342_hs25025381.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3897">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3897" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOADITIVOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_CONTRATOADITIVOS))" FormUrl="~/aga/a/f/aga_t1951_at3897_hsed641525.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2889">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2889" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE)) AND (A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t2220_at2889_hs56723e2b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6257">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6257" Title="Liberar parcelas suspensas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVORETENCAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE) AND A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t4033_at6257_hsc965b6bf.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3681">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3681" Title="Novos itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVONOVOOBJETOMESTRE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE) AND A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t2497_at3681_hs25c17027.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2890">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2890" Title="Novos itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVONOVOSOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE) AND A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t2336_at2890_hs55f4b2b1.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__CADASTRADOS_FORM" Level="20" Order="55"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    