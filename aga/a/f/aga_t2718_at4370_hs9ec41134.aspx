<%@ Page Title="Alíquota por Origem x Destino" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Alíquota" Subtitle="por Origem x Destino" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_ESTADOTRIBUTOSALIQUOTAS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_DE_IMPOSTOS__ALIQUOTASPORESTADO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4479" class="active"><a data-toggle="tab" href="#tabWIDGET_4479"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Por família")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4480"><a data-toggle="tab" href="#tabWIDGET_4480"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Por produtos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_4479">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4479" Title="Por família" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSALIQUOTAS.FAMILIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FAMILIA IS NOT NULL)
   AND (A.FAMILIA IN (SELECT FAMILIA.HANDLE
                        FROM PD_FAMILIASPRODUTOS FAMILIA
                       WHERE FAMILIA.HANDLE = A.FAMILIA
                         AND FAMILIA.EMPRESA IN (@EMPRESA))) 
   AND (A.PRODUTO IS NULL) 
   AND (A.ESTADOORIGEM = @CAMPO(ESTADOORIGEM))
   AND (A.ESTADODESTINO = @CAMPO(ESTADODESTINO))
   AND (A.IMPOSTO = @CAMPO(IMPOSTO)) " FormUrl="~/aga/a/f/aga_t2718_at4479_hsf7719ec.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS__ALIQUOTASPORESTADO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4480">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4480" Title="Por produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSALIQUOTAS.PRODUTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FAMILIA IS NOT NULL
AND A.PRODUTO IS NOT NULL 
AND A.ESTADOORIGEM = @CAMPO(ESTADOORIGEM)
AND A.ESTADODESTINO = @CAMPO(ESTADODESTINO)
AND A.IMPOSTO = @CAMPO(IMPOSTO)
AND A.PRODUTO IN (SELECT HANDLE FROM PD_PRODUTOS WHERE FILIAL IN @FILIAIS)" FormUrl="~/aga/a/f/aga_t2718_at4480_hsbc8f4d42.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS__ALIQUOTASPORESTADO_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    