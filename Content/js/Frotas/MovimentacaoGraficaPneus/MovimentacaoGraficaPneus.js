import {
    makeRequest,
    obterOrigem,
    carregarCaminhao,
    DesenharPneusSelecionados,
    DesenharPneuArrastado,
    BuscarPneuASerRemovido,
    ExcluirPneuDesenho,
    MudarPosicaoPneu,
    movimentacoesRealizadas,
    GravarMovimentacoes,
    pneusJaDesenhados,
    ValidaMovimentoPneu,
    verificarInputOrigem,
    ObterDivPelaOrigem
} from './MovimentacaoGraficaPneusFunctions.js'

var listaPneusSelecionados = [];
var destinos = [];
var listaPneusGrid = null;
var origemPneus = "";
var adicionandoPneuDesenho = false;
var coordenadaXPneu;
var coordenadaYPneu;

const canvas = document.getElementById("desenhoCarreta");
const divCanvas = document.getElementById("desenho");
const divsPneus = document.getElementsByClassName("buscaPneus");
const divEstoque = document.getElementById("Estoque");
const modalValidaMovimentoPneu = document.getElementById("ModalValidaMovimentoPneu");

const localVeiculo = 1;
const localEstoque = 2;
const localBaixado = 5;
const localRecapagem = 3;
const localBorracharia = 4;

var handlePneuSelecionadoGrid;

let tirandoPneuDesenho = false;

$(document).ready(function () {
    carregarCaminhao();
    CarregarSelectsDestino();
    controlModal();

    divCanvas.ondragover = allowDrop;
    divCanvas.ondrop = dropElement;
    canvas.draggable = true;

    canvas.ondragstart = arrastarPneuParaFora;
    canvas.ondrop = MoverPneuDesenho;

    divsPneus.forEach((div) => {
        div.ondragover = allowDrop;
        div.ondrop = devolvendoPneu;
        div.ondragstart = teste;
        div.draggable = true;
    })

    divEstoque.ondragover = allowDrop;
    divEstoque.ondrop = devolvendoPneu;
    divEstoque.draggable = true;
});


function teste(e) {
    adicionandoPneuDesenho = true;
}

async function arrastarPneuParaFora(e) {

    tirandoPneuDesenho = true;


    var dragIcon = new Image();
    dragIcon.src = "";
    // Define a imagem personalizada como ícone de arraste
    e.dataTransfer.setDragImage(dragIcon, 0, 0);

    // Informa ao navegador que o elemento está sendo arrastado
    e.dataTransfer.effectAllowed = 'move';

    var rect = canvas.getBoundingClientRect();
    var mouseX = e.clientX - rect.left;
    var mouseY = e.clientY - rect.top;

    await BuscarPneuASerRemovido(mouseX, mouseY);
}

async function devolvendoPneu(e) {


    e.preventDefault();

    if (tirandoPneuDesenho) {
        await ExcluirPneuDesenho(e.target.id);

        tirandoPneuDesenho = false;
    }

}

async function MoverPneuDesenho(e) {
    if (e.target.id == "desenhoCarreta" && adicionandoPneuDesenho == false) {

        var rect = canvas.getBoundingClientRect();

        coordenadaXPneu = e.clientX - rect.left;
        coordenadaYPneu = e.clientY - rect.top;

        var dadosMovimentacaoProgramada = await ValidaMovimentoPneu();
        if (dadosMovimentacaoProgramada ?.ExisteMovimentacaoProgramada) {

            document.getElementById("CodigoOs").innerText = dadosMovimentacaoProgramada.CodigoOs;
            document.getElementById("DescricaoLocal").innerText = dadosMovimentacaoProgramada.DescricaoLocal;
            document.getElementById("DataFinal").innerText = dadosMovimentacaoProgramada.DataFinal;
            document.getElementsByClassName("DataInicial").forEach((span) => {
                span.innerText = dadosMovimentacaoProgramada.DataInicial;
            })

            modalValidaMovimentoPneu.style.display = "flex";
        } else {
            await MudarPosicaoPneu(coordenadaXPneu, coordenadaYPneu);
            modalValidaMovimentoPneu.style.display = "none";
        }
    }
}


function allowDrop(e) {
    e.preventDefault();
}

async function dropElement(e) {
    e.preventDefault();
    var data = e.dataTransfer.getData("pneu");
    var rect = canvas.getBoundingClientRect();
    var mouseX = e.clientX - rect.left;
    var mouseY = e.clientY - rect.top;

    await DesenharPneuArrastado(data, mouseX, mouseY);
    adicionandoPneuDesenho = false;

}


