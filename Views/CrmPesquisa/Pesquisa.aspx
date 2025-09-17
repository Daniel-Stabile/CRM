<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pesquisa.aspx.cs" Inherits="Views_CrmPesquisa_Pesquisa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="appCrmPesquisa" class="row">
        <div v-show="Loading" style="background-color:whitesmoke;z-index:100;opacity:0.6;height:100%;width:100%;position:absolute">
            <img src="../../content/img/Dot Loader.gif" style="position:relative;left:40%;top:30%;width:20%"/>
        </div>
        <div class="col-md-12" style="z-index:50;">
                                        <div class="row">
                                <div class="col-md-9" v-if="Mensagem == 'Ok'">
                                    <button type="submit" id="btnVoltar" class="btn grey fa fa-chevron-circle-left" v-on:click.prevent="Voltar()">   Voltar</button>
                                    <button type="submit" class="btn green" v-on:click.prevent="QualificaConta()">Qualificar conta</button>
                                    <button type="submit" class="btn green-jungle" v-on:click.prevent="SalvaQuestionario()">Salvar</button>
                                    <button type="submit" class="btn grey-silver fa fa-times" v-on:click.prevent="RetornaContas()">   Cancelar</button>
                                </div>
                            </div>
            <div>
                <div class="portlet-body row form">
                    <div class="form-horizontal">
                        <div class="form-body col-md-12" style="margin-top:20px;">
                            <div class="alert alert-danger" v-if="Mensagem != 'Ok'">
                                <strong>Erro!</strong> Não existe questionario cadastrado para o Ramo de Atividade da conta nessa filial !!!!
                            </div>
                            <div class="form-group col-md-12" v-for="perg in Pesquisa.Perguntas">
                                <p><h5> {{perg.Titulo}}  <span class="bold font-red-intense" v-if="perg.Obrigatorio == 'True'">*</span></h5></p>
                                <div class="col-md-9">
                                    <div class="mt-checkbox-list col-md-12" v-if="perg.Tipo == 'Multipla escolha'">
                                        <label v-for="resp in perg.Respostas" :key="resp.Handle" class="mt-checkbox col-md-12" >
                                            <input v-bind:id="resp.Handle" v-bind:value="resp" type="checkbox" v-model="perg.SelecionadoMultiplaEscolha"> {{resp.Titulo}}
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="mt-radio col-md-12" v-if="perg.Tipo == 'Fechada'">
                                        <label v-for="(resp,index) in perg.Respostas" :key="resp.Handle"  class="mt-radio col-md-12">
                                            <input v-model="perg.SelecionadoFechado" type="radio" v-bind:id="resp.Handle" v-bind:value="resp"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{resp.Titulo}}
                                            <span></span>
                                        </label>
                                    </div>
                                    <textarea class="form-control" rows="3" v-model="perg.Texto" v-if="perg.Tipo == 'Aberta'"></textarea>
                                </div>
                            </div>
                        </div>
                        <!--div-- class="form-actions col-md-12">
                            <div class="row">
                                <div class="col-md-9" v-if="Mensagem == 'Ok'">
                                    <button type="submit" class="btn green" v-on:click.prevent="QualificaConta()">Qualificar conta</button>
                                    <button type="submit" class="btn green-jungle" v-on:click.prevent="SalvaQuestionario()">Salvar</button>
                                </div>
                            </div>
                        </!--div-->
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
<script type="text/javascript">
    var app = new Vue({
        el: '#appCrmPesquisa',
        data: {
            Pesquisa: {},
            Mensagem: "",
            Loading:false
        },
        methods: {
            SalvaQuestionario: function () {
                var scope = this;

                console.log(" -- POST INFO --")
                console.log(scope.Pesquisa)
                console.log(" -- POST INFO --")
                scope.Loading = true;
                $.ajax({
                    url: Benner.Page.getApplicationPath() +"api/crm/pesquisapost/save-questionario1",
                    //url: Benner.Page.getApplicationPath() + "CrmProdutoItens/SaveItens",
                    type: 'POST',
                    dataType: "json",
                    data:JSON.stringify(scope.Pesquisa),
                    contentType: "application/json; charset=utf-8",
                    crossDomain: true,
                    cache: false,
                    success: function (msg) {
                        console.log(msg);
                        var aux = JSON.parse(msg);
                        console.log(aux);
                        scope.Loading = false;
                        if(aux.status.indexOf("error") != -1)
                            toastr.error(aux.message,"Erro");
                        else{
                            toastr.success(aux.message);
                            window.location.href = aux.url;
                        }
                    },
                    error: function () {
                        toastr.error("Erro ao atualizar oportunidade!","Erro");
                        scope.Loading = false;
                    }
                 });
            },

            QualificaConta: function () {
                var scope = this;
                console.log(" -- POST INFO --")
                console.log(scope.Pesquisa)
                console.log(" -- POST INFO --")

                for (var i = 0; i < scope.Pesquisa.Perguntas.length; i++) {

                    if (scope.Pesquisa.Perguntas[i].Obrigatorio == "True"
                        && scope.Pesquisa.Perguntas[i].Tipo == "Fechada"
                        && scope.Pesquisa.Perguntas[i].SelecionadoFechado.Handle == null) {

                        toastr.error(scope.Pesquisa.Perguntas[i].Titulo, "Pergunta fechada obrigatoria:");
                        return;
                    }
                    else if (scope.Pesquisa.Perguntas[i].Obrigatorio == "True"
                        && scope.Pesquisa.Perguntas[i].Tipo == "Multipla escolha"
                        && scope.Pesquisa.Perguntas[i].SelecionadoMultiplaEscolha.length == 0) {

                        toastr.error(scope.Pesquisa.Perguntas[i].Titulo,"Pergunta de multipla escolha obrigatoria:");
                        return;
                    } 
                }
                
                scope.Loading = true;
                $.ajax({
                    url: Benner.Page.getApplicationPath() +"api/crm/pesquisapost/qualifica-conta1",
                    //url: Benner.Page.getApplicationPath() + "CrmProdutoItens/SaveItens",
                    type: 'POST',
                    dataType: "json",
                    data:JSON.stringify(scope.Pesquisa),
                    contentType: "application/json; charset=utf-8",
                    crossDomain: true,
                    cache: false,
                    success: function (msg) {
                        console.log(msg);
                        var aux = JSON.parse(msg);
                        console.log(aux);
                        scope.Loading = false;
                        if(aux.status.indexOf("error") != -1)
                            toastr.error(aux.message,"Erro");
                        else{
                            toastr.success(aux.message);
                            window.location.href = aux.url;
                        }
                    },
                    error: function () {
                        toastr.error("Erro ao atualizar oportunidade!","Erro");
                        scope.Loading = false;
                    }
                 });
            },

            Voltar: function () {
                window.location.reload(1);
                //var currentStep = $("#CurrentStep").val();
            },

            RetornaContas: function () {
                window.location.assign(Benner.Page.getApplicationPath() + "Pages/K_CRM_PESSOAS/grid.aspx");
            }
        },
        watch: {
            'Pesquisa.Perguntas': function() {
                var scope = this;
                
                console.log('Pesquisa')
                console.log(scope)
            }
        },
        mounted: function () {
            var scope = this;
            var jsonTeste = <%= jsonPesquisa.ToString()%>;
            var json;
            var mensagem = "";

            if (jsonTeste != "Json")
                json = <%= jsonPesquisa%>;
            else
                json = {}

            mensagem = "<%= mensagem%>";
            
            scope.Pesquisa = json;
            scope.Mensagem = mensagem;

            if (scope.Pesquisa.hasOwnProperty("Perguntas")) {
                //for (i = 0; i < scope.Pesquisa.Perguntas.length; i++) {
                //    scope.Pesquisa.Perguntas[i].SelecionadoMultiplaEscolha = new Array;
                //    scope.Pesquisa.Perguntas[i].SelecionadoFechado = new Object;
                //}
            }

            console.log(scope);
        }
    });
</script>
</html>
