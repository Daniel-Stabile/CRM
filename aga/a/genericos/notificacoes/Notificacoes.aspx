<%@ Page Title="Notificações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="NOTIFICAES" Title="Notificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_NOTIFICACOES.NOTIFICACOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.USUARIO = @USUARIO AND A.TIPONOTIFICACAO NOT IN 
(SELECT TIPONOTIFICACAO FROM GN_TIPONOTIFICACAOUSUARIOS WHERE USUARIO = @USUARIO)
AND A.TIPONOTIFICACAOTAREFA IN 
(SELECT HANDLE FROM GN_TIPONOTIFICACAOTAREFAS WHERE NOMETAREFA IN
(SELECT NOME FROM Z_TAREFAS WHERE HANDLE IN @TAREFAS))" FormUrl="~/AccessDenied.aspx" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_GENERICOS_NOTIFICACOES_NOTIFICACOES" Level="20" Order="10"  />
        </div>
    
        <style>
              .iconeGridNotificacoes .label.label-icon {
    padding-right: 4px;
}

              </style>
      </asp:Content>
    