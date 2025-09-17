<%@ Page Title="Acidentes de trabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="DOCUMENTOACIDENTEDETRABALHO" Title="Documento acidente de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_ACIDENTESTRABALHO.ACIDENTE.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CN_ACIDENTESTRABALHOAPROVACAO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS" class="active"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TERCEIROS"><a data-toggle="tab" href="#tabTERCEIROS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Terceiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINANTES"><a data-toggle="tab" href="#tabASSINANTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTOACIDENTEDETRABALHO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_DOCUMENTOANEXOS.DOCANEXO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ACIDENTESTRABALHOAPROVACAO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTERCEIROS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TERCEIROS" Title="Terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTOACIDENTEDETRABALHO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_ACIDENTESTERCEIROS.ACIDTERC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ACIDENTESTRABALHOAPROVACAO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINANTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINANTES" Title="Assinantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTOACIDENTEDETRABALHO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.ACIDENTETRABALHO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ACIDENTESTRABALHOAPROVACAO" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    