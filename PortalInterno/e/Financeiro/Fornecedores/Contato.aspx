<%@ Page Title="Contato" Language="C#"
    AutoEventWireup="true" Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FrmCadastroContatoFornecedor->TELEFONESCONTATOS_GRID", "FrmCadastroContatoFornecedor", "TELEFONESCONTATOS_GRID");
        }
        
    </script>
    
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FrmCadastroContatoFornecedor"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_FORNECEDOR_CONTATO.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            ChromeState="Normal"
            Title="Contato >>"
            PageWidgetHandle="1" />
    </div>
    
    <div class="row">
        <wes:EditableGrid runat="server"
            ID="TELEFONESCONTATOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_FORNECEDOR_TELEFONECONTATO.GRID"
            Description="Telefones do contato."
            UserDefinedCriteriaWhereClause="A.CONTATO = @CAMPO(HANDLE)"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            FormUrl="TelefoneContatos"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            Title="Telefones do contato>>"
            ChromeState="Normal"
            PageWidgetHandle="5" />
    </div>



</asp:Content>


