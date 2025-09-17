<%@ Page Title="Portal Interno - Detalhes Documento" Language="C#" CodeFile="~/PortalInterno/e/Financeiro/CPA/LiberarCPAVisualizar.aspx.cs" Inherits="CPALiberarCPAVisualizarPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
      
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
     
    <style>
        #WidgetParcela {
            display: none;
        }
    </style>

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("Parcela->AprovacaoDetalheDocumento", "Parcela", "AprovacaoDetalheDocumento");
            AddWebPartStaticConnection("Parcela->Assinatura", "Parcela", "Assinatura");
            AddWebPartStaticConnection("Parcela->Ocorrencia", "Parcela", "Ocorrencia");
            AddWebPartStaticConnection("Parcela->ContaFinanceira", "Parcela", "ContaFinanceira");            
            AddWebPartStaticConnection("Parcela->Orcamento", "Parcela", "Orcamento");
            AddWebPartStaticConnection("Parcela->Anexo", "Parcela", "Anexo");
            AddWebPartStaticConnection("Parcela->Contratos", "Parcela", "Contratos");
            
        }

          

    </script>

    <div class="portlet light">
        <div class="portlet-body">
            <div class="row">
                <wes:AjaxForm
                    runat="server"
                    ID="Parcela"
                    EntityViewName="PORTAL_INT_CONTAS_PAGAR_APROVACAODETALHEPARCELA.FORM"
                    SystemInstanceName="CORPORATIVO"
                    UserDefinedCommandsVisible="true"
                    ShowTitle="false"
                    HideDeveloperCommands="True"
                    CanDelete="false"
                    CanInsert="false"
                    CanUpdate="false" />
            </div>

            <div class="row">
                <wes:CommandsPanel
                    runat="server"
                    ID="ComandosParcela"
                    EntityViewName="PORTAL_INT_CONTAS_PAGAR_APROVACAODETALHEPARCELA.FORM"
                    SystemInstanceName="CORPORATIVO"
                    UserDefinedCommandsVisible="true"
                    ShowTitle="false"
                    HideDeveloperCommands="True"
                    CanDelete="false"
                    CanInsert="false"
                    CanUpdate="false" />
            </div>

            <div class="row">
                <wes:AjaxForm
                    ID="AprovacaoDetalheDocumento"
                    runat="server"
                    EntityViewName="PORTAL_INT_CONTAS_PAGAR_APROVACAODETALHEDOCUMENTO.FORM"
                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(DOCUMENTO)"
                    DisplayLabels="True"
                    HideDeveloperCommands="True"
                    FormMode="View"
                    CanDelete="false"
                    CanUpdate="false"
                    CanInsert="false"
                    ShowTitle="true"
                    Title=""
                    EditButtonClass="green" />
            </div>

            <erp:ErpTabControl runat="server" ID="TabControlParcela" ShowBorder="True" RenderAsPortlet="False">
                <erp:ErpTab runat="server" ID="TabContaFinanceira" Text="Contas Financeiras">
                    <div class="row">
                        <wes:SimpleGrid
                            runat="server"
                            ID="ContaFinanceira"
                            Title="Contas Financeiras"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            UserDefinedCriteriaWhereClause="A.LANCAMENTO IN(SELECT DISTINCT HANDLE FROM FN_LANCAMENTOS WHERE PARCELA = @CAMPO(AP))"
                            UserDefinedDataSourceParameters=""
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="10"
                            Mode="None"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="True"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_CONTAS_PAGAR_APROVACAODETALHECONTA.GRID"
                            PageWidgetHandle="108" />
                    </div>
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="TabAssinaturas" Text="Assinaturas">
                    <div class="row">
                        <wes:SimpleGrid
                            runat="server"
                            ID="Assinatura"
                            Title="Assinaturas"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            UserDefinedCriteriaWhereClause="A.PARCELALIBERACAO = @CAMPO(AP)"
                            UserDefinedDataSourceParameters=""
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="10"
                            Mode="None"
                            UserDefinedSelectColumnVisible="False"
                            DefaultFilterName=""
                            HideDeveloperCommands="True"
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_ASSINATURAS.GRID"
                            PageWidgetHandle="108" />
                    </div>
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="TabOcorrencias" Text="Ocorrências">
                    <div class="row">
                        <wes:SimpleGrid
                            runat="server"
                            ID="Ocorrencia"
                            Title="Ocorrências"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(AP) AND ((A.TIPOMOVIMENTO IN (12,13)) OR (A.TIPOMOVIMENTO = 7 AND (A.OCORRENCIA IN (SELECT OCORRENCIALIBERACAOINICIADA FROM FN_PARAMETROS WHERE EMPRESA = @EMPRESA) OR A.OCORRENCIA IN (SELECT OCORRENCIALIBERACAORECUSADA FROM FN_PARAMETROS WHERE EMPRESA = @EMPRESA))))"
                            UserDefinedDataSourceParameters=""
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="10"
                            Mode="None"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="True"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_CONTAS_PAGAR_APROVACAODETALHEOCORRENCIA.GRID"
                            PageWidgetHandle="108" />                        
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="tabORCAMENTO" Text="Orçamento">                 
                      <div class="row">
                        <wes:SimpleGrid
                            runat="server"
                            ID="OrcamentoContas"
                            ProviderWidgetUniqueId="Parcela"
                            Title="Contas"
                            BootstrapCols="12" 
                            ChromeState="Fixed"  
                            UserDefinedDisableRowSelection="true" 
                            UserDefinedPageSize="10000" 
                            CanView="false"  />                        
                    </div>
                     <div class="row">
                        <wes:SimpleGrid
                            runat="server"
                            ID="OrcamentoCCs"
                            ProviderWidgetUniqueId="Parcela"
                            Title="Centros de resultados"
                            BootstrapCols="12" 
                            ChromeState="Fixed"  
                            UserDefinedDisableRowSelection="true" 
                            UserDefinedPageSize="10000" 
                            CanView="false"  />                        
                    </div>
                </erp:ErpTab>
                 <erp:ErpTab runat="server" ID="tabANEXOS" Text="Anexos">
                    <div class="row">
                        <wes:SimpleGrid
                            runat="server"
                            ID="Anexos"
                            Title="Anexos"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            UserDefinedCriteriaWhereClause="A.DOCUMENTOFINANCEIRO = @CAMPO(DOCUMENTO)"
                            ProviderWidgetUniqueId="Parcela"
                            UserDefinedDataSourceParameters=""
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="10"
                            Mode="None"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="True"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_ANEXOS.GRID"
                            PageWidgetHandle="108" />                        
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="tabCONTRATOS" Text="Contratos">
                    <div class="row">
                    <wes:SimpleGrid
                      runat="server"
                            ID="SimpleGrid4"
                            Title="OrcamentoCC"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            UserDefinedCriteriaWhereClause=""
                            UserDefinedDataSourceParameters=""
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="10"
                            Mode="None"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="True"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            EntityViewName="APROVACAO_AP_CONTRATOS.DATASOURCE.CUSTOM.GRID"
                            PageWidgetHandle="112" />  
                         </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
</asp:Content>
