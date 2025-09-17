<%@ Page Title="Por produto" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Por produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOS.PRODUTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__PRODUTO__POR_PRODUTO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3297" class="active"><a data-toggle="tab" href="#tabWIDGET_3297"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro do produto")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3301"><a data-toggle="tab" href="#tabWIDGET_3301"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro do produto")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1802"><a data-toggle="tab" href="#tabWIDGET_1802"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Por variação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3626"><a data-toggle="tab" href="#tabWIDGET_3626"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Redução interna do produto")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3296"><a data-toggle="tab" href="#tabWIDGET_3296"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valor da pauta do produto")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3297">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3297" Title="Margem de lucro do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_TR_ESTADOTRIBUTOSMARGEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at3297_hs6f59dc21.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__PRODUTO__POR_PRODUTO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3301">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3301" Title="Margem de lucro do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSMARGEM.VARIAVEL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at3301_hsf0805a3e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__PRODUTO__POR_PRODUTO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1802">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1802" Title="Por variação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOS.VARIACAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ESTADO IS NOT NULL
AND A.FAMILIA IS NOT NULL
AND A.PRODUTO IS NOT NULL
AND A.VARIACAO IS NOT NULL
AND A.PRODUTO = @CAMPO(PRODUTO)
AND A.FAMILIA = @CAMPO(FAMILIA)
AND A.ESTADO = @CAMPO(ESTADO)
AND A.IMPOSTO = @CAMPO(IMPOSTO)" FormUrl="~/aga/a/f/aga_t829_at1802_hs8a872d81.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__PRODUTO__POR_PRODUTO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3626">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3626" Title="Redução interna do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_ESTADOTRIBUTOSREDUCOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2491_at3626_hs7b23944b.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__PRODUTO__POR_PRODUTO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3296">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3296" Title="Valor da pauta do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_ESTADOTRIBUTOSVALOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2371_at3296_hsfa932e61.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__PRODUTO__POR_PRODUTO_FORM" Level="20" Order="35"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    