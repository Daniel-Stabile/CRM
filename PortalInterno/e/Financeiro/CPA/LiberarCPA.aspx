<%@ Page Title="Liberar parcelas" Language="C#" AutoEventWireup="true" Inherits="PortalInterno.Financeiro.PortalInternoFinanceiroLiberarCPAPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="GridListagemCPA"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CONTAS_PAGAR_LISTAGEMAPROVACAOPARCELA.GRID"
            Title="Liberação AP"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="True"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            HideDeveloperCommands="True"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            UserDefinedCriteriaWhereClause= "A.EMPRESA = @EMPRESA AND A.PAGAMENTOSUSPENSO = 'S' AND A.STATUSLIBERACAO = 2 AND ((A.GRUPOASSINATURALIBERACAO IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B, CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA >= A.SEQUENCIAALCADALIBERACAO) OR (C.EHHIERARQUIA <> 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADALIBERACAO)) AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')) OR (A.GRUPOASSINATURALIBERACAO IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND ((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA >= A.SEQUENCIAALCADALIBERACAO) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADALIBERACAO)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 'S')))"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Financeiro/CPA/LiberarCPAVisualizar.aspx?hdl=@CAMPO(HANDLE)" />
    </div>
</asp:Content>
