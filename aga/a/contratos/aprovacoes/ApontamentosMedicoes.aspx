<%@ Page Title="Apontamentos/Medições" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APONTAMENTOSMEDIES" Title="Aprovações De Apontamentos/Medições De Contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_APONTAMENTOS.CONTRATOSAPROVACOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2 AND A.HANDLE IN (SELECT CN_APONTAMENTOS.HANDLE FROM CN_APONTAMENTOS
JOIN CN_CONTRATOS ON CN_CONTRATOS.HANDLE = CN_APONTAMENTOS.CONTRATO
JOIN CN_TIPOSCONTRATOS ON CN_TIPOSCONTRATOS.HANDLE = CN_CONTRATOS.TIPOCONTRATO
WHERE ((CN_TIPOSCONTRATOS.TIPO = 1) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_APONTAMENTOS_MEDICOES_COMPRAS') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 2) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_APONTAMENTOS_MEDICOES_FATURAMENTO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 3) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_APONTAMENTOS_MEDICOES_CONVENIO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 4) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_APONTAMENTOS_MEDICOES_PERMUTA') IN @TAREFAS))) 
AND A.GRUPOASSINATURAS IN(SELECT C.HANDLE
                                           FROM   CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                           WHERE  B.GRUPO = C.HANDLE
                                                  AND
                           ( ( C.EHHIERARQUIA = 'S'
                               AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA )
                              OR ( C.EHHIERARQUIA &lt;&gt; 'S'
                                   AND B.SEQUENCIA = A.SEQUENCIAALCADA ) )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S')" FormUrl="~/aga/a/contratos/aprovacoes/ApontamentosForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APROVACOES_APONTAMENTOSMEDICOES" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    