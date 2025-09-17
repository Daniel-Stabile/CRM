<%@ Page Title="Rateio do lançamento" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDFX_RATEIOSLANCAMENTO" Title="Rateio do lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_RATEIOSLANCAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/FluxoCaixa/Lancamentos/FxLancamentos/FxRateioslancamento/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FLUXOCAIXA_LANCAMENTOS_FXLANCAMENTOS_FXRATEIOSLANCAMENTO_GRID" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    