function controlModal() {
    // Quando o botão for clicado, abrir o modal
    $(".btnBuscaPneus").click(function (event) {

        obterOrigens(event.target.id);
        var inputOrigem = document.getElementById("inputOrigem");

        inputOrigem.value = event.target.id;

        document.getElementById('myModal').style.display = 'block';
        setTimeout(function () {
            document.getElementById('myModal').querySelector('.modal-content').style.opacity = 1;
            document.getElementById('myModal').querySelector('.modal-content').style.transform = 'scale(1)';
        }, 50);

    });

    $("#btnConfirmar").click(function (event) {

        if (movimentacoesRealizadas.HouveMovimentacao) {
            MontarTabelaPneusMovimentados();
            carregarEventoMovimentoPneu();
            document.getElementById("titleModalConfirmar").innerText = "Confirmar Movimentações";
            document.getElementById('ModalConfirmar').style.display = 'flex';
            setTimeout(function () {
                document.getElementById('ModalConfirmar').querySelector('#modalContentConfirmar').style.opacity = 1;
                document.getElementById('ModalConfirmar').querySelector('#modalContentConfirmar').style.transform = 'scale(1)';
            }, 50);
        }

    });

    $("#closeModalConfirmar").click(function () {

        document.getElementById('ModalConfirmar').querySelector('#modalContentConfirmar').style.opacity = 0;
        document.getElementById('ModalConfirmar').querySelector('#modalContentConfirmar').style.transform = 'scale(0.9)';
        setTimeout(function () {
            document.getElementById('ModalConfirmar').style.display = 'none';
        }, 300);
    });

    // Quando o botão de fechar for clicado, fechar o modal
    $("#btnFecharModal, #btnConfirmaPneus").click(function () {

        var tbody = document.getElementById("conteudoGrid");

        var msgPneu = document.getElementById("PneuNaoEncontrado");
        msgPneu.style.display = "none";

        tbody.innerHTML = '';

        document.getElementById('myModal').querySelector('.modal-content').style.opacity = 0;
        document.getElementById('myModal').querySelector('.modal-content').style.transform = 'scale(0.9)';
        setTimeout(function () {
            document.getElementById('myModal').style.display = 'none';
        }, 300);
    });
}

const selectItens = document.getElementById("SelectOrigemPneus");
selectItens.addEventListener("change", () => {
    var inputOrigem = document.getElementById("inputOrigem");
    obterPneus(inputOrigem.value, selectItens.value, pneusJaDesenhados, 1795)
});

async function obterOrigens(idBotao) {
    selectItens.innerHTML = '';

    var opcaoPadrao = document.createElement('option');
    opcaoPadrao.value = '';
    opcaoPadrao.text = 'Selecione uma origem';
    selectItens.appendChild(opcaoPadrao);

    destinos[obterOrigem(idBotao)].forEach((item) => {
        var option = document.createElement('option');
        option.value = item.Handle;
        option.text = item.Nome;
        selectItens.appendChild(option);
    });

}

async function obterPneus(idBotao, handleOrigem, pneusJaDesenhados, handleOs) {

    var origem = obterOrigem(idBotao);
    origemPneus = origem;
    var msgPneu = document.getElementById("PneuNaoEncontrado");
    await makeRequest("GET", `api/ObterPneus?origemPneus=${origem}&handleOrigem=${handleOrigem}&handlesJaDesenhados=${pneusJaDesenhados}&handleOs=${handleOs}`)
        .then((response) => {
            msgPneu.style.display = "none";
            PreencheGrid(response);
        })
        .catch((e) => {
            var tbody = document.getElementById("conteudoGrid");
            tbody.innerHTML = '';
            msgPneu.style.display = "block";
        });
}


function PreencheGrid(response) {
    var tbody = document.getElementById("conteudoGrid"); // Certifique-se de que o ID "corpoGrid" existe na sua tabela

    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    if (response.length > 0) {

        listaPneusGrid = response;

        response.forEach((pneu) => {
            var tr = document.createElement("tr");

            var tdCheckbox = document.createElement("td");
            var checkbox = document.createElement("input");
            checkbox.type = 'checkbox';
            checkbox.value = pneu.Handle;
            checkbox.id = pneu.Codigo;
            checkbox.className = 'checkboxPneu';
            tdCheckbox.appendChild(checkbox);

            tr.appendChild(tdCheckbox);

            Object.values(pneu).forEach((valor) => {
                var td = document.createElement("td");
                td.textContent = valor;
                tr.appendChild(td);
            });

            tbody.appendChild(tr);
        });

        changeCheckboxes();
    }


}



const confirmarPneusSelecionados = document.getElementById("btnConfirmaPneus");
confirmarPneusSelecionados.addEventListener("click", (event) => {
    var inputOrigem = document.getElementById("inputOrigem");

    var origem = ObterDivPelaOrigem(inputOrigem.value);

    DesenharPneusSelecionados(origem, listaPneusSelecionados, listaPneusGrid);
});

