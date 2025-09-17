<%@ Page Title="Movimentacao Grafica de Pneus" Language="C#" Inherits="Benner.Corporativo.Frotas.WebApp.aga.e.MovimentacaoGraficaPneus.MovimentacaoGraficaPneus" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <link rel="stylesheet" type="text/css" href="../../../Content/css/Frotas/MovimentacaoGraficaPneus.css">

    <div class="row" id="PageMovGrafica">

        <asp:HiddenField ID="txtOrdemServico" runat="Server"></asp:HiddenField>
        <asp:HiddenField ID="txtRecurso" runat="Server"></asp:HiddenField>

        <div class="ContainerConfirm">
            <div class="btn command-action custom-action btn command-action blue" id="btnConfirmar">Confirmar Movimentos</div>
        </div>
        <div id="ContentPage">
            <div class="desenho" id="desenho">
                <canvas id="desenhoCarreta"></canvas>
            </div>
            <div class="Pneus" id="Estoque">

                <div class="headPneusEstoque">
                    <h4>Estoque</h4>
                    <div class="btnBuscaPneus btn command-action custom-action btn command-action blue" id="btnModalEstoque">Buscar Pneus</div>
                </div>
                <div class="bodyDiv" id="PneusEstoque">
                </div>

            </div>
        </div>
        <div class="footer">
            <div class="buscaPneus" id="Borracharia">
                <div class="headDiv">
                    <h4>Borracharia</h4>
                    <div class="btnBuscaPneus btn command-action custom-action btn command-action blue" id="btnModalBorracharia">Buscar Pneus</div>
                </div>
                <div class="bodyDiv" id="PneusBorracharia">
                </div>
            </div>

            <div class="buscaPneus" id="Recapadora">
                <div class="headDiv">
                    <h4>Recapadora</h4>
                    <div class="btnBuscaPneus btn command-action custom-action btn command-action blue" id="btnModalRecapadora">Buscar Pneus</div>
                </div>
                <div class="bodyDiv" id="PneusRecapadora">
                </div>
            </div>

            <div class="buscaPneus" id="Baixado">
                <div class="headDiv">
                    <h4>Baixado</h4>
                </div>
                <div class="bodyDiv" id="PneusBaixa">
                </div>
            </div>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <div id="modalContent">

                    <div id="headModal">
                        <span>
                            <label for="ddlOpcoes">teste</label>
                            <input hidden id="inputOrigem" value="" />
                            <select id="SelectOrigemPneus"></select>
                        </span>

                        <div>
                            <div class="btn command-action custom-action btn command-action blue" id="btnConfirmaPneus">Confirmar</div>
                            <div class="btn command-action custom-action btn command-action red" id="btnFecharModal">Fechar</div>
                        </div>

                    </div>

                    <div class="bodyTable">

                        <table border="1" id="tablePneus">
                            <thead>
                                <tr id="cabecalhoGrid">
                                    <th></th>
                                    <th>Handle</th>
                                    <th>Codigo</th>
                                    <th>Marca Fogo</th>
                                    <th>Vida</th>
                                    <th>Desgaste</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Medida</th>
                                    <th>Desenho</th>
                                    <th>Tipo Borracha</th>
                                    <th>Profundidade Borracha</th>
                                    <th>Fabricante</th>
                                    <th>Posicao Pneu</th>
                                </tr>
                            </thead>
                            <tbody id="conteudoGrid"></tbody>
                        </table>

                        <div id="PneuNaoEncontrado">
                            Nenhum registro Encontrado!
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div id="ModalErro" class="">
            <span class="close" id="closeModalErro">&times;</span>
            <div id="modalContentErro">
                <div id="HeadErro">
                    <span id="titleErro">Houve um Erro!</span>
                </div>
                <div id="ContentErro">
                    <span id="mensagemErro"></span>
                </div>
            </div>
        </div>

        <div id="ModalValidaMovimentoPneu" class="modal">
            <div class="modalContent" id="modalContentValidaMovimento">
                <div id="MensagemValidaMovimento">
                    Atenção! Foi encontrado uma movimentação futura para este pneu que utiliza-o na posição em que estava.
                    (Movimento encontrado na data <span class="DataInicial"></span> gerado pela OS "<span id="CodigoOs"></span>")
                    Nesta data futura, este pneu foi movimentado para "<span id="DescricaoLocal"></span>".

                    <br />
                    <br />

                    Ao realizar o movimento atual, você estará invalidando a movimentação futura.

                    <br />
                    <br />
                    
                    (Recomenda-se devolver o pneu no seu local original posteriormente, nesta ou em outra OS, com data inferior a <span class="DataInicial"></span> e posterior a <span id="DataFinal"></span>.
                    Desta forma a movimentação futura permanecerá válida).

                    <br />
                    <br />

                    Deseja realmente mover o pneu?
                </div>
                <div id="botoesValidaMovimento">
                    <div id="btnConfirmaMoverPneu" class="btn command-action custom-action btn command-action blue">Sim</div>
                    <div id="btnCancelaMoverPneu" class="btn command-action custom-action btn command-action red">Não</div>
                </div>

            </div>
        </div>

        <div id="ModalPneuEstoque" class="modal">
            <div class="modalContent" id="modalContentMovimentoEstoque">
                <div id="MensagemMovimentoEstoque">
                    Não é possível mover o pneu para o Estoque, pois não foi informado Produto/Variação no cadastro do Pneu! 

                    <br/>

                    É necessário informar o Produto e Variação deste Pneu antes de movimentá-lo!
                </div>
                <div id="botoesMovimentoEstoque">
                    <div id="btnModalMovimentoEstoque" class="btn command-action custom-action btn command-action blue">Ok</div>
                </div>

            </div>
        </div>

        <div id="ModalConfirmar" class="modal">

            <div id="modalContentConfirmar">
                <div id="ContainerCloseModalConfirmar">
                    <div id="btnGravarMovimentacoes" class="btn command-action custom-action btn command-action blue">Gravar</div>
                    <div id="closeModalConfirmar" class="btn command-action custom-action btn command-action red">Cancelar</div>
                </div>
                <div id="HeadConfirmar">
                    <span id="titleModalConfirmar"></span>
                </div>
                <div id="ContentConfirmar">
                    <div class="tab">
                        <div class="tablinksFrotas" id="Item-Veiculo">Veiculo</div>
                        <div class="tablinksFrotas" id="Item-Borracharia">Borracharia</div>
                        <div class="tablinksFrotas" id="Item-Recapadora">Recapadora</div>
                        <div class="tablinksFrotas" id="Item-Estoque">Estoque</div>
                        <div class="tablinksFrotas" id="Item-Baixa">Baixa</div>
                    </div>


                    <!-- Tab content -->
                    <div id="Tab-Veiculo" class="tabcontentFrotas">
                    </div>

                    <div id="Tab-Borracharia" class="tabcontentFrotas">
                        <label>Centro de Manutenção <span class="fieldRequired">*</span> </label>
                        <select required class="SelectDestino" id="SelectBorracharia"></select>
                        <span class="mensagemCampoRequired"> Voce precisa definir um destino para esse pneu! </span>
                    </div>

                    <div id="Tab-Recapadora" class="tabcontentFrotas">
                        <label>Fornecedor <span class="fieldRequired">*</span> </label>
                        <select required class="SelectDestino" id="SelectRecapadora"></select>
                        <span class="mensagemCampoRequired"> Voce precisa definir um destino para esse pneu! </span>
                    </div>

                    <div id="Tab-Estoque" class="tabcontentFrotas">
                        <label>Almoxarifado <span class="fieldRequired">*</span> </label>
                        <select required class="SelectDestino" id="SelectEstoque"></select>
                        <span class="mensagemCampoRequired"> Voce precisa definir um destino para esse pneu! </span>
                    </div>

                    <div id="Tab-Baixa" class="tabcontentFrotas">
                        <div class="FormDestino">
                            <label>Motivo da Baixa <span class="fieldRequired">*</span> </label>
                            <select required class="SelectDestino" id="SelectBaixa"></select>

                            <label>Observação</label>
                            <textarea id="ObservacoesBaixa"></textarea>

                            <span class="mensagemCampoRequired"> Voce precisa definir um destino para esse pneu! </span>
                        </div>

                    </div>

                    <div class="bodyTable">
                        <table border="1" id="TablePneusMovimentados">
                            <thead>
                                <tr>
                                    <th>Handle</th>
                                    <th>Marca Fogo</th>
                                    <th>Pneu</th>
                                    <th>Vida</th>
                                    <th>Desgaste</th>
                                    <th>Motivo da Movimentação</th>
                                    <th>Motivo de Baixa</th>
                                </tr>
                            </thead>
                            <tbody id="PneusMovimentados"></tbody>
                        </table>
                    </div>
                
                </div>
            </div>
        </div>

    </div>
    <script type="module" src="../../../Content/js/Frotas/MovimentacaoGraficaPneus/MovimentacaoGraficaPneus.js"></script>
    <script type="module" src="../../../Content/js/Frotas/MovimentacaoGraficaPneus/MovimentacaoGraficaPneusFunctions.js"></script>
</asp:Content>
