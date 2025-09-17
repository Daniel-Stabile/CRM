<%@ Page Title="Limites de crédito" Language="C#" CodeFile="~/Erp/Financeiro/AnaliseCredito/LimitesCredito.aspx.cs" Inherits="AnaliseCreditoLimitesCreditoPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LIMITESDECRDITO" ProviderWidgetUniqueId="" UserDefinedCriteriaWhereClause="" Title="Limites de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true"  ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOASLIMITESCREDITO.ANALISECREDITO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="22333" Level="20" Order="10" />
        <wes:AjaxForm runat="server" ID="LIMITEDECRDITO"  ProviderWidgetUniqueId="LIMITESDECRDITO" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE) AND A.PESSOA = @CAMPO(PESSOA)"  Title="Limite de Crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOASLIMITESCREDITO.ANALISECREDITO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22334" Level="20" Order="20" />
    </div>
    <script>
        $(document).ready(function () {
            SelectRow("LIMITESDECRDITO", 0);
        });
        function SelectRow(prIDGrid, prLine) {
            function internalSelectRow(grid, idRow) {
                //on the tests, 'SelectRow' is more faster, if use dopostback than use click
                if ((idRow < grid.find("table tbody tr").filter("[rel]").length) && (idRow >= 0)) {
                    event.stopPropagation();
                    //$('tr[rel="' + idRow + '"').find('td').trigger('click');
                    __doPostBack(grid.find('table').attr('id').replace(/_/g, '$'), 'Select$' + idRow)
                }
            }
            var grid = $('[data-widget-id="' + prIDGrid + '"]');
            internalSelectRow(grid, prLine);
        }

    </script>
</asp:Content>
