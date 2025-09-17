<%@ Page Title="Aprovar requisições" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.PortalInterno.Requisicoes.AprovarRequisicoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WIDGETID_635756866430259239" Title="Requisições&gt;&gt; listagem para aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_SUP_REQUISICOES_LISTAGEMAPROVACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
           A.LIBERADA = 'S'
           OR A.LIBERADA IS NULL
       )
       AND
       (
           A.STATUS IN(1)
       )
       AND
       (
           (
               A.GRUPODEASSINATURAS IS NULL
               AND A.CONFIRMANTE = @USUARIO
           )
           OR
           (
               A.GRUPODEASSINATURAS IN(SELECT C.HANDLE
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
               A.GRUPODEASSINATURAS IN (SELECT D.GRUPO
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
           OR
           (
               A.GRUPODEASSINATURAS IS NULL
               AND A.CONFIRMANTE IN (SELECT D.USUARIO
                                       FROM CP_GRUPOALCADASUSUARIOS D,
                                            CP_GRUPOALCADASINTEGRANTES I,
                                            CP_GRUPOALCADAS G
                                      WHERE D.GRUPO = G.HANDLE
                                            AND I.GRUPO = G.HANDLE
                                            AND I.HANDLE = D.INTEGRANTE
                                            AND D.USUARIOAUTORIZADO = @USUARIO
                                            AND I.USUARIO = D.USUARIO
                                            AND D.ATIVO = 'S'
                                            AND I.ATIVO = 'S'
                                            AND I.AUSENTE = 'S'
                                    )
           )
           OR
           (
               @USUARIO IN (SELECT B.USUARIO
                              FROM PD_ASSINATURAS B,
                                   CP_GRUPOALCADASINTEGRANTES C,
                                   CP_GRUPOALCADAS D
                             WHERE B.REQUISICAOPAI = A.HANDLE
                                   AND C.GRUPO = A.GRUPODEASSINATURAS
                                   AND D.HANDLE = C.GRUPO
                                   AND
                                   (
                                       (
                                           D.EHHIERARQUIA = 'S'
                                           AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA
                                       )
                                       OR
                                       (
                                           D.EHHIERARQUIA &lt;&gt; 'S'
                                           AND B.SEQUENCIA = A.SEQUENCIAALCADA
                                       )
                                   )
                                   AND C.ATIVO = 'S'
                                   AND C.AUSENTE = 'N'
                                   AND C.TABTIPO = 2
                           )
           )
           OR
           (
               @USUARIO IN (SELECT B.USUARIO
                              FROM GN_PLANOHIERARQUIAUSUARIOS B,
                                   GN_PLANOHIERARQUIAINTEGRANTES C,
                                   PD_ASSINATURAS D,
                                   CP_GRUPOALCADASINTEGRANTES E,
                                   CP_GRUPOALCADAS F
                             WHERE C.HANDLE = B.INTEGRANTE
                                   AND
                                   (
                                       D.REQUISICAOPAI = A.HANDLE
                                       AND D.USUARIO = C.USUARIO
                                   )
                                   AND E.GRUPO = A.GRUPODEASSINATURAS
                                   AND F.HANDLE = E.GRUPO
                                   AND
                                   (
                                       (
                                           F.EHHIERARQUIA = 'S'
                                           AND D.SEQUENCIA &gt;= A.SEQUENCIAALCADA
                                       )
                                       OR
                                       (
                                           F.EHHIERARQUIA &lt;&gt; 'S'
                                           AND D.SEQUENCIA = A.SEQUENCIAALCADA
                                       )
                                   )
                                   AND E.TABTIPO = 2
                                   AND C.AUSENTE = 'S'
                                   AND B.ATIVO = 'S'
                           )
           )
       )" FormUrl="~/PortalInterno/e/Suprimentos/Requisicoes/AprovarRequisicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="SUP_REQ_APROVARREQUISICOES" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    