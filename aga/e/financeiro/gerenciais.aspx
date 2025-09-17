<%@ Page Title="Gerenciais" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Financeiro.Gerenciais" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div id="app" class="col-md-12">
            <div id="navegadorNaoSuportado" class="note note-danger note-bordered hide">
                <h3>Ops!</h3>
                <p>O navegador atual não tem suporte para acessar esta página e visualizar o relatório Gerenciais, recomendamos a utilização do Google Chrome.</p>
            </div>

            <gerenciais-pivot-grid id="pivotGrid"></gerenciais-pivot-grid>
        </div>
    </div>

    <div id="projetos_container" style="display: none;">
        <wes:SimpleGrid runat="server" ID="PROJETOS" Title="Projetos" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PROJETOS.TREEVIEW.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="True" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_PAGAMENTOAUTOMATIZADO" Level="20" Order="30"  />
    </div>

    <script src="../../../Content/apps/financeiro/gerenciais.js"></script>

    <script>
        $(document).ready(function () {
            verificarSeBrowserEhSuportado();
            configuraData();
            ajustaTreeViewProjetos();
        });

        function configuraData() {
            $('.filtro-gerenciais-right-actions input[name="start"]').attr("readonly", "readonly").css("background-color", "white");
            $('.filtro-gerenciais-right-actions input[name="end"]').attr("readonly", "readonly").css("background-color", "white");
        }

        

        function verificarSeBrowserEhSuportado() {
            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (!(msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)))
                $("#navegadorNaoSuportado").addClass('hide');
            else
                $("#navegadorNaoSuportado").removeClass('hide');

            return false;
        }

        function ajustaTreeViewProjetos(){
            document.getElementById("treeview_projetos_custom").append(document.getElementById("PROJETOS"));
        }

    </script>

<style>
    .bootstrap-switch span::before {
        content: " " !important;
    }
    .dx-pivotgrid {
        cursor: default;
    }
    .linkAnalitico {
        cursor: pointer;
    }
    .modal-title {
        font-weight: bold;
        font-size: 22px;
    }
    .dx-datagrid-header-panel .dx-toolbar .dx-toolbar-after {
        right: auto;
        padding-left: 0;
    }
    .dx-datagrid-headers {
        background-color: ghostwhite;
        color: black;
        font-weight: bold;
    }
    .dx-pivotgrid-vertical-headers, .dx-row-total
    { 
      background: #dbe8f8 !important; 
    } 
    .dx-page-sizes:before {  
        content: "Itens por página (clique para alterar): ";
        opacity: 0.6;
    }
    .dx-group-row {
        display: none;
    }

    #PROJETOS table{
        background-color: #dbe8f8!important;
    }
    
    #PROJETOS table > tbody > tr > td{
        border: none !important;
    }

    #PROJETOS table .column-extra-options, #PROJETOS .multi-select-message{
        display: none !important;
    }

    #PROJETOS table tr:hover td{
        background: #E7F4F9!important;
        background-color: #E7F4F9!important;
    }
    
    #PROJETOS table tr.active td{
        background: #b2e7ff!important;
        background-color: #b2e7ff!important;
    }

    #PROJETOS{
        max-height: 400px;
        overflow-y: auto;
        overflow-x: hidden;
    }
</style>

</asp:Content>