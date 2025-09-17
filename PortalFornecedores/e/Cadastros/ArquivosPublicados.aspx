<%@ Page Title="Publicações" Language="C#" AutoEventWireup="true" 
    Inherits="PortalFornecedores.Cadastros.ArquivosPublicadosPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <div runat="server" id="labTitulo" class="caption">
                    <span runat="server" id="NomeTitulo" class="caption-subject font-green-sharp bold uppercase">Publicações</span>
                    <span runat="server" id="HelperTitulo" class="caption-helper">todos arquivos disponíveis para download</span>
                </div>
            </div>
            <erp:ErpTabControl runat="server" ID="tabs" ShowBorder="false" RenderAsPortlet="false">
              <erp:ErpTab runat="server" ID="ErpTab1" Text="Pendentes">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="GridArquivosPendentes"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTAL_FOR_DOWNLOADS_PENDENTES.GRID"
                            UserDefinedCriteriaWhereClause="(A.FORNECEDORES = 'S') AND (A.DISPONIVELEM <= @HOJE) AND (A.EXIBIRATE IS NULL OR A.EXIBIRATE >= @HOJE) AND (((SELECT COUNT(FORN.HANDLE) FROM GN_PUBLICACAOARQUIVOFORNECEDOR FORN WHERE FORN.ARQUIVO = A.HANDLE) = 0) OR ((SELECT COUNT(FORN.HANDLE) FROM GN_PUBLICACAOARQUIVOFORNECEDOR FORN WHERE FORN.ARQUIVO = A.HANDLE AND FORN.FORNECEDOR = (SELECT USU.PESSOA FROM Z_GRUPOUSUARIOS USU WHERE @USUARIO = USU.HANDLE)) > 0)) AND A.HANDLE NOT IN (SELECT ARQUIVO FROM GN_PUBLICACAOARQUIVODOWNLOAD)"
                            Title="Arquivos pendentes"
                            UserDefinedDisableRowSelection="True"
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
                            PageWidgetHandle="1" />
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="tab_1" Text="Todos disponíveis">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="GridArquivos"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTAL_FOR_DOWNLOADS.GRID"
                            UserDefinedCriteriaWhereClause="(A.FORNECEDORES = 'S') AND (A.DISPONIVELEM <= @HOJE) AND (A.EXIBIRATE IS NULL OR A.EXIBIRATE >= @HOJE) AND (((SELECT COUNT(FORN.HANDLE) FROM GN_PUBLICACAOARQUIVOFORNECEDOR FORN WHERE FORN.ARQUIVO = A.HANDLE) = 0) OR ((SELECT COUNT(FORN.HANDLE) FROM GN_PUBLICACAOARQUIVOFORNECEDOR FORN WHERE FORN.ARQUIVO = A.HANDLE AND FORN.FORNECEDOR = (SELECT USU.PESSOA FROM Z_GRUPOUSUARIOS USU WHERE @USUARIO = USU.HANDLE)) > 0))"
                            Title="Todos arquivos para download"
                            UserDefinedDisableRowSelection="True"
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
                            PageWidgetHandle="1" />
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
</asp:Content>