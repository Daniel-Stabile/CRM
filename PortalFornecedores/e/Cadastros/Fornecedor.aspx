<%@ Page Title="Meus dados" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORMHANDLE->RESUMO_COMANDOS", "FORMHANDLE", "RESUMO_COMANDOS");
            AddWebPartStaticConnection("FORMHANDLE->RESUMO_VIEW", "FORMHANDLE", "RESUMO_VIEW");
            AddWebPartStaticConnection("FORMHANDLE->ENDERECO_COMANDOS", "FORMHANDLE", "ENDERECO_COMANDOS");
            AddWebPartStaticConnection("FORMHANDLE->ENDERECO_VIEW", "FORMHANDLE", "ENDERECO_VIEW");
            AddWebPartStaticConnection("FORMHANDLE->MEUSDADOS_TELEFONE", "FORMHANDLE", "MEUSDADOS_TELEFONE");			
            AddWebPartStaticConnection("FORMHANDLE->CONTASBANCARIAS", "FORMHANDLE", "CONTASBANCARIAS"); 		
        }
        
    </script>

    <style>
        #CadastroFornecedorZone {
            display: none;
        }
    </style>

    <div id="CadastroFornecedorZone">
        <wes:AjaxForm runat="server"
            ID="FORMHANDLE"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_MEUSDADOS_GERAL.FORM"
            Title="Dados"
            UserDefinedSelectColumnVisible="False"
            UserDefinedCommandsVisible="false"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="True"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

    <div class="row">
        <div class="col-md-12 col-lg-12 col-sm-12 erp-unbox">
            <div class="portlet light ">
                <div class="portlet-title">
                    <erp:ErpPortletTitleCaption runat="server" Title="Meus dados" Description=" dados gerais" />
                </div>
                <div class="portlet-body">
                    <div class="row">              
                        <erp:ErpAjaxForm
                            ID="RESUMO_VIEW"
                            runat="server"
                            EntityViewName="PORTAL_FOR_MEUSDADOS_GERAL.FORM"
                            DisplayLabels="True"
                            ColumnCount="1"
                            ShowTitle="false" />
                    </div>
                </div>
            </div>
        </div>        
    </div>
    
    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <div class="portlet light ">
                <div class="portlet-title">
                    <erp:ErpPortletTitleCaption runat="server" Title="Endereço" Description=" endereço principal" />
                </div>
                <div class="portlet-body">                  
                    <div class="row">
                        <erp:ErpAjaxForm
                            ID="ENDERECO_VIEW"
                            runat="server"
                            EntityViewName="PORTAL_FOR_MEUSDADOS_ENDERECO.FORM"
                            DisplayLabels="True"
                            ColumnCount="1"
                            ShowTitle="false"/>                   
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-6 col-sm-6 erp-unbox">
            <div class="row">                 
                <wes:SimpleGrid runat="server"
                    ID="MEUSDADOS_TELEFONE"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_FOR_MEUSDADOS_TELEFONES.GRID"
                    UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="false"
                    UserDefinedSelectColumnVisible="false"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    FormUrl="~/PortalFornecedores/a/Cadastros/Telefones.aspx"
                    DisplayRowCommand="false"
                    SystemFilterOnly="false"
                    UserDefinedPageSize="20"
                    Mode="None"
                    CanInsert="true"
                    CanUpdate="true"
                    CanDelete="true"
                    ShowTitle="True"
                    Title="Telefones >> Informe todos os telefones para contato"
                    UserDefinedCommandsVisible="true"
                    ChromeType="None"
                    PageWidgetHandle="2" />
            </div>
        </div>
		
        <div class="col-md-6 col-lg-6 col-sm-6 erp-unbox">
            <div class="row">                 
                <wes:SimpleGrid runat="server"
                    ID="CONTASBANCARIAS"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_FOR_CONTASBANCARIAS.GRID"
                    UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="false"
                    UserDefinedSelectColumnVisible="false"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    FormUrl="~/PortalFornecedores/e/Cadastros/IncluirContasBancarias.aspx"
                    DisplayRowCommand="false"
                    SystemFilterOnly="false"
                    UserDefinedPageSize="20"   
                    Mode="None"
                    CanInsert="true"
                    CanUpdate="true"
                    CanDelete="true"
                    ShowTitle="True"
                    Title="Contas Bancárias >> Informe a conta bancária"
                    UserDefinedCommandsVisible="true"
                    ChromeType="None"
                    PageWidgetHandle="2" />                
            </div>
        </div>		
    </div>

</asp:Content>
