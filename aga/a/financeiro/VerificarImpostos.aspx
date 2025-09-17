<%@ Page Title="Verificar impostos" Language="C#" Inherits="aga.a.Financeiro.VerificarImpostos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="REMESSA" Title="Remessa" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBREMESSAS.VERIFICARIMPOSTOS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_VERIFICARIMPOSTOS" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="PAGAMENTOSAGENDAMENTOS" Title="Pagamentos/Agendamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REMESSA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.VERIFICARIMPOSTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REMESSA = @CAMPO(HANDLE) AND A.TEMRETENCAONABAIXA = 'S'" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_VERIFICARIMPOSTOS" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="IMPOSTOSRETIDOS" Title="Impostos retidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PAGAMENTOSAGENDAMENTOS" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="FN_DOCUMENTOIMPOSTOSPARCELAS.VERIFICARIMPOSTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE)" ShowExport="False" PageId="AGA_A_FINANCEIRO_VERIFICARIMPOSTOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    