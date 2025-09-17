<%@ Page Title="Reservas orçamentárias" Language="C#" Inherits="aga.a.orcamento.ReservasOrcamentarias" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row"><div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CADASTRADAS" class="active"><a data-toggle="tab" href="#tabCADASTRADAS"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cadastradas")%></span></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TODAS"><a data-toggle="tab" href="#tabTODAS"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Todas")%></span></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCADASTRADAS">
                        <div class="row">
    <wes:SimpleGrid runat="server" ID="CADASTRADAS" Title="Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CT_RESERVASORCAMENTARIAS.PADRAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 'A'" FormUrl="~/aga/a/orcamento/EmExecucao/ReservasOrcamentarias/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMEXECUCAO_RESERVASORCAMENTARIAS" Level="20" Order="10"  /></div>
          <div class="row">
            <div class="tabbable-line">
              <ul class="nav nav-tabs"></ul>
              <div class="tab-content"></div>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="tabTODAS">
                        <div class="row">
    <wes:SimpleGrid runat="server" ID="TODAS" Title="Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CT_RESERVASORCAMENTARIAS.PADRAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/orcamento/EmExecucao/ReservasOrcamentarias/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMEXECUCAO_RESERVASORCAMENTARIAS" Level="20" Order="20"  /></div>
          <div class="row">
            <div class="tabbable-line">
              <ul class="nav nav-tabs"></ul>
              <div class="tab-content"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
        </div></div>
      </asp:Content>
    