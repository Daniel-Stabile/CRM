<%@ Page Title="Responder Questionário" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FILTRO->QUESTIONARIO_GRID", "FILTRO", "QUESTIONARIO_GRID");
            AddWebPartStaticConnection("QUESTIONARIO_GRID->QUESTIONARIOQUESTAO_GRID", "QUESTIONARIO_GRID", "QUESTIONARIOQUESTAO_GRID");
            AddWebPartStaticConnection("QUESTIONARIOQUESTAO_GRID->RESPOSTAS_FORM", "QUESTIONARIOQUESTAO_GRID", "RESPOSTAS_FORM");
            AddWebPartStaticConnection("RESPOSTAS_FORM->ANEXOS_GRID", "RESPOSTAS_FORM", "ANEXOS_GRID");
        }
       
        protected override void OnInit(EventArgs e)
        {
            var statusAdapter = new Benner.Corporativo.Wes.WebApp.GridCellStatusAdapter(QUESTIONARIO_GRID, "STATUS");
            statusAdapter.StatusList["Pendente na web"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Warning;
            statusAdapter.StatusList["Aguardando liberação"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Primary;
            statusAdapter.StatusList["Liberada"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Success;
            statusAdapter.StatusList["Reprovada"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Danger;
            statusAdapter.StatusList["Reenviada web"] = Benner.Corporativo.Wes.WebApp.LabelClasses.Warning;

            AddCellAdapter(statusAdapter);

            base.OnInit(e);
        }                                                                                                                                                                                                                                                                                                              
    </script>

    <div class="row">
        <erp:ErpFilterForm runat="server"
            ID="FILTRO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_WEB_FILTRO_QUESTIONARIOS.FORM"
            Title="Filtro"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCriteriaWhereClause=""
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>


    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="QUESTIONARIO_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_QL_RESPOSTASFORNECEDOR.GRID"
            Title="Questionários"
            UserDefinedCriteriaWhereClause="A.ORIGEM = 1 AND @WHERECLAUSE"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="CompanyAndBranch"
            DisplayRowCommand="True"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="5"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>


    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="QUESTIONARIOQUESTAO_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_QL_APLICACAOQUESTIONARIOFORNEC.GRID"
            UserDefinedCriteriaWhereClause="A.RESPOSTAFORNECEDOR = @CAMPO(HANDLE)"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Questões"
            ChromeState="Normal"
            PageWidgetHandle="2" />
    </div>

    <erp:ErpTabControl runat="server" ID="TABS" ShowBorder="true">
        <erp:ErpTab runat="server" ID="TAB_RESPOSTAS" Text="Respostas">
            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="RESPOSTAS_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_QL_APLICACAOQUESTIONARIOFORNEC.FORM"
                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="False"
                    CanUpdate="True"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Resposta"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="TAB_ANEXOS" Text="Anexos">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="ANEXOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_QL_RESPOSTAANEXO.GRID"
                    Title="Anexos"
                    UserDefinedCriteriaWhereClause="A.APLICACAOQUESTIONARIO = @CAMPO(HANDLE) AND A.RESPOSTAFORNECEDOR = @CAMPO(RESPOSTAFORNECEDOR)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    UserDefinedPageSize="10"
                    CanInsert="True"
                    CanUpdate="False"
                    CanDelete="True"
                    ShowTitle="False"
                    FormUrl="IncluirAnexos.aspx"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>
    </erp:ErpTabControl>
</asp:Content>
