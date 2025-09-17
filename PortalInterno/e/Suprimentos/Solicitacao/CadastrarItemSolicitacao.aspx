<%@ Page Title="Detalhes documento" Language="C#" AutoEventWireup="true"
    Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Suprimentos.CadastrarItemSolicitacao, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
     
    
    <script runat="server">
</script>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    Title="Solicitação >> Cadastro da solicitação"
                    ID="TITULO" />
            </div>
            <div class="row">
		        <wes:AjaxForm 
                    runat="server"
                    ID="Solicitacao" 
                    FormMode="ReadOnly"
                    BootstrapCols="12"
                    UserDefinedCommandsVisible="True"
                    UserDefinedCriteriaWhereClause="" 
                    IncludeRecordInRecentItems="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    HideDeveloperCommands="true"
                    EntityViewName="PORTAL_INT_COMANDOS_CADASTRAR_ITENS_SOLICITACAO.FORM"
                    PageWidgetHandle="110"  />
            </div>

            <div class="row">
		        <wes:SimpleGrid 
                    runat="server" 
                    ID="Itens"  
                    Title="" 
                    BootstrapCols="12" 
                    UserDefinedDisableRowSelection="True" 
                    UserDefinedCriteriaWhereClause="A.SOLICITACAO = @CAMPO(HANDLE)" 
                    UserDefinedDataSourceParameters="" 
                    CompanyFilterMode="None" 
                    DisplayRowCommand="True" 
                    SystemFilterOnly="False" 
                    UserDefinedPageSize="20" 
                    Mode="None" 
                    UserDefinedSelectColumnVisible="False" 
                    DefaultFilterName="" 
                    CanInsert="False" 
                    CanUpdate="False" 
                    CanDelete="False" 
                    ShowTitle="False" 
                    ChromeState="Normal" 
                    FormUrl="~/PortalInterno/a/Suprimentos/Solicitacao/CadastrarItem.aspx"
                    EntityViewName="PORTAL_INT_ITENS_SOLICITACAO.GRID" 
                    PageWidgetHandle="111"  />
            </div>

        </div>
    </div>

</asp:Content>
