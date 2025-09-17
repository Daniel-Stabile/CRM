<%@ Page Title="Edição rápida" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.Cotacoes.ItensFastPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="erp-unbox">

        <div class="row">
            
            <wes:EditableGrid runat="server"
                ID="ITENSCOTACAO_GRID"
                SystemInstanceName="CORPORATIVO"
                EntityViewName="PORTAL_FOR_COTACAO_ITENS_EDIT.GRID"
                Description="Informe os valores e condições específicas de cada item da cotação."
                UserDefinedCriteriaWhereClause="A.EHCANCELADO <> 'S' AND A.STATUS = 1"
                UserDefinedDisableRowSelection="False"
                UserDefinedSelectColumnVisible="False"
                HideDeveloperCommands="False"
                CompanyFilterMode="None"
                FormUrl="TESTE"
                DisplayRowCommand="False"
                SystemFilterOnly="False"
                UserDefinedPageSize="300"
                Mode="None"
                CanInsert="False"
                CanUpdate="True"
                CanDelete="False"
                ShowTitle="True"
                Title="Itens da cotação"
                ChromeState="Normal"
                PageWidgetHandle="2" />
        </div>

    </div>

</asp:Content>
