<%@ Page Title="Detalhamento Centro Manutenção" Language="C#" CodeFile="~/Frotas/e/TabelasAuxiliares/CentroManutencao/CadastroCentroManutencaoForm.aspx.cs" Inherits="CentroManutencaoCadastroCentroManutencaoFormPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CENTRODEMANUTENCAO" Title="Centro de Manutenção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MA_FORMCENTROSMANUTENCAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_A_TABELASAUXILIARES_CENTROMANUTENCAO_FORM" Level="20" Order="10" />

        <wes:SimpleGrid runat="server" ID="CENTROSDEMANUTENO" Title="Centros de Manutenção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CENTRODEMANUTENCAO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MA_CENTROMANUTENCAOTECNICOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_E_TABELASAUXILIARES_CENTROMANUTENCAOTECNICOS_GRID" Level="20" Order="10"  />

    </div>

</asp:Content>
