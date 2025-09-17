<%@ Page Title="Gerar clientes" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.GerarClientes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:EditableGrid runat="server" ID="GERARCLIENTES" Title="Gerar clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="PD_VARIACAOCLIENTES.GERAR_CLIENTES.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="1000" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" PageId="MATERIAIS_GERARCLIENTES" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
        pagina.add_endRequest(alterarDestinoComandoGerar);
        
    alterarDestinoComandoGerar();
});

const alterarDestinoComandoGerar = () => {
    let novoDestinoComando = "javascript:__doPostBack('GerarClientes', '')";
    $("#top-CMD_GerarClientesSelecionados").attr("href", novoDestinoComando);
    $("#ctl00_Main_GERARCLIENTES_footerCommands #top-CMD_GerarClientesSelecionados").attr("href", novoDestinoComando);
};
              </script>
        <style>
              #GERARCLIENTES th, td {
    white-space: nowrap !important;
}
              </style>
      </asp:Content>
    