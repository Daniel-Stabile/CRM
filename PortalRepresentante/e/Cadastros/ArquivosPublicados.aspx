<%@ Page Title="Downloads" Language="C#" AutoEventWireup="true" 
    Inherits ="PortalRepresentante.Cadastros.ArquivosPublicadosPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="GridArquivos"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_DOWNLOADS.GRID"
            UserDefinedCriteriaWhereClause="(A.REPRESENTANTES = 'S') AND (A.DISPONIVELEM <= @HOJE) AND (A.EXIBIRATE IS NULL OR A.EXIBIRATE >= @HOJE) AND (((SELECT COUNT(RES.HANDLE) FROM GN_PUBLICACAOARQUIVOREPRESENTA RES WHERE RES.ARQUIVO = A.HANDLE) = 0) OR ((SELECT COUNT(RES.HANDLE) FROM GN_PUBLICACAOARQUIVOREPRESENTA RES WHERE RES.ARQUIVO = A.HANDLE AND RES.REPRESENTANTE = (SELECT USU.PESSOA FROM Z_GRUPOUSUARIOS USU WHERE @USUARIO = USU.HANDLE)) > 0))"
            Title="Publicações >> todos arquivos disponíveis para download"
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
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>
