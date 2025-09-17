<%@ Page Title="Ordem de produção" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.OrdemProducao.OrdemProducaoformPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ORDEMDEPRODUO" Title="Ordem de produção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDENSPRODUCAO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORDEMPRODUCAO_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS" class="active"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFAS"><a data-toggle="tab" href="#tabTAREFAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SERVIOS"><a data-toggle="tab" href="#tabSERVIOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Serviços")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDUSTRIALIZADOS"><a data-toggle="tab" href="#tabINDUSTRIALIZADOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Industrializados")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEPRODUO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMPRODUCAOITENS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMPRODUCAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrdemProducaoItem/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEPRODUO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMPRODUCAOTAREFAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMPRODUCAO  = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrdemProducaoTarefa/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabSERVIOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SERVIOS" Title="Serviços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEPRODUO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMPRODUCAOSERVICOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMPRODUCAO  = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrdemProducaoServico/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabINDUSTRIALIZADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INDUSTRIALIZADOS" Title="Industrializados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEPRODUO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMINDUSTRIALIZADOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMPRODUCAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrdemIndustrializado/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAO_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    