function changeCheckboxes() {
    const checkBoxes = document.querySelectorAll(".checkboxPneu");
    checkBoxes.forEach((checkbox) => {
        checkbox.addEventListener('change', function () {
            const isChecked = this.checked;

            if (isChecked) {
                var objectPneu = {
                    Handle: this.value
                }

                var pneuJaExiste = listaPneusSelecionados.find((pneu) => {
                    return pneu.Handle == this.value;
                })

                if (!pneuJaExiste) {
                    listaPneusSelecionados.push(objectPneu)
                }
            } else {
                var indice = listaPneusSelecionados.findIndex((item) => {
                    return item.handle === this.value
                })

                listaPneusSelecionados.splice(indice, 1);
            }
        })
    });
}


async function CarregarSelectsDestino() {
    await makeRequest("GET", "api/ObterDestinos")
        .then((response) => {
            destinos = response;

            var selects = document.getElementsByClassName("SelectDestino");
            selects.forEach((select) => {

                var idSelect = select.id;
                var nomeDestino = idSelect.slice(6);


                var opcaoPadrao = document.createElement('option');
                opcaoPadrao.value = '';
                opcaoPadrao.text = 'Selecione uma origem';
                select.appendChild(opcaoPadrao);

                if (response.hasOwnProperty(nomeDestino)) {
                    var destinos = response[nomeDestino];
                    destinos.forEach((destino) => {
                        var option = document.createElement('option');
                        option.value = destino.Handle;
                        option.text = destino.Nome;
                        select.appendChild(option);
                    })
                }

            })

        })
        .catch((err) => console.log(err));
}

function MontarTabelaPneusMovimentados() {
    var tBodyPneus = document.getElementById("PneusMovimentados");
    while (tBodyPneus.firstChild) {
        tBodyPneus.removeChild(tBodyPneus.firstChild);
    }

    if (movimentacoesRealizadas.HouveMovimentacao) {

        var listaCompletaPneus = [];

        movimentacoesRealizadas.Destinos.forEach((destino) => {

            destino.HandlesPneus.forEach((pneu) => {
                listaCompletaPneus.push(pneu);
            })
        })


        listaCompletaPneus.forEach((pneu) => {
            // Crie uma nova linha (<tr>) para cada pneu
            var tr = document.createElement("tr");
            tr.className = "movimentoPneu";

            const propriedadesPneu = [
                "Handle", "MarcaFogo", "Codigo", "Vida", "Desgaste",
            ]

            var aux = 0;
            Object.keys(pneu).forEach(() => {
                var td = document.createElement("td");

                if (propriedadesPneu[aux] == "Handle") {
                    td.className = "LinhaHandle";
                    td.value = pneu[propriedadesPneu[aux]];
                }
                td.textContent = pneu[propriedadesPneu[aux]];
                tr.appendChild(td);

                aux++;
            });


            // Adicione a linha à tabela (substitua 'suaTabela' pelo id ou classe real da sua tabela)
            tBodyPneus.appendChild(tr);
        })


    }
}

const btnCloseErro = document.getElementById("closeModalErro");
btnCloseErro.addEventListener("click", () => {

    var ModalErro = document.getElementById("ModalErro");
    ModalErro.style.display = "none";

})


const btnCloseConfirmar = document.getElementById("closeModalConfirmar");
btnCloseConfirmar.addEventListener("click", () => {

    var ModalConfirmar = document.getElementById("ModalConfirmar");
    ModalConfirmar.style.display = "none";

    location.reload();

});

const btnGravarMovimentacoes = document.getElementById("btnGravarMovimentacoes");
btnGravarMovimentacoes.addEventListener("click", async () => {
    var podeGravar = ValidarMovimentacoes();
    if(podeGravar){
        await GravarMovimentacoes();
    }
})

const btnConfirmaMoverPneu = document.getElementById("btnConfirmaMoverPneu");
btnConfirmaMoverPneu.addEventListener("click", async () => {
    var observacaoMovimentoPneu = await MudarPosicaoPneu(coordenadaXPneu, coordenadaYPneu, observacaoMovimentoPneu);
    modalValidaMovimentoPneu.style.display = "none";
})

const btnCancelaMoverPneu = document.getElementById("btnCancelaMoverPneu");
btnCancelaMoverPneu.addEventListener("click", () => {
    modalValidaMovimentoPneu.style.display = "none";
})

const btnModalMovimentoEstoque = document.getElementById("btnModalMovimentoEstoque");
btnModalMovimentoEstoque.addEventListener("click", () => {
    var modalContent = document.getElementById("ModalPneuEstoque");
    modalContent.style.display = "none";

})

