<%@ Page Title="Baixa rápida" Language="C#" CodeFile="~/aga/e/financeiro/tesouraria/GridBaixaRapida.aspx.cs" Inherits="tesourariaGridBaixaRapidaPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PARCELAS" Title="Parcelas" Subtitle="" PortletCssClass=""
            PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId=""
            ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False"
            EntityViewName="PARCELAS_EM_ABERTO.DATASOURCE.GRID" DefaultFilterName="Filtro parcelas baixa rápida"
            Mode="SelectableRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="True"
            DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True"
            UserDefinedDisableRowSelection="False" PageWidgetHandle="22674" Level="20" Order="20" />
    </div>
    
    <script type="text/javascript">
        function afterAsyncPostBack() {
              $("#ctl00_Main_PARCELAS_btPreviousPage").click(function(){
                LimparSelecoes();
            });
            
            $("#ctl00_Main_PARCELAS_btNextPage").click(function(){
                LimparSelecoes();
            });
            
            $("#ctl00_Main_PARCELAS_FilterControl_FilterButton").click(function(){
                LimparSelecoes();
            });
            
            function LimparSelecoes() {                
                $("[id$=SelectAllCheckBoxHeader]").click();

                var checkboxHeader = $("[id$=SelectAllCheckBoxHeader]");
                if (checkboxHeader.length > 0 && checkboxHeader[0].checked) {
                    $("[id$=SelectAllCheckBoxHeader]").click();
                }
            }
            
            $('input[type="checkbox"]').on('click', function () {
                inicializaCMD_BAIXAR();
                   var valorTotal = 0;
                $('input[type="checkbox"]:checked:not(#ctl00_Main_PARCELAS_SimpleGrid_ctl01_SelectAllCheckBoxHeader,#ctl00_Main_PARCELAS_FilterControl_GERAL_REMESSABANCARIA_CHECKBOX,#ctl00_Main_PARCELAS_FilterControl_GERAL_PGTOPRIORIZADO_CHECKBOX)').each(function () {
                    
                    parentTR = $(this).parents('tr:eq(0)')[0];

                    TDValor = $(parentTR).children('td[data-field="VALORNOMINAL"]:first').text();
                    strValor = TDValor.replace(/[R$\s]+/, '');
                    strValor = strValor.replaceAll('.', '');
                    strValor = strValor.replace(',', '.'); 

                    valorTotal += parseFloat(strValor);

                    if (valorTotal > 0) {
                        valorFormatado = 'R$ ' + mascaraValor(valorTotal.toFixed(2));
                        $(".btn.command-action.custom-action.command-action.btn-primary").each(function (btn) {
                            this.innerHTML = "<i class='fa fa-check btn-action'></i> Baixar (" + valorFormatado + ")";
                        })
                    }
                });
            });
        }

        $(function(){
            afterAsyncPostBack();
        })

        function mascaraValor(valor) {
            valor = valor.toString().replace(/\D/g, "");
            valor = valor.toString().replace(/(\d)(\d{8})$/, "$1.$2");
            valor = valor.toString().replace(/(\d)(\d{5})$/, "$1.$2");
            valor = valor.toString().replace(/(\d)(\d{2})$/, "$1,$2");
            return valor;
        }

        Sys.Application.add_init(appl_init);
        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_beginRequest(EndHandler);
            pgRegMgr.add_endRequest(EndHandler);
        }

        function EndHandler() {
            afterAsyncPostBack();
        }

        function inicializaCMD_BAIXAR() {
            $(".btn.command-action.custom-action.command-action.btn-primary").each(function(btn){
                this.innerHTML = "<i class='fa fa-check btn-action'></i> Baixar"
            })
        }

        $(function () {
            var prm = window.Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function(sender, args){
                    RemoverHoraZeroCampoData();       
                });
            }
            RemoverHoraZeroCampoData();
        });
        
        function RemoverHoraZeroCampoData(){
            $('td:contains("00:00:00")').each(function (i, elem) {
                elem.innerText = elem.innerText.replace('00:00:00', '');
            })
        }
    </script>
</asp:Content>

