<%@ Page Title="Recálculo de saldos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.Recalculos.RecalculoSaldos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="RECLCULODESALDOS" Title="Recálculo de saldos" Subtitle="Esta rotina reorganiza os saldos do(s) almoxarifado(s) e da(s) filial(is) nas movimentações de estoque." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_PD_FILTRORECALCULOSALDOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_RECALCULOS_RECALCULODESALDOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    