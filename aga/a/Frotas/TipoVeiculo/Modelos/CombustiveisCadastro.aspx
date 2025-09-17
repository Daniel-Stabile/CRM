<%@ Page Title="Combustível" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="COMBUSTVEL" Title="Combustível" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_MODELOCOMBUSTIVEIS.CADASTROMODELOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_TIPOVEICULO_MODELOS_COMBUSTIVEIS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="VARIAESPARAASFILIAIS" Title="Variações Para As Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="COMBUSTVEL" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_COMBUSTIVELVARIACOES.COMBUSTIVELVARIACAOFILIAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.COMBUSTIVEL = @CAMPO(COMBUSTIVEL)" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelos/Combustivel/VariacaoParaFilial.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_TIPOVEICULO_MODELOS_COMBUSTIVEIS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    