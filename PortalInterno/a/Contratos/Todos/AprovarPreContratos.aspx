<%@ Page Title="Aprovação de pré-contrato" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APROVAODEPRCONTRATO" Title="Aprovação de pré-contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PORTAL_INT_APROVAR_PRECONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2 AND ((((SELECT TIPO FROM CN_TIPOSCONTRATOS WHERE HANDLE = A.TIPOCONTRATO) = 2) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_PRECONTRATO_FATURAMENTO') IN @TAREFAS)) OR (((SELECT TIPO FROM CN_TIPOSCONTRATOS WHERE HANDLE = A.TIPOCONTRATO) = 4) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_PRECONTRATO_PERMUTA') IN @TAREFAS)))" FormUrl="~/PortalInterno/a/Contratos/Todos/VisualizarPreContratos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALINTERNO_APROVAR__PRECONTRATO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    