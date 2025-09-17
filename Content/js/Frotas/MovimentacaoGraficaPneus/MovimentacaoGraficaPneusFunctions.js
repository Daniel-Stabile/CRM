
const pathImagem = "../../../Content/assets/img/Frotas/";
const canvas = document.getElementById("desenhoCarreta");
const containerDesenho = document.getElementById("desenho");
const modalError = document.getElementById("ModalErro");
const ctx = canvas.getContext("2d");
const page = document.getElementById("PageMovGrafica");

var ultimaPosicaoXEixo;
var ultimaPosicaoXPneu;
var coordenadasEixo = [];
var listaPosicoesXPneus = [];
var posicoesDisponiveisPorEixo = [];
let todosPneusEixos = [];
var movimentacoesRealizadas = {
    Destinos: [],
    Pneus: [],
    HandleOs: undefined
};
let stepBloqueado = false;
let ultimoEixo;
let numeroUltimoEixo;
let temStep = false;
let eixoStep;
let pneuRetirado = null;
var tipoCaminhao;
var localizacaoAtualPneuSelecionado;
var HandleVeiculo = null;
var pneusJaDesenhados = "";
var handlesDesenhados = [];
var infoCaminhao;
var temSegundoEixoDirecional = false;

export { posicoesDisponiveisPorEixo, movimentacoesRealizadas, pneusJaDesenhados }

export async function makeRequest(method, endpoint, body) {
    try {
        const response = await fetch(Benner.Page.getApplicationPath() + endpoint, {
            method: method,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body)
        });

        let responseData;

        try {
            responseData = await response.json();
        } catch (jsonError) {
            // Pode não ser JSON, então apenas ignore e continue
        }

        if (!response.ok) {
            throw new Error(responseData ?.Message || 'Erro na requisição');
        }

        return responseData;
    } catch (error) {
        throw error;
    }
}

export function obterEndpointPelaOrigem(idBotao) {
    switch (idBotao) {
        case "btnModalBorracharia":
            return "api/ObterCentrosManutencao";
        case "btnModalRecapadora":
            return "api/ObterRecapadoras";
        case "btnModalEstoque":
            return "api/ObterAlmoxarifados";
    }
}

export function obterOrigem(idBotao) {
    switch (idBotao) {
        case "btnModalBorracharia":
            return "Borracharia";
        case "btnModalRecapadora":
            return "Recapadora";
        case "btnModalEstoque":
            return "Estoque";
    }
}

export async function carregarCaminhao(movimentandoPneus = false) {

    const handleOs = document.getElementById("ctl00_Main_txtOrdemServico").value;
    const handleVeiculo = document.getElementById("ctl00_Main_txtRecurso").value;

    const chassi = new Image();

    try{    

        page.style.cursor = "progress"

        if(!movimentandoPneus){
            const response =  await makeRequest("GET", `api/MontarCaminhao?handleVeiculo=${handleVeiculo}&handleOs=${handleOs}`)
            infoCaminhao = response;
            todosPneusEixos = infoCaminhao.Eixos;
        }
    
        movimentacoesRealizadas.HandleOs = handleOs;
        HandleVeiculo = handleVeiculo;

        chassi.onload = async function () {
            drawImageActualSize();
            
            if (!temStep) {
                DesenharEixoStep(eixoStep);
            }

            await carregarEixos();

            await carregarPneus();

            if(coordenadasEixo.length == 0){
                DefinirCoordenadasEixos(todosPneusEixos);
                RegistrarPosicoesDisponiveisPorEixo(todosPneusEixos);
            }
            
            ultimaPosicaoXPneu = undefined;
            ultimaPosicaoXEixo = undefined;
            ultimoEixo = undefined;
        };

        tipoCaminhao = infoCaminhao.TipoCaminhao;

        const ehCavalo = infoCaminhao.TipoCaminhao === 1;

        if (ehCavalo) {
            chassi.src = pathImagem + "ChassiCaminhao/CorpoCavalo.png";
        } else {
            chassi.src = pathImagem + "ChassiCaminhao/CorpoCarreta.png";
        }

        canvas.width = containerDesenho.clientWidth;
        canvas.height = containerDesenho.clientHeight;

        function drawImageActualSize() {
            var imageWidth;
            var imageHeight;

            if (ehCavalo) {
                imageWidth = chassi.width * scaleX ;
                imageHeight = chassi.height * scaleY;
                ctx.drawImage(chassi, 740 * scaleX,  50 * scaleY, imageWidth, imageHeight);
            } else {

                imageWidth = chassi.width * scaleX;
                imageHeight = chassi.height * scaleY;
                ctx.drawImage(chassi, 520 * scaleX, 45 * scaleY, imageWidth, imageHeight);
            }

            
            numeroUltimoEixo = infoCaminhao.Eixos.reduce(function (max, eixo) {
                return Math.max(max, eixo.Ordem);
            }, -Infinity);

            var qtdeEixosDirecionais = 0;

            infoCaminhao.Eixos.forEach((eixo) => {
                if (eixo.EhStep) {
                    temStep = true;
                    eixoStep = eixo;
                }

                if(eixo.EhDirecional){
                    qtdeEixosDirecionais++;
                }

                if(qtdeEixosDirecionais >= 2){
                    temSegundoEixoDirecional = true;
                }
            });
        
            ultimaPosicaoXPneu = undefined;
            ultimaPosicaoXEixo = undefined;
            ultimoEixo = undefined;
        }

    }catch(err){
        modalError.style.display = "flex";
        var mensagemErro = document.getElementById("mensagemErro");
        mensagemErro.innerText = err.message;
    }  
    
    page.style.cursor = "default"
}

async function DesenharEixoStep(eixo) {

    let step;
    if (!eixo) {
        stepBloqueado = true;

        step = {
            Handle: null,
            Ordem: 0,
            EhStep: true,
            Pneus: [],
            QtdePneusPorEixo: 2,
        }

        todosPneusEixos.push(step);
    }
}

function CriarListaPosicoes(eixo) {

    var eixo4posicoes = [1, -1, 2, -2];
    var eixo2posicoes = [1, -1];

    var eixoDuasPosicoes = eixo.QtdePneusPorEixo === 2;

    eixo.Pneus.forEach((pneu) => {
        if (eixoDuasPosicoes) {
            if (eixo2posicoes.includes(pneu.PosicaoPneu)) {
                var indicePosicao = eixo2posicoes.findIndex((posicao) => { return posicao === pneu.PosicaoPneu });
                eixo2posicoes.splice(indicePosicao, 1);

            }
        } else {
            if (eixo4posicoes.includes(pneu.PosicaoPneu)) {
                var indicePosicao = eixo4posicoes.findIndex((posicao) => { return posicao === pneu.PosicaoPneu })
                eixo4posicoes.splice(indicePosicao, 1);
            }
        }
    })

    if (eixoDuasPosicoes) {
        return eixo2posicoes;
    } else {
        return eixo4posicoes;
    }
}

