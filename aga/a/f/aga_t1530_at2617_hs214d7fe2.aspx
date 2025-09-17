<%@ Page Title="Itens de oc" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens de oc" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_ORDENSCOMPRAITENS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PRODUTOS_OC__PROD_ORDENSCOMPRA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7322" class="active"><a data-toggle="tab" href="#tabWIDGET_7322"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Inspeções Adicionais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6854"><a data-toggle="tab" href="#tabWIDGET_6854"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordem venda origem")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1527"><a data-toggle="tab" href="#tabWIDGET_1527"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimento físico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1478"><a data-toggle="tab" href="#tabWIDGET_1478"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisição item")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2595"><a data-toggle="tab" href="#tabWIDGET_2595"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições de aquisição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREVISODEENTREGAS"><a data-toggle="tab" href="#tabPREVISODEENTREGAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7322">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7322" Title="Inspeções Adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_ROTEIROSADICIONAIS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORDEMCOMPRAITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4889_at7322_hsf1476853.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_OC__PROD_ORDENSCOMPRA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6854">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6854" Title="Ordem venda origem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CM_ORDEMVENDAITENS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT OVI.HANDLE FROM CM_ORDEMVENDAITENS OVI JOIN CP_ORDEMCOMPRAORDEMVENDA OCOV ON OVI.HANDLE = OCOV.ORDEMVENDAITEM
WHERE OCOV.ORDEMCOMPRAITEM = @RASTRO(CP_ORDENSCOMPRAITENS))" FormUrl="~/aga/a/f/aga_t1944_at6854_hs415222a0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_OC__PROD_ORDENSCOMPRA_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1527">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1527" Title="Recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3 OR A.STATUS = 2 OR A.STATUS IS NULL) AND (A.ORDEMCOMPRAITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1584_at1527_hs5375fd9d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_OC__PROD_ORDENSCOMPRA_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1478">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1478" Title="Requisição item" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_REQUISICOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t868_at1478_hs2aee0e2c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_OC__PROD_ORDENSCOMPRA_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2595">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2595" Title="Requisições de aquisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_LC_REQUISICOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT D.HANDLE FROM CP_ORDENSCOMPRAITENS E, LC_AQUISICAOITENS B, LC_REQUISICAOITENS C,
LC_REQUISICOES D WHERE E.HANDLE = @RASTRO(CP_ORDENSCOMPRAITENS) AND E.HANDLE = B.ORDEMCOMPRAITEM AND 
B.REQUISICAOITEM = C.HANDLE AND C.REQUISICAO = D.HANDLE)" FormUrl="~/aga/a/f/aga_t1792_at2595_hs24811090.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_OC__PROD_ORDENSCOMPRA_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabPREVISODEENTREGAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREVISODEENTREGAS" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRAENTREGA.ITENSDAEMPRESA.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDENSCOMPRAITENS = @RASTRO(CP_ORDENSCOMPRAITENS)" FormUrl="~/aga/a/materiais/itensDaEmpresa/ItensDeOc/PrevisaoEntregas/PrevisaoEntregas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_OC__PROD_ORDENSCOMPRA_FORM" Level="20" Order="45"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    