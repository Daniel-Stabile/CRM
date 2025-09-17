<%@ Page Title="R-1070 - Tabelas de Processos Administrativos/Judiciais" Language="C#" Inherits="PortalReinf.a.Registro.Cadastro.R1070Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="REINF_REGISTRO_R1070_FORM" Title="R-1070 - Tabela de Processos Administrativos/Judiciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R1070.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R1070_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SUSPENSES" class="active"><a data-toggle="tab" href="#tabSUSPENSES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Suspensões")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabSUSPENSES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SUSPENSES" Title="Suspensões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REINF_REGISTRO_R1070_FORM" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_SUSPENSAOEXIGIBILIDADE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R1070 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Suspensao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R1070_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    