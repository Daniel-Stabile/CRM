<%@ Page Title="Aglutinador Documentos CRE" Language="C#" CodeFile="~/Erp/Financeiro/AglutinadorCRE/Geral.aspx.cs" Inherits="AglutinadorCREGeralPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Contas a receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOS.AGLUTINADORCRE.GRID" DefaultFilterName="Filtro Aglutinador CRE" Mode="FixedRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="ERP_FINANCEIRO_AGLUTINADORCRE_GERAL" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              function afterAsyncPostBack() {
            $('input[type="checkbox"]').on('click', function () {
                inicializaCMD_SALVAR();
                var valorTotal = 0;
                $('input[type="checkbox"]:checked:not(#ctl00_Main_PARCELAS_SimpleGrid_ctl01_SelectAllCheckBoxHeader)').each(function () {
                    if(this.name.includes('CONTABILIZADO') || this.id == 'ctl00_Main_DOCUMENTOS_SimpleGrid_ctl01_SelectAllCheckBoxHeader')
                      return;
                    parentTR = $(this).parents('tr:eq(0)');

                    TDValor = $(parentTR).children('td[data-field="VALORLIQUIDO"]:first');

                    strValor = $(TDValor).children().text().replace(/[R$\s]+/, '');
                    strValor = strValor.replaceAll('.', '');
                    strValor = strValor.replace(',', '.');

                    valorTotal += parseFloat(strValor);
                    if (valorTotal > 0) {
                        valorFormatado = 'R$ ' + mascaraValor(valorTotal.toFixed(2));
                        $(".btn.command-action.custom-action.blue").each(function(btn){
                         this.innerHTML = "<i class='fa fa-check btn-action'></i> Aglutinar (" + valorFormatado + ")";
                        })
                    }
                });
            });
          }

          function inicializaCMD_SALVAR() {
               $(".btn.command-action.custom-action.blue").each(function(btn){
              this.innerHTML = "<i class='fa fa-check btn-action'></i> Aglutinar"
            })
          }

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

          $(function(){
            afterAsyncPostBack();
          })

          function EndHandler() {
            afterAsyncPostBack();
          }

              </script>
      </asp:Content>
    