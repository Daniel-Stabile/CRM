<%@ Page Title="Itens/objetos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.aditivos.ObjetoAditivo" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOOBJETOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_ADITIVO_SL__OBJETOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4405" class="active"><a data-toggle="tab" href="#tabWIDGET_4405"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do patrimônio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3444"><a data-toggle="tab" href="#tabWIDGET_3444"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3529"><a data-toggle="tab" href="#tabWIDGET_3529"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3207"><a data-toggle="tab" href="#tabWIDGET_3207"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3494"><a data-toggle="tab" href="#tabWIDGET_3494"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FAIXADEVALORES"><a data-toggle="tab" href="#tabFAIXADEVALORES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Faixa de valores")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_4405">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4405" Title="Itens do patrimônio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOPATRIMONIO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ADITIVOOBJETO = @RASTRO(CN_ADITIVOOBJETOS)" FormUrl="~/aga/a/f/aga_t2728_at4405_hsec7193fe.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__OBJETOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3444">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3444" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGAS_AP_ADICAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.ORIGINAL = 'N') OR (A.ORIGINAL IS NULL)) AND A.OBJETO = @CAMPO(OBJETO) AND A.ADITIVOOBJETOS = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2335_at3444_hs430f9015.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__OBJETOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3529">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3529" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGAS_AP.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.ORIGINAL = 'N') OR (A.ORIGINAL IS NULL)) AND A.OBJETO = @CAMPO(OBJETO) AND A.ADITIVOOBJETOS = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2335_at3529_hs40690dda.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__OBJETOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3207">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3207" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGAS_ADICAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.ORIGINAL = 'N') OR (A.ORIGINAL IS NULL)) AND (A.ADITIVOOBJETOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2335_at3207_hs2266d290.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__OBJETOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3494">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3494" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORIGINAL = 'N')  AND A.ADITIVOOBJETOS = @CAMPO(HANDLE) AND A.OBJETO = @CAMPO(OBJETO)" FormUrl="~/aga/a/f/aga_t2335_at3494_hs4829c48a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__OBJETOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabFAIXADEVALORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FAIXADEVALORES" Title="Faixa de valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_ADITIVOOBJETOFAIXAVALORES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 2 AND A.ADITIVOOBJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/aditivos/AditivoObjetoFaixaValoresForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_SL__OBJETOS_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    