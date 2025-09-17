<%@ Page Title="Gerar ordens de compra" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SUPRIMENTOS" class="active"><a data-toggle="tab" href="#tabSUPRIMENTOS">Suprimentos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AQUISIES"><a data-toggle="tab" href="#tabAQUISIES">Aquisições</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabSUPRIMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SUPRIMENTOS" Title="Suprimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2 AND A.EHCONTRATO = 'S' AND (A.VARIACAO IN (SELECT B.VARIACAO FROM CN_CONTRATOOBJETOS B WHERE B.CONTRATO = @TABELA(CN_CONTRATOS)))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_GERAORDEMCOMPRA" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabAQUISIES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AQUISIES" Title="Aquisições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="LC_REQUISICAOITENS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EHCONTRATO = 'S' AND A6.STATUS = 2 AND A6.HANDLE = A.REQUISICAO AND (A.VARIACAO IN (SELECT C.VARIACAO FROM CN_CONTRATOOBJETOS C WHERE C.CONTRATO = @TABELA(CN_CONTRATOS)))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_GERAORDEMCOMPRA" Level="20" Order="40"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    