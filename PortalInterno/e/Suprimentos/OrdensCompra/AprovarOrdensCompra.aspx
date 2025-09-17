<%@ Page Title="Aprovar ordens de compra" Language="C#" AutoEventWireup="true"
    Inherits="Benner.Corporativo.Wes.WebApp.PortalInterno.OrdensCompra.AprovarOrdensCompra" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="TITULOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_ORDENS_COMPRA_APROVAR.GRID"
            Title="Ordens de compra >> Aprovar ordens de compra"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="True"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
			Mode="Search"
            SystemFilterOnly="False"
            UserDefinedPageSize="10"
            UserDefinedCriteriaWhereClause=" ((A.LIBERADA = 'S' OR A.LIBERADA IS NULL) AND (A.STATUS IN(1, 7)) AND ((A.GRUPODEASSINATURAS IS NULL AND A.CONFIRMANTE = @USUARIO) OR (SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VSUALIZAR_OREDENSDECOMPRA_TODOSUSUARIOS') IN @TAREFAS OR (A.GRUPODEASSINATURAS IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B, CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA >= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA <> 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND (B.USUARIO = @USUARIO) AND B.ATIVO = 'S')) OR (A.GRUPODEASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND ((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA >= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 'S')))) AND (A.FILIAL IN @FILIAIS) AND ((A.GRUPODEASSINATURAS IS NULL 
                 AND A.CONFIRMANTE = @USUARIO ) 
                OR ( A.GRUPODEASSINATURAS IN(SELECT C.HANDLE 
                                             FROM 
                     CP_GRUPOALCADASINTEGRANTES B, 
         CP_GRUPOALCADAS C 
                                 WHERE  B.GRUPO = C.HANDLE 
                                        AND ( ( C.EHHIERARQUIA = 'S' 
                                                AND B.SEQUENCIA >= 
                                                    A.SEQUENCIAALCADA ) 
                                               OR ( C.EHHIERARQUIA <> 'S' 
                                                    AND B.SEQUENCIA = 
                                                        A.SEQUENCIAALCADA 
                                                  ) 
                                            ) 
                                        AND B.USUARIO = @USUARIO 
                                        AND B.ATIVO = 'S') ) 
                OR ( A.GRUPODEASSINATURAS IN (SELECT D.GRUPO 
                                              FROM 
                     CP_GRUPOALCADASUSUARIOS D, 
                     CP_GRUPOALCADASINTEGRANTES I, 
                     CP_GRUPOALCADAS G 
                                              WHERE  D.GRUPO = G.HANDLE 
                                                     AND I.GRUPO = G.HANDLE 
                                                     AND I.HANDLE = D.INTEGRANTE 
                                                     AND ( ( G.EHHIERARQUIA = 
                                                             'S' 
                                                             AND I.SEQUENCIA >= 
A.SEQUENCIAALCADA ) 
OR ( G.EHHIERARQUIA = 'N' 
AND I.SEQUENCIA = 
    A.SEQUENCIAALCADA 
) ) 
AND D.USUARIOAUTORIZADO = @USUARIO 
AND I.USUARIO = D.USUARIO 
AND D.ATIVO = 'S' 
AND I.ATIVO = 'S' 
AND I.AUSENTE = 'S') ) ) "
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Suprimentos/OrdensCompra/AprovarOrdemCompra.aspx" />
    </div>
</asp:Content>
