<%@ Page Title="Classificação NCM" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Classificação NCM" Subtitle="Nomenclatura Comum do MERCOSUL" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_TIPIS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__CLASSIFICACAO_NCM_FORM" Level="20" Order="1"  />
      <div class="col-md-5"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CEST" class="active"><a data-toggle="tab" href="#tabCEST"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"CEST")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7441"><a data-toggle="tab" href="#tabWIDGET_7441"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Classificação NVE")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIMITEDEISENO"><a data-toggle="tab" href="#tabLIMITEDEISENO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Limite de isenção")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCEST">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="CEST" Title="CEST" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_CESTNCM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.NCM = @CAMPO(HANDLE))" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__CLASSIFICACAO_NCM_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7441">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7441" Title="Classificação NVE" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_NVEATRIBUTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.NCM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5091_at7441_hs56a8fd2e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__CLASSIFICACAO_NCM_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabLIMITEDEISENO">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="LIMITEDEISENO" Title="Limite de isenção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_TIPIISENCOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLASSIFICACAOTIPI = @CAMPO(HANDLE))" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__CLASSIFICACAO_NCM_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    