async function RegistrarPosicoesDisponiveisPorEixo(eixos) {
    var aux = 0;
    eixos.forEach((eixo) => {
        posicoesDisponiveisPorEixo.push({
            Pneus: [],
            PneusPorEixo: null,
            OrdemEixo: eixo.Ordem,
        })
        posicoesDisponiveisPorEixo[aux].PneusPorEixo = eixo.QtdePneusPorEixo;

        var posicoesDisponiveis = CriarListaPosicoes(eixo);
        var auxDisponiveis = -1;

        for (let i = 0; i < eixo.QtdePneusPorEixo; i++) {
            posicoesDisponiveisPorEixo[aux].Pneus.push({
                PosicaoPneu: eixo.Pneus[i] ?.PosicaoPneu ? eixo.Pneus[i] ?.PosicaoPneu : (auxDisponiveis++ , posicoesDisponiveis[auxDisponiveis]),
                Handle: eixo.Pneus[i] ?.Handle, // Ajuste conforme necessário
                PosX: verificarPosicaoEixoXPneu(eixo.Ordem, eixo.EhStep ),
                PosY: verificarPosicaoEixoYPneu(eixo.Pneus[i] ?.PosicaoPneu, eixo.QtdePneusPorEixo, eixo.EhStep ),
            });
        }
        aux++;
    })

}


function verificarPosicaoEixoYPneu(posicaoPneu,qtdePneusEixo, ehStep) {

    const ehCavalo = tipoCaminhao === 1;
    if(ehStep){
        switch (posicaoPneu) {
            case 1: // segundo pneu lado esquerdo
                return ehCavalo ? 90 : 52;
            case -1: // segundo pneu lado direito
                return ehCavalo ? 220 : 275;
        }
    }
    else if(qtdePneusEixo == 4){
        switch (posicaoPneu) {
            case 2: // segundo pneu lado esquerdo
                return ehCavalo ? 110 : 52;
            case 1: // primeiro pneu lado esquerdo
                return ehCavalo ? 143 : 83;
            case -1: // primeiro pneu lado direito
                return ehCavalo ? 237 : 244;
            case -2: // segundo pneu lado direito
                return ehCavalo ? 270 : 275;
        }
    }
    else if(qtdePneusEixo == 2){
        switch (posicaoPneu) {
            case 1: // segundo pneu lado esquerdo
                return ehCavalo ? 115 : 52;
            case -1: // segundo pneu lado direito
                return ehCavalo ? 270 : 275;
        }
    }
    
}

function verificarPosicaoEixoXPneu(ordemPneu, ehStep, ehDirecional = false) {

    const ehCavalo = tipoCaminhao === 1;
    var espacamentoX; //Espaçamento entre as posições X
    var posicaoXPrimeiroPneu; // Posição X inicial para o primeiro eixo
    var posicaoXProximoPneu;

    if (ehCavalo) {

        espacamentoX = 128; // Espaçamento entre as posições X
        posicaoXPrimeiroPneu = 492; // Posição X inicial para o primeiro eixo

        if (!ehStep) {

            if(ehDirecional && temSegundoEixoDirecional){
                ultimaPosicaoXPneu = 615;
                return ultimaPosicaoXPneu;
            }

            if(!ultimaPosicaoXPneu){
                ultimoEixo = ordemPneu;
                ultimaPosicaoXPneu = posicaoXPrimeiroPneu;
                return ultimaPosicaoXPneu;
            }

            if(ordemPneu != ultimoEixo){
                ultimoEixo = ordemPneu;
                ultimaPosicaoXPneu -= espacamentoX;

                if(temSegundoEixoDirecional){
                    return ultimaPosicaoXPneu - 125;
                }else{
                    return ultimaPosicaoXPneu ;
                }
                

            }else{
                ultimoEixo = ordemPneu;

                if(temSegundoEixoDirecional){
                    return ultimaPosicaoXPneu - 125;
                }else{
                    return ultimaPosicaoXPneu;
                }
                
            }
            
        } else {

            if(temSegundoEixoDirecional){
                ultimaPosicaoXPneu = 500;
                return ultimaPosicaoXPneu;

            }else{
                ultimaPosicaoXPneu = 615;
                return ultimaPosicaoXPneu;
            }

            
        }

    } else { // Carreta

        if (!ehStep) {
            espacamentoX = 111; // Espaçamento entre as posições X
            posicaoXPrimeiroPneu = 405; // Posição X inicial para o primeiro eixo
            posicaoXProximoPneu = 280;

            return ordemPneu === 1 ? posicaoXPrimeiroPneu : posicaoXProximoPneu - (ordemPneu - 2) * espacamentoX;
        }

    }

}

async function carregarEixos() {
    const ehCavalo = tipoCaminhao === 1;
    for (var eixo of todosPneusEixos) {
        var posicaoX = 0;
        if (eixo.Ordem !== 1 && ehCavalo){
        posicaoX = calcularPosicaoXEixo(eixo.Ordem, tipoCaminhao, eixo.EhStep, eixo.EhDirecional);
        } else if (!ehCavalo){
            posicaoX = calcularPosicaoXEixo(eixo.Ordem, tipoCaminhao, eixo.EhStep);
        }
        
        listaPosicoesXPneus.push({
            ordem: eixo.Ordem,
            x: posicaoX,
        });

        await carregarImagemEixo(eixo, posicaoX);
    }
}


