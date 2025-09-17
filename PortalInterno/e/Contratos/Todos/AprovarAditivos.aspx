<%@ Page Title="Aprovar aditivos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
            <wes:SimpleGrid runat="server"
                ID="ADITIVOS"
                SystemInstanceName="CORPORATIVO"
                EntityViewName="PORTAL_INT_APROVAR_ADITIVOS.GRID"
                Title="APROVAÇÕES DE ADITIVOS DE CONTRATOS"
                UserDefinedDisableRowSelection="False"
                UserDefinedCommandsVisible="True"
                UserDefinedSelectColumnVisible="True"
                HideDeveloperCommands="False"
                CompanyFilterMode="None"
                DisplayRowCommand="False"
                DefaultFilterName=""
                SystemFilterOnly="True"
                UserDefinedPageSize="10"
                UserDefinedCriteriaWhereClause=" (((A.STATUS = 2) AND ((A.ALCADA IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B, CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA >= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA <> 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')) OR (A.ALCADA IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND ((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA >= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 'S')))) AND (A.HANDLE IN (SELECT CN_CONTRATOADITIVOS.HANDLE FROM CN_CONTRATOADITIVOS
JOIN CN_CONTRATOS ON CN_CONTRATOS.HANDLE = CN_CONTRATOADITIVOS.CONTRATO
JOIN CN_TIPOSCONTRATOS ON CN_TIPOSCONTRATOS.HANDLE = CN_CONTRATOS.TIPOCONTRATO
WHERE ((CN_TIPOSCONTRATOS.TIPO = 1) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_ADITIVO_CONTRATO_COMPRAS') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 2) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_ADITIVO_CONTRATO_FATURAMENTO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 3) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_ADITIVO_CONTRATO_CONVENIO') IN @TAREFAS))
OR ((CN_TIPOSCONTRATOS.TIPO = 4) AND ((SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZAR_APROVACAO_ADITIVO_CONTRATO_PERMUTA') IN @TAREFAS))))) "
                Mode="Selectable"
                CanInsert="False"
                CanUpdate="False"
                CanDelete="False"
                ShowTitle="True"
                ChromeState="Normal"
                PageWidgetHandle="1"
                FormUrl="~/PortalInterno/e/Contratos/Todos/VisualizarAprovarAditivo.aspx" />
    </div>
</asp:Content>
