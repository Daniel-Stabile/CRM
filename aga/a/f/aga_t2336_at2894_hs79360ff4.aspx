<%@ Page Title="Novos itens/objetos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.aditivos.NovosItensObjetosAditivo" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Novos itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CN_ADITIVONOVOSOBJETOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_ADITIVO_SL__NOVOSOBJETOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5949" class="active"><a data-toggle="tab" href="#tabWIDGET_5949"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comissões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6745"><a data-toggle="tab" href="#tabWIDGET_6745"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Faixa de valores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4403"><a data-toggle="tab" href="#tabWIDGET_4403"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do patrimônio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6803"><a data-toggle="tab" href="#tabWIDGET_6803"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Períodos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3442"><a data-toggle="tab" href="#tabWIDGET_3442"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3209"><a data-toggle="tab" href="#tabWIDGET_3209"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5949">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5949" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOCOMISSOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.NOVOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3712_at5949_hse8896053.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__NOVOSOBJETOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6745">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6745" Title="Faixa de valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVONOVOOBJETOFAIXAVALOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE) AND A.ADITIVO = @CAMPO(ADITIVO))" FormUrl="~/aga/a/f/aga_t4456_at6745_hsf0e4231c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__NOVOSOBJETOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4403">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4403" Title="Itens do patrimônio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOPATRIMONIO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVONOVOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2728_at4403_hs376e7753.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__NOVOSOBJETOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6803">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6803" Title="Períodos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOITEMPERIODOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ADITEM = @RASTRO(CN_ADITIVONOVOSOBJETOS)" FormUrl="~/aga/a/f/aga_t2068_at6803_hs1d9c5154.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__NOVOSOBJETOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3442">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3442" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGASNOVOSOBJETOS_AP.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2337_at3442_hs2c209ece.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__NOVOSOBJETOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3209">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3209" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGASNOVOSOBJETOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2337_at3209_hsd2941771.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__NOVOSOBJETOS_FORM" Level="20" Order="35"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    