<%@ Page Title="Recebimentos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.Recebimentos.RecebimentosGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRO" Title="Recebimento Fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_VT_FILTRORECEBIMENTOS.FILTROPRINCIPAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GN_RECEBIMENTOS_GRID" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="RECEBIMENTOSFISCAIS" Title="Recebimentos fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="RECEBIMENTOSFISCAISGRID.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="30" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" FormUrl="~/aga/e/materiais/recebimentos/RecebimentoFiscal/RecebimentoFiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GN_RECEBIMENTOS_GRID" Level="20" Order="30"  />
        </div>
    
        <script type="text/javascript">
                      function RecolherSecaoDoFormulario(idSecao) {
            var selector = document.querySelectorAll("[id$=" + idSecao + "]");
            if (selector.length > 0) {
                var secao = selector[0].firstChild;
                var fontIcon = selector[0].lastElementChild.firstChild;

                if (fontIcon.classList.contains("fa-angle-down")) {
                    Benner.FormWidget.changeStateGroup(secao);
                }
            }
        }

              </script>
      </asp:Content>
    