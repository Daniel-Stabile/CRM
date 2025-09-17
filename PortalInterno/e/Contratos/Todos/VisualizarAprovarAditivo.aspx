<%@ Page Title="Visualizar contrato" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("RESUMO_ADITIVO->TAB_CONTRATO", "RESUMO_ADITIVO", "TAB_CONTRATO");
        AddWebPartStaticConnection("RESUMO_ADITIVO->TAB_CAPACONTRATOCONVENIO", "RESUMO_ADITIVO", "TAB_CAPACONTRATOCONVENIO");
        AddWebPartStaticConnection("RESUMO_ADITIVO->TAB_CLAUSULAS", "RESUMO_ADITIVO", "TAB_CLAUSULAS");
        AddWebPartStaticConnection("RESUMO_ADITIVO->TAB_ASSINANTES", "RESUMO_ADITIVO", "TAB_ASSINANTES");
        AddWebPartStaticConnection("RESUMO_ADITIVO->TAB_ALTERACAOITEM", "RESUMO_ADITIVO", "TAB_ALTERACAOITEM");
        AddWebPartStaticConnection("RESUMO_ADITIVO->TAB_NOVOS_ITENS", "RESUMO_ADITIVO", "TAB_NOVOS_ITENS");         

    }

    protected override void OnPreRenderComplete(EventArgs e) 
    {
        base.OnPreRenderComplete(e);
        var entidade = RESUMO_ADITIVO.GetEntity();

      //  TITULO.Title = "Contrato >> " + entidade.Fields["NUMERO"].ToString() + " - " + entidade.Fields["PESSOA"].ToString();

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
            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
		                    <wes:AjaxForm 
                                runat="server"
                                ID="RESUMO_ADITIVO" 
                                Title="Informações do aditivo"
                                FormMode="View"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause="" 
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                HideDeveloperCommands="True"
                                EntityViewName="PORTAL_INT_RESUMO_ADITIVO.FORM"
                                PageWidgetHandle="110"  />
	                    </div>
                    </div> 

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
		                    <wes:AjaxForm 
                                runat="server"
                                ID="TAB_CONTRATO" 
                                Title="Informações do contrato"
                                FormMode="View"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(CONTRATO)" 
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                HideDeveloperCommands="True"
                                EntityViewName="PORTAL_INT_RESUMO_CONTRATO_ADITIVO.FORM"
                                PageWidgetHandle="110"  />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <erp:ErpTabControl runat="server" ID="tabControl2" ShowBorder="true" RenderAsPortlet="false">

                        <erp:ErpTab runat="server" ID="tabContratoConvenio" Text="Capa contrato/convênio">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="TAB_CAPACONTRATOCONVENIO"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ADITIVO_CAPA_CONTRATO.GRID"
                                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                                    UserDefinedDisableRowSelection="False"
                                    UserDefinedCommandsVisible="True"
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
                                    Title=""
                                    FormUrl="~/PortalInterno/e/Contratos/Todos/VisualizarAditivoCapaContratoConvenio.aspx"
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
                            </div>
                        </erp:ErpTab>



                        <erp:ErpTab runat="server" ID="tabAlteracaoItem" Text="Alteração de itens/objetos">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="TAB_ALTERACAOITEM"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ADITIVO_OBJETOS.GRID"
                                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                                    UserDefinedDisableRowSelection="False"
                                    UserDefinedCommandsVisible="True"
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
                                    Title=""
                                    FormUrl="~/PortalInterno/e/Contratos/Todos/VisualizarAditivoAlteracaoItem.aspx"
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
                            </div>
                        </erp:ErpTab>



                        <erp:ErpTab runat="server" ID="NovosItensObjetos" Text="Novos itens/objetos">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="TAB_NOVOS_ITENS"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ADITIVO_NOVOS_OBJETOS.GRID"
                                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                                    UserDefinedDisableRowSelection="False"
                                    UserDefinedCommandsVisible="True"
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
                                    Title=""
                                    FormUrl="~/PortalInterno/e/Contratos/Todos/VisualizarAditivoInclusaoItens.aspx"
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
                            </div>
                        </erp:ErpTab>



                        <erp:ErpTab runat="server" ID="tabClausulas" Text="Cláusulas">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="TAB_CLAUSULAS"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_CLAUSULA_ADITIVO.GRID"
                                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE) AND A.CLAUSULAADITIVO IS NULL"
                                    UserDefinedDisableRowSelection="False"
                                    UserDefinedCommandsVisible="True"
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
                                    Title="Entregas"
                                    ChromeState="Normal"
                                    FormUrl="~/PortalInterno/e/Contratos/Todos/ClausulasAditivoContrato.aspx"
                                    PageWidgetHandle="3" />
                            </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="tabAssinatures" Text="Assinantes incluídos">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="TAB_ASSINANTES"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ASSINANTE_ADITIVO.GRID"
                                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                                    UserDefinedDisableRowSelection="False"
                                    UserDefinedCommandsVisible="True"
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
                                    Title="Entregas"
                                    ChromeState="Normal"
                                    FormUrl=""
                                    PageWidgetHandle="3" />
                            </div>
                        </erp:ErpTab>

                    </erp:ErpTabControl>
                </div>
            </div>
        </div>
    </div>
</asp:content>
