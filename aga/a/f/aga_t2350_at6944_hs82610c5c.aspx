<%@ Page Title="Roteiros de manutenção - Plano de manutenção preventiva" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Roteiros de manutenção - Plano de manutenção preventiva" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_ROTEIROMANUTENCAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_ROTEIRODEMANUTENCAO__PLANO_DE_MANUTENCAO_PREVENTIVA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7067" class="active"><a data-toggle="tab" href="#tabWIDGET_7067"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Materiais/Serviços externos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7001"><a data-toggle="tab" href="#tabWIDGET_7001"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Serviços internos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7067">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7067" Title="Materiais/Serviços externos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_MF_ROTEIROETAPAEXTERNA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ROTEIRO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4689_at7067_hsf8b802ab.aspx" UserDefinedDisableRowSelection="False" PageId="MF_ROTEIRODEMANUTENCAO__PLANO_DE_MANUTENCAO_PREVENTIVA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7001">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7001" Title="Serviços internos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MA_ROTEIROMANUTENCAOETAPAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ROTEIROMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2352_at7001_hs3217e861.aspx" UserDefinedDisableRowSelection="False" PageId="MF_ROTEIRODEMANUTENCAO__PLANO_DE_MANUTENCAO_PREVENTIVA_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    