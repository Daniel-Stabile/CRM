<%@ Page Title="Detalhes do item" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
<script runat="server">

    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("GERAL->PENHORAS", "GERAL", "PENHORAS");
        AddWebPartStaticConnection("GERAL->CONTRATOS", "GERAL", "CONTRATOS");
        AddWebPartStaticConnection("GERAL->COMPONENTES", "GERAL", "COMPONENTES");
        AddWebPartStaticConnection("GERAL->COMANDOS_RESUMO_LOCAL_ENTREGA", "GERAL", "COMANDOS_RESUMO_LOCAL_ENTREGA");
        AddWebPartStaticConnection("GERAL->FIGURA", "GERAL", "FIGURA");
        AddWebPartStaticConnection("GERAL->MOVIMENTACOES", "GERAL", "MOVIMENTACOES");
        AddWebPartStaticConnection("GERAL->MOVIMENTACOESCOMANDOS", "GERAL", "MOVIMENTACOESCOMANDOS");
    }


    protected override void OnPreRenderComplete(EventArgs e)
    {
        base.OnPreRenderComplete(e);
        //GERAL.ForceUpdate();
        var entidade = GERAL.GetEntity();
		
		if (entidade != null)
		{
			TITULO.Title = entidade.Fields["NOME"].ToString();
		}       
    }

    protected void MOVIMENTACOESCOMANDOS_DataLoaded(object sender, EventArgs e)
    {
        MOVIMENTACOES.ForceUpdate();
    }
