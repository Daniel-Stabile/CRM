<%@ Page Title="Gerar fornecedores" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.GerarFornecedores" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:EditableGrid runat="server" ID="GERARFORNECEDORES" Title="Gerar fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="PD_VARIACAOFORNECEDORES.GERAR_FORNECEDORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="1000" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" PageId="MATERIAIS_GERARFORNECEDORES" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
        pagina.add_endRequest(alterarDestinoComandoGerar);
        
    alterarDestinoComandoGerar();
});

const alterarDestinoComandoGerar = () => {
    let novoDestinoComando = "javascript:__doPostBack('GerarFornecedores', '')";
    $("#top-CMD_GerarFornecedoresSelecionados").attr("href", novoDestinoComando);
    $("#ctl00_Main_GERARFORNECEDORES_footerCommands #top-CMD_GerarFornecedoresSelecionados").attr("href", novoDestinoComando);
};
              </script>
        <style>
              #GERARFORNECEDORES th, td {
    white-space: nowrap !important;
}
              </style>
      </asp:Content>
    