async function carregarImagemEixo(eixo, posicaoX) {
    return new Promise((resolve) => {

        var larguraPadraoEixo;
        var alturaPadraoEixo;
        const ehCavalo = tipoCaminhao === 1;
        const nomeChassi = tipoCaminhao === 1 ? "Cavalo" : "Carreta";
        const imgEixo = new Image();
        const numPneus = eixo?.QtdePneusPorEixo;
    
        var ordemEixo;
        var imgEixoSrc;
    
        if (!ehCavalo) {
            if (eixo.EhStep === false) {
                if (eixo.Ordem === 1) {
                    ordemEixo = "Primeiro";
                } else if (eixo.Ordem === numeroUltimoEixo) {
                    ordemEixo = "Ultimo";
                } else {
                    ordemEixo = "Intermedio";
                }
                imgEixoSrc = pathImagem + `Eixos/${ordemEixo}Eixo${numPneus}${nomeChassi}.png`;
            } else {
                imgEixoSrc = pathImagem + `Eixos/EixoStep.png`;
            }
    
        } else {
            if (eixo?.EhStep) {
                imgEixoSrc = pathImagem + `Eixos/EixoStep.png`;
            } else {
                imgEixoSrc = pathImagem + `Eixos/Eixo${numPneus}${nomeChassi}.png`;
            }
        }

        if (ehCavalo) { // Cavalo
            larguraPadraoEixo = 215 * scaleX;
            alturaPadraoEixo = 215 * scaleY;
        } else { // Carreta
            larguraPadraoEixo = 280 * scaleX;
            alturaPadraoEixo = 295 * scaleY;
        }
    
        if (!ehCavalo) {
            if (eixo.EhStep === false) {
                if (eixo.Ordem === 1) {
                    ordemEixo = "Primeiro";
                } else if (eixo.Ordem === numeroUltimoEixo) {
                    ordemEixo = "Ultimo";
                } else {
                    ordemEixo = "Intermedio";
                }
                imgEixoSrc = pathImagem + `Eixos/${ordemEixo}Eixo${numPneus}${nomeChassi}.png`;
            } else {
                imgEixoSrc = pathImagem + `Eixos/EixoStep.png`;
            }
    
        } else {
            if (eixo?.EhStep) {
                imgEixoSrc = pathImagem + `Eixos/EixoStep.png`;
            } else {
                imgEixoSrc = pathImagem + `Eixos/Eixo${numPneus}${nomeChassi}.png`;
            }
        }

        imgEixo.onload = function () {

            drawImageActualSize(eixo, posicaoX);
            
            resolve();
        };

        function drawImageActualSize(eixo,posicaoX) {
            if (ehCavalo) {    
                if (eixo.EhStep) {
                    ctx.drawImage(imgEixo, (posicaoX * scaleX), (95 * scaleY) , larguraPadraoEixo, alturaPadraoEixo);
                    if (stepBloqueado) {
                        var xPneu = new Image();
                        xPneu.onload = stepBloqueado;
                        xPneu.src = pathImagem + "SemPneu.png";
    
                        function stepBloqueado() {
                            ctx.drawImage(this, (posicaoX + 90) * scaleX, (110 * scaleY), 45, 45);
                            ctx.drawImage(this, (posicaoX + 90) * scaleX, (260 * scaleY), 45, 45);
                        }
                    }
                } else {
                    if(eixo.Ordem !== 1){
                        ctx.drawImage(imgEixo, (posicaoX * scaleX ) , (97.5 * scaleY), larguraPadraoEixo, alturaPadraoEixo);
                    }
                }
            } else {
                if(!eixo.EhStep){
                    ctx.drawImage(imgEixo, posicaoX * scaleX, 35 * scaleY, larguraPadraoEixo, alturaPadraoEixo);
                }
    
                if (stepBloqueado) {
                    var xPneu = new Image();
                    xPneu.src = pathImagem + "SemPneu.png";
                    xPneu.onload = stepBloqueado;
    
                    function stepBloqueado() {
                        ctx.drawImage(this, 575 * scaleX, (80 * scaleY), 65, 65);
                        ctx.drawImage(this, 575 * scaleX, (210 * scaleY), 65, 65);
                    }
                }
    
            }
        }

        imgEixo.src = imgEixoSrc;
    });
}


async function carregarPneus() {

    const larguraPadraoPneu = 125 * scaleX;
    const alturaPadraoPneu = 33 * scaleY;

    const larguraPadraoStep = 120 * scaleX;
    const alturaPadraoStep = 100 * scaleY;

    for(var eixo of todosPneusEixos){
        function drawImageActualSize(img, x, y, dadosPneu, ehStep) {
    
            if(ehStep){
                ctx.drawImage(img, x * scaleX, y * scaleY, larguraPadraoStep, alturaPadraoStep);
            }else{
                if(tipoCaminhao === 1){
                    ctx.drawImage(img, x * scaleX, y * scaleY, larguraPadraoPneu, alturaPadraoPneu);
                }else{
                    ctx.drawImage(img, x - (10 * scaleX), y * scaleY, larguraPadraoPneu, alturaPadraoPneu);
                }
            }
    
            ctx.font = '12px'; // Define a fonte e o tamanho
            ctx.fillStyle = 'white';
            if (dadosPneu.MarcaFogo !== null) {
    
                if(ehStep){
                    ctx.fillText(dadosPneu.MarcaFogo, (x + 10) * scaleX, (y + 10) * scaleY);
                }else{
                    ctx.fillText(dadosPneu.MarcaFogo, (x + 10) * scaleX, (y + 10) * scaleY);
                }
            }
    
            if(ehStep){
                ctx.fillText(dadosPneu.Codigo, (x + 10) * scaleX, (y + 20) * scaleY);
            }else{
                ctx.fillText(dadosPneu.Codigo, (x + 10) * scaleX, (y + 20) * scaleY);
            }
        }
    
        function VerificaCorPneuPelaVida(pneu) {
            switch (pneu.Vida) {
                case -1:
                    return "Pneu.png";
                case 0:
                    return "PneuVerde.png";
                case 1:
                    return "PneuAzul.png";
                case 2:
                    return "PneuAmarelo.png";
                case pneu.Vida >= 3:
                    return "PneuLaranja.png";
            }
        }
    
        function VerificaCorStepPelaVida(pneu) {
            switch (pneu.Vida) {
                case -1:
                    return "EstepePadrao.png";
                case 0:
                    return "EstepeVerde.png";
                case 1:
                    return "EstepeAzul.png";
                case 2:
                    return "EstepeAmarelo.png";
                case pneu.Vida >= 3:
                    return "EstepeLaranja.png";
            }
        }
    
        function carregarImagem(pneu, x, y, ehStep) {
            const img = new Image();
    
            img.id = pneu.Handle;
    
            img.onload = function () {
                drawImageActualSize(img, x, y, pneu, ehStep);
            };
    
            if(ehStep){
                img.src = pathImagem + "Estepe/" + VerificaCorStepPelaVida(pneu);
            }else{
                img.src = pathImagem + "Pneus/" + VerificaCorPneuPelaVida(pneu);
            }
    
        
        }

        if(eixo.Ordem != 1 && tipoCaminhao == 1){
            verificarPosicaoEixoXPneu(eixo.Ordem, eixo.EhStep, eixo.EhDirecional);
        }
        
        for(var pneu of eixo.Pneus){
            if (pneu.Handle) {
                if (!handlesDesenhados.includes(pneu.Handle)) {
                    handlesDesenhados.push(pneu.Handle);
                }
            }
    
            if (tipoCaminhao === 1) {
                if (eixo.Ordem === 1) {
                    const eixoXPneuInicial = 793;
                    const eixoYPneuEsquerdo = 114;
                    const eixoYPneuDireito = 265;
    
                    const eixoYInicial = pneu.PosicaoPneu < 0 ? eixoYPneuDireito : eixoYPneuEsquerdo;
                    carregarImagem(pneu, eixoXPneuInicial, eixoYInicial, eixo.EhStep);
                } else {
                    const x = verificarPosicaoEixoXPneu(eixo.Ordem, eixo.EhStep, eixo.EhDirecional);
                    const y = verificarPosicaoEixoYPneu(pneu.PosicaoPneu, eixo.QtdePneusPorEixo, eixo.EhStep);
                    carregarImagem(pneu, x, y, eixo.EhStep);
                }
            } else {
                const x = verificarPosicaoEixoXPneu(eixo.Ordem, eixo.EhStep);
                const y = verificarPosicaoEixoYPneu(pneu.PosicaoPneu, eixo.QtdePneusPorEixo, eixo.EhStep);
                carregarImagem(pneu, x, y);
    
            }
        }

        pneusJaDesenhados = handlesDesenhados.join(',');
    }
}


