<%@ Page Title="LOA" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOA" class="active"><a data-toggle="tab" href="#tabLOA">LOA</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEIS"><a data-toggle="tab" href="#tabRESPONSVEIS">Responsáveis</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="VERSES"><a data-toggle="tab" href="#tabVERSES">Versões</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROJETOSORAMENTRIOS"><a data-toggle="tab" href="#tabPROJETOSORAMENTRIOS">Projetos Orçamentários</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PLANOSESTRATGICOS"><a data-toggle="tab" href="#tabPLANOSESTRATGICOS">Planos Estratégicos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EXECUOECONTROLE"><a data-toggle="tab" href="#tabEXECUOECONTROLE">Execução e Controle</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="JULGAMENTOS"><a data-toggle="tab" href="#tabJULGAMENTOS">Julgamentos</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabLOA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="LOA" Title="LOA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_PLANEJAMENTO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ANEXOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/Anexos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEIS" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_RESPONSAVEISUNIDADE.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ResponsaveisUnidade/ProjetoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabVERSES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="VERSES" Title="Versões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOA" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="OP_VERSOESPLANEJAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/VersoesPlanejamentos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabPROJETOSORAMENTRIOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROJETOSORAMENTRIOS" Title="Projetos Orçamentários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_PROJETOSETAPAS_OP_PROJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTO = @CAMPO(HANDLE) AND A.PROJETOORCAMENTARIO IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/ProjetosEtapas/ProjetoOrcamentario.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabPLANOSESTRATGICOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PLANOSESTRATGICOS" Title="Planos Estratégicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_PROJETOSETAPAS_GP_PROJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTO = @CAMPO(HANDLE) AND A.PROJETOESTRATEGICO IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/ProjetosEtapas/ProjetoEstrategico.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabEXECUOECONTROLE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EXECUOECONTROLE" Title="Execução e Controle" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_VERSOESORCAMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT B.VERSAO FROM OP_VERSOESPLANEJAMENTOS B WHERE PLANEJAMENTO = @CAMPO(HANDLE) )" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="60"  />
    <wes:AjaxForm runat="server" ID="VERSO" Title="Versão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="EXECUOECONTROLE" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_VERSOESORCAMENTOS.EMEXECUCAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabJULGAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="JULGAMENTOS" Title="Julgamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LOA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_JULGAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTO = @CAMPO(HANDLE) AND A.CATEGORIA = @CAMPO(CATEGORIA)" FormUrl="~/aga/a/OrcamentoPublico/Julgamentos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_LOA" Level="20" Order="80"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    