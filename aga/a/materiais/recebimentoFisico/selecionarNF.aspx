<%@ Page Title="Seleção de notas fiscais" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.recebimentoFisico.SelecionarNF" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="SELECIONAROSITENSPARADEVOLUODECLIENTES_1" Title="Seleção de itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VTSELECIONARNF.RECEBIMENTOFISICO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CORPORATIVO_AGA_A_MATERIAIS_RECEBIMENTOFISICO_SELECIONARNF" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CM_ITENS.ITEM.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="CORPORATIVO_AGA_A_MATERIAIS_RECEBIMENTOFISICO_SELECIONARNF" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITENS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_ITEMENTREGALOTES.RECEBIMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="1000" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ITEMENTREGA IN (SELECT HANDLE FROM CM_ITEMENTREGAS WHERE ITEM = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="CORPORATIVO_AGA_A_MATERIAIS_RECEBIMENTOFISICO_SELECIONARNF" Level="20" Order="40"  />
        </div>
    
        <script type="text/javascript">
              function AtualizarQuantidades() 
{
    var totalInformado = 0;
    
    $("#ctl00_Main_LOTES_SimpleGrid input[name*='QTDEEDITAVEL']").each(
    function() 
            {
                totalInformado += Number($(this).val().replace(",", "."));
            }
        );
    
    var lotesContados = $("#ctl00_Main_LOTES_SimpleGrid input[name*='QTDEEDITAVEL']").length;
    
    if (lotesContados > 0) 
    {
        $("#ctl00_Main_LOTES_SimpleGrid input[name*='QTDEEDITAVEL']").blur(AtualizarQuantidades);
        var handleItem = $("#ctl00_Main_LOTES_SimpleGrid input[name*='QTDEEDITAVEL']").attr('name').split('$')[6];
        var quantidadeTotal = totalInformado.toFixed(4).replace(".", ",");
        $("tr[handle='" + handleItem + "'] #QUANTIDADE").val(quantidadeTotal);
        
        var listaItens = ($("#CAMPOQUANTIDADELOTE").val().length > 0) ?
            $.parseJSON($("#CAMPOQUANTIDADELOTE").val()) : [];
        var listaLotes = [];
        
        $("#ctl00_Main_LOTES_SimpleGrid input[name*='QTDEEDITAVEL']").map(
            function() { listaLotes.push({
                    HandleLote: $(this).attr('name').split('$')[7],
                    Quantidade: Number($(this).val().replace(",", "."))
                });
            }
        );
        
        var indexItemSeExistir = listaItens.findIndex(item => item.HandleItem === handleItem);
        
        if (indexItemSeExistir > -1)
        {
            listaItens[indexItemSeExistir].Lotes = listaLotes;
            listaItens[indexItemSeExistir].QtdeTotal = totalInformado;
        }
        else
        {
            listaItens.push({
                HandleItem: handleItem, 
                Lotes: listaLotes, 
                QtdeTotal: totalInformado
            });
        }
        
        $("#CAMPOQUANTIDADELOTE").val(JSON.stringify(listaItens));
    }
}

              </script>
        <style>
              .checkBoxEditavel{
    margin-top: 1px !important;
    margin-bottom: 1px !important;
}

              </style>
      </asp:Content>
    