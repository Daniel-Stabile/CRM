<%@ Page Title="Apontamento tarefa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="APONTAMENTOTAREFA" Title="Apontamento tarefa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_TAREFAAPONTAMENTOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TAREFAAPONTAMENTO_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ATRIBUTOSDATAREFA" Title="Atributos da Tarefa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="APONTAMENTOTAREFA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_TAREFAAPONTAMENTOATRIBUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TAREFAAPONTAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrdemProducaoApontamento/TarefaApontamentoAtributos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TAREFAAPONTAMENTO_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    