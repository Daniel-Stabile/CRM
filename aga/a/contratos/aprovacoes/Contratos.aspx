<%@ Page Title="Contratos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.ContratoAprovacoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APROVAES" Title="Aprovações de contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.APROVACOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 1 AND A.LIBERADO = 'S' AND A.HANDLE IN (SELECT CN_CONTRATOS.HANDLE FROM CN_CONTRATOS
JOIN CN_TIPOSCONTRATOS ON CN_TIPOSCONTRATOS.HANDLE = CN_CONTRATOS.TIPOCONTRATO
WHERE ((CN_TIPOSCONTRATOS.TIPO = 1) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_CONTRATO_COMPRA') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 2) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_CONTRATO_FATURAMENTO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 3) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_CONTRATO_CONVENIO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 4) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_CONTRATO_PERMUTA') IN @TAREFAS)))
AND A.GRUPODEASSINATURAS IN(SELECT C.HANDLE
                                           FROM   CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                           WHERE  B.GRUPO = C.HANDLE
                                                  AND
                           ( ( C.EHHIERARQUIA = 'S'
                               AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA )
                              OR ( C.EHHIERARQUIA &lt;&gt; 'S'
                                   AND B.SEQUENCIA = A.SEQUENCIAALCADA ) )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S')" FormUrl="~/aga/a/contratos/aprovacoes/formulario/Contratos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APROVACOES_CONTRATOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    