</script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }
    </style>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="TITULO" />
            </div>

            <div class="row">
                <wesWidget:CommandsPanel
                    runat="server"
                    ID="COMANDOS_RESUMO_LOCAL_ENTREGA"
                    EntityViewName="PORTAL_INT_ATIVO_DETALHEITEM_GERAL.FORM"
                    UserDefinedCommandsVisible="true"
                    ShowTitle="false"
                    SystemInstanceName="CORPORATIVO" />
            </div> 

            <div class="row">
                <div class="col-lg-10 col-md-10 col-sm-10">
                     <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                        <erp:ErpTab runat="server" ID="ErpTab1" Text="Detalhes">
                            <div class="row">
	                            
		                        <wesWidget:AjaxForm 
                                    runat="server"
                                    ID="GERAL" 
                                    Title=""
                                    FormMode="View"
                                    BootstrapCols="12"
                                    UserDefinedCommandsVisible="false"
                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                                    IncludeRecordInRecentItems="False"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    ChromeState="Normal"
                                    HideDeveloperCommands="false"
                                    EntityViewName="PORTAL_INT_ATIVO_DETALHEITEM_GERAL.FORM"
                                    PageWidgetHandle="110"  />
                            </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab2" Text="Aquisição">
                            <div class="row">
	                            
		                        <wesWidget:AjaxForm 
                                    runat="server"
                                    ID="AQUISICAO" 
                                    Title=""
                                    FormMode="View"
                                    BootstrapCols="12"
                                    UserDefinedCommandsVisible="True"
                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                                    IncludeRecordInRecentItems="False"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    ChromeState="Normal"
                                    HideDeveloperCommands="false"
                                    EntityViewName="PORTAL_INT_ATIVO_DETALHEITEM_AQUISICAO.FORM"
                                    PageWidgetHandle="110"  />
	                        </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab3" Text="Localização">
                            <div class="row">
		                        <wesWidget:AjaxForm 
                                    runat="server"
                                    ID="LOCALIZACAO" 
                                    Title=""
                                    FormMode="View"
                                    BootstrapCols="12"
                                    UserDefinedCommandsVisible="True"
                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                                    IncludeRecordInRecentItems="False"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    ChromeState="Normal"
                                    HideDeveloperCommands="false"
                                    EntityViewName="PORTAL_INT_ATIVO_DETALHEITEM_LOCALIZACAO.FORM"
                                    PageWidgetHandle="110"  />
	                            </div>
                        </erp:ErpTab>

                    </erp:ErpTabControl>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2">
                    <div class="row">
	                    
		                <wesWidget:AjaxForm 
                            runat="server"
                            ID="FIGURA" 
                            Title=""
                            FormMode="ReadOnly"
                            BootstrapCols="12"
                            UserDefinedCommandsVisible="True"
                            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                            IncludeRecordInRecentItems="False"
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            HideDeveloperCommands="true"
                            EntityViewName="PORTAL_INT_ATIVO_FIGURA.FORM"
                            PageWidgetHandle="110"  />
	                </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                     <erp:ErpTabControl runat="server" ID="ErpTabControl2" ShowBorder="true" RenderAsPortlet="false">
                        <erp:ErpTab runat="server" ID="ErpTab4" Text="Penhoras">
                            <div class="row">
                                <wesWidget:SimpleGrid runat="server"
                                    ID="PENHORAS"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ATIVO_DETALHEITEM_PENHORAS.GRID"
                                    UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT PENHORA FROM AT_ITEMPENHORAS WHERE ITEM = @CAMPO(HANDLE)) "
                                    UserDefinedDisableRowSelection="true"
                                    UserDefinedCommandsVisible="false"
                                    UserDefinedSelectColumnVisible="False"
                                    HideDeveloperCommands="True"
                                    CompanyFilterMode="None"
                                    DisplayRowCommand="False"
                                    FilterVisible="False"
                                    SystemFilterOnly="True"
                                    UserDefinedPageSize="10"
                                    Mode="None"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    EmptyDataText="Sem penhoras para este item."
                                    Title=""
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
	                        </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab5" Text="Contratos">
                            <div class="row">
                                <wesWidget:SimpleGrid runat="server"
                                    ID="CONTRATOS"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ATIVO_DETALHEITEM_CONTRATOS.GRID"
                                    UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTRATO FROM AT_ITEMCONTRATOS WHERE ITEM = @CAMPO(HANDLE)) "
                                    UserDefinedDisableRowSelection="true"
                                    UserDefinedCommandsVisible="false"
                                    UserDefinedSelectColumnVisible="False"
                                    HideDeveloperCommands="True"
                                    CompanyFilterMode="None"
                                    DisplayRowCommand="False"
                                    FilterVisible="False"
                                    SystemFilterOnly="True"
                                    UserDefinedPageSize="10"
                                    Mode="None"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    EmptyDataText="Sem contratos para este item."
                                    Title=""
                                    FormUrl="~/PortalInterno/a/Ativo/Consulta/ContratoCobertura.aspx"
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
	                        </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab6" Text="Componentes">
                            <div class="row">
                                <wesWidget:SimpleGrid runat="server"
                                    ID="COMPONENTES"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ATIVO_DETALHEITEM_COMPONENTES.GRID"
                                    UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
                                    UserDefinedDisableRowSelection="true"
                                    UserDefinedCommandsVisible="false"
                                    UserDefinedSelectColumnVisible="False"
                                    HideDeveloperCommands="True"
                                    CompanyFilterMode="None"
                                    DisplayRowCommand="False"
                                    FilterVisible="False"
                                    SystemFilterOnly="True"
                                    UserDefinedPageSize="10"
                                    Mode="None"
                                    EmptyDataText="Sem componentes para este item."
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    Title=""
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
	                        </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab7" Text="Requisições de movimentação">
                            <div class="row">
                                    <wesWidget:CommandsPanel
                                        runat="server"
                                        ID="MOVIMENTACOESCOMANDOS"
                                        EntityViewName="PORTAL_INT_ATIVO_REQUISICAOTRANSFERENCIACOMANDOS.FORM"
                                        UserDefinedCommandsVisible="true"
                                        UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                                        SystemInstanceName="CORPORATIVO" />
                            </div>
                            <div class="row">
                                <wesWidget:SimpleGrid runat="server"
                                    ID="MOVIMENTACOES"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ATIVO_REQUISICAOTRANSFERENCIA.GRID"
                                    UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
                                    UserDefinedDisableRowSelection="false"
                                    UserDefinedCommandsVisible="true"
                                    UserDefinedSelectColumnVisible="False"
                                    HideDeveloperCommands="True"
                                    CompanyFilterMode="None"
                                    DisplayRowCommand="False"
                                    FilterVisible="False"
                                    SystemFilterOnly="True"
                                    UserDefinedPageSize="10"
                                    Mode="None"
                                    EmptyDataText="Sem movimentações para este item."
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    Title=""
                                    FormUrl="~/PortalInterno/e/Ativo/Transferencia/RequisicaoTransferencia.aspx"
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
	                           </div>
                        </erp:ErpTab>
                    </erp:ErpTabControl>
                </div>
            </div>
        </div>
    </div>
</asp:content>
