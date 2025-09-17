<%@ Page Title="Processo de cobrança" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoCobranca.Processo" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PROCESSODECOBRANA" Title="Processo de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GC_PROCESSOSCOBRANCA.CADASTROS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GESTAO_COBRANCA_PROCESSO" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="ETAPASDOPROCESSO" Title="Etapas do processo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PROCESSODECOBRANA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GC_PROCESSOSETAPAS.CADASTROS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="3" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROCESSO = @CAMPO(HANDLE)" PageId="GESTAO_COBRANCA_PROCESSO" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="MATRIZDECOBRANA" Title="Matriz de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PROCESSODECOBRANA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GC_MATRIZCOBRANCA.CADASTROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROCESSOCOBRANCA= @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAO_COBRANCA_PROCESSO" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    