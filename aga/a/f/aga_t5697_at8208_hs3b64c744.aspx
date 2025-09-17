<%@ Page Title="Configurações comerciais - Tipos de visita" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tipo de visita" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_TIPOVISITA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__CM_TIPOVISITA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8206" class="active"><a data-toggle="tab" href="#tabWIDGET_8206"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Configuração de avaliação")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_8206">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8206" Title="Configuração de avaliação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CM_CONFIGAVALIACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOVISITA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5699_at8206_hs5843855d.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__CM_TIPOVISITA_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    