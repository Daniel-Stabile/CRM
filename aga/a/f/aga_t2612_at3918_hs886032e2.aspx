<%@ Page Title="Tabelas auxiliares - Implementos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Implementos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_VEICULOCARROCARIAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__CARROCARIAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3921" class="active"><a data-toggle="tab" href="#tabWIDGET_3921"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Conjuntos mecânicos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1188_4186"><a data-toggle="tab" href="#tabWIDGET_1188_4186"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de manutenções preventivas&gt;Ativas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1188_4187"><a data-toggle="tab" href="#tabWIDGET_1188_4187"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de manutenções preventivas&gt;Não utilizadas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3921">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3921" Title="Conjuntos mecânicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_MF_CARROCARIAPARTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CARROCARIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2615_at3921_hs5e068d00.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__CARROCARIAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1188_4186">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1188_4186" Title="Roteiros de manutenções preventivas&gt;Ativas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ATIVO = 'S' AND (A.CARROCARIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at4186_hs247145cf.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__CARROCARIAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1188_4187">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1188_4187" Title="Roteiros de manutenções preventivas&gt;Não utilizadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(ATIVO = 'N' OR ATIVO IS NULL) AND (A.CARROCARIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at4187_hs3e73bdfd.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__CARROCARIAS_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    