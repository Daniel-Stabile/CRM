<%@ Page Title="Minha agenda" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoCobranca.Agenda" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="AGENDA" Title="Agenda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-calendar" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GC_AGENDA.GRID" DefaultFilterName="Padrão" Mode="SelectableRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/e/cobranca/InformacoesCliente.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MINHA_AGENDA" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(function (){$('#ctl00_Main_AGENDA .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" style="border-radius: 10px!important;margin: 0 7px 0 0!important;" onclick="exibirFiltro();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="ocultarFiltro(true);" style="border-radius: 10px!important;" id="labelOcultarFiltroFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');
});

var ocultarFiltro = () => {
	$("#ctl00_Main_AGENDA_FilterControl").hide();
};

var exibirFiltro = () =>  {
	$("#ctl00_Main_AGENDA_FilterControl").show();
}
              </script>
        <style>
              #ctl00_Main_AGENDA_FilterControl_FilterContainer, #ctl00_Main_AGENDA_MsgUser, .alert-warning, .alert-danger {
    margin: 0 -20px 5px !important;
}

#ctl00_Main_AGENDA_FilterControl .input-group > input, select{
    border-top-left-radius: 10px !important;
    border-bottom-left-radius: 10px !important;
}

#ctl00_Main_AGENDA_FilterControl_FilterFormContainer  select{
    border-radius: 10px !important;
}

#ctl00_Main_AGENDA_FilterControl_FilterFormContainer > .btn, .btn-default:not(#ctl00_Main_AGENDA_FilterControl_FilterControlEditButton){
    border-top-right-radius: 10px !important;
    border-bottom-right-radius: 10px !important;
}

.select2-selection, .select2-selection--single {
    border-top-left-radius: 10px !important;
    border-bottom-left-radius: 10px !important;
}
#ctl00_Main_AGENDA_FilterControl_FilterControlNewButton{
    border-top-right-radius: 10px !important;
    border-bottom-right-radius: 10px !important;
} 

#ctl00_Main_AGENDA_FilterControl_FilterActionsCol > a {
    border-radius: 10px !important;
    margin: 0.25rem;
}

.command-action{
    border-radius: 10px!important;
}
.table{
    white-space: nowrap;
}
              </style>
      </asp:Content>
    