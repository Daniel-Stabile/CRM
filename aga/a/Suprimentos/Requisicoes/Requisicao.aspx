<%@ Page Title="Requisição" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.Requisicoes.Requisicao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIES" class="active"><a data-toggle="tab" href="#tabREQUISIES">Requisição</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSTODOS"><a data-toggle="tab" href="#tabITENSTODOS">Itens da requisição</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabREQUISIES">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="REQUISIES" Title="Requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICOESPAI.REQUISICAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_REQUISICOES_REQUISICAO" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSTODOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSTODOS" Title="Itens da requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIES" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICOES.ITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAOPAI = @CAMPO(HANDLE)" FormUrl="~/aga/a/Suprimentos/Requisicoes/Itens(Todos)/RequisicoesItens.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_REQUISICOES_REQUISICAO" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    