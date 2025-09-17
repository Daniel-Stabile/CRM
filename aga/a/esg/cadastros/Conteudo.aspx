<%@ Page Title="Conteúdo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTEDO" class="active"><a data-toggle="tab" href="#tabCONTEDO">Conteúdo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISITOS"><a data-toggle="tab" href="#tabREQUISITOS">Requisitos</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabCONTEDO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTEDO" Title="Conteúdo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="ESG_GRICONTEUDOS.CADASTRO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ESG_CONTEUDO" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabREQUISITOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REQUISITOS" Title="Requisitos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTEDO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="ESG_GRICONTEUDOREQUISITOS.CADASTRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTEUDO = @CAMPO(HANDLE)" FormUrl="~/aga/a/esg/cadastros/Requisito.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ESG_CONTEUDO" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    