function calcularPosicaoXEixo(ordemEixo, tipoCaminhao, ehStep, ehDirecional) {
    var espacamentoX; // Espaçamento entre as posições X
    var posicaoXPrimeiroEixo; // Posição X inicial para o primeiro eixo
    var posicaoXProximoEixo; // Posição X para os próximos eixos

    if (tipoCaminhao === 1) { // Cavalo
        espacamentoX = 126; // Espaçamento entre as posições X
        posicaoXPrimeiroEixo = 440; // Posição X inicial para o primeiro eixo
        posicaoXProximoEixo = 200;

        if (!ehStep) {

            if(ehDirecional && temSegundoEixoDirecional){
                ultimaPosicaoXEixo = 565;
                return 565;
            }
        
            if(!ultimaPosicaoXEixo){
                ultimaPosicaoXEixo = posicaoXPrimeiroEixo;
                return ultimaPosicaoXEixo;
            }
            if(temSegundoEixoDirecional){
                ultimaPosicaoXEixo -= espacamentoX + 125;
                return ultimaPosicaoXEixo;
            }else{
                ultimaPosicaoXEixo -= espacamentoX;
                return ultimaPosicaoXEixo;
            }
           
            
        } else {

            if(temSegundoEixoDirecional){
                ultimaPosicaoXEixo = 440;
                return 440;
            }else{
                ultimaPosicaoXEixo = 565;
                return 565;
            }

            
        }

    } else { // Carreta

        if (!ehStep) {
            espacamentoX = 124;
            posicaoXPrimeiroEixo = 310;
            posicaoXProximoEixo = 200;

            return ordemEixo === 1 ? posicaoXPrimeiroEixo : posicaoXProximoEixo - (ordemEixo - 2) * espacamentoX;
        }


    }

}



export async function DesenharPneusSelecionados(origem, listaPneusSelecionados, listaPneus, devolvendoPneu = false, pneuRetirado) {

    var pneus = [];

    let idDiv;
    let containerImagensPneus = undefined;

    if (!devolvendoPneu) {

        var pneusDisponiveisGrid = document.getElementsByClassName("ContainerPneu");
        var listaPneusNoGrid = Array.prototype.slice.call(pneusDisponiveisGrid);


        idDiv = verificarInputOrigem(origem);
        containerImagensPneus = document.getElementById(idDiv);
        listaPneusSelecionados.forEach((pneuSelecionado) => {

            var pneu = listaPneusNoGrid.find((pneu) => {
                return pneu.id == pneuSelecionado.Handle;
            })

            if (!pneu) {
                const dadosPneu = listaPneus.find((pneu) => pneu.Handle == pneuSelecionado.Handle);
                if (dadosPneu) {
                    pneus.push({
                        Handle: dadosPneu.Handle,
                        MarcaFogo: dadosPneu.MarcaFogo,
                        Codigo: dadosPneu.Codigo,
                        Vida: dadosPneu.Vida
                    });
                }
            }


        });
    } else {
        containerImagensPneus = document.getElementById(origem);
        pneus.push(pneuRetirado);
    }


    const larguraPadraoPneu = 130;
    const alturaPadraoPneu = 35;

    pneus.forEach((pneu) => {
        function drawImageActualSize(img) {
            const containerDiv = document.createElement('div');
            containerDiv.className = "ContainerPneu";
            containerDiv.draggable = true;
            containerDiv.ondragstart = dragElement;
            containerDiv.id = pneu.Handle;

            const textoDiv = document.createElement('div');
            textoDiv.textContent = pneu.Codigo;
            textoDiv.className = "TextoDivPneu";
            textoDiv.id = pneu.Handle;

            containerDiv.appendChild(img);
            containerDiv.appendChild(textoDiv);

            var containerPneus = containerImagensPneus.querySelector(".bodyDiv");
            containerPneus.appendChild(containerDiv);

        }

        function VerificaCorPneuPelaVida(pneu) {
            switch (pneu.Vida) {
                case -1:
                    return "Pneu.png";
                case 0:
                    return "PneuVerde.png";
                case 1:
                    return "PneuAzul.png";
                case 2:
                    return "PneuAmarelo.png";
                case pneu.Vida >= 3:
                    return "PneuLaranja.png";
            }
        }

        function carregarImagem(pneu) {
            const img = new Image(larguraPadraoPneu, alturaPadraoPneu);

            img.onload = function () {
                drawImageActualSize(img);
            };
            img.src = pathImagem + "Pneus/" + VerificaCorPneuPelaVida(pneu);
            img.id = pneu.Handle;
        }

        function dragElement(e) {
            e.dataTransfer.setData("pneu", JSON.stringify(pneu));
        }

        carregarImagem(pneu);

    })

}

export function ObterDivPelaOrigem(idBotao) {
    switch (idBotao) {
        case "btnModalBorracharia":
            return "PneusBorracharia";
        case "btnModalRecapadora":
            return "PneusRecapadora";
        case "btnModalEstoque":
            return "PneusEstoque";
    }
}


