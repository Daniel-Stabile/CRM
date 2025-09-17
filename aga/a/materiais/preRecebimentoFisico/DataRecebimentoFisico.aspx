<%@ Page Title="Gerar recebimento físico" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.preRecebimentoFisico.DataRecebimentoFisico" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PRRECEBIMENTOFSICO" Title="Gerar recebimento físico" Subtitle="Informe a data de entrada do recebimento para confirmar a geração" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_GERARPRERECEDATA.PRERECEBIMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_PRERECEBIMENTOFISICO_DATARECEBIMENTOFISICO" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(function () {
    LimparClasseTopAction('PRRECEBIMENTOFSICO');
    var divButtons = document.getElementById('ctl00_Main_PRRECEBIMENTOFSICO_toolbar');
    divButtons.classList.remove('top-actions-bar');
    var divCampos = document.getElementById('ctl00_Main_PRRECEBIMENTOFSICO_PageControl_GERAL_GERAL');
    divCampos.style.paddingTop = "0px";
});

              </script>
        <style>
              .alert-request-confirmation p {
	white-space: pre-line;
}

              </style>
      </asp:Content>
    