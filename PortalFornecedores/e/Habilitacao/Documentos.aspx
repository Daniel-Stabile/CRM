<%@ Page Title="Documentos e certificados" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.Habilitacao.DocumentosPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("DOCUMENTOS_GRID->REGISTROS_GRID", "DOCUMENTOS_GRID", "REGISTROS_GRID");
            AddWebPartStaticConnection("REGISTROS_GRID->ANEXOS_GRID", "REGISTROS_GRID", "ANEXOS_GRID");
        }
       
                 
    </script>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="row">
                
                <wes:SimpleGrid runat="server"
                    ID="DOCUMENTOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_FOR_HABILITACAO_TIPODOCUMENTOS.GRID"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    UserDefinedCriteriaWhereClause="A.HANDLE IN(SELECT A.DOCUMENTO FROM GN_PESSOADOCUMENTOSHABILITACAO A WHERE (A.EMPRESA = @EMPRESA) AND (A.PESSOA IN (SELECT HANDLE FROM GN_PESSOAS WHERE HANDLE = @TABELA(GN_PESSOAS))) AND EHDOCUMENTODISPENSADO = 'N' )"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="10"
                    Mode="Selectable"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="True"
                    Title="Tipos de Documentos >> todos tipos"
                    ChromeState="Normal"
                    PageWidgetHandle="2" />
                
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-8 col-lg-8 col-sm-12 erp-unbox">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="REGISTROS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_FOR_HABILITACAO_DOCUMENTOS.GRID"
                    UserDefinedCriteriaWhereClause="A.DOCUMENTOHABILITACAO = @CAMPO(HANDLE) AND A.HANDLE IN(SELECT B.HANDLE FROM GN_PESSOADOCHABILITREGISTROS B WHERE B.DOCUMENTO IN(SELECT C.HANDLE FROM GN_PESSOADOCUMENTOSHABILITACAO C WHERE C.PESSOA IN(SELECT USU.PESSOA FROM Z_GRUPOUSUARIOS USU WHERE USU.HANDLE = @USUARIO) AND C.DOCUMENTO = @CAMPO(HANDLE)))"
                    Title="Documentos >> documentos/certificados"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="True"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="12"
                    Mode="None"
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="True"
                    ShowTitle="True"
                    ChromeState="Normal"
                    PageWidgetHandle="3"
                    FormUrl="~/PortalFornecedores/e/Habilitacao/Documento.aspx" />
            </div>
        </div>
        <div class="col-md-4 col-lg-4 col-sm-12 erp-unbox">
            <div class="row">
                
                <wes:SimpleGrid runat="server"
                    ID="ANEXOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_FOR_HABILITACAO_DOCUMENTO_ANEXOS.GRID"
                    UserDefinedCriteriaWhereClause="A.REGISTRO = @CAMPO(HANDLE)"
                    Title="Anexos >> selecione o documento para visualizar"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="True"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="12"
                    Mode="None"
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="True"
                    ShowTitle="True"
                    ChromeState="Normal"
                    PageWidgetHandle="4"
                    FormUrl="~/PortalFornecedores/e/Habilitacao/Anexo.aspx" />                
            </div>
        </div>
    </div>
</asp:Content>
