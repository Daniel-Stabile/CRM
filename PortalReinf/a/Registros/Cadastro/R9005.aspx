<%@ Page Title="R-9005 - Bases e tributos - retenções na fonte" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R9005BASESETRIBUTOSRETENESNAFONTE" Title="R-9005 - Bases e tributos - retenções na fonte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9005.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R9005_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSMENSAL" class="active"><a data-toggle="tab" href="#tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSMENSAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizador da base de cálculo, apuração e retenção dos tributos Mensal")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSQUINZENAL"><a data-toggle="tab" href="#tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSQUINZENAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizador da base de cálculo, apuração e retenção dos tributos Quinzenal")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDECENDIAL"><a data-toggle="tab" href="#tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDECENDIAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizador da base de cálculo, apuração e retenção dos tributos Decendial")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSSEMANAL"><a data-toggle="tab" href="#tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSSEMANAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizador da base de cálculo, apuração e retenção dos tributos Semanal")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDIRIO"><a data-toggle="tab" href="#tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDIRIO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizador da base de cálculo, apuração e retenção dos tributos Diário")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OCORRNCIA"><a data-toggle="tab" href="#tabOCORRNCIA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ocorrência")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSMENSAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSMENSAL" Title="Totalizador da base de cálculo, apuração e retenção dos tributos Mensal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9005BASESETRIBUTOSRETENESNAFONTE" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_TOTALIZADORAPURACAOMEN.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9005 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/R9005/TotalizadorMensal.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9005_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSQUINZENAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSQUINZENAL" Title="Totalizador da base de cálculo, apuração e retenção dos tributos Quinzenal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9005BASESETRIBUTOSRETENESNAFONTE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_TOTALIZADORAPURACAOQUI.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9005 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/R9005/TotalizadorQuinzenal.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9005_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDECENDIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDECENDIAL" Title="Totalizador da base de cálculo, apuração e retenção dos tributos Decendial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9005BASESETRIBUTOSRETENESNAFONTE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_TOTALIZADORAPURACAODEC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9005 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/R9005/TotalizadorDecendial.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9005_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSSEMANAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSSEMANAL" Title="Totalizador da base de cálculo, apuração e retenção dos tributos Semanal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9005BASESETRIBUTOSRETENESNAFONTE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_TOTALIZADORAPURACAOSEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9005 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/R9005/TotalizadorSemanal.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9005_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDIRIO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORDABASEDECLCULOAPURAOERETENODOSTRIBUTOSDIRIO" Title="Totalizador da base de cálculo, apuração e retenção dos tributos Diário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9005BASESETRIBUTOSRETENESNAFONTE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_TOTALIZADORAPURACAODIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9005 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/R9005/TotalizadorDiario.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9005_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabOCORRNCIA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OCORRNCIA" Title="Ocorrência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R9005BASESETRIBUTOSRETENESNAFONTE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_OCORRENCIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R9005 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Ocorrencia.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R9005_FORM" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    