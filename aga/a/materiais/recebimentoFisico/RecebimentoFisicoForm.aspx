<%@ Page Title="Recebimento Físico" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.RecebimentoFisicoForm" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="RECEBIMENTOFSICO" Title="Recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_RECEBIMENTOFISICOPAI.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_AGA_A_MATERIAIS_RECEBIMENTOFISICO_CADASTRARRECEBIMENTO" Level="20" Order="10"  />
      <div class="col-md-6"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R" class="active"><a data-toggle="tab" href="#tabR"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabR">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFSICO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_RECEBIMENTOFISICO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.RECEBIMENTOFISICOPAI= @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/recebimentoFisico/itemRecebimento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_AGA_A_MATERIAIS_RECEBIMENTOFISICO_CADASTRARRECEBIMENTO" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    