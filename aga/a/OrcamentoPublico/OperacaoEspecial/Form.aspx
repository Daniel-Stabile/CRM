<%@ Page Title="Operação especial" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMOP_OPERACAOESPECIAL" class="active"><a data-toggle="tab" href="#tabFORMOP_OPERACAOESPECIAL">Operação especial</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AES"><a data-toggle="tab" href="#tabAES">Ações Orçamentárias</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEISPELAUNIDADE"><a data-toggle="tab" href="#tabRESPONSVEISPELAUNIDADE">Responsáveis pela Unidade</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabFORMOP_OPERACAOESPECIAL">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMOP_OPERACAOESPECIAL" Title="Operação especial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_OPERACAOESPECIAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_OPERACAOESPECIAL_FORM" Level="20" Order="100"  /></div>
      </div>
      <div class="tab-pane" id="tabAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AES" Title="Ações Orçamentárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_OPERACAOESPECIAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPROJETOSOPERACAOESPECIAL.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.OPERACAOESPECIAL = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/AcoesOperacao/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_OPERACAOESPECIAL_FORM" Level="20" Order="110"  /></div>
      </div>
      <div class="tab-pane" id="tabRESPONSVEISPELAUNIDADE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEISPELAUNIDADE" Title="Responsáveis pela Unidade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_OPERACAOESPECIAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_RESPONSAVEISUNIDADE.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OPERACAOESPECIAL = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ResponsaveisUnidade/OperacaoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_OPERACAOESPECIAL_FORM" Level="20" Order="120"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    