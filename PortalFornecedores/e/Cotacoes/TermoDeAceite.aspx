<%@ Page Title="Termos de Aceite" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.Cotacoes.TermoDeAceitePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">

    <style>
        #Texto_Aceite{
            font-family: "Open Sans",sans-serif;
            padding-left: 12px;
            font-weight: bold;
        }      

        #Div_CheckBox_TermoAceite{
            font-family: "Open Sans",sans-serif;
            padding-left: 7px;
        }

        #FormHandle {
            display: none;
        }
    </style>

    <div class="row">
        
        <wes:AjaxForm
            ID="REGISTROCOTACAO"
            runat="server"
            Title=""
            FormMode="View"
            EntityViewName="PORTAL_FOR_TERMODEACEITE_COMANDO.FORM"
            UserDefinedCommandsVisible="true"
            HideDeveloperCommands="true"
            SystemInstanceName="CORPORATIVO" />        
    </div>

    <div class="row">
        
        <wes:CommandsPanel
            ID="RESUMO_COMANDOS"
            runat="server"
            Title="Termos de Aceite >> "
            FormMode="View"
            EntityViewName="PORTAL_FOR_TERMODEACEITE_COMANDO.FORM"
            UserDefinedCommandsVisible="true"
            HideDeveloperCommands="true"
            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
            SystemInstanceName="CORPORATIVO" />
    </div>
   
    <h5 id="Texto_Aceite">Antes do envio da cotação, baixe o arquivo abaixo e leia os "termos de aceite" para participar das cotações.</h5>

    <div class="row">
        
        <wes:AjaxForm runat="server"
            ID="AjaxForm1"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_TERMOSDEACEITE.FORM"                    
            UserDefinedSelectColumnVisible="False"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="true"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            CanInsert="False"
            CanUpdate="False"
            FormMode="View"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCommandsVisible="False"
            ChromeState="Normal"
            UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA"
            PageWidgetHandle="1" />        
    </div>

    <div id="Div_CheckBox_TermoAceite" >        
        <asp:UpdatePanel ID="updatePanel1" runat="server"> 
            <ContentTemplate> 
                <asp:CheckBox 
                    id="Check_TermoAceite" 
                    runat="server" 
                    AutoPostBack="True" 
                    Text="Li e aceito os termos para participar desta cotação." 
                    TextAlign="Right" 
                    OnCheckedChanged="check_termodeaceite_OnClick"/>
            </ContentTemplate> 
        </asp:UpdatePanel>
    </div>

</asp:Content>
