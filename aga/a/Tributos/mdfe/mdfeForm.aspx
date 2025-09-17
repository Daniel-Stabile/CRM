<%@ Page Title="MDF-e" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="MDFE" Title="MDF-e" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFE.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_MDFEFORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MUNICPIOSDEDESCARREGAMENTO" class="active"><a data-toggle="tab" href="#tabMUNICPIOSDEDESCARREGAMENTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Municípios de descarregamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PERCURSOS"><a data-toggle="tab" href="#tabPERCURSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Percursos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LACRES"><a data-toggle="tab" href="#tabLACRES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lacres")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SEGURO"><a data-toggle="tab" href="#tabSEGURO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Seguro")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabMUNICPIOSDEDESCARREGAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MUNICPIOSDEDESCARREGAMENTO" Title="Municípios de descarregamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MDFE" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFEMUNICIPIODESCARGA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.MDFE = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/grupodescarregamentoform.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFEFORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabPERCURSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PERCURSOS" Title="Percursos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MDFE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFEPERCURSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.MDFE = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/grupopercursosform.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFEFORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabLACRES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LACRES" Title="Lacres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MDFE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFELACRE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.MDFE = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/Lacres.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFEFORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabSEGURO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SEGURO" Title="Seguro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MDFE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFESEGURO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.MDFE = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/Seguro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFEFORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    