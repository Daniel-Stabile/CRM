<%@ Page Title="Apontamentos/medições" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.apontamento.AdicionarBadgesStatusApontamento" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APONTAMENTOSMEDIES" Title="Apontamentos/medições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_APONTAMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CN_APONTAMENTOS.HANDLE FROM CN_APONTAMENTOS
JOIN CN_CONTRATOS ON CN_CONTRATOS.HANDLE = CN_APONTAMENTOS.CONTRATO
JOIN CN_TIPOSCONTRATOS ON CN_TIPOSCONTRATOS.HANDLE = CN_CONTRATOS.TIPOCONTRATO
WHERE ((CN_TIPOSCONTRATOS.TIPO = 1) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APONTAMENTOS_MEDICOES_COMPRAS') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 2) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APONTAMENTOS_MEDICOES_FATURAMENTO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 3) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APONTAMENTOS_MEDICOES_CONVENIO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 4) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APONTAMENTOS_MEDICOES_PERMUTA') IN @TAREFAS)))" FormUrl="~/aga/a/f/aga_t2184_at2741_hs6da50108.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_APONTAMENTOS_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    