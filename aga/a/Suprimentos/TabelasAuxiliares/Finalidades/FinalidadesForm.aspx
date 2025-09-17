<%@ Page Title="Finalidades" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FINALIDADES" Title="Finalidades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_FINALIDADES.SUPRIMENTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_TABELASAUXILIARES_FINALIDADES_FINALIDADESFORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSOS" class="active"><a data-toggle="tab" href="#tabPROCESSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Processos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARMETROS"><a data-toggle="tab" href="#tabPARMETROS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPROCESSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROCESSOS" Title="Processos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FINALIDADES" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_FINALIDADEPROCESSOS.SUPRIMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FINALIDADE = @TABELA(CP_FINALIDADES)" FormUrl="~/aga/a/suprimentos/TabelasAuxiliares/Finalidades/FinalidadeProcessosForm.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_TABELASAUXILIARES_FINALIDADES_FINALIDADESFORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabPARMETROS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PARMETROS" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FINALIDADES" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_FINALIDADEPARAMETROS.SUPRIMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FINALIDADE = @TABELA(CP_FINALIDADES)" FormUrl="~/aga/a/suprimentos/TabelasAuxiliares/Finalidades/FinalidadeParametrosForm.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_TABELASAUXILIARES_FINALIDADES_FINALIDADESFORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FINALIDADES" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_FINALIDADEITENS.SUPRIMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FINALIDADE = @TABELA(CP_FINALIDADES)" FormUrl="~/aga/a/suprimentos/TabelasAuxiliares/Finalidades/FinalidadeItensForm.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_TABELASAUXILIARES_FINALIDADES_FINALIDADESFORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    