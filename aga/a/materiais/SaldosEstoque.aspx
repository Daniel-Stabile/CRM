<%@ Page Title="Saldos em estoque" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.SaldosEstoque" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:FilterWidget runat="server" ID="FILTROSALDOSESTOQUE" Title="Saldos em Estoque" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ALMOXARIFADOPRODUTOS.SALDOS_ESTOQUE.GRID" DefaultFilterName="Saldos de estoque" Mode="Fixed" PageId="PD_SALDOS_ESTOQUE" Level="20" Order="10"  />
        <wes:HtmlPanel runat="server" ID="SALDOSESTOQUE" Title="SALDOSESTOQUE" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTROSALDOSESTOQUE" ChromeState="Normal" HtmlBase64="PGRpdiBpZD0ic2FsZG9zR3JpZCI+CiAgICA8bWF0ZXJpYWlzLXNhbGRvcz48L21hdGVyaWFpcy1zYWxkb3M+CjwvZGl2Pg==" PageId="PD_SALDOS_ESTOQUE" Level="20" Order="20"  />
        <wes:HtmlPanel runat="server" ID="MOVIMENTACOESESTOQUE" Title="MOVIMENTACOESESTOQUE" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTROSALDOSESTOQUE" ChromeState="Normal" HtmlBase64="PGRpdiBpZD0ibW92aW1lbnRhY29lc0dyaWQiPgogICAgPG1hdGVyaWFpcy1tb3ZpbWVudGFjb2VzPjwvbWF0ZXJpYWlzLW1vdmltZW50YWNvZXM+CjwvZGl2Pg==" PageId="PD_SALDOS_ESTOQUE" Level="20" Order="30"  />
        </div>
    
        <script type="text/javascript">
              var saldosPivotGrid = {};
var movimentacoesDataGrid = {};

const inicializarSaldos = () => {
    Benner.Corporativo.Materiais.SaldosStore.dispatch("loadSaldosStore", JSON.parse($("#JsonDadosFiltroSaldos").val()));
};

const inicializarMovimentacoes= () => {
    Benner.Corporativo.Materiais.MovimentacoesStore.dispatch("loadMovimentacoesStore", JSON.parse($("#JsonDadosFiltroMovimentacoes").val()));
}
              </script>
      </asp:Content>
    