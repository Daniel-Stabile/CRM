<%@ Page Title="Tabelas auxiliares - Tipos de implemento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Tipos de implemento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_PARTESEQUIPAMENTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__TIPOS_DE_IMPLEMENTO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3961" class="active"><a data-toggle="tab" href="#tabWIDGET_3961"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Campos adicionais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7005"><a data-toggle="tab" href="#tabWIDGET_7005"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de lubrificações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6945"><a data-toggle="tab" href="#tabWIDGET_6945"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de manutenções preventivas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1196_4186"><a data-toggle="tab" href="#tabWIDGET_1196_4186"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de manutenções preventivas&gt;Ativas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1196_4187"><a data-toggle="tab" href="#tabWIDGET_1196_4187"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de manutenções preventivas&gt;Não utilizadas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3961">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3961" Title="Campos adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_MF_PARTEEQUIPAMENTOCONTROLES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOPARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2635_at3961_hsb910edca.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOS_DE_IMPLEMENTO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7005">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7005" Title="Roteiros de lubrificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="MANUTENCAO IN (SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARPLANOLUBRIFICACAO = 'S') AND (A.PARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at7005_hs3cf45dd9.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOS_DE_IMPLEMENTO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6945">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6945" Title="Roteiros de manutenções preventivas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="MANUTENCAO IN (SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZAPLANOPREVENTIVO = 'S') AND (A.PARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at6945_hs9f4c2ff6.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOS_DE_IMPLEMENTO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1196_4186">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1196_4186" Title="Roteiros de manutenções preventivas&gt;Ativas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ATIVO = 'S' AND (A.PARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at4186_hs247145cf.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOS_DE_IMPLEMENTO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1196_4187">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1196_4187" Title="Roteiros de manutenções preventivas&gt;Não utilizadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(ATIVO = 'N' OR ATIVO IS NULL) AND (A.PARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at4187_hs3e73bdfd.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOS_DE_IMPLEMENTO_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    