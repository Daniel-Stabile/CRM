<%@ Page Title="TAREFAS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="TAREFA" Title="Tarefa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAS.CRONOGRAMA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TAREFA_CRONOGRAMA" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PRECEDNCIA" class="active"><a data-toggle="tab" href="#tabPRECEDNCIA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Precedências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECURSO"><a data-toggle="tab" href="#tabRECURSO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recursos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARTICIPANTES"><a data-toggle="tab" href="#tabPARTICIPANTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Participantes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="APONTAMENTOS"><a data-toggle="tab" href="#tabAPONTAMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFASAGRUPADAS"><a data-toggle="tab" href="#tabTAREFASAGRUPADAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas agrupadas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPRECEDNCIA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PRECEDNCIA" Title="Precedências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAPRECEDENCIAS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOTAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Precedencia.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TAREFA_CRONOGRAMA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabRECURSO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECURSO" Title="Recursos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFARECURSOS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOTAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/RecursoTarefa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TAREFA_CRONOGRAMA" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabPARTICIPANTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PARTICIPANTES" Title="Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAPARTICIPANTES.CADASTRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOTAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/ParticipanteTarefa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TAREFA_CRONOGRAMA" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabAPONTAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="APONTAMENTOS" Title="Apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFASAPONTAMENTOS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TAREFA = @CAMPO(HANDLE)" FormUrl="~/aga/a/projetos/Apontamento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TAREFA_CRONOGRAMA" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFASAGRUPADAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFASAGRUPADAS" Title="Tarefas agrupadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TAREFA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GP_PROJETOTAREFAS.GESTAO.AGRUPADAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TAREFAPAI = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="TAREFA_CRONOGRAMA" Level="20" Order="60"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    