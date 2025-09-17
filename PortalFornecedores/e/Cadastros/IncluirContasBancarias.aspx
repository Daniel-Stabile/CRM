<%@ Page Title="Endereço" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {

        }        
    </script>

    <div class="row"> 
        
        <wes:AjaxForm runat="server"
            ID="FORMHANDLE"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_CONTASBANCARIAS.FORM"
            Title="Contas Bancárias >> informações da conta bancária"
            UserDefinedSelectColumnVisible="False"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            UserDefinedCommandsVisible="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />

            <wes:SimpleGrid runat="server" 
                ID="CHAVESPIX" 
                Title="Chaves PIX" 
                Subtitle="" 
                PortletCssClass="" 
                PortletLayout="Default" 
                BootstrapCols="12" 
                FontIcon="" 
                ShowTitle="true" 
                ProviderWidgetUniqueId="FORMHANDLE" 
                ChromeState="Normal" 
                CanDelete="True" 
                CanUpdate="True" 
                CanInsert="True" 
                EntityViewName="GN_PESSOACHAVEPIXCADASTRO.GRID" 
                Mode="Selectable" 
                UserDefinedSelectColumnVisible="False" 
                UserDefinedPageSize="20" 
                SystemFilterOnly="False" 
                DisplayRowCommand="True" 
                CompanyFilterMode="OnlyCompany" 
                UserDefinedCriteriaWhereClause="A.CONTABANCARIA = @CAMPO(HANDLE)" 
                FormUrl="~/aga/a/genericos/ChavePIX.aspx" 
                ShowExport="True" 
                UserDefinedDisableRowSelection="False" 
                PageId="CARGA_DE_FORNECEDOR__CONTAS_BANCARIAS_FORM" 
                Level="20" 
                Order="11"  />
    </div>

</asp:Content>
