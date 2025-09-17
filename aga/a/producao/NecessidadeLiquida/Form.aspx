<%@ Page Title="Necessidade Líquida" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.producao.NecessidadeLiquida.NecessidadeLiquidaFormPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMPR_NECESSIDADELIQUIDA" Title="Necessidade Líquida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_NECESSIDADELIQUIDA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_PRODUCAO_NECESSIDADELIQUIDA_FORM" Level="20" Order="100"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS" class="active"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDENSPRODUOGERADAS"><a data-toggle="tab" href="#tabORDENSPRODUOGERADAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens Produção Geradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIESGERADAS"><a data-toggle="tab" href="#tabREQUISIESGERADAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições Geradas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMPR_NECESSIDADELIQUIDA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_NECESSIDADELIQUIDAITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.NECESSIDADELIQUIDA = @CAMPO(HANDLE)" FormUrl="~/aga/a/Producao/NecessidadeLiquida/ItensNecessidade/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_NECESSIDADELIQUIDA_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabORDENSPRODUOGERADAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ORDENSPRODUOGERADAS" Title="Ordens Produção Geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMPR_NECESSIDADELIQUIDA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PR_ORDENSPRODUCAOSTATUSNECESSIDADELIQ.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.NUMEROORIGEM = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_NECESSIDADELIQUIDA_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabREQUISIESGERADAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REQUISIESGERADAS" Title="Requisições Geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMPR_NECESSIDADELIQUIDA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOESPAISTATUSNECESSIDADELIQUIDA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT B.REQUISICAOPAI FROM CP_REQUISICOES B
WHERE B.NUMEROORIGEM = @CAMPO(HANDLE) )" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_NECESSIDADELIQUIDA_FORM" Level="20" Order="130"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    