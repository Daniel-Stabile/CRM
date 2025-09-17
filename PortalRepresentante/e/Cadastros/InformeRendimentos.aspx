<%@ Page Title="Comprovante de rendimentos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="GridArquivos"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="TR_DIRFPUBLICACAOCOMPROVANTES.CUSTOM.GRID"
            UserDefinedCriteriaWhereClause="(A.PESSOA = (SELECT USU.PESSOA FROM Z_GRUPOUSUARIOS USU WHERE @USUARIO = USU.HANDLE))"
            Title="Comprovante de rendimentos >>"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"  
            DefaultFilterName="Ano de entrega"                           
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>
