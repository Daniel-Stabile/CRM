<%@ Page Title="Aprovação de solicitações" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APROVARSOLICITAES" Title="Aprovar solicitações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_APROVAR_SOLICITACOES_ALCADA.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
    A.LIBERADA = 'S'
)
AND
(
    A.STATUS IN(1)
)
AND
(
    (
        A.GRUPOASSINATURAS IS NULL
        AND A.CONFIRMANTE = @USUARIO
        OR A.CONFIRMANTE IN (SELECT USUARIO FROM Z_WFUSUARIOSUBSTITUTOS
              WHERE SUBSTITUTO = @USUARIO
              AND @AGORA BETWEEN INICIO AND TERMINO)
    )
    OR
    (
        A.GRUPOASSINATURAS IN (SELECT C.HANDLE
                                   FROM CP_GRUPOALCADASINTEGRANTES B,
                                        CP_GRUPOALCADAS C
                                  WHERE B.GRUPO = C.HANDLE
                                        AND
                                        (
                                            (
                                                C.EHHIERARQUIA = 'S'
                                                AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA
                                            )
                                            OR
                                            (
                                                C.EHHIERARQUIA &lt;&gt; 'S'
                                                AND B.SEQUENCIA = A.SEQUENCIAALCADA
                                            )
                                        )
                                        AND B.USUARIO = @USUARIO
                                        AND B.ATIVO = 'S'
                                )
    )
    OR
    (
        A.GRUPOASSINATURAS IN (SELECT D.GRUPO
                                   FROM CP_GRUPOALCADASUSUARIOS D,
                                        CP_GRUPOALCADASINTEGRANTES I,
                                        CP_GRUPOALCADAS G
                                  WHERE D.GRUPO = G.HANDLE
                                        AND I.GRUPO = G.HANDLE
                                        AND I.HANDLE = D.INTEGRANTE
                                        AND
                                        (
                                            (
                                                G.EHHIERARQUIA = 'S'
                                                AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA
                                            )
                                            OR
                                            (
                                                G.EHHIERARQUIA = 'N'
                                                AND I.SEQUENCIA = A.SEQUENCIAALCADA
                                            )
                                        )
                                        AND D.USUARIOAUTORIZADO = @USUARIO
                                        AND I.USUARIO = D.USUARIO
                                        AND D.ATIVO = 'S'
                                        AND I.ATIVO = 'S'
                                        AND I.AUSENTE = 'S'
                                )
    )
)" FormUrl="~/PortalInterno/e/Suprimentos/Solicitacao/ConsultarCapaSolicitacao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_APROVARSOLICITACOES_ALCADA" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    