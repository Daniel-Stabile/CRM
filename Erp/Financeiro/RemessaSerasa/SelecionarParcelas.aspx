<%@ Page Title="Parcelas" Language="C#" Inherits="aga.e.Financeiro.RemessaSerasa.SelecionarParcelas" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" 
                        ID="PARCELAS" 
                        Title="Parcelas" 
                        EntityViewName="FN_PARCELAS.REMESSASERASA.SELECIONARPARCELAS.GRID"
                        UserDefinedCriteriaWhereClause=""
                        DefaultFilterName="Padrão"
                        PortletLayout="Default" 
                        BootstrapCols="12" 
                        ShowTitle="true" 
                        ProviderWidgetUniqueId="" 
                        ChromeState="Normal" 
                        CanDelete="False" 
                        CanUpdate="False" 
                        CanInsert="False" 
                        Mode="Fixed" 
                        UserDefinedSelectColumnVisible="True" 
                        UserDefinedPageSize="50" 
                        SystemFilterOnly="True" 
                        DisplayRowCommand="True" 
                        CompanyFilterMode="OnlyCompany" 
                        ShowExport="True" 
                        UserDefinedDisableRowSelection="False" 
                        PageWidgetHandle="22469" 
                        Level="20" 
                        Order="10"  />
        
    </div>
</asp:Content>
