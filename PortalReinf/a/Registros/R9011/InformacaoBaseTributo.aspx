<%@ Page Title="Informações consolidadas por contrib. relativas a totalizadores de bases e tributos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESCONSOLIDADASPORCONTRIBUINTEDETOTALIZADORESDEBASESETRIBUTOS" Title="INFORMAÇÕES CONSOLIDADAS POR CONTRIBUINTE DE TOTALIZADORES DE BASES E TRIBUTOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INFORMACOESBASETRIBUTOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_9011_INFORMACAO_BASETRIBUTO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDOEVENTOR2010" class="active"><a data-toggle="tab" href="#tabTOTALIZADORESDOEVENTOR2010"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores do evento R-2010")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDOEVENTOR2020"><a data-toggle="tab" href="#tabTOTALIZADORESDOEVENTOR2020"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores do evento R-2020")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDOEVENTOR2040"><a data-toggle="tab" href="#tabTOTALIZADORESDOEVENTOR2040"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores do evento R-2040")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDOEVENTOR2050"><a data-toggle="tab" href="#tabTOTALIZADORESDOEVENTOR2050"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores do evento R-2050")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDOEVENTOR2055"><a data-toggle="tab" href="#tabTOTALIZADORESDOEVENTOR2055"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores do evento R-2055")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDOEVENTOR2060"><a data-toggle="tab" href="#tabTOTALIZADORESDOEVENTOR2060"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores do evento R-2060")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTOTALIZADORESDOEVENTOR2010">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDOEVENTOR2010" Title="Totalizadores do evento R-2010" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESCONSOLIDADASPORCONTRIBUINTEDETOTALIZADORESDEBASESETRIBUTOS" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9001TOTALIZADORR2010.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAOBASETRIBUTO = @CAMPO(HANDLE))" FormUrl="~/PortalReinf/a/Registros/R9001/TotalizadorR2010.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_9011_INFORMACAO_BASETRIBUTO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORESDOEVENTOR2020">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDOEVENTOR2020" Title="Totalizadores do evento R-2020" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESCONSOLIDADASPORCONTRIBUINTEDETOTALIZADORESDEBASESETRIBUTOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9001TOTALIZADORR2020.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAOBASETRIBUTO = @CAMPO(HANDLE))" FormUrl="~/PortalReinf/a/Registros/R9001/TotalizadorR2020.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_9011_INFORMACAO_BASETRIBUTO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORESDOEVENTOR2040">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDOEVENTOR2040" Title="Totalizadores do evento R-2040" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESCONSOLIDADASPORCONTRIBUINTEDETOTALIZADORESDEBASESETRIBUTOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9001TOTALIZADORR2040.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAOBASETRIBUTO = @CAMPO(HANDLE))" FormUrl="~/PortalReinf/a/Registros/R9001/TotalizadorR2040.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_9011_INFORMACAO_BASETRIBUTO" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORESDOEVENTOR2050">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDOEVENTOR2050" Title="Totalizadores do evento R-2050" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESCONSOLIDADASPORCONTRIBUINTEDETOTALIZADORESDEBASESETRIBUTOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9001TOTALIZADORR2050.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAOBASETRIBUTO = @CAMPO(HANDLE))" FormUrl="~/PortalReinf/a/Registros/R9001/TotalizadorR2050.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_9011_INFORMACAO_BASETRIBUTO" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORESDOEVENTOR2055">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDOEVENTOR2055" Title="Totalizadores do evento R-2055" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESCONSOLIDADASPORCONTRIBUINTEDETOTALIZADORESDEBASESETRIBUTOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9001TOTALIZADORR2055.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAOBASETRIBUTO = @CAMPO(HANDLE))" FormUrl="~/PortalReinf/a/Registros/R9001/TotalizadorR2055.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_9011_INFORMACAO_BASETRIBUTO" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabTOTALIZADORESDOEVENTOR2060">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDOEVENTOR2060" Title="Totalizadores do evento R-2060" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESCONSOLIDADASPORCONTRIBUINTEDETOTALIZADORESDEBASESETRIBUTOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9001TOTALIZADORR2060.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAOBASETRIBUTO = @CAMPO(HANDLE))" FormUrl="~/PortalReinf/a/Registros/R9001/TotalizadorR2060.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_9011_INFORMACAO_BASETRIBUTO" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    