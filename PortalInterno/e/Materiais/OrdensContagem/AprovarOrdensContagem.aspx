<%@ Page Title="Aprovar ordens de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="TITULOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_ORDENSCONTAGEM.GRID"
            Title="Ordens de contagem >> Aprovação de ordens de contagem"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="True"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            DefaultFilterName="Filtrar por"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            UserDefinedCriteriaWhereClause=" (((A.STATUS = 2) AND (A.LIBERADA = 'S')) AND (((A.GRUPOASSINATURAS IN (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B, CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA >= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA <> 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')) OR (A.GRUPOASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND ((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA >= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 'S'))))) AND A.FILIAL IN @FILIAIS"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Materiais/OrdensContagem/AprovarOrdemContagem.aspx" />
    </div>
</asp:Content>
