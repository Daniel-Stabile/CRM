<%@ Page Title="Faturamentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Faturamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CM_CONTRATOITEMFATURAMENTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CM_CARGAITEMFATURAMENTOS__FATURAMENTOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2364" class="active"><a data-toggle="tab" href="#tabWIDGET_2364"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Eventos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2363"><a data-toggle="tab" href="#tabWIDGET_2363"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Eventos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6743"><a data-toggle="tab" href="#tabWIDGET_6743"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ocorrências")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2364">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2364" Title="Eventos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CM_CONTRATOITEMEVENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMFATURAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2020_at2364_hs5d6fd0df.aspx" UserDefinedDisableRowSelection="False" PageId="CM_CARGAITEMFATURAMENTOS__FATURAMENTOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2363">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2363" Title="Eventos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOITEMEVENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMFATURAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2020_at2363_hsc432f19c.aspx" UserDefinedDisableRowSelection="False" PageId="CM_CARGAITEMFATURAMENTOS__FATURAMENTOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6743">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6743" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOOCORRENCIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMFATURAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2037_at6743_hsffe3b907.aspx" UserDefinedDisableRowSelection="False" PageId="CM_CARGAITEMFATURAMENTOS__FATURAMENTOS_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    