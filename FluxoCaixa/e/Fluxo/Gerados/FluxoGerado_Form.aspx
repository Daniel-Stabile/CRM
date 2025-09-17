<%@ Page Title="Fluxo de Caixa" Language="C#" CodeFile="~/FluxoCaixa/e/Fluxo/Gerados/FluxoGerado_Form.aspx.cs" Inherits="eFluxoGerado_FormPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server">
    <link href="FluxoGerado_Form.css" rel="stylesheet" />
    <div class="modal fade draggable-modal ui-draggable" id="cenarioDetail" tabindex="-1" role="basic" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title" id="titulo-modal">Lançamentos</h4>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">Fechar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="row">
        <!-- Sidebar -->
        <nav id="sidebar" class="sidebar-start" style="display: none;">
            <div class="col">
                <div class="row hide formulario" id="FrmSimulacaoFluxoAtrMedioCpa">
                    <wes:AjaxForm runat="server" ID="FrmSimFluxoAtrMedioCpa"
                        Title="CPA - Atraso Médio"
                        ShowTitle="False"
                        PortletLayout="Default"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="FX_SIM_FLUXO_CPA_ATRASO_MEDIO.FORM"
                        ProviderWidgetUniqueId="GrdSimulacoes"
                        IncludeRecordInRecentItems="False"
                        HideDeveloperCommands="False"
                        CanInsert="True" CanUpdate="True" CanDelete="False"
                        ChromeState="Normal" FormMode="View" PageWidgetHandle="1" />
                </div>
                <div class="row hide formulario" id="FrmSimulacaoFluxoAtrMedioCre">
                    <wes:AjaxForm runat="server" ID="FrmSimFluxoAtrMedioCre"
                        Title="CRE - Atraso Médio"
                        ShowTitle="False"
                        PortletLayout="Default"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="FX_SIM_FLUXO_CRE_ATRASO_MEDIO.FORM"
                        ProviderWidgetUniqueId="GrdSimulacoes"
                        IncludeRecordInRecentItems="False"
                        HideDeveloperCommands="False"
                        CanInsert="True" CanUpdate="True" CanDelete="False"
                        ChromeState="Normal" FormMode="View" PageWidgetHandle="1" />
                </div>
                <div class="row hide formulario" id="FrmSimulacaoFluxoAltVencCpa">
                    <wes:AjaxForm runat="server" ID="FrmSimFluxoAltVencCpa"
                        Title="CPA - Alterar Vencimento"
                        ShowTitle="False"
                        PortletLayout="Default"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="FX_SIM_FLUXO_CPA_ALTER_VENC.FORM"
                        ProviderWidgetUniqueId="GrdSimulacoes"
                        IncludeRecordInRecentItems="False"
                        HideDeveloperCommands="False"
                        CanInsert="True" CanUpdate="True" CanDelete="False"
                        ChromeState="Normal" FormMode="View" PageWidgetHandle="1" />
                </div>
                <div class="row hide formulario" id="FrmSimulacaoFluxoAltVencCre">
                    <wes:AjaxForm runat="server" ID="FrmSimFluxoAltVencCre"
                        Title="CPA - Alterar Vencimento"
                        ShowTitle="False"
                        PortletLayout="Default"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="FX_SIM_FLUXO_CRE_ALTER_VENC.FORM"
                        ProviderWidgetUniqueId="GrdSimulacoes"
                        IncludeRecordInRecentItems="False"
                        HideDeveloperCommands="False"
                        CanInsert="True" CanUpdate="True" CanDelete="False"
                        ChromeState="Normal" FormMode="View" PageWidgetHandle="1" />
                </div>
                <div class="row hide formulario" id="FrmSimulacaoFluxoSusPagCpa">
                    <wes:AjaxForm runat="server" ID="FrmSimFluxoSusPagCpa"
                        Title="CPA - Suspender Pagamento"
                        ShowTitle="False"
                        PortletLayout="Default"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="FX_SIM_FLUXO_CPA_SUS_PAG.FORM"
                        ProviderWidgetUniqueId="GrdSimulacoes"
                        IncludeRecordInRecentItems="False"
                        HideDeveloperCommands="False"
                        CanInsert="True" CanUpdate="True" CanDelete="False"
                        ChromeState="Normal" FormMode="View" PageWidgetHandle="1" />
                </div>
                <div class="row hide formulario" id="FrmSimulacaoFluxoSusPagCre">
                    <wes:AjaxForm runat="server" ID="FrmSimFluxoSusPagCre"
                        Title="CRE - Suspender Recebimento"
                        ShowTitle="False"
                        PortletLayout="Default"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="FX_SIM_FLUXO_CRE_SUS_PAG.FORM"
                        ProviderWidgetUniqueId="GrdSimulacoes"
                        IncludeRecordInRecentItems="False"
                        HideDeveloperCommands="False"
                        CanInsert="True" CanUpdate="True" CanDelete="False"
                        ChromeState="Normal" FormMode="View" PageWidgetHandle="1" />
                </div>
            </div>
        </nav>

        <div id="regiaoEsquerda" class="col col-lg-11 col-md-11 col-sm-12 col-xs-12">
            <div id="col-reg-1" class="col">
                <div class="row">
                    <div class="region-button" onclick="MostraRegiao1();">
                        <span class="fa fa-cog title-icon"></span>
                        <span class="title-toggle">Gerador Fluxo de Caixa</span>
                    </div>
                </div>
                <div class="col" id="div_reg_1">
                    <div class="row developer-adjust">
                        <wes:AjaxForm runat="server"
                            ID="FrmGeradorFluxoCaixa"
                            Title="Gerador de Fluxo de Caixa >>"
                            PortletLayout="Default"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="FX_FLUXO.FORM"
                            IncludeRecordInRecentItems="False"
                            HideDeveloperCommands="False"
                            CanInsert="True"
                            CanUpdate="True"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            FormMode="View"
                            PageWidgetHandle="1" />
                    </div>
                </div>
            </div>
            <div id="col-reg-2" class="col bottom-float">
                <div class="row">
                    <div class="region-button" onclick="MostraRegiao2();">
                        <span class="fa fa-cogs title-icon"></span>
                        <span class="title-toggle">Gerador Simulações</span>
                    </div>
                </div>
                <div class="col collapse developer-adjust" id="div_reg_2">
                    <div class="col col-lg-9" style="border-right: 1px solid">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GrdSimulacoes"
                                Title="Simulações Cadastradas"
                                Subtitle=""
                                PortletCssClass=""
                                PortletLayout="Default"
                                BootstrapCols="12"
                                ShowTitle="False"
                                ProviderWidgetUniqueId="FrmGeradorFluxoCaixa"
                                FontIcon=""
                                ChromeState="Normal"
                                CanDelete="True"
                                CanUpdate="True"
                                CanInsert="False"
                                EntityViewName="FX_SIMULACOESFLUXO.GRID"
                                Mode="Search"
                                UserDefinedSelectColumnVisible="True"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="True"
                                CompanyFilterMode="OnlyCompany"
                                FormUrl=""
                                ShowExport="True"
                                UserDefinedDisableRowSelection="False"
                                PageWidgetHandle="2"
                                Level="20"
                                Order="10" />
                        </div>
                    </div>
                    <div class="col col-lg-3" runat="server" id="painelCadastroSimulacoes">
                        <div class="row">
                            <ul class="nav nav-tabs widget">
                                <li class="active">
                                    <a href="#tab_CPA" data-toggle="tab" aria-expanded="true">CPA </a>
                                </li>
                                <li class="">
                                    <a href="#tab_CRE" data-toggle="tab" aria-expanded="false">CRE </a>
                                </li>
                                <%-- <li class="">
                                    <a href="#tab_OUT" data-toggle="tab" aria-expanded="false">OUTROS </a>
                                </li>--%>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="tab_CPA">
                                    <div class="col col-lg-6 simulacao-icon" id="OpenSidebarAlterarVencCPA">
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span class="fa fa-calendar-check-o simulacao-icon-size"></span>
                                        </div>
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span>Alterar Vencimento</span>
                                        </div>
                                    </div>
                                    <div class="col col-lg-6 simulacao-icon" id="OpenSidebarAtrasoMedioCPA">
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span class="fa fa-calendar simulacao-icon-size"></span>
                                        </div>
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span>Atraso Médio</span>
                                        </div>
                                    </div>
                                    <div class="col col-lg-6 simulacao-icon" id="OpenSidebarSusPagCPA">
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span class="fa fa-exclamation-triangle simulacao-icon-size"></span>
                                        </div>
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span>Suspender Pagamento</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab_CRE">
                                    <div class="col col-lg-6 simulacao-icon" id="OpenSidebarAlterarVencCRE">
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span class="fa fa-calendar-check-o simulacao-icon-size"></span>
                                        </div>
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span>Alterar Vencimento</span>
                                        </div>
                                    </div>
                                    <div class="col col-lg-6 simulacao-icon" id="OpenSidebarAtrasoMedioCRE">
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span class="fa fa-calendar simulacao-icon-size"></span>
                                        </div>
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span>Atraso Médio</span>
                                        </div>
                                    </div>
                                    <div class="col col-lg-6 simulacao-icon" id="OpenSidebarSusPagCRE">
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span class="fa fa-exclamation-triangle simulacao-icon-size"></span>
                                        </div>
                                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 simulacao-icon-center">
                                            <span>Suspender Recebimento</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="regiaoDireita" class="col col-lg-1 col-md-1 col-sm-12 col-xs-12">
            <div id="col-reg-3" class="col">
                <div class="row">
                    <div class="region-button" onclick="MostraRegiao3();">
                        <span class="fa fa-pie-chart title-icon"></span>
                        <span class="title-toggle hide">Dashboard</span>
                    </div>
                </div>
                <div class="col collapse hide" id="div_reg_3">


                    <div class="row">
                        <div class="col col-lg6 col-md-12 col-sm-12 col-xs-12">
                            <div id="chartPorPeriodo" class="grafico-fluxo">
                            </div>
                        </div>
                        <div id="chartPorConta" class="grafico-fluxo"></div>
                    </div>
                </div>
            </div>
        
            <div id="col-reg-4" class="col">
                <div class="row">
                    <div class="region-button" onclick="MostraRegiao4();">
                        <span class="fa fa-line-chart title-icon"></span>
                        <span class="title-toggle hide">Fluxo de Caixa</span>
                    </div>
                </div>
                <div class="col hide" id="div_reg_4">
                    <div id="app-fluxo" class="container_datatable body-content" v-cloak >

                        <div class="row">
                            <div class="col-md-6">
                                <%-- 
                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                    <input id="checkBoxValorRealizado" class="visibility-control" value="R" type="checkbox" v-model="exibirRealizado" @click="checkBoxRealizadoClick" name="checkBoxValorRealizado">
                                    <label for="checkBoxValorRealizado"> Valor Realizado</label>
                                    <span></span>
                                </label>                                                                    
                                --%>
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
                                            <th :colspan="coluna.colspan" v-bind:class="[coluna.cssClass]" v-for="coluna in grupoColunas" >                                                 
                                                 <div class="fx-cell-content2">
                                                     {{ coluna.title }}
                                                 </div>
                                             </th>                                            
                                        </tr>
                                        <tr id="fx-cabecalho-realizado">     
                                            <th v-for="(coluna, index) in colunas"
                                                v-bind:class="obterClasse(coluna, index)">
                                                {{ obterValorCabecalho(index,coluna) }}
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="colunas in linhas" v-bind:class="obterClasseLinha(colunas)">
                                             <td  v-for="(coluna, index) in colunas" 
                                                  v-bind:class="obterClasse(coluna, index)"
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
    <div class="overlay">
    </div>
    
    <iframe id="frameExport" style="width:0px; height:0px;" onload="$.unblockUI()">
    </iframe>
    <script type="text/javascript">
        $.getScript("FluxoGerado_Form.js");        
    </script>

</asp:content>
