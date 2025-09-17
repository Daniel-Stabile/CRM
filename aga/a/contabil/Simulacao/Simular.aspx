<%@ Page Title="Simulação contábil" Language="C#" Inherits="aga.a.contabil.simulacao.Simulacao,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CENRIODESIMULAOCONTBIL" Title="Cenário de simulação contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CT_SIMULACAOCENARIO.SIMULACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_SIMULACAO_SIMULAR" Level="20" Order="10"  />
        <wes:ActionView runat="server" ID="PROJEO" Title="Projeção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CENRIODESIMULAOCONTBIL" ChromeState="Normal" Controller="SimulacaoContabil" Action="Simulacao" PageId="AGA_A_CONTABIL_SIMULACAO_SIMULAR" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    