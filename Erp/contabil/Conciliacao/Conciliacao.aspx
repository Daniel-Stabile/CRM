<%@ Page Title="Conciliacao" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<style>
.chart {
    width: 100% !important;
    height: 250px !important;
}
.item-topo li{
    list-style-type: none;
    font-size: 17px;
    line-height: 35px;
    color: white;
}
.item-topo li strong {
    float: right;
}
.item-topo {
    margin-left:0;
    padding-left:0;
}
.table-bordered tbody tr td {
    padding-left: 20px
}
.hide {
    display:none
}
.filtro {
    cursor:pointer;
}
.filtro:hover 
{
    border-top: 2px dashed #8c8a8a;
    border-bottom: 2px dashed #8c8a8a;
}
caption {
    font-weight:bold;
    padding-top:20px
}
small {
    font-weight:normal;
    font-size:11px
}
.colResumo {
    font-weight:bold;border:none;text-align:right
}
.modal-dialog {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-content {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
</style>

<div class="portlet light">
    
    <div class="portlet-title">
        <div class="caption caption-md">
            <i class="icon-bar-chart theme-font hide"></i>
            <span class="caption-subject font-blue-madison bold uppercase">Posição atual da conciliação contábil</span>
        </div>
        <div class="actions">
            <a href="javascript:;" class="btn btn-sm btn-circle red easy-pie-chart-reload" onclick="location.reload();">
            <i class="fa fa-repeat"></i> Atualizar</a>
            <a href="javascript:;" onclick="window.location.assign('Auditoria.aspx')" class="btn btn-sm btn-circle blue-steel easy-pie-chart-reload">
            <i class="fa fa-check"></i> Auditar dados</a>
        </div>
    </div>
    <div class="portlet-body">
        <div class="row">
            
            <div class="col-md-6">
                <div id="chartPosicaoGeral" class="chart"></div>
            </div>

            <div class="col-md-6">
                <div id="ChartPrincipalErros" class="chart"></div>
            </div>
        </div>
    </div>
</div>

<div class="portlet light">
    
    <div class="portlet-title">
        <div class="caption caption-md">
            <i class="icon-bar-chart theme-font hide"></i>
            <span class="caption-subject font-blue-madison bold uppercase">Resumo geral</span>
            <span class="caption-helper hide"></span>
        </div>
    </div>
    <div class="portlet-body">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr style="background-color: #5e738b; color:#fff">
                            <th style="width: 50%"> Categoria </th>
                            <th> Origem </th>
                            <th> Contabilidade </th>
                            <th> Diferença </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="tr_BANCOS">
                            <td>
                                <a href="javascript:;"> Bancos </a>
                            </td>
                            <td style="text-align:right;"> R$ 825.50 </td>
                            <td style="text-align:right"> R$ 735.50 </td>
                            <td style="text-align:right"> R$ 90.00 </td>
                        </tr>
                        <tr id="tr_FORNECEDORES">
                            <td>
                                <a href="javascript:;"> Fornecedores</a>
                            </td>
                            <td style="text-align:right"> R$ 1825.50 </td>
                            <td style="text-align:right"> R$ 1735.50 </td>
                            <td style="text-align:right"> R$ 190.00 </td>
                        </tr>
                        <tr id="tr_CLIENTES">
                            <td>
                                <a href="javascript:;"> Clientes </a>
                            </td>
                            <td style="text-align:right"> R$ 725.50 </td>
                            <td style="text-align:right"> R$ 635.50 </td>
                            <td style="text-align:right"> R$ 90.00 </td>
                        </tr>
                        <tr id="tr_OUTROS">
                            <td>
                                <a href="javascript:;"> Outros </a>
                            </td>
                            <td style="text-align:right"> R$ 825.50 </td>
                            <td style="text-align:right"> R$ 735.50 </td>
                            <td style="text-align:right"> R$ 90.00 </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr style="border:none">
                            <td class="colResumo">Totais:</td>
                            <td class="colResumo">R$ 4.202,00</td>
                            <td class="colResumo">R$ 3.842,00</td>
                            <td class="colResumo">R$ 460,00</td>                            
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-8">
        <div class="portlet light">    
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart theme-font hide"></i>
                    <span class="caption-subject font-blue-madison bold uppercase">Por grupo de contas</span>
                    <span class="caption-helper hide"></span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tabbable-line">
                            <ul class="nav nav-tabs ">
                                <li class="active"><a href="#tabBancos" data-toggle="tab"> BANCOS </a></li>
                                <li><a href="#tabClientes" data-toggle="tab"> CLIENTES </a></li>
                                <li><a href="#tabFornecedores" data-toggle="tab"> FORNECEDORES </a></li>
                                <li><a href="#tabOutros" data-toggle="tab"> OUTROS </a></li>
                            </ul>  
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabBancos">
                                    <table class="table table-striped table-hover table-bordered">
                                        <thead>
                                            <tr style="background-color: #8392a4; color:#fff">
                                                <th style="width: 50%"> DESCRIÇÃO </th>
                                                <th> Origem </th>
                                                <th> Contabilidade </th>
                                                <th> Diferença </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> BRADESCO </a>
                                                </td>
                                                <td style="text-align:right;"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> HSBC </a>
                                                </td>
                                                <td style="text-align:right"> R$ 1825.50 </td>
                                                <td style="text-align:right"> R$ 1735.50 </td>
                                                <td style="text-align:right"> R$ 190.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> ITAÚ </a>
                                                </td>
                                                <td style="text-align:right"> R$ 725.50 </td>
                                                <td style="text-align:right"> R$ 635.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> CITYBANK </a>
                                                </td>
                                                <td style="text-align:right"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr style="border:none">
                                                <td class="colResumo">Totais:</td>
                                                <td class="colResumo">R$ 4.202,00</td>
                                                <td class="colResumo">R$ 3.842,00</td>
                                                <td class="colResumo">R$ 460,00</td>                            
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="tab-pane" id="tabClientes">
                                    <table class="table table-striped table-hover table-bordered">
                                        <thead>
                                            <tr style="background-color: #8392a4; color:#fff">
                                                <th style="width: 50%"> Conta </th>
                                                <th> Origem </th>
                                                <th> Contabilidade </th>
                                                <th> Diferença </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 1.02.03.4 - Cliente exemplo I</a>
                                                </td>
                                                <td style="text-align:right;"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 2.01.03.6 - Cliente exemplo II</a>
                                                </td>
                                                <td style="text-align:right"> R$ 1825.50 </td>
                                                <td style="text-align:right"> R$ 1735.50 </td>
                                                <td style="text-align:right"> R$ 190.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 2.02.04.5 - Cliente exemplo III </a>
                                                </td>
                                                <td style="text-align:right"> R$ 725.50 </td>
                                                <td style="text-align:right"> R$ 635.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 3.02.06.1 - Cliente exemplo IV </a>
                                                </td>
                                                <td style="text-align:right"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr style="border:none">
                                                <td class="colResumo">Totais:</td>
                                                <td class="colResumo">R$ 4.202,00</td>
                                                <td class="colResumo">R$ 3.842,00</td>
                                                <td class="colResumo">R$ 460,00</td>                            
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="tab-pane" id="tabFornecedores">
                                    <table class="table table-striped table-hover table-bordered">
                                        <thead>
                                            <tr style="background-color: #8392a4; color:#fff">
                                                <th style="width: 50%"> Conta </th>
                                                <th> Origem </th>
                                                <th> Contabilidade </th>
                                                <th> Diferença </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 4.03.25.1 - Fornece forte</a>
                                                </td>
                                                <td style="text-align:right;"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 2.05.02.7 - Fornecedor LTDA</a>
                                                </td>
                                                <td style="text-align:right"> R$ 1825.50 </td>
                                                <td style="text-align:right"> R$ 1735.50 </td>
                                                <td style="text-align:right"> R$ 190.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 2.02.04.5 - Forneci's SA </a>
                                                </td>
                                                <td style="text-align:right"> R$ 725.50 </td>
                                                <td style="text-align:right"> R$ 635.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> 3.02.06.1 - Fornece pouco </a>
                                                </td>
                                                <td style="text-align:right"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr style="border:none">
                                                <td class="colResumo">Totais:</td>
                                                <td class="colResumo">R$ 4.202,00</td>
                                                <td class="colResumo">R$ 3.842,00</td>
                                                <td class="colResumo">R$ 460,00</td>                            
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="tab-pane" id="tabOutros">
                                    <table class="table table-striped table-hover table-bordered">
                                        <thead>
                                            <tr style="background-color: #8392a4; color:#fff">
                                                <th style="width: 50%"> Categoria </th>
                                                <th> Origem </th>
                                                <th> Contabilidade </th>
                                                <th> Diferença </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> Bancos </a>
                                                </td>
                                                <td style="text-align:right;"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> Fornecedores</a>
                                                </td>
                                                <td style="text-align:right"> R$ 1825.50 </td>
                                                <td style="text-align:right"> R$ 1735.50 </td>
                                                <td style="text-align:right"> R$ 190.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> Clientes </a>
                                                </td>
                                                <td style="text-align:right"> R$ 725.50 </td>
                                                <td style="text-align:right"> R$ 635.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="javascript:;"> Outros </a>
                                                </td>
                                                <td style="text-align:right"> R$ 825.50 </td>
                                                <td style="text-align:right"> R$ 735.50 </td>
                                                <td style="text-align:right"> R$ 90.00 </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr style="border:none">
                                                <td class="colResumo">Totais:</td>
                                                <td class="colResumo">R$ 4.202,00</td>
                                                <td class="colResumo">R$ 3.842,00</td>
                                                <td class="colResumo">R$ 460,00</td>                            
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="portlet light">    
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart theme-font hide"></i>
                    <span class="caption-subject font-blue-madison bold uppercase">Providências solicitadas</span>
                    <span class="caption-helper hide">Providências solicitadas para outros colaboradores</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="chats">

                    <li class="out">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Alessandro </a>
                            <span class="datetime"> as 10:11 </span>
                            <span class="body"> Está com problema neste registro. </span>
                        </div>
                    </li>

                    <li class="out">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Alessandro </a>
                            <span class="datetime"> as 10:12 </span>
                            <span class="body"> Teria como verificar? </span>
                        </div>
                    </li>

                    <li class="in">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Tamiris </a>
                            <span class="datetime"> as 10:18 </span>
                            <span class="body"> Corrigi agora, tenta denovo. </span>
                        </div>
                    </li>

                    <li class="out">
                        <div class="message">
                            <span class="arrow"> </span>
                            <a href="javascript:;" class="name"> Alessandro </a>
                            <span class="datetime"> as 10:18 </span>
                            <span class="body"> Obrigado! </span>
                        </div>
                    </li>
                </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="full" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Registros não conciliados</h4>

            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <wes:SimpleGrid runat="server" ID="FINANCEIRO" Title="Financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="TMP_CT_CONCILIACAOFIN.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="22367" Level="20" Order="100"  />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <wes:SimpleGrid runat="server" ID="CONTABIL" Title="Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TMP_CT_CONCILIACAOCTB.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="22368" Level="20" Order="200"  />
                    </div>
                </div>                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn dark btn-outline" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn green">Conciliar</button>
            </div>
        </div>
    </div>
</div>
    

<script type="text/javascript">
    $(function () {
        var chartPosicaoGeral = AmCharts.makeChart("chartPosicaoGeral", {
            "type": "pie",
            "theme": "light",
            "dataProvider": [{
                "Estado": "Conciliados",
                "Documentos": 900,
                "color": "#67b7dc"
            }, {
                "Estado": "Divergentes",
                "Documentos": 100,
                "color": "#cc4748"
            }],
            "valueField": "Documentos",
            "titleField": "Estado",
            "colorField": "color",
            "labelColorField": "color",
            "balloon": {
                "fixedPosition": true
            },
            //"titles": [
            //{
            //    "text": "Por inconsistência",
            //    "size": 24,
            //    "color": "#67b7dc"
            //}
            //],
            labelsEnabled: true,
            autoMargins: false,
            marginTop: 10,
            marginBottom: 10,
            marginLeft: 10,
            marginRight: 10,
            pullOutRadius: 10,
        });

        var ChartPrincipalErros = AmCharts.makeChart("ChartPrincipalErros", {
            "type": "pie",
            "theme": "light",
            "dataProvider": [{
                "Estado": "Sem lançamentos contábeis",
                "Documentos": 520,
                "color": "#67b7dc"
            }, {
                "Estado": "Valores divergentes do lançamento",
                "Documentos": 250,
                "color": "#cc4748"
            }, {
                "Estado": "Não contabilizados",
                "Documentos": 370,
                "color": "#76B4B4"
            }, {
                "Estado": "Natureza do lançamento difere da origem",
                "Documentos": 200,
                "color": "#2b7a7a"
            }, {
                "Estado": "Data do lançamento difere da origem",
                "Documentos": 180,
                "color": "#F07575"
            }],
            "valueField": "Documentos",
            "titleField": "Estado",
            "colorField": "color",
            "labelColorField": "color",
            "balloon": {
                "fixedPosition": true,
                "text": "[[value]]"
            },
            //"titles": [
            //{
            //    "text": "Por inconsistência",
            //    "size": 24,
            //    "color": "#67b7dc"
            //}
            //],
            labelsEnabled: true,
            autoMargins: false,
            marginTop: 10,
            marginBottom: 10,
            marginLeft: 10,
            marginRight: 10,
            pullOutRadius: 10,
        });

        $('table td a').click(function (i, cmp) {
            $('#full').modal('toggle');
            $('#full').modal('show');
        })

    })

</script>
</asp:Content>