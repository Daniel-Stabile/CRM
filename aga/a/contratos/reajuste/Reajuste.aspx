<%@ Page Title="Reajuste" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.Reajustes.ReajusteSoftware" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REAJUSTE" class="active"><a data-toggle="tab" href="#tabREAJUSTE">Reajuste</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DESFAZER"><a data-toggle="tab" href="#tabDESFAZER">Desfazer</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabREAJUSTE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REAJUSTE" Title="Reajuste" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATO_REAJUSTE.GRID" DefaultFilterName="Filtro" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE = -1" FormUrl="~/aga/a/contratos/reajuste/ItensContratoReajuste.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_CONTRATOS_REAJUSTE" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabDESFAZER">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DESFAZER" Title="Desfazer" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_DESFAZER_REAJUSTECONTRATOADITIVOS.GRID" DefaultFilterName="Filtro" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_CONTRATOS_REAJUSTE" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    