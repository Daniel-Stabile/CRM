<%@ Page Title="Projeto" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.Projeto" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROJETO" class="active"><a data-toggle="tab" href="#tabPROJETO">Projeto</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECURSOS"><a data-toggle="tab" href="#tabRECURSOS">Recursos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFAS"><a data-toggle="tab" href="#tabTAREFAS">Tarefas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARTICIPANTES"><a data-toggle="tab" href="#tabPARTICIPANTES">Participantes</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="STAKEHOLDERS"><a data-toggle="tab" href="#tabSTAKEHOLDERS">Stakeholders</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLIENTESALVOS"><a data-toggle="tab" href="#tabCLIENTESALVOS">Clientes-alvos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ATRIBUTOS"><a data-toggle="tab" href="#tabATRIBUTOS">Atributos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANLISECRTICA"><a data-toggle="tab" href="#tabANLISECRTICA">Análise Crítica</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDICADORES"><a data-toggle="tab" href="#tabINDICADORES">Indicadores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LINHADEBASE"><a data-toggle="tab" href="#tabLINHADEBASE">Linha de base</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AESORAMENTRIAS"><a data-toggle="tab" href="#tabAESORAMENTRIAS">Ações Orçamentárias</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabPROJETO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PROJETO" Title="Projeto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOS.GESTAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CADASTRO_PROJETO" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabRECURSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECURSOS" Title="Recursos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETORECURSOS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Recurso.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="250" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Tarefa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabPARTICIPANTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PARTICIPANTES" Title="Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOPARTICIPANTES.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Participante.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabSTAKEHOLDERS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="STAKEHOLDERS" Title="Stakeholders" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOSTAKEHOLDERS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Stakeholder.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabCLIENTESALVOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLIENTESALVOS" Title="Clientes-alvos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOCLIENTES.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Cliente.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOANEXOS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Anexo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabATRIBUTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ATRIBUTOS" Title="Atributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOATRIBUTOS.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Atributos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabANLISECRTICA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANLISECRTICA" Title="Análise Crítica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOANALISESCRITICA.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO=@CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/AnalisesCriticas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabINDICADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INDICADORES" Title="Indicadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GP_PROJETOINDICADORES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="CADASTRO_PROJETO" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabLINHADEBASE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LINHADEBASE" Title="Linha de base" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GP_PROJETOLINHASBASE.GESTAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabAESORAMENTRIAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AESORAMENTRIAS" Title="Ações Orçamentárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_PERIODOGESTESTRATEGICA_EM_GP_PROJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.PROJETO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO=@CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/AssinaturasProjeto.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CADASTRO_PROJETO" Level="20" Order="150"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    