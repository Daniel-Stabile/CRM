<%@ Page Title="Condição de recebimento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Condição de recebimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_CONDICOESPAGAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__CONDICOES_DE_PAGAMENTO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6129" class="active"><a data-toggle="tab" href="#tabWIDGET_6129"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Configurações de recebimento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MAPA"><a data-toggle="tab" href="#tabMAPA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Mapa")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6129">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6129" Title="Configurações de recebimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CP_CONFIGURACAORECEBIMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONDICAOPAGAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3940_at6129_hs14a29e74.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__CONDICOES_DE_PAGAMENTO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabMAPA">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="MAPA" Title="Mapa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_MAPACONDICAOPAGAMENTO.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONDICOESPAGAMENTO = @CAMPO(HANDLE)" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__CONDICOES_DE_PAGAMENTO_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    