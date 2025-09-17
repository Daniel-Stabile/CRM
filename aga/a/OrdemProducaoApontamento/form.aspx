<%@ Page Title="Apontamento" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.OrdemProducaoApontamento.OrdemProducaoApontamentoformPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="APONTAMENTO" Title="Apontamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMPRODUCAOAPONTAMENTOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORDEMPRODUCAOAPONTAMENTO_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS" class="active"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens consumidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFASEXECUTADAS"><a data-toggle="tab" href="#tabTAREFASEXECUTADAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas executadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SERVIOSEXTERNOS"><a data-toggle="tab" href="#tabSERVIOSEXTERNOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Serviços externos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDUSTRIALIZADOS"><a data-toggle="tab" href="#tabINDUSTRIALIZADOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Industrializados")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens consumidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="APONTAMENTO" ChromeState="Fixed" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="PR_ITEMCONSUMOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.APONTAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/ItemConsumo/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAOAPONTAMENTO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFASEXECUTADAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFASEXECUTADAS" Title="Tarefas executadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="APONTAMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_TAREFAAPONTAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.APONTAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/TarefaApontamento/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAOAPONTAMENTO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabSERVIOSEXTERNOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SERVIOSEXTERNOS" Title="Serviços externos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="APONTAMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_SERVICOAPONTAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.APONTAMENTO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAOAPONTAMENTO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabINDUSTRIALIZADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INDUSTRIALIZADOS" Title="Industrializados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="APONTAMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_INDUSTRIALIZADOAPONTAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.APONTAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrdemIndustrializado/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAOAPONTAMENTO_FORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    