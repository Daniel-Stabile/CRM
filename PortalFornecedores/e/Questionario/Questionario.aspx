<%@ Page Title="Questionário" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_VIEW->RESUMO_COMANDOS", "RESUMO_VIEW", "RESUMO_COMANDOS");
            AddWebPartStaticConnection("RESUMO_VIEW->QUESTOES_GRID", "RESUMO_VIEW", "QUESTOES_GRID");
            AddWebPartStaticConnection("RESUMO_VIEW->QUESTOESPENDENTES_GRID", "RESUMO_VIEW", "QUESTOESPENDENTES_GRID");
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            var registro = RESUMO_VIEW.GetEntity();
            TITULO.Title = "Questionário " + registro["NUMERO"].GetString();
            TITULO.Description = registro["QUESTIONARIOQUALIFICACAO"].GetString();


            int status = registro["STATUS"].GetInt32();

            bool soLeitura = (status != 3) && (status != 7);

            QUESTOES_GRID.CanUpdate = !soLeitura;
            QUESTOESPENDENTES_GRID.CanUpdate = !soLeitura;

            RESUMO_VIEW.ForceUpdate();
            RESUMO_COMANDOS.ForceUpdate();

            QUESTOES_GRID.ForceUpdate();
            QUESTOESPENDENTES_GRID.ForceUpdate();

        }

        protected void RESUMO_VIEW_TranslateText(object sender, TranslateTextEventArgs e)
        {
            if (e.FieldDefinition.Name == "QUANTIDADEPONTOS")
            {
                bool exibirNota = e.Entity["EXIBIRNOTA"].GetBoolean();
                if (!exibirNota)
                    e.Text = "";                                
            }
            if (e.FieldDefinition.Name == "SITUACAO")
            {
                bool ReprovadoOuReprovado = (e.Entity["STATUS"].GetInt64() == 5 || e.Entity["STATUS"].GetInt64() == 6);
                if(!ReprovadoOuReprovado)
                {
                    e.Text = "";
                }
            }
        }
    </script>


    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" ID="TITULO" />
            </div>
            <div class="portlet-body">

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12   erp-unbox">
                        <div class="row">
                            
                            <wes:CommandsPanel runat="server"
                                ID="RESUMO_COMANDOS"
                                EntityViewName="PORTAL_FOR_QUESTIONARIO.FORM"
                                UserDefinedCommandsVisible="true"
                                SystemInstanceName="CORPORATIVO" />
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12   erp-unbox">

                        <div class="row">
                            
                            <erp:SimpleCardView
                                runat="server"
                                ID="RESUMO_VIEW"
                                EntityViewName="PORTAL_FOR_QUESTIONARIO.FORM"
                                DisplayLabels="True"
                                ColumnCount="1"
                                OnTranslateText="RESUMO_VIEW_TranslateText" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-7 col-md-7 col-sm-12 erp-unbox">

                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="QUESTOES_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_QUESTIONARIO_QUESTOES_RESPONDIDAS.GRID"
                                UserDefinedCriteriaWhereClause="A.RESPOSTAFORNECEDOR = @CAMPO(HANDLE) AND NOT(A.QUESTAORESPOSTA IS NULL)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="15"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="True"
                                CanDelete="False"
                                ShowTitle="True"
                                Title="Questões respondidas>> "
                                ChromeState="Normal"
                                PageWidgetHandle="2"
                                FormUrl="~/PortalFornecedores/e/Questionario/Questao.aspx" />
                        </div>


                    </div>

                    <div class="col-lg-5 col-md-5 col-sm-12 erp-unbox">

                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="QUESTOESPENDENTES_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_QUESTIONARIO_QUESTOES_PENDENTES.GRID"
                                UserDefinedCriteriaWhereClause="A.RESPOSTAFORNECEDOR = @CAMPO(HANDLE) AND A.QUESTAORESPOSTA IS NULL"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="15"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="True"
                                CanDelete="False"
                                ShowTitle="True"
                                Title="Questões pendentes>> "
                                ChromeState="Normal"
                                PageWidgetHandle="2"
                                FormUrl="~/PortalFornecedores/e/Questionario/Questao.aspx" />
                        </div>
                    </div>
                </div>

            </div>
</asp:Content>
