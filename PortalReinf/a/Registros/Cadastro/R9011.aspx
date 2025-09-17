<%@ Page Title="R-9011 - Consolidação de bases e tributos - Contribuição previdenciária" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R9011CONSOLIDAODEBASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA" Title="R-9011 - Consolidação de bases e tributos - Contribuição previdenciária" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9011.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R9011_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDEBASESETRIBUTOS" class="active"><a data-toggle="tab" href="#tabTOTALIZADORESDEBASESETRIBUTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores de bases e tributos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OCORRNCIA"><a data-toggle="tab" href="#tabOCORRNCIA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ocorrência")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTOTALIZADORESDEBASESETRIBUTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDEBASESETRIBUTOS" Title="Totalizadores de bases e tributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9011CONSOLIDAODEBASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INFORMACOESBASETRIBUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9011 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/R9011/InformacaoBaseTributo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9011_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabOCORRNCIA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OCORRNCIA" Title="Ocorrência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9011CONSOLIDAODEBASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="REINF_OCORRENCIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9011 = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9011_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    