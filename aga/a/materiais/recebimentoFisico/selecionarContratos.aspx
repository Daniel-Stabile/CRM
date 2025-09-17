<%@ Page Title="Selecionar contratos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.recebimentoFisico.SelecionarContratos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="SELECIONARCONTATROS" Title="Selecionar Contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CONSULTA_SELECIONARCONTRATOS.DATASOURCE.GRID" DefaultFilterName="BuscarContratos" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISICO_SELECIONARCONTRATOS" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              const conversorDecimal = value => currency(value, { separator: '.', decimal: ',', precision: 4 });

const AtualizarQuantidadeJSONItens = (item) => {
    var listaItens = JSON.parse($("#JsonListaItens").val());

    var handleItem = $(item).attr('name').split('$')[1];
    var indexItemJSON = listaItens.findIndex(item => item.Handle === handleItem);
    listaItens[indexItemJSON].Quantidade = conversorDecimal($(item).val()).value;

    $("#JsonListaItens").val(JSON.stringify(listaItens));
};

const MapearItensParaJSON = () => {
    $("#SELECIONARCONTATROS input[name*='QTDE_RECEBIDA']").blur(function () { AtualizarQuantidadeJSONItens(this); });

    var listaItens = JSON.parse($("#JsonListaItens").val());

    $("#SELECIONARCONTATROS input[name*='QTDE_RECEBIDA']").map(function () {
        var handleItem = $(this).attr('name').split('$')[1];
        var indexItemJSON = listaItens.findIndex(item => item.Handle === handleItem);

        if (indexItemJSON > -1)
            $(this).val(conversorDecimal(listaItens[indexItemJSON].Quantidade).format());
        else
            listaItens.push({
                Handle: handleItem,
                Quantidade: conversorDecimal($(this).val()).value
            });
    });

    $("#JsonListaItens").val(JSON.stringify(listaItens));
};

$(Sys.WebForms.PageRequestManager.getInstance().add_endRequest(MapearItensParaJSON));

              </script>
        <style>
              [id^="QTDE_RECEBIDA$"] {
    width: 150px;
}

              </style>
      </asp:Content>
    