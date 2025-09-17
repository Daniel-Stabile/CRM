<%@ Page Title="Visualizar Ajuste Orçamento público" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="AJUSTEORAMENTRIO" Title="Ajuste Orçamentário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES_ORCPUB.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTOPUBLICO_AJUSTES_VISUALIZAR" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LANAMENTOS" class="active"><a data-toggle="tab" href="#tabLANAMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamentos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabLANAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LANAMENTOS" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AJUSTEORAMENTRIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVLANCAMENTOS_ORCPUB.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTOPUBLICO_AJUSTES_VISUALIZAR" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    