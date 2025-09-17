<%@ Page Title="Liberar parcelas" Language="C#" Inherits="aga.e.Financeiro.Documentos.LiberarParcelas" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server">
    <div class="row" id="div_parcelas">
        <wes:SimpleGrid runat="server" 
            ID="PARCELAS" 
            Title="Parcelas" 
            Subtitle="" 
            PortletCssClass="" 
            PortletLayout="Default" 
            BootstrapCols="12" 
            FontIcon="" 
            ShowTitle="true" 
            ProviderWidgetUniqueId="" 
            ChromeState="Normal" 
            CanDelete="false" 
            CanUpdate="false" 
            CanInsert="false" 
            EntityViewName="FN_PARCELAS.ZOOMDOCUMENTOS.LIBERARPARCELAS.GRID" 
            Mode="None" 
            UserDefinedSelectColumnVisible="true" 
            UserDefinedPageSize="100" 
            SystemFilterOnly="False" 
            DisplayRowCommand="true" 
            CompanyFilterMode="OnlyCompany" 
            ShowExport="True" 
            UserDefinedDisableRowSelection="true" 
            PageWidgetHandle="22516" 
            Level="20" 
            Order="10" />
    </div>

    <script type="text/javascript">
        jQuery(function ($) {
            divParcelas = $("#div_parcelas")
            if (!!(divParcelas[0])) {
                const ckSelecionarTodasParcelas = divParcelas.find("input[id$=SelectAllCheckBoxHeader]")
                if (!!(ckSelecionarTodasParcelas[0])) {
                    ckSelecionarTodasParcelas.click()
                }
            }
        })
    </script>
</asp:content>