async function DefinirCoordenadasEixos(eixos) {

    listaPosicoesXPneus.forEach((item) => {

        if (tipoCaminhao === 1) { // Cavalo
            if (item.ordem === 1) {
                coordenadasEixo.push({
                    xInicio: 800 * scaleX,
                    xFinal: 920 * scaleX,
                    yInicio: 204 * scaleY,
                    OrdemEixo: item.ordem,
                    // Adicione outras propriedades conforme necessário
                });
            } else {
                // Se for um eixo diferente, ajuste as coordenadas de acordo
                var eixo = eixos.find((eixo) => {return eixo.Ordem == item.ordem});
                coordenadasEixo.push({
                    xInicio: (item.x + (60 * scaleX)),
                    xFinal: (item.x + (167 * scaleX)),
                    yInicio: 204 * scaleY,
                    OrdemEixo: item.ordem,
                    QtdePneusEixo : eixo.QtdePneusPorEixo,
                    // Adicione outras propriedades conforme necessário
                });
            }
        } else { // Carreta

            // Se for um eixo diferente, ajuste as coordenadas de acordo
            var xInicio = (item.x + (210 * scaleX)) - 105
            coordenadasEixo.push({
                xInicio: xInicio,
                xFinal: item.x + (210 * scaleX),
                yInicio: 175 * scaleY,
                OrdemEixo: item.ordem,
                // Adicione outras propriedades conforme necessário
            });

        }

    })

}

export async function DesenharPneuArrastado(pneuArrastado, x, y) {

    page.style.cursor = "progress"

    if (pneuArrastado == "") {
        return;
    }

    ultimaPosicaoXEixo = undefined;
    ultimaPosicaoXPneu = undefined;
    ultimoEixo = undefined;
    
    const pneuSelecionado = JSON.parse(pneuArrastado); // aqui vc tem os dados do pneu q esta arrastando
    pneuRetirado = pneuSelecionado;

    var destinoPneu = VerificarPosicaoDestinoPneu(x, y, pneuSelecionado);

    if(destinoPneu.ordemEixo == undefined || destinoPneu.posicaoPneu == undefined){
        page.style.cursor = "default";
        return;
    }

    var eixoDestino = todosPneusEixos.find((eixo) => {
        return eixo.Ordem === destinoPneu.ordemEixo;
    })

    eixoDestino.Pneus.push({
        Handle: pneuSelecionado.Handle,
        PosicaoPneu: destinoPneu.posicaoPneu,
        Vida: pneuSelecionado.Vida,
        Codigo: pneuSelecionado.Codigo,
        MarcaFogo: pneuSelecionado.MarcaFogo
    })

    GerarMovimentacaoPneusAoAdicionarPneu(eixoDestino, destinoPneu);

    var pneusDisponiveisGrid = document.getElementsByClassName("ContainerPneu");
    var listaPneusDisponiveisGrid = Array.prototype.slice.call(pneusDisponiveisGrid);

    // Encontrando o elemento com base na condição
    var pneuDesenhado = listaPneusDisponiveisGrid.find((containerPneu) => {
        return containerPneu.id == pneuSelecionado.Handle;
    });


    // Removendo o elemento se encontrado
    if (pneuDesenhado) {
        pneuDesenhado.remove();
    }

    ctx.clearRect(0, 0, canvas.width, canvas.height);

    
    await carregarCaminhao(true);


    page.style.cursor = "default"

}

function VerificarPosicaoDestinoPneu(x, y, pneuSelecionado) {
    var ordemEixo;
    var posicaoPneu;

    for (const coordenada of coordenadasEixo) {
        var ehEixoPrincipal = coordenada.OrdemEixo === 1 && tipoCaminhao === 1;
        if (x >= coordenada.xInicio && x <= coordenada.xFinal) {
            if (ehEixoPrincipal) {

                if (y <= coordenada.yInicio) {
                    posicaoPneu = 1;
                } else {
                    posicaoPneu = -1;
                }

                ordemEixo = 1;

            } else {
                if (y <= coordenada.yInicio) { // Esquerda
                    if (tipoCaminhao === 1) {
                        if (y >= (110 * scaleY) && y <= (142 * scaleY)) { // 62.5
                            if(coordenada.QtdePneusEixo == 2){
                                posicaoPneu = 1 // Necessario isso quando o eixo tem dois pneus por eixo
                            }else{
                                posicaoPneu = 2; // primeiro pneu
                            }
                        } else if (y >= (144 * scaleY) && y <= (167 * scaleY)) {
                            posicaoPneu = 1; // segundo pneu
                        }
                    } else {
                        if (y >= (50 * scaleY) && y <= (80 * scaleY)) { // 62.5
                            if(coordenada.QtdePneusEixo == 2){
                                posicaoPneu = 1 // Necessario isso quando o eixo tem dois pneus por eixo
                            }else{
                                posicaoPneu = 2; // primeiro pneu
                            }
                        } else if (y >= (83 * scaleY) && y <= (121 * scaleY)) {
                            posicaoPneu = 1; // segundo pneu
                        }
                    }

                } else { // Direita
                    if (tipoCaminhao === 1) {
                        if (y >= (230 * scaleY) && y <= (267 * scaleY)) {
                            posicaoPneu = -1;
                        } else if (y >= (270 * scaleY) && y <= (302 * scaleY)) {
                            if(coordenada.QtdePneusEixo == 2){
                                posicaoPneu = -1 // Necessario isso quando o eixo tem dois pneus por eixo
                            }else{
                                posicaoPneu = -2;
                            }
                        }
                    } else {
                        if (y >= (277 * scaleY) && y <= (307 * scaleY)) { // 62.5
                            posicaoPneu = -2;
                        } else if (y >= (239 * scaleY) && y <= (275 * scaleY)) {
                            posicaoPneu = -1;
                        }
                    }

                }

                ordemEixo = coordenada.OrdemEixo;
            }

            if (pneuSelecionado) {
                var indiceEixo = posicoesDisponiveisPorEixo.findIndex((eixo) => eixo.OrdemEixo === coordenada.OrdemEixo);
                const pneus = posicoesDisponiveisPorEixo[indiceEixo].Pneus;

                var indicePneu = pneus.findIndex((pneu) => pneu.PosicaoPneu === posicaoPneu);
                var pneu = pneus[indicePneu];


                if (pneu.Handle !== undefined) {
                    return;
                } else {
                    pneu.Handle = pneuSelecionado.Handle;
                }
            }
        }
    }

    if(ordemEixo === 0){
        if(posicaoPneu > 0 || posicaoPneu === 1){
            posicaoPneu = 1;
        }else{
            posicaoPneu = -1
        }
    }

    return {
        ordemEixo: ordemEixo,
        posicaoPneu: posicaoPneu
    };
}

export async function BuscarPneuASerRemovido(x, y) {
    localizacaoAtualPneuSelecionado = VerificarPosicaoDestinoPneu(x, y);

    if(localizacaoAtualPneuSelecionado.ordemEixo == undefined || localizacaoAtualPneuSelecionado.posicaoPneu == undefined){
        return;
    }

    var eixoPneuSelecionado = todosPneusEixos.find((eixo) => {
        return eixo.Ordem === localizacaoAtualPneuSelecionado.ordemEixo;
    })

    var indicePneuSelecionado = eixoPneuSelecionado.Pneus.findIndex((pneu) => {
        return pneu.PosicaoPneu === localizacaoAtualPneuSelecionado.posicaoPneu;
    })

    if (indicePneuSelecionado !== -1) {
        pneuRetirado = eixoPneuSelecionado.Pneus[indicePneuSelecionado];
    }

}

