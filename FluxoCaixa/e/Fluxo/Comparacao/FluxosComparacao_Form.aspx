<%@ Page Title="Comparação de cenários" Language="C#" CodeFile="~/FluxoCaixa/e/Fluxo/Comparacao/FluxosComparacao_Form.aspx.cs" Inherits="ComparacaoFluxosComparacao_FormPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <link href="FluxoGerado_Form.css" rel="stylesheet" />

    <asp:HiddenField ID="FluxoHandlesHiddenField" runat="server" />
    <div class="portlet light" id="portlet_SIMULAESDOFLUXO">
        <div class="portlet-title">
            <div class="caption collapsible">
                <span class="caption-subject font-green-sharp bold uppercase">Comparação de Fluxos</span>
            </div>
        </div>
        <div class="portlet-body form">
            <div class="widget-body" data-widget-id="SIMULAESDOFLUXO">
                <div>
                    <span id="ctl00_Main_SIMULAESDOFLUXO_ctl01"></span>
                </div>
                <div id="ctl00_Main_SIMULAESDOFLUXO_ctl04">

                    <div id="app-fluxo" v-cloak>

                        <div class="row">
                            <div class="col-md-2">
                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                    <input id="checkBoxValorRealizado" 
                                        class="visibility-control" 
                                        value="R" 
                                        type="checkbox" 
                                        v-model="exibirRealizado" 
                                        @click="checkBoxRealizadoClick" 
                                        name="checkBoxValorRealizado">
                                    <label for="checkBoxValorRealizado"> Valor Realizado</label>
                                    <span></span>
                                </label>
                            </div>
                            <div class="col-md-2 conteudo-legenda" v-for="legenda in legendas">
                                <div>
                                    <div class="conteudo-cor" v-bind:style="{ backgroundColor: legenda.color }">
                                    </div>
                                    <div>
                                        <label v-text="legenda.nomeFluxo"></label>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-6 fx-botoes-exportacao">
                                <a class="btn command-action custom-action blue" 
                                     @click="exportarExcel">
                                    <i class="fa fa-file-excel-o"></i> 
                                    Excel</a>
                                &nbsp;
                                <a class="btn green btn-new command-action predef-action editable"
                                     @click="exportarPdf">
                                    <i class="fa fa-file-pdf-o"></i> 
                                    PDF</a> 
                            </div>
                        </div>

                        <div class="row">
                            <div id="fx-fluxo-container" class="col-md-12">
                                <table>
                                    <thead>
                                        <tr>
                                             <th :colspan="coluna.colspan" 
                                                 v-bind:class="[coluna.cssClass]" 
                                                 v-for="coluna in grupoColunas" 
                                                 style="text-align: center !important;">{{ coluna.title }}
                                             </th>
                                        </tr>
                                        <tr id="fx-cabecalho-realizado">     
                                            <th v-for="(coluna, index) in colunas"
                                                v-bind:class="obterClasse(index)">
                                                {{ obterValorCabecalho(index) }}
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="colunas in linhas" v-bind:class="obterClasseLinha(colunas)">
                                             <td  v-for="(coluna, index) in colunas" 
                                                  v-bind:class="obterClasse(index)"
                                                  @click="cellClick(coluna, index)">
                                                 <div class="fx-cell-content">{{ coluna.value }}
                                                     </div>
                                             </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    <iframe id="frameExport" style="width: 0px; height: 0px;" onload="$.unblockUI()"></iframe>
    <script src="DataTable_Comparacao.js"></script>
</asp:Content>
