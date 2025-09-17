<%@ Page Title="Ordens de venda" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.OrdensVenda.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content runat="server" id="Content" contentplaceholderid="Main">

    <div class="row">
        <erp:ErpFilterForm runat="server"
            ID="FILTRO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_FILTRO_ORDENSVENDA.FORM"
            Title="Filtro"
            ShowTitle="True"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
   
    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="ORDENSVENDA_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_ORDENSVENDA.GRID"
            UserDefinedCriteriaWhereClause="@WHERECLAUSE"
            Title="Pedidos"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            FilterVisible="False"
            DefaultFilterName="Todos"
            SystemFilterOnly="True"
            UserDefinedPageSize="6"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="" />
    </div>


    <erp:ErpTabControl runat="server" ID="tabs">
        <erp:ErpTab runat="server" ID="tab_1_1" Text="Itens">

                <div class="row">
                    <erp:ErpSimpleGrid runat="server"
                        ID="ORDEMVENDAITENS_GRID"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTALINTERNO_ORDEMVENDAITENS.GRID"
                        Title="Itens"
                        UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                        UserDefinedSelectColumnVisible="False"
                        HideDeveloperCommands="False"
                        CompanyFilterMode="None"
                        DisplayRowCommand="False"
                        SystemFilterOnly="False"
                        UserDefinedPageSize="10"
                        Mode="None"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="False"
                        ChromeState="Normal"
                        PageWidgetHandle="2" />
                </div>




                            <div class="row">
                                <erp:ErpSimpleGrid runat="server"
                                    ID="ORDEMVENDAITEMENTREGAS_GRID"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTALINTERNO_ORDEMVENDAITEMENTREGAS.GRID"
                                    Title="Entregas"
                                    UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
                                    UserDefinedSelectColumnVisible="False"
                                    HideDeveloperCommands="False"
                                    CompanyFilterMode="None"
                                    DisplayRowCommand="False"
                                    SystemFilterOnly="False"
                                    UserDefinedPageSize="10"
                                    Mode="None"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="True"
                                    ChromeState="Normal"
                                    PageWidgetHandle="4" />
                            </div>

        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tab_1_2" Text="Condições de Recebimento">
                <div class="row">
                    <erp:ErpSimpleGrid runat="server"
                        ID="ORDEMVENDACONDICOES_GRID"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTALINTERNO_ORDEMVENDACONDICOES.GRID"
                        Title="Condições de Recebimento"
                        UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                        UserDefinedSelectColumnVisible="False"
                        HideDeveloperCommands="False"
                        CompanyFilterMode="None"
                        DisplayRowCommand="False"
                        SystemFilterOnly="False"
                        UserDefinedPageSize="10"
                        Mode="None"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="False"
                        ChromeState="Normal"
                        PageWidgetHandle="3" />
                </div>
        </erp:ErpTab>

    </erp:ErpTabControl>

</asp:content>