export async function ExcluirPneuDesenho(divDestino) {

    page.style.cursor = "progress"

    ultimaPosicaoXEixo = undefined;
    ultimaPosicaoXPneu = undefined;
    ultimoEixo = undefined;

    var pneuRemovido = undefined;

    var origem = verificarDivOrigem(divDestino);

    if(origem == "Estoque"){
        var temProduto = await VerificaProdutoVariacaoPneu(pneuRetirado.Handle);
            
        if(!temProduto){
            var modalMensagem = document.getElementById("ModalPneuEstoque");
            var mensagem = document.getElementById("MensagemMovimentoEstoque");
            mensagem.innerHTML = "Não é possível mover o pneu para o Estoque, pois não foi informado Produto/Variação no cadastro do Pneu! <br/> <br/> <br/> É necessário informar o Produto e Variação deste Pneu antes de movimentá-lo!";
            modalMensagem.style.display = "flex";
            page.style.cursor = "default"
            return;
        }
    }


    for (const eixo of posicoesDisponiveisPorEixo) {
        // Verifica se o pneuRemovido já está preenchido
        if (!pneuRemovido) {
            pneuRemovido = eixo.Pneus.find((pneu) => {
                return pneu.Handle == pneuRetirado.Handle;
            });
        } else {
            // Se o pneuRemovido já estiver preenchido, você pode sair do loop ou fazer qualquer outra lógica necessária.
            break;
        }
    }

    var eixoPneuSelecionado = todosPneusEixos.find((eixo) => {
        return eixo.Ordem === localizacaoAtualPneuSelecionado.ordemEixo;
    })

    var indicePneuSelecionado = eixoPneuSelecionado.Pneus.findIndex((pneu) => {
        return pneu.PosicaoPneu === localizacaoAtualPneuSelecionado.posicaoPneu;
    })

    var numeroDestino = DefinirDestino(divDestino)

    GravarMovimentacoesPneus(numeroDestino);

    eixoPneuSelecionado.Pneus.splice(indicePneuSelecionado, 1);

    pneuRemovido.Handle = undefined;

    
    DesenharPneusSelecionados(origem, [], [], true, pneuRetirado);

    ctx.clearRect(0, 0, canvas.width, canvas.height);

  
    await carregarCaminhao(true);


    page.style.cursor = "default"
}


export async function MudarPosicaoPneu(x, y, observacaoMovimentoPneu = "") {

    page.style.cursor = "progress"

    ultimaPosicaoXEixo = undefined;
    ultimaPosicaoXPneu = undefined;
    ultimoEixo = undefined;
    // Verifica a posição que o Pneu foi solto e obtem a posição no eixo.
    var coordenadasDetino = VerificarPosicaoDestinoPneu(x, y);

    if(coordenadasDetino.ordemEixo == undefined || coordenadasDetino.posicaoPneu == undefined){
        page.style.cursor = "default";
        return;
    }

    // Verifica se ja existe um pneu na posicao que o pneu foi arrastado.
    var eixoDestino = todosPneusEixos.find((eixo) => {
        return eixo.Ordem === coordenadasDetino.ordemEixo;
    })

    var posicaoDestino = eixoDestino.Pneus.find((pneu) => {
        return pneu.PosicaoPneu === coordenadasDetino.posicaoPneu;
    })

    if (posicaoDestino) {
        // se tiver pneu na posição nao faz nada.
        return
    } else {

        var eixoOrigem = todosPneusEixos.find((eixo) => {
            return eixo.Ordem === localizacaoAtualPneuSelecionado.ordemEixo;
        });

        var indicePosicaoOrigem = eixoOrigem.Pneus.findIndex((pneu) => {
            return pneu.PosicaoPneu === localizacaoAtualPneuSelecionado.posicaoPneu;
        })

        eixoOrigem.Pneus.splice(indicePosicaoOrigem, 1);


        // Atualiza o campo PosicaoPneu do pneu arrastado, colocando a posicao atual 
        pneuRetirado.PosicaoPneu = coordenadasDetino.posicaoPneu;

        // Adiciona ao eixo o Pneu movimentado.
        eixoDestino.Pneus.push(pneuRetirado);

        GravarMovimentacaoPneusEntreEixos(eixoDestino, coordenadasDetino, observacaoMovimentoPneu);
        
        var posicaoAtualPneu;
        var posicaoDestinoPneu;

        for(var eixo of posicoesDisponiveisPorEixo) {

            if (eixo.OrdemEixo == coordenadasDetino.ordemEixo) {
                posicaoDestinoPneu = eixo.Pneus.find((posicao) => {
                    return posicao.PosicaoPneu == coordenadasDetino.posicaoPneu;
                });
            }

            if (!posicaoAtualPneu) {
                posicaoAtualPneu = eixo.Pneus.find((posicao) => {
                    return posicao.Handle == pneuRetirado.Handle;
                });
            }

        }        
       
        posicaoAtualPneu.Handle = undefined;
        posicaoDestinoPneu.Handle = pneuRetirado.Handle;


        ctx.clearRect(0, 0, canvas.width, canvas.height);

        await carregarCaminhao(true);

    }

    page.style.cursor = "default"
}

function DefinirDestino(idDiv) {
    switch (idDiv) {
        case "Borracharia":
            return 4;
        case "PneusBorracharia":
            return 4;
        case "Estoque":
            return 2;
        case "PneusEstoque":
            return 2;
        case "Recapadora":
            return 3;
        case  "PneusRecapadora":
            return 3;
        case "Baixado":
            return 5;
        case "PneusBaixa":
            return 5;
    }
}


export async function GravarMovimentacoes() {
    var modalMensagem = document.getElementById("ModalPneuEstoque");
    var mensagem = document.getElementById("MensagemMovimentoEstoque");
    var modalMovimentacoes = document.getElementById("ModalConfirmar");
    var modalContentResultadoMovimentacoes = document.getElementById("modalContentMovimentoEstoque");

    await makeRequest("POST", "api/ConfirmarMovimentacao", movimentacoesRealizadas)
        .then((response) => {
            
            mensagem.innerText = response.Message;
            modalMovimentacoes.style.display = "none";
            modalContentResultadoMovimentacoes.style.height = "20%";
            modalMensagem.style.display = "flex";

            movimentacoesRealizadas =  {
                Destinos: [],
                Pneus: [],
                HandleOs: undefined
            };

        })
        .catch((err) => {
            mensagem.innerText = err;
            modalMovimentacoes.style.display = "none";
            modalContentResultadoMovimentacoes.style.height = "45%";
            modalMensagem.style.display = "flex";
        });
}


