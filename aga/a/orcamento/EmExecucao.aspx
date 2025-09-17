<%@ Page Title="Em execução" Language="C#" Inherits="aga.a.orcamento.OrcamentoEmExecucao,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ORAMENTOSEMEXECUO" Title="ORÇAMENTOS EM EXECUÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_VERSOESORCAMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ESTADO = 'X'" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMEXECUCAO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="DETALHE" Title="Detalhe" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORAMENTOSEMEXECUO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_VERSOESORCAMENTOS.EMEXECUCAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTO_EMEXECUCAO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    