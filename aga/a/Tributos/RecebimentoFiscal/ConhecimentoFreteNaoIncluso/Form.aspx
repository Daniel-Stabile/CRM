<%@ Page Title="Conhecimento de frete não incluso" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Tributos.RecebimentoFiscal.ConhecimentoFreteNaoIncluso.ConhecimentoFreteNaoInclusoFormPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONHECIMENTODEFRETE" class="active"><a data-toggle="tab" href="#tabCONHECIMENTODEFRETE">Conhecimento de Frete</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRIBUTAES"><a data-toggle="tab" href="#tabTRIBUTAES">Tributações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NOTASFISCAIS"><a data-toggle="tab" href="#tabNOTASFISCAIS">Notas fiscais</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabCONHECIMENTODEFRETE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONHECIMENTODEFRETE" Title="Conhecimento de Frete" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOTRANSPORTE.CONHECIMENTOFRETENAOINCLUSO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="RECEBIMENTOFISCAL_CONHECIMENTOFRETENAOINCLUSO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabTRIBUTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TRIBUTAES" Title="Tributações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONHECIMENTODEFRETE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOTRANSPORTETRIBUTOS.CONHECIMENTOFRETENAOINCLUSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTOTRANSPORTE = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/RecebimentoFiscal/ConhecimentoFreteNaoIncluso/TributacoesForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECEBIMENTOFISCAL_CONHECIMENTOFRETENAOINCLUSO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabNOTASFISCAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="NOTASFISCAIS" Title="Notas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONHECIMENTODEFRETE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOTRANSPORTENOTAS.CONHECIMENTOFRETENAOINCLUSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTOTRANSPORTE = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/RecebimentoFiscal/ConhecimentoFreteNaoIncluso/Notas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECEBIMENTOFISCAL_CONHECIMENTOFRETENAOINCLUSO_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    