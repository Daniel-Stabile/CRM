<%@ Page Title="Notas Fiscais de Serviço" Language="C#" CodeFile="Grid.aspx.cs" Inherits="Erp_vendas_nfs_grid" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row" id="totais"></div>
    <div class="row">
            <wes:SimpleGrid runat="server" ID="GRIDNOTASFISCAISDESERVICO"
                Title="Notas Fiscais de Serviço" BootstrapCols="12" UserDefinedDisableRowSelection="False" FormUrl="~/Erp/Vendas/NFS/Form.aspx"
                UserDefinedCriteriaWhereClause="" UserDefinedDataSourceParameters="" CompanyFilterMode="OnlyCompany" DisplayRowCommand="True"
                SystemFilterOnly="False" UserDefinedPageSize="10" Mode="None" UserDefinedSelectColumnVisible="False"
                DefaultFilterName="" CanInsert="False" CanUpdate="False" CanDelete="False" ChromeState="Normal"
                EntityViewName="CLOUD_NOTASFISCAISSERVICO.GRID" ShowTitle="True" PageWidgetHandle="261" />
    </div>
    <script type="text/javascript">
        $("document").ready(function () {
            $.ajax({
                type: "POST",
                url: "Grid.aspx/GetTotais",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var alerts = response.d;
                    $.each(alerts, function (i, currentAlert) {

                        $('#totais').append(
                            "<div class=\"col-lg-3 col-md-3 col-sm-6 col-xs-12\">" +
                            " <a class=\"dashboard-stat dashboard-stat-v2 "+ currentAlert.Label +" href=\"#\">"+
                            "  <div class=\"visual\"><i class=\"fa fa-bar-chart-o\"></i></div>" +
                            "  <div class=\"details\"> " +
                            "       <div class=\"number\"><span data-counter=\"counterup\" data-value=" + currentAlert.Values + ">" + currentAlert.Values + " </span></div>" +
                            "       <div class=\"desc\">"+currentAlert.Title+ "</div>"+
                            "  </div>"+
                            " </a>" +
                            "</div>");
                    });
                    
                },
                failure: function (response) {
                },
                error: function (response) {
                }
            });
        });


    </script>

</asp:Content>