export async function ValidaMovimentoPneu() {
    var handlePneu = pneuRetirado.Handle
    const handleOs = document.getElementById("ctl00_Main_txtOrdemServico").value;
    try {
        const response = await makeRequest("GET", `api/ValidarPneuMovimentado?handleOs=${handleOs}&handlePneu=${handlePneu}`);
        return response;
    } catch (err) {
        console.log(err);
    }
}


export async function ObterDescricaoMovimentoPneu() {
    var handlePneu = pneuRetirado.Handle
    const handleOs = document.getElementById("ctl00_Main_txtOrdemServico").value;
    try {
        const response = await makeRequest("GET", `api/ValidarPneuMovimentado?handleOs=${handleOs}&handlePneu=${handlePneu}`);
        return response;
    } catch (err) {
        console.log(err);
    }
}

export function verificarInputOrigem(idInput){
    switch(idInput){
        case "Borracharia":
            return "Borracharia";
        case "PneusBorracharia":
            return "Borracharia";
        case "Recapadora":
            return "Recapadora";
        case "PneusRecapadora":
            return "Recapadora";
        case "Baixado":
            return "Baixado";
        case "PneusBaixa":
            return "Baixado";
        case "PneusEstoque":
            return "Estoque";
        case "Estoque":
            return "Estoque";
    }
}

export function verificarDivOrigem(idInput){
    switch(idInput){
        case "Borracharia":
            return "Borracharia";
        case "PneusBorracharia":
            return "Borracharia";
        case "Recapadora":
            return "Recapadora";
        case "PneusRecapadora":
            return "Recapadora";
        case "Baixado":
            return "Baixado";
        case "PneusBaixa":
            return "Baixado";
        case "PneusEstoque":
            return "Estoque";
        case "Estoque":
            return "Estoque";
    }
}

async function VerificaProdutoVariacaoPneu(handlePneu) {
    try {
        const response = await makeRequest("GET", `api/VerificarProdutoVariacao?handlePneu=${handlePneu}`);
        return response;
    } catch (err) {
        console.log(err);
    }
}


function GravarMovimentacaoPneusEntreEixos(eixoDestino, coordenadasDetino, observacaoMovimentoPneu){
    
    var eixoJaTemDestino = movimentacoesRealizadas.Destinos.find((movimentacao) => {
        return movimentacao.HandleEixo === eixoDestino.Handle;
    })

    var pneuEstaNoEixoDestino = -1;
    var destinoEixoAntigo = undefined;

    movimentacoesRealizadas.Destinos?.forEach((destino) => {
        if(pneuEstaNoEixoDestino === -1){
            pneuEstaNoEixoDestino = destino.HandlesPneus?.findIndex((pneu) => {
                return pneu.Handle == pneuRetirado.Handle;
            })
            if (pneuEstaNoEixoDestino !== -1 && destinoEixoAntigo === undefined) {
                destinoEixoAntigo = destino;
            }
        }
    });

    if (pneuEstaNoEixoDestino !== -1 && destinoEixoAntigo?.HandleEixo !== eixoDestino.Handle) {
        destinoEixoAntigo.HandlesPneus.splice(pneuEstaNoEixoDestino, 1);

        if(destinoEixoAntigo.HandlesPneus.length === 0){
            var indiceDestino = movimentacoesRealizadas.Destinos.findIndex((destino) => {
                return destino.HandleEixo === destinoEixoAntigo.HandleEixo;
            })

            if(indiceDestino !== -1){
                movimentacoesRealizadas.Destinos.splice(indiceDestino, 1);
            }
        }

    }


    if (!eixoJaTemDestino) {
        movimentacoesRealizadas.Destinos.push({
            Destino: 1,
            HandleEixo: eixoDestino.Handle,
            Observacao: observacaoMovimentoPneu,
            HandlesPneus: [
                {
                    Handle: pneuRetirado.Handle,
                    MarcaFogo : pneuRetirado.MarcaFogo,
                    Codigo : pneuRetirado.Codigo,
                    Vida : pneuRetirado.Vida,
                    Desgaste : pneuRetirado.Desgaste,
                    PosicaoPneu : coordenadasDetino.posicaoPneu,
                    HandleDestino: HandleVeiculo,
                }
            ]
        })


    }else{
        var pneuJaTemDestino;
        movimentacoesRealizadas.Destinos?.forEach((destino) => {
            if(!pneuJaTemDestino){
                pneuJaTemDestino = destino.HandlesPneus?.find((pneu) => {
                    return pneu.Handle == pneuRetirado.Handle;
                })
            }
        });

        if(!pneuJaTemDestino){

            eixoJaTemDestino.HandlesPneus.push({
                Handle: pneuRetirado.Handle,
                MarcaFogo : pneuRetirado.MarcaFogo,
                Codigo : pneuRetirado.Codigo,
                Vida : pneuRetirado.Vida,
                Desgaste : pneuRetirado.Desgaste,
                PosicaoPneu : coordenadasDetino.posicaoPneu,
                HandleDestino: HandleVeiculo,
            })
            
        }else{
            pneuJaTemDestino.PosicaoPneu = coordenadasDetino.posicaoPneu;
        }
    }

    movimentacoesRealizadas.HouveMovimentacao = true;
    console.log(movimentacoesRealizadas);

}

