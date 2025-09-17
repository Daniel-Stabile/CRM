<%@ Page Title="Grupos de Lançamento" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDFX_GRUPOSLANCAMENTO" Title="Grupos de Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_GRUPOSLANCAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/FluxoCaixa/a/Lancamentos/FxGruposLancamento/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_FXGRUPOSLANCAMENTO_GRID" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    