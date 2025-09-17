<%@ Page Title="Digitação rápida de cotações" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.DigitacaoRapidaCotacoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:EditableGrid runat="server" ID="DIGITAORPIDADECOTAES" Title="Digitação rápida de cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICAOCOTACOES.DIGITACAORAPIDA.GRID" DefaultFilterName="Comprador e fornecedor" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="1=2" PageId="AGA_A_SUPRIMENTOS_COTACOES_DIGITACAORAPIDACOTACOES" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              const limparHandlesRodadasPreenchidas = () => $("#ctl00_Main_DIGITAORPIDADECOTAES_BulkEditGridView_DataChangedCollecion").val("");

$(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
        pagina.add_endRequest(alterarDestinoComandoSalvar);
        
    alterarDestinoComandoSalvar();
});

const alterarDestinoComandoSalvar = () => {
    let novoDestinoComando = "javascript:__doPostBack('SalvarCotacoes', '')";
    $("#top-SalvarRodadas").attr("href", novoDestinoComando);
    $("#ctl00_Main_DIGITAORPIDADECOTAES_footerCommands #top-SalvarRodadas").attr("href", novoDestinoComando);
};

              </script>
        <style>
              #DIGITAORPIDADECOTAES th, td {
    white-space: nowrap !important;
}
              </style>
      </asp:Content>
    