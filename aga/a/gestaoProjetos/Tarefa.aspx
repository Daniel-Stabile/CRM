<%@ Page Title="Tarefa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="TAREFA" Title="Tarefa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAS.GESTAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PROJETO_GESTAO_TAREFA" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PRECEDNCIAS" class="active"><a data-toggle="tab" href="#tabPRECEDNCIAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Precedências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECURSOS"><a data-toggle="tab" href="#tabRECURSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recursos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARTICIPANTES"><a data-toggle="tab" href="#tabPARTICIPANTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Participantes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="APONTAMENTOS"><a data-toggle="tab" href="#tabAPONTAMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPRECEDNCIAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PRECEDNCIAS" Title="Precedências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAPRECEDENCIAS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOTAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Precedencia.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PROJETO_GESTAO_TAREFA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabRECURSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECURSOS" Title="Recursos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFARECURSOS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOTAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/RecursoTarefa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PROJETO_GESTAO_TAREFA" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabPARTICIPANTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PARTICIPANTES" Title="Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAPARTICIPANTES.CADASTRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOTAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/ParticipanteTarefa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PROJETO_GESTAO_TAREFA" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabAPONTAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="APONTAMENTOS" Title="Apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFASAPONTAMENTOS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/projetos/Apontamento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PROJETO_GESTAO_TAREFA" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    