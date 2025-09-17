<%@ Page Title="Etapas do processo" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoCobranca.EtapasProcesso" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:EditableGrid runat="server" ID="ETAPASDOPROCESSO" Title="Etapas do processo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GC_PROCESSOSETAPAS.CADASTROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" PageId="GESTAO_COBRANCA_ETAPAS_PROCESSO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    