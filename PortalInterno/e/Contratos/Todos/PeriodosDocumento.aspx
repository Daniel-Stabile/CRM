<%@ Page Title="Itens da requisição" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <style>
        #WidgetMaster {
            display: none;
        }


    </style>

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORMPAI->PERIODOS", "FORMPAI", "PERIODOS");
        }

        protected override void OnLoadComplete(EventArgs e) 
        {
            base.OnLoadComplete(e);
            var entidade = FORMPAI.GetEntity();

        //    PERIODOS.Title = "Períodos >> " + entidade.Fields["DOCUMENTO"].ToString();

        }    
    
    </script>

    <div class="row">
        <wes:AjaxForm
            runat="server"
            ID="FORMPAI"
            EntityViewName="PORTAL_INT_DOCUMENTO_CONTRATO_RESUMO.FORM"
            SystemInstanceName="CORPORATIVO"
            UserDefinedCommandsVisible="false"
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false" />
    </div>

    <div class="row">        
        <wes:SimpleGrid runat="server"
            ID="PERIODOS"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_PERIODOS_DOCUMENTO_CONTRATO.GRID"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            UserDefinedCommandsVisible="true"
            UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
            CanInsert="false"
            CanUpdate="false"
            CanDelete="false"
            ShowTitle="True"
            Title="Cadastro de itens"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

</asp:Content>