function GravarMovimentacoesPneus(numeroDestino){
    var jaPossuiMovimentacaoParaDestino = movimentacoesRealizadas.Destinos.find((movimentacao) => {
        return  movimentacao.Destino == numeroDestino;
    })

    var pneuJaTemDestino = movimentacoesRealizadas.Destinos.find((movimentacao) => {
        return  movimentacao.HandlesPneus.find((pneu) => {
            return pneu.Handle == pneuRetirado.Handle;
        });
    })

    var indiceDestino = movimentacoesRealizadas.Destinos.findIndex((movimentacao) => {
        return  movimentacao.HandlesPneus.find((pneu) => {
            return pneu.Handle == pneuRetirado.Handle;
        });
    })

    if(pneuJaTemDestino){

        var indicePneuRetirado = pneuJaTemDestino.HandlesPneus.findIndex((pneu) => {
            return pneu.Handle == pneuRetirado.Handle;     
        })

        if(indicePneuRetirado != -1){
            pneuJaTemDestino.HandlesPneus.splice(indicePneuRetirado, 1);

            if(pneuJaTemDestino.HandlesPneus.length == 0){
                movimentacoesRealizadas.Destinos.splice(indiceDestino, 1)
                
            }
            
        }

        if(jaPossuiMovimentacaoParaDestino){

            jaPossuiMovimentacaoParaDestino.HandlesPneus.push({
                Handle: pneuRetirado.Handle,
                MarcaFogo : pneuRetirado.MarcaFogo,
                Codigo : pneuRetirado.Codigo,
                Vida : pneuRetirado.Vida,
                Desgaste : pneuRetirado.Desgaste,
                PosicaoPneu : undefined,
                HandleDestino: undefined,
            })

        }else{
            movimentacoesRealizadas.Destinos.push({
                Destino: numeroDestino,
                Observacao: "",
                HandleEixo: null,
                HandlesPneus: [
                    {
                        Handle: pneuRetirado.Handle,
                        MarcaFogo : pneuRetirado.MarcaFogo,
                        Codigo : pneuRetirado.Codigo,
                        Vida : pneuRetirado.Vida,
                        Desgaste : pneuRetirado.Desgaste,
                        PosicaoPneu : undefined,
                        HandleDestino: undefined,
                    }
                ]
            });
        }
        
    }else{
        movimentacoesRealizadas.Destinos.push({
            Destino: numeroDestino,
            Observacao: "",
            HandleEixo: null,
            HandlesPneus: [
                {
                    Handle: pneuRetirado.Handle,
                    MarcaFogo : pneuRetirado.MarcaFogo,
                    Codigo : pneuRetirado.Codigo,
                    Vida : pneuRetirado.Vida,
                    Desgaste : pneuRetirado.Desgaste,
                    PosicaoPneu : undefined,
                    HandleDestino: undefined,
                }
            ]
        });
    }
    
    movimentacoesRealizadas.HouveMovimentacao = true;

    console.log(movimentacoesRealizadas);
}

function GerarMovimentacaoPneusAoAdicionarPneu(eixoDestino, destinoPneu){
    
    var eixoJaTemDestino = movimentacoesRealizadas.Destinos.find((movimentacao) => {
        return movimentacao.HandleEixo == eixoDestino.Handle;
    })

    if (!eixoJaTemDestino) {

        var pneuJaTemDestino = movimentacoesRealizadas.Destinos.find((movimentacao) => {
            return  movimentacao.HandlesPneus.find((pneu) => {
                return pneu.Handle == pneuRetirado.Handle;
            });
        })

        var indiceDestinoRetirado = movimentacoesRealizadas.Destinos.findIndex((movimentacao) => {
            return  movimentacao.HandlesPneus.find((pneu) => {
                return pneu.Handle == pneuRetirado.Handle;
            });
        })

        if(pneuJaTemDestino){
            
            var indicePneuRetirado =  pneuJaTemDestino.HandlesPneus.findIndex((pneu) => {
                return pneu.Handle == pneuRetirado.Handle;
            });

            pneuJaTemDestino.HandlesPneus.splice(indicePneuRetirado, 1);

            if(pneuJaTemDestino.HandlesPneus.length === 0){
                movimentacoesRealizadas.Destinos.splice(indiceDestinoRetirado,1);
            }

        }

        movimentacoesRealizadas.Destinos.push({
            Destino: 1,
            Observacao: "",
            HandleEixo: eixoDestino.Handle,
            HandlesPneus: [
                {
                    Handle: pneuRetirado.Handle,
                    MarcaFogo : pneuRetirado.MarcaFogo,
                    Codigo : pneuRetirado.Codigo,
                    Vida : pneuRetirado.Vida,
                    Desgaste : pneuRetirado.Desgaste,
                    PosicaoPneu : destinoPneu.posicaoPneu,
                    HandleDestino: parseInt(HandleVeiculo)
                }
            ]
        });
        
        
    } else{
        var pneuJaTemDestino = movimentacoesRealizadas.Destinos.find((movimentacao) => {
            return movimentacao.HandlesPneus.find((pneu) => {
                return pneu.Handle == pneuRetirado.Handle;
            });
        })

        var indiceDestino = movimentacoesRealizadas.Destinos.findIndex((movimentacao) => {
            return movimentacao.HandlesPneus.find((pneu) => {
                return pneu.Handle == pneuRetirado.Handle;
            });
        })

        if(!pneuJaTemDestino){

            eixoJaTemDestino.HandlesPneus.push({
                Handle: pneuRetirado.Handle,
                PosicaoPneu : destinoPneu.posicaoPneu,
                HandleDestino : parseInt(HandleVeiculo),
                MarcaFogo : pneuRetirado.MarcaFogo,
                Codigo : pneuRetirado.Codigo,
                Vida : pneuRetirado.Vida,
                Desgaste : pneuRetirado.Desgaste
            }) 
            
        }else{
            if(pneuJaTemDestino.Destino !== 1){
                var indicePneu = pneuJaTemDestino.HandlesPneus.findIndex((pneu) => {
                    return pneu.Handle === pneuRetirado.Handle;
                })

                pneuJaTemDestino.HandlesPneus.splice(indicePneu, 1);
                if(pneuJaTemDestino.HandlesPneus.length === 0){
                    movimentacoesRealizadas.Destinos.splice(indiceDestino,1);
                }

                var existeDestinoParaVeiculo = movimentacoesRealizadas.Destinos.find((destino) => {
                    return destino.Destino === 1;
                })

                if(existeDestinoParaVeiculo){
                    existeDestinoParaVeiculo.HandlesPneus.push({
                        Handle: pneuRetirado.Handle,
                        PosicaoPneu : destinoPneu.posicaoPneu,
                        HandleDestino : parseInt(HandleVeiculo),
                        MarcaFogo : pneuRetirado.MarcaFogo,
                        Codigo : pneuRetirado.Codigo,
                        Vida : pneuRetirado.Vida,
                        Desgaste : pneuRetirado.Desgaste
                    });

                }else{
                    movimentacoesRealizadas.Destinos.push({
                        Destino: 1,
                        Observacao: "",
                        HandleEixo: eixoDestino.Handle,
                        HandlesPneus: [
                            {
                                Handle: pneuRetirado.Handle,
                                MarcaFogo : pneuRetirado.MarcaFogo,
                                Codigo : pneuRetirado.Codigo,
                                Vida : pneuRetirado.Vida,
                                Desgaste : pneuRetirado.Desgaste,
                                PosicaoPneu : destinoPneu.posicaoPneu,
                                HandleDestino: parseInt(HandleVeiculo)
                            }
                        ]
                    });
                }

            }
        }
    }

    movimentacoesRealizadas.HouveMovimentacao = true;
    console.log(movimentacoesRealizadas);
}


const scaleX = canvas.clientHeight / 390.55;
const scaleY = canvas.clientWidth / 986; 