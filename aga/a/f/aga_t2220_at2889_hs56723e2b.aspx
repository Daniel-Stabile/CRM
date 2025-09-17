<%@ Page Title="Itens/objetos" Language="C#" Inherits="aga.a.contratos.aga_t2220_at2889_hs56723e2bPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOOBJETOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_ADITIVO_PERMISSAO__OBJETOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4404" class="active"><a data-toggle="tab" href="#tabWIDGET_4404"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do patrimônio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3443"><a data-toggle="tab" href="#tabWIDGET_3443"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3528"><a data-toggle="tab" href="#tabWIDGET_3528"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3206"><a data-toggle="tab" href="#tabWIDGET_3206"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_4404">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4404" Title="Itens do patrimônio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CN_OBJETOPATRIMONIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ADITIVOOBJETO = @RASTRO(CN_ADITIVOOBJETOS)" FormUrl="~/aga/a/f/aga_t2728_at4404_hs80ccf2e3.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__OBJETOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3443">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3443" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_ADITIVOENTREGAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.ORIGINAL = 'N') OR (A.ORIGINAL IS NULL)) AND A.OBJETO IN (SELECT OBJETO FROM CN_ADITIVOOBJETOS WHERE HANDLE = @RASTRO(CN_ADITIVOOBJETOS) ) AND (A.ADITIVOOBJETOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2335_at3443_hs5fede25d.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__OBJETOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3528">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3528" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_ADITIVOENTREGAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.ORIGINAL = 'N') OR (A.ORIGINAL IS NULL)) AND A.OBJETO IN (SELECT OBJETO FROM CN_ADITIVOOBJETOS WHERE HANDLE = @RASTRO(CN_ADITIVOOBJETOS) ) AND (A.ADITIVOOBJETOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2335_at3528_hs3794c95f.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__OBJETOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3206">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3206" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.ORIGINAL = 'N') OR (A.ORIGINAL IS NULL)) AND (A.OBJETO = @CAMPO(OBJETO)) AND (A.ADITIVOOBJETOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2335_at3206_hs2884f935.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__OBJETOS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    