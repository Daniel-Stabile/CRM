<%@ Page Title="Consultar solicitações" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Suprimentos.Solicitacoes.ConsultarSolicitacoes,Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>



<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">


    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    Title="Cadastro >> Cadastro de solicitações"
                    ID="TITULO" />
            </div>

            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="PORCAPA"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_INT_CONSULTAR_SOLICITACOESCAPA.GRID"
                    UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA AND A.FILIAL IN @FILIAIS AND (A.SOLICITANTE = @USUARIO OR (SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZARSOLICITACAOTODOSUSUARIOS') IN @TAREFAS)"
                    Title=""
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="True"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="10"
                    Mode="Selectable"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    FormUrl="~/PortalInterno/e/Suprimentos/Solicitacao/VisualizarSolicitacao.aspx"
                    ChromeState="Normal"/>
            </div>
        </div>
    </div>
</asp:Content>
