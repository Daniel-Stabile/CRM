<%@ Page Title="Tipos de Recursos" Language="C#" CodeFile="~/Pages/KCrmTiposrecursospessoa/BennerGrid.aspx.cs" Inherits="KCrmTiposrecursospessoaBennerGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <div class="row">
        <wes:AjaxForm runat="server" ID="K_VERTICAL" Title="Vertical" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_PESSOAVERTICAL.CNPJ.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGES_KCRMTIPOSRECURSOSPESSOA_BENNERGRID" Level="50" Order="10" />
    </div>
    <div class="row">
        <%--<div v-show="Loading" style="background-color: whitesmoke; z-index: 100; opacity: 0.6; height: 100%; width: 100%; position: absolute">
            <img src="../../content/img/Dot Loader.gif" style="position: relative; left: 40%; top: 30%; width: 20%" />
        </div>--%>
        <div class="col-md-12 widget portlet-default">
            <div class="portlet light" style="max-height: 400px; overflow: auto;">
                <div class="portlet body form">
                    <asp:GridView ID="GrdContratos" runat="server" CssClass="widget-body" OnRowCommand="GrdContratos_RowCommand" OnRowDataBound="GrdContratos_RowDataBound" OnRowCreated="GrdContratos_RowCreated">
                        <RowStyle CssClass="grid-row" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 widget portlet-default">
            <div class="portlet light" style="max-height: 400px; overflow: auto;">
                <div class="portlet body form">
                    <asp:GridView ID="GrdItensContrato" runat="server" CssClass="widget-body">
                        <RowStyle CssClass="grid-row" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            // Manipula o cursor quando passar o mouse sobre uma linha do grid
            $('.grid-row').hover(function () {
                $(this).css('cursor', 'pointer');
            }, function () {
                $(this).css('cursor', 'default');
            });
            $('.grid-row').click(function () {
                // Obtenha os dados da linha clicada usando o DOM da tabela
                var rowData = $(this).find('tr').map(function () {
                    return $(this).text();
                }).get();
            });
        });
    </script>
    
      </asp:Content>
    