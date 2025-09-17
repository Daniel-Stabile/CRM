<%@ Page Language="C#" Title="Detalhes do aditivo" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <script runat="server">
           
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("DETALHES_FORM->OBJETOS_GRID", "DETALHES_FORM", "OBJETOS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->NOVOSOBJETOS_GRID", "DETALHES_FORM", "NOVOSOBJETOS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->CLAUSULAS_GRID", "DETALHES_FORM", "CLAUSULAS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->CAPACONTRATO_GRID", "DETALHES_FORM", "CAPACONTRATO_GRID");

            AddWebPartStaticConnection("OBJETOS_GRID->OBJETO_FORM", "OBJETOS_GRID", "OBJETO_FORM");
            AddWebPartStaticConnection("NOVOSOBJETOS_GRID->NOVOOBJETO_FORM", "NOVOSOBJETOS_GRID", "NOVOOBJETO_FORM");
            AddWebPartStaticConnection("NOVOSOBJETOS_GRID->NOVOOBJETOENTREGAS_GRID", "NOVOSOBJETOS_GRID", "NOVOOBJETOENTREGAS_GRID");
            AddWebPartStaticConnection("CLAUSULAS_GRID->CLAUSULA_FORM", "CLAUSULAS_GRID", "CLAUSULA_FORM");
            AddWebPartStaticConnection("CAPACONTRATO_GRID->CAPACONTRATO_FORM", "CAPACONTRATO_GRID", "CAPACONTRATO_FORM");
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            tabCapaContrato.SetWidgetTickSource(CAPACONTRATO_GRID);
            tabClausulas.SetWidgetTickSource(CLAUSULAS_GRID);
            tabNovosItens.SetWidgetTickSource(NOVOSOBJETOS_GRID);
            tabObjetos.SetWidgetTickSource(OBJETOS_GRID);
        }     
    </script>

    <erp:ErpTabControl runat="server" ID="tabPages">

        <erp:ErpTab runat="server" ID="tabDetalhes" Text="Detalhes">
            <div class="row">
                
                <erp:ErpFilterForm runat="server"
                    ID="DETALHES_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_DETALHES.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="False"
                    UserDefinedCriteriaWhereClause=""
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>

        <erp:ErpTab runat="server" ID="tabObjetos" Text="Itens/Objetos">
            <div class="row">
                
                <wes:SimpleGrid runat="server"
                    ID="OBJETOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_OBJETOS.GRID"
                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
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
                    Title="Itens"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>

            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="OBJETO_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_OBJETO.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="true"
                    Title="Detalhes"
                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>

        <erp:ErpTab runat="server" ID="tabNovosItens" Text="Novos Itens">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="NOVOSOBJETOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_NOVOSOBJETOS.GRID"
                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
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
                    Title="Novos itens"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
                </div>


            <erp:ErpTabControl runat="server" ID="tabsDetalheNovoItem">


                <erp:ErpTab runat="server" ID="tabDetalhesNovoItem" Text="Detalhes">
                    <div class="row">
                        <wes:AjaxForm runat="server"
                            ID="NOVOOBJETO_FORM"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_NOVOOBJETO.FORM"
                            IncludeRecordInRecentItems="False"
                            HideDeveloperCommands="False"
                            CanInsert="false"
                            CanUpdate="false"
                            CanDelete="False"
                            ShowTitle="false"
                            Title="Detalhes"
                            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                            ChromeState="Normal"
                            PageWidgetHandle="1" />
                    </div>
                </erp:ErpTab>


                <erp:ErpTab runat="server" ID="tabNovoItemEntregas" Text="Previsão entregas">
                    <div class="row">
                        
                        <wes:SimpleGrid runat="server"
                            ID="NOVOOBJETOENTREGAS_GRID"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_NOVOOBJETOENTREGAS.GRID"
                            UserDefinedCriteriaWhereClause="A.OBJETO = @CAMPO(HANDLE)"
                            UserDefinedDisableRowSelection="False"
                            UserDefinedCommandsVisible="True"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="False"
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
                            Title="Novos itens"
                            ChromeState="Normal"
                            PageWidgetHandle="3" />
                    </div>





                </erp:ErpTab>


            </erp:ErpTabControl>




        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tabClausulas" Text="Cláusulas">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="CLAUSULAS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_CLAUSULAS.GRID"
                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
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
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
                </div>

            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="CLAUSULA_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_CLAUSULA.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="true"
                    Title="Detalhes"
                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>




        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tabCapaContrato" Text="Capa contrato">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="CAPACONTRATO_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_CAPACONTRATO.GRID"
                    UserDefinedCriteriaWhereClause="A.ADITIVO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
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
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>

            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="CAPACONTRATO_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVO_CAPACONTRATO.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="true"
                    Title="Detalhes"
                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>


        </erp:ErpTab>

    </erp:ErpTabControl>
</asp:Content>
