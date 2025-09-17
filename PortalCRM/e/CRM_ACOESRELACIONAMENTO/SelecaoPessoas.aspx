<%@ Page 
    Title="Seleção de pessoas da ação" 
    Language="C#" 
    Inherits="SelecaoPessoas" 
    CodeFile="~/PortalCRM/e/CRM_ACOESRELACIONAMENTO/SelecaoPessoas.aspx.cs" %>
<%@ Register 
    Assembly="Benner.Tecnologia.Wes.Components.WebApp" 
    Namespace="Benner.Tecnologia.Wes.Components.WebApp" 
    TagPrefix="wesControl" %>
<%@ Register 
    Assembly="Benner.Tecnologia.Wes.Components" 
    Namespace="Benner.Tecnologia.Wes.Components" 
    TagPrefix="wesWidget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server" xmlns:asp="urn:asp.net">
<script runat="server">  
</script>
<div class="row"> 
    
    <wesWidget:AjaxForm runat="server" 
        ID="WIDGETID_635781683906877499"  
        Title="Público alvo" 
        BootstrapCols="12" 
        UserDefinedCommandsVisible="True" 
        UserDefinedCriteriaWhereClause="" 
        IncludeRecordInRecentItems="False" 
        CanInsert="True" 
        CanUpdate="True" 
        CanDelete="True" 
        ShowTitle="True" 
        ChromeState="Normal" 
        EntityViewName="CRM_PUBLICOALVO.CUSTOM.FORM" 
        PageWidgetHandle="230"  />

</div>
    <div class="row">
        
        <wesWidget:SimpleGrid 
            runat="server" 
            ID="WIDGETID_635781850674619409"  
            Title="Pessoas" 
            BootstrapCols="12" 
            UserDefinedDisableRowSelection="False" 
            FormUrl="" 
            UserDefinedCriteriaWhereClause="" 
            UserDefinedDataSourceParameters="" 
            CompanyFilterMode="OnlyCompany" 
            DisplayRowCommand="True" 
            SystemFilterOnly="False" 
            UserDefinedPageSize="100" 
            Mode="None" 
            UserDefinedSelectColumnVisible="True" 
            DefaultFilterName="" 
            CanInsert="False" 
            CanUpdate="False" 
            CanDelete="False" 
            ShowTitle="False" 
            ChromeState="Normal" 
            EntityViewName="GN_PESSOAS.PESSOAACAO.CUSTOM.GRID" 
            PageWidgetHandle="234"  />


    </div>

</asp:Content>