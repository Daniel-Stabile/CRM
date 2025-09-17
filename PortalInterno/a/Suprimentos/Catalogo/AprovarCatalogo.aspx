<%@ Page Title="Aprovação de catálogo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APROVARCATLOGOS" Title="Aprovar Catálogos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_APROVAR_CATALOGOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(
    A.LIBERADO = 'S'
    OR A.LIBERADO IS NULL
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
)" FormUrl="~/PortalInterno/e/Suprimentos/Catalogo/VisualizarCatalogo.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_INT_APROVAR_CATALOGO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    