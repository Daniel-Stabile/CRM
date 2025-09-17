<%@ Page Title="Retorno de cobrança bancária" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMPROCESSARRETORNODECOBRANCA" class="active"><a data-toggle="tab" href="#tabFORMPROCESSARRETORNODECOBRANCA">Detalhes do retorno de cobrança</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSDORETORNO"><a data-toggle="tab" href="#tabITENSDORETORNO">Itens do retorno</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabFORMPROCESSARRETORNODECOBRANCA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMPROCESSARRETORNODECOBRANCA" Title="Detalhes do retorno de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_HBRETORNOS.COBRANCA_BANCARIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabITENSDORETORNO">
                    <div class="row">
    <wes:Tile runat="server" ID="TTULOSBAIXADOS" Title="Títulos baixados" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMPROCESSARRETORNODECOBRANCA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBITEMRETORNO.COBRANCABANCARIA.GRID" CompanyFilterMode="OnlyCompany" CriteriaWhereClauseTotalValue="A.RETORNO = @CAMPO(HANDLE)" CriteriaWhereClause="A.RETORNO = @CAMPO(HANDLE) AND A.VLRBAIXA > 0" TotalValue="HANDLE" Value="HANDLE" Description="Títulos baixados" Icon="fa fa-times" Color="blue" ValueAggregation="Count" TileType="Progress" Level="20" Order="30"  />
    <wes:Tile runat="server" ID="VALORESBAIXADOS" Title="Valores baixados" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMPROCESSARRETORNODECOBRANCA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBITEMRETORNO.COBRANCABANCARIA.GRID" CompanyFilterMode="OnlyCompany" CriteriaWhereClause="A.RETORNO = @CAMPO(HANDLE)" ValueFormat="C" Value="VLRBAIXA" Description="Valores baixados" Icon="fa fa-dollar" Color="green" ValueAggregation="Sum" TileType="Flat" Level="20" Order="40"  />
    <wes:SimpleGrid runat="server" ID="ITENSDORETORNO" Title="Itens do retorno" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMPROCESSARRETORNODECOBRANCA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBITEMRETORNO.COBRANCABANCARIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    
    