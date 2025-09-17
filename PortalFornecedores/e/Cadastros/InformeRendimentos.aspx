<%@ Page Title="Informe de rendimentos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row"> 
        
        <wes:SimpleGrid runat="server"
            ID="INFORMES_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_MEUSDADOS_INFORMERENDIMENTOS.GRID"
            UserDefinedCriteriaWhereClause="(A.PESSOA = (SELECT USU.PESSOA FROM Z_GRUPOUSUARIOS USU WHERE USU.HANDLE = @USUARIO))"
            Title="Informe de rendimentos>>comprovantes de rendimentos anuais"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="20"
            DefaultFilterName="Ano/Cliente"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />        
    </div>
</asp:Content>
