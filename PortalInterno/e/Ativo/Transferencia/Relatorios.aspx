<%@ Page Title="Relatórios" Language="C#" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>
    
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content" ContentPlaceHolderID="Main" Runat="Server">
    <div>
            <wesWidget:SimpleGrid runat="server"
                ID="RELATORIOS"
                SystemInstanceName="CORPORATIVO"
                EntityViewName="PORTAL_INT_ATIVO_OCORRENCIARELATORIOS.GRID"
                Title="Relatórios"
                UserDefinedDisableRowSelection="False"
                UserDefinedCommandsVisible="False"
                UserDefinedSelectColumnVisible="False"
                HideDeveloperCommands="False"
                CompanyFilterMode="None"
                DisplayRowCommand="True"
                FilterVisible="False"
                DefaultFilterName=""
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
    