<%@ Page Title="Projeto" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROJETO" class="active"><a data-toggle="tab" href="#tabPROJETO">Projeto</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARTICIPANTES"><a data-toggle="tab" href="#tabPARTICIPANTES">Participantes</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabPROJETO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PROJETO" Title="Projeto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOSKANBAN.PROJETO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PROJETO_KANBAN" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabPARTICIPANTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PARTICIPANTES" Title="Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PARTICIPANTESKANBAN.PROJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOKANBAN = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Kanban/Participante.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PROJETO_KANBAN" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROJETO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_ANEXOSKANBAN.PROJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETOKANBAN = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/Kanban/Anexo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PROJETO_KANBAN" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    