<%@ Page Title="Visualizar contrato" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("RESUMO_CONTRATO->TAB_ANEXOS", "RESUMO_CONTRATO", "TAB_ANEXOS");
        AddWebPartStaticConnection("RESUMO_CONTRATO->TAB_DOCUMENTOS", "RESUMO_CONTRATO", "TAB_DOCUMENTOS");
        AddWebPartStaticConnection("RESUMO_CONTRATO->TAB_CONDPAGT", "RESUMO_CONTRATO", "TAB_CONDPAGT");
        AddWebPartStaticConnection("RESUMO_CONTRATO->TAB_CLAUSULAS", "RESUMO_CONTRATO", "TAB_CLAUSULAS");         
    }

    protected override void OnPreRenderComplete(EventArgs e)  
    {
        base.OnPreRenderComplete(e);
        var entidade = RESUMO_CONTRATO.GetEntity();

        TITULO.Title = "Contrato >> " + entidade.Fields["NUMERO"].ToString() + " - " + entidade.Fields["PESSOA"].ToString();

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
            <div class="portlet-body">
                <div class="row">

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
		                    <wes:AjaxForm 
                                runat="server"
                                ID="RESUMO_CONTRATO" 
                                Title=""
                                FormMode="View"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause="" 
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                HideDeveloperCommands="True"
                                EntityViewName="PORTAL_INT_RESUMO_CONTRATO.FORM"
                                PageWidgetHandle="110"  />
                        </div>
                    </div>



                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <erp:ErpTabControl runat="server" ID="tabControl1" ShowBorder="true" RenderAsPortlet="false">

                            <erp:ErpTab runat="server" ID="tabAnexos" Text="Anexos">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="TAB_ANEXOS"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_ANEXOS_CONTRATO.GRID"
                                        UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
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
                                        Title="asas"
                                        ChromeState="Normal"
                                        PageWidgetHandle="3" />
                                </div>
                            </erp:ErpTab>


                            <erp:ErpTab runat="server" ID="tabDocumentos" Text="Documentos">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="TAB_DOCUMENTOS"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_DOCUMENTOS_CONTRATO.GRID"
                                        UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
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
                                        FormUrl="~/PortalInterno/e/Contratos/Todos/PeriodosDocumento.aspx"
                                        PageWidgetHandle="3" />
                                </div>
                            </erp:ErpTab>
                        </erp:ErpTabControl>
                    </div>
                </div>
                <div class="row">
                    <erp:ErpTabControl runat="server" ID="tabControl2" ShowBorder="true" RenderAsPortlet="false">

                        <erp:ErpTab runat="server" ID="tabCondPagamento" Text="Cond. Pgto">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="TAB_CONDPAGT"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_CONDICOES_PAGAMENTO_CONTRATO.GRID"
                                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
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
                                    ChromeState="Normal"
                                    PageWidgetHandle="3" />
                            </div>
                        </erp:ErpTab>


                        <erp:ErpTab runat="server" ID="tabClausulas" Text="Cláusulas">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="TAB_CLAUSULAS"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_CLAUSULAS_CONTRATO.GRID"
                                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
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
                                    FormUrl="~/PortalInterno/e/Contratos/Todos/ClausulasContrato.aspx"
                                    PageWidgetHandle="3" />
                            </div>
                        </erp:ErpTab>
                    </erp:ErpTabControl>
                </div>
            </div>
        </div>
    </div>
</asp:content>
