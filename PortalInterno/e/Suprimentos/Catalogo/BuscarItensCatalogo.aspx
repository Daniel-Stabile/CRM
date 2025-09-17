<%@ Page Title="Capa da solicitação" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Suprimentos.Catalogo.BuscarItensCatalogo, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

 

    <style>
        #WidgetEscondido {
            display: none;
        }                  
    </style>


    <div class="row">
        <wes:AjaxForm
            ID="CATALOGO"
            runat="server"
            EntityViewName="PORTAL_INT_VISUALIZAR_CATALOGO.FORM"
            DisplayLabels="True"
            CanDelete="false"
            CanUpdate="false"
            Title="Anexos da solicitação"
            CanInsert="false"
            HideDeveloperCommands="true"
            FormMode="View"
            EditButtonClass="green" />
    </div>


    <div class="erp-unbox">
        <div class="portlet light ">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" Title="Nada ainda" ID="Titulo" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <wes:AjaxForm
                        ID="FORM"
                        runat="server"
                        EntityViewName="PORTAL_INT_ADICIONAR_ITEM_CATALOGO.FORM"
                        FormMode="Edit"
                        CanInsert="true"
                        CanUpdate="true"
                        CanDelete="False"
                        ShowTitle="false"
                        HideDeveloperCommands="false"
                        UserDefinedCriteriaWhereClause=""
                        EditButtonClass="green" />
                </div>

                <div class="row">
                    <wes:SimpleGrid runat="server"
                        ID="ITENS"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTAL_INT_ITENS_CATALOGO.GRID"
                        UserDefinedCriteriaWhereClause="A.CATALOGOFORNECIMENTO = @CAMPO(HANDLE) AND A.STATUS = 1 "
                        Title=""
                        OnCommandExecute="ITENS_CommandExecute"
                        UserDefinedDisableRowSelection="False"
                        UserDefinedCommandsVisible="True"
                        UserDefinedSelectColumnVisible="True"
                        CompanyFilterMode="None"
                        DisplayRowCommand="True"
                        DefaultFilterName="Pesquisar por"
                        SystemFilterOnly="True"
                        OnCommandExecuted="ITENS_CommandExecuted"
                        UserDefinedPageSize="10"
                        Mode="Selectable"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="False"
                        ChromeState="Normal"
                            />
                </div>

                
            </div>
        
        </div>
    </div>

</asp:Content>
