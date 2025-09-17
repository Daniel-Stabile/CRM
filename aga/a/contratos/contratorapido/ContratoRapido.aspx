<%@ Page Title="Contrato rápido" Language="C#" Inherits="aga.a.contratos.ContratoRapidoPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CADASTROCONTRATO" Title="Contrato rápido" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATOSRAPIDOS.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_CONTRATORAPIDO_CONTRATORAPIDO" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CADASTROCONTRATO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="CN_CONTRATOOBJETOS.RAPIDOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(CONTRATO)" PageId="AGA_A_CONTRATOS_CONTRATORAPIDO_CONTRATORAPIDO" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="ITENS_1" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CADASTROCONTRATO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATOOBJETOS.RAPIDOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(CONTRATO)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_CONTRATORAPIDO_CONTRATORAPIDO" Level="20" Order="15"  />
        </div>
    
        <script type="text/javascript">
              var prm;
$(function (){
    
    
    $('#ITENS_1').show();
    $('#ITENS').hide();
    prm = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!prm.get_isInAsyncPostBack()) {
        prm.add_endRequest(function (sender, args) {
            $('#ITENS_1').show();
            $('#ITENS').hide();
            VerificarAcaoUsuario();
        });
        
    }
});

function VerificarAcaoUsuario(sender, args){
    
    
    var editando = ((prm._activeElement.id == 'top-CMD_EDITAR') || $(prm._activeElement).closest('a[id="top-CMD_EDITAR"]').length > 0);
    
    var excluindo = ($(prm._activeElement).hasClass('btn-del'));
    
    var _alert = document.getElementById('ctl00_Main_ITENS_MsgUser_message');
    
    if(excluindo || editando || _alert){
        $('#ITENS_1').hide();
        $('#ITENS').show();
    }
}


              </script>
      </asp:Content>
    