function carregarEventoMovimentoPneu() {
    const movimentosPneu = document.getElementsByClassName("movimentoPneu");
    movimentosPneu.forEach((movimentoPneu) => {
        movimentoPneu.addEventListener("click", (e) => {
            var handleValorSelecionado = e.target.parentElement.children[0].innerText;
            abrirFormDestino(handleValorSelecionado);
        })
    })
}


function abrirFormDestino(handlePneu) {

    var tabItens = document.getElementsByClassName("tabcontentFrotas");
    tabItens.forEach((item) => {
        item.style.display = "none";
    })

    movimentacoesRealizadas.Destinos.forEach((movimento) => {
        var valuesSelect;
        var existePneu = movimento.HandlesPneus.find((pneu) => {
            return pneu.Handle === parseInt(handlePneu);
        });
        if (existePneu){
            if (movimento.Destino == localVeiculo) {
                return;
            } else if (movimento.Destino == localEstoque) {
                valuesSelect = document.getElementById("SelectEstoque");
                document.getElementById("Tab-Estoque").style.display = "flex";
                
            } else if (movimento.Destino == localBaixado) {

                valuesSelect = document.getElementById("SelectBaixa");
                document.getElementById("Tab-Baixa").style.display = "flex";

            } else if (movimento.Destino == localBorracharia) {

                valuesSelect = document.getElementById("SelectBorracharia");
                document.getElementById("Tab-Borracharia").style.display = "flex";

            } else if (movimento.Destino == localRecapagem) {

                valuesSelect = document.getElementById("SelectRecapadora");
                document.getElementById("Tab-Recapadora").style.display = "flex";
            }



            if(existePneu.HandleDestino){
                var optionsArray = Array.from(valuesSelect.options);
                var option = optionsArray.find((option) => {
                    return option.value == existePneu.HandleDestino;
                });

                option.selected = true;

            }else{
                valuesSelect.forEach((option) => {
                    option.selected = false;
                })
            }

            handlePneuSelecionadoGrid = handlePneu;

            return;
        }  
    });
}

const selectsDestino = document.getElementsByClassName("SelectDestino");
selectsDestino.forEach((select) => {
    select.addEventListener("change", () => {

        movimentacoesRealizadas.Destinos.forEach((destino) => {
            var pneu = destino.HandlesPneus.find((pneuMovimento) => {
               return pneuMovimento.Handle ===  parseInt(handlePneuSelecionadoGrid);
            })

            if(pneu){
                pneu.HandleDestino = parseInt(select.value);

                var listaPneusMovimentados = Array.from(document.getElementsByClassName("movimentoPneu"));
                var listaMensagemCampoRequired = Array.from(document.getElementsByClassName("mensagemCampoRequired"));
                
                var linhaPneuPreenchido = listaPneusMovimentados.find((pneuLinha) => {
                    return pneuLinha.firstChild.value == pneu.Handle;
                });

                linhaPneuPreenchido.style.backgroundColor = "transparent";

                var spanPreenchido = listaMensagemCampoRequired.find((span) => {
                    var idParentSpan = obterIdParentPeloDestino(destino.Destino)
                    return span.parentElement.id == idParentSpan;
                });

                spanPreenchido.style.display = "none";


            }

        });
    });

})

function ValidarMovimentacoes(){

    var podeGravar = true;

    movimentacoesRealizadas.Destinos.forEach((movimentacao) => {
        movimentacao.HandlesPneus.forEach((pneu) => {
            if(movimentacao.Destino !== 1){
                if(!pneu.HandleDestino){
                    console.log("não pode mandar sem destino")
                    obrigarPreencherDestino(pneu.Handle, movimentacao.Destino);
                    podeGravar = false
                }
            }
        })
    })

    return podeGravar;
}

function obrigarPreencherDestino(handlePneu, destino){
    var listaPneusMovimentados = Array.from(document.getElementsByClassName("movimentoPneu"));
    var listaMensagemCampoRequired = Array.from(document.getElementsByClassName("mensagemCampoRequired"));

    listaPneusMovimentados.forEach((pneu) => {
        var handle = pneu.children[0].value;

        if(handle === handlePneu){
            pneu.style.backgroundColor = "#fc000052"

            var idParentSpan = obterIdParentPeloDestino(destino);
            var span = listaMensagemCampoRequired.find( (span) => {
                return span.parentElement.id == idParentSpan
            })
            span.style.display = "block"
        }
    })

}

function obterIdParentPeloDestino(destino){
    switch(destino){
        case 4:
            return "Tab-Borracharia";
        case 2:
            return "Tab-Estoque";
        case 3:
            return "Tab-Recapadora";
        default:
            return "Tab-Baixa"
    }
}


