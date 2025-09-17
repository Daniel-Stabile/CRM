<%@ Page Title="Processos de retenções" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMREINF_R1070" Title="Processos de retenções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R1070.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_REINFR1070_FORM" Level="20" Order="100"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DADOSDOPROCESSO" class="active"><a data-toggle="tab" href="#tabDADOSDOPROCESSO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Dados do processo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IMPOSTOS"><a data-toggle="tab" href="#tabIMPOSTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PESSOAS"><a data-toggle="tab" href="#tabPESSOAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabDADOSDOPROCESSO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DADOSDOPROCESSO" Title="Dados do processo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMREINF_R1070" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_REINF_SUSPENSAOEXIGIBILIDADE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R1070 = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/ReinfSuspensaoexigibilidade/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_REINFR1070_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabIMPOSTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IMPOSTOS" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMREINF_R1070" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_REINF_PROCESSORETENCAOIMPOSTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R1070 = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/ReinfProcessoretencaoimpostos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_REINFR1070_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabPESSOAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PESSOAS" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMREINF_R1070" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_REINF_PROCESSORETENCAOPESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R1070 = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/ReinfProcessoretencaopessoas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_REINFR1070_FORM" Level="20" Order="130"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    