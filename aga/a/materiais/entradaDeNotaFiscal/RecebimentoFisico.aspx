<%@ Page Title="Recebimento físico - Entrada de nota fiscal" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.RecebimentoFisicoForm" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="RECEBIMENTOFSICO" Title="Recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="CP_RECEBIMENTOFISICOPAI.ENTRADA_NOTA_FISCAL.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_ENTRADADENOTAFISCAL_RECEBIMENTOFISICO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECEBIMENTOFSICODETALHES" class="active"><a data-toggle="tab" href="#tabRECEBIMENTOFSICODETALHES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimento físico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabRECEBIMENTOFSICODETALHES">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="RECEBIMENTOFSICODETALHES" Title="Recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFSICO" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CP_RECEBIMENTOFISICOPAI.ENTRADA_NOTA_FISCAL_DETALHES.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_ENTRADADENOTAFISCAL_RECEBIMENTOFISICO" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFSICO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_RECEBIMENTOFISICO.ENTRADA_NOTA_FISCAL.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.RECEBIMENTOFISICOPAI = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/recebimentoFisico/itemRecebimento.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_ENTRADADENOTAFISCAL_RECEBIMENTOFISICO" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <style>
            #ctl00_Main_RECEBIMENTOFSICO_PageControl_GERAL_GERAL .label-title {
    font-size: 13px;
}

#ctl00_Main_RECEBIMENTOFSICO_PageControl_GERAL_GERAL span[data-type="number"] {
    background-color: #659be0;
    font-size: 24px;
    color: #fff;
    text-align: center;
}

            </style>
      </asp:Content>
    