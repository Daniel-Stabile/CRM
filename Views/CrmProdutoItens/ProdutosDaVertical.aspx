<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProdutosDaVertical.aspx.cs" Inherits="Views_CrmProdutoItens_ProdutosDaVertical" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700');
        *{
            /* Fonts*/
            --work: 'Work Sans', sans-serif;
  
            /* Colors*/
            --h2o: #7bd4cc;
            --honey: #bea42e;
            --army: #7b895b;
            --green: #037367;
            --green-jungle: #26c281;
            --sangria: #00281f;
            --red: #f03434;
            --white: #fff;
            /* Transition */
            --transition-short: all .5s ease-in-out;
  
            /* padding */
            --padding-standard:1rem;
        }
               
        button{ cursor:pointer; }

        h2, p, input, h1, h3{ font-family:  var(--work); }

        .left_panel{ padding-left:0px; padding-right:0px;}
        .left_panel header{ background-color: var(--h2o); padding:var(--padding-standard); }

        #chart_datas{ position: relative; }
        #chartpanel{ background-color:#fafafa; max-width:50rem; max-width: 50rem; height: auto; border-radius:7px;}

        .hideshow{ color: var(--white); font-size: .8rem;}
        .inputHide{ opacity:1;  -webkit-transition: var(--transition-short);  -moz-transition: var(--transition-short);  -o-transition: var(--transition-short); transition: var(--transition-short);}
        .is-collapsed{ opacity:0;}

        .addRowBtn{
                width: 3rem;height: 3rem;position: absolute;left: -3rem;
                font-size: 1.5rem;background-color: var(--green-jungle);
                padding: .2rem .9rem;border-radius: 2rem !important;margin-top: -1rem;
                z-index: 999999999999999;-webkit-box-shadow: 1px 2px 1px 0px rgba(0,0,0,0.45);
                -moz-box-shadow: 0px 3px 1px 0px rgba(0,0,0,0.45);box-shadow: 1px 2px 1px 0px rgba(0,0,0,0.45);
                cursor: pointer;opacity: 1;
                -webkit-transition: var(--transition-short);
                -moz-transition: var(--transition-short);
                -o-transition: var(--transition-short);
                transition: var(--transition-short);
        }
        .addRowBtn:hover{ opacity:.8; }
        .addRowBtn .fa{color:var(--white); margin-top: 7px; }

        .single-cel{overflow: hidden; display: block; position: relative;}

        .edit_panel{padding-left:1rem !important; padding-right:1rem; padding-top:.5rem !important;}
        .edit_panel button{
            padding: 0;
            -webkit-appearance: none;
            -moz-appearance: none;
            border: 0;
            border-radius: 0;
            background: transparent;
            line-height: 1;
        }
        .edit_panel button:focus{outline:0}
        .edit_panel .edit_mode{ color:var(--h2o);}
        .edit_panel .edit_mode:hover{ opacity:.5;}
        .edit_panel .delete_mode{color:var(--red);}
        .edit_panel .delete_mode:hover{ opacity:.5;}
        .edit_panel .confirm_mode{color:var(--green-jungle);}
        .edit_panel .confirm_mode:hover{ opacity:.5;}

        .left_panel{ 
            overflow:hidden; position:relative; border-radius:7px; 
            -webkit-box-shadow: 0px 0px 20px 0px rgba(50, 50, 50, 0.57);
            -moz-box-shadow:    0px 0px 20px 0px rgba(50, 50, 50, 0.57);
            box-shadow:         0px 0px 20px 0px rgba(50, 50, 50, 0.57);
        }
        .left_panel header{ overflow:hidden; position:relative; color:var(--white);}
        .menu_top_icon, .right_nav .fa-heart, .right_nav .fa-link{ font-size:1.3rem; color:var(--sangria);}
        .right_nav .fa-user-circle{ font-size:1.3rem; margin-left:1rem; }
        .right_nav .fa-link{ margin-left:1rem;}
        .right_nav{float:right;}

        #chart_datas{ padding-top:1rem; margin-top: 1.5rem;}
        .input_wrp .cell{padding:0px;}
        #chart_datas .inputLabel{border-top: 0px; border-left: 0px; border-right: 0px; box-shadow: none; background-color: rgba(255,255,255,.30); border-bottom:1px solid var(--h2o);}
        #chart_datas input{border: 0px; box-shadow: none; background-color: rgba(255,255,255,.30); }
        #chart_datas input:focus{outline:none; }

        #cart_table, #chart_datas{ padding-left: 1rem; padding-right: 1rem }
        #chart_table{padding-left:1rem; padding-right:1rem;}
        #chart_table .column{ padding:3px;}
        #chart_table .row{ margin-left:0px; margin-right:0px;}
        #chart_table .top_titles div{ text-align:center; color: var(--green); text-transform: uppercase; font-size: 75%;}
        #chart_table div.table_cell input{ border: 0px; background-color: rgba(0,0,0,.05); text-align: center; color: var(--army); font-weight: 500;}

        #chart_table div.table_cell input[type="text"]:disabled { background: rgba(0,0,0,.02); }

        .right_panel{padding-left:0px; padding-right:0px; min-height:10.8rem; border-radius:3px;}

        .right_panel header{background-color:var(--green); min-height:3rem; display:block; width:100%; border-left: 2px solid rgba(0,0,0,.2); }
    
        .mt-checkbox-list > .mt-checkbox {
            height:35px;
            word-break:inherit;
            word-wrap:break-word;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body>
    <div id="appItensVertical" class="portlet light bordered">
        <div class="portlet-title green">
            <div class="caption ">
                <i class="fa fa-cubes font-green"></i>
                <span class="caption-subject font-green bold uppercase">Produtos da Vertical</span>
            </div>
        </div>
        <div class="portlet-body row form">
            <div class="form-horizontal">
                <!-- Botão Superior -->
                <div class="col-md-12" style="padding:10px 15px;margin-bottom:10px" @click="postInfo" v-if="pessoaOportunidadeProd.Status == 3">
                    <a class="btn green btn-new"><i class="fa fa-plus btn-action"></i> Salvar</a>
                </div>
                
                <!-- Form Superior -->
                <div class="form-body col-md-7">
                    <div class="form-group col-md-12">
                        <label class="col-md-5 control-label">Vertical</label>
                        <div class="col-md-7">
                            <p class="form-control-static"> {{verticalOportunidade.NomeProduto}} </p>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="col-md-5 control-label">Tabela de Preços</label>
                        <div class="col-md-7">
                            <select class="form-control" v-model="tabelaSelecionada" :disabled="pessoaOportunidadeProd.Status != 3">
                                <option v-for="tabela in tabelas" v-bind:value="tabela.Handle">{{tabela.Nome}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="col-md-5 control-label">Categoria</label>
                        <div class="col-md-7">
                            <select class="form-control" v-model="categoriaSelecionada" :disabled="pessoaOportunidadeProd.Status != 3">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                            </select>
                        </div>
                    </div>
                    <div v-show="tiposUsuarios.length == 0" class="form-group col-md-12">
                        <label class="col-md-5 control-label">Quantidade Usuários</label>
                        <div class="col-md-7">
                            <div class="input-icon form-control" style="padding:0px;border:none;">
                                <i class="fa fa-user"></i>
                                <input type="number" min="1" class="form-control" placeholder="Quantidade usuários" v-model="qtdeUsuarios" :disabled="pessoaOportunidadeProd.Status != 3" />
                            </div>
                        </div>
                    </div>
                    <div v-show="tiposUsuarios.length > 0" class="form-group col-md-12">
                        <div v-for="item in tiposUsuarios" >
                            <label class="col-md-5 control-label">{{item.Nome}}</label>
                            <div class="col-md-7" style="margin-bottom: 5px;">
                                <div class="input-icon form-control" style="padding:0px;border:none;">
                                    <i class="fa fa-user"></i>
                                    <input type="number" min="1" class="form-control" placeholder="Quantidade usuários" v-model="item.Quantidade" :disabled="pessoaOportunidadeProd.Status != 3" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="col-md-5 control-label">Tipo de Venda</label>
                        <div class="col-md-7">
                            <div class="mt-radio-inline">
                                <label class="mt-radio">
                                    <input v-model="radioSelected" type="radio" id="produto" value="produto" checked="" :disabled="pessoaOportunidadeProd.Status != 3"> Produto
                                    <span></span>
                                </label>
                                <label class="mt-radio">
                                    <input v-model="radioSelected" type="radio" id="pacote" value="pacote" checked="" :disabled="pessoaOportunidadeProd.Status != 3"> Pacote
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="col-md-5 control-label">Com Impostos</label>
                        <div class="col-md-7">
                            <div class="mt-checkbox-list" style="padding-top:10px !important">
                                <label class="mt-checkbox col-md-2" style="height:unset;overflow:unset">
                                    <input id="comImpostos" v-bind:value="pessoaOportunidadeProd.ComImpostos" type="checkbox" v-model="pessoaOportunidadeProd.comImpostos" :disabled="pessoaOportunidadeProd.Status != 3">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <%--<div class="form-group col-md-12" v-show="pessoaOportunidadeProd.ComImpostos" >
                        <label class="col-md-5 control-label">Impostos</label>
                        <div class="col-md-7">
                            <div class="mt-checkbox-list" style="padding-top:10px !important">
                                <label v-for="item in impostos" class="mt-checkbox col-md-6" style="height:unset;overflow:unset">
                                    <input v-bind:id="item.Handle" v-bind:value="item" type="checkbox" v-model="checkedImpostos"> {{item.Nome}}
                                    <span></span>
                                </label>
                             </div>
                        </div>
                    </div>--%>
                </div>
                
                <!-- Tab E Content -->
                <div class="form-body col-md-12" style="margin-top:20px;">
                    <ul class="nav nav-tabs col-md-12">
                        <li v-if='radioSelected == "pacote"' v-bind:class="{'active':tabDisplay == 3}">
                            <a data-toggle="tab" aria-expanded="true" @click="tabDisplay = 3"> Pacotes </a>
                        </li>
                        <li v-bind:class="{'active':tabDisplay == 1}">
                            <a data-toggle="tab" aria-expanded="true" @click="tabDisplay = 1"> Produtos </a>
                        </li>
                        <li v-bind:class="{'active':tabDisplay == 2}">
                            <a data-toggle="tab" aria-expanded="false" @click="tabDisplay = 2"> Escopo </a>
                        </li>
                        <li v-bind:class="{'active':tabDisplay == 4}">
                            <a data-toggle="tab" aria-expanded="false" @click="tabDisplay = 4"> Fora do Escopo </a>
                        </li>
                        <li v-bind:class="{'active':tabDisplay == 5}">
                            <a data-toggle="tab" aria-expanded="false" @click="tabDisplay = 5"> Forma de Pagamento </a>
                        </li>
                        <li v-bind:class="{'active':tabDisplay == 6}">
                            <a data-toggle="tab" aria-expanded="false" @click="tabDisplay = 6"> Condição de Implantação </a>
                        </li>
                    </ul>
                    <div class="tab-content col-md-12">
                        <div class="form-body">
                            <div class="col-md-12" v-show="tabDisplay == 3">
                                <div class="form-group col-md-12">
                                    <p><h5> Pacotes </h5></p>
                                    <div class="mt-checkbox-list">
                                        <label v-for="item in listPacotes" class="mt-checkbox col-md-2">
                                            <input v-bind:id="item.Handle" v-bind:value="item" type="checkbox" v-model="checkedPacotes" :disabled="pessoaOportunidadeProd.Status != 3"> {{item.Nome}}
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                             </div>
                            <div class="col-md-12 active" v-show="tabDisplay == 1">
                                <div class="form-group col-md-10">
                                    <p><h5><b>Produtos da vertical</b></h5></p>
                                    <div class="mt-checkbox-list">
                                        <label v-for="item in listProdutos" class="mt-checkbox col-md-2" style="color:#6c7a89">
                                            <input 
                                                v-bind:id="idProduto(item.Handle)" 
                                                v-bind:value="item" 
                                                type="checkbox" 
                                                v-model="checkedProdutos" 
                                                :disabled="radioSelected == 'pacote' || pessoaOportunidadeProd.Status != 3" > {{item.Nome}}
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group col-md-2" style="border-left:2px solid #81cfe0;border-bottom:2px solid #81cfe0;box-shadow:2px -1px 2px rgba(129, 207, 224, 0.6) inset">
                                    <p><h5><b>Adicionais da vertical</b></h5></p>
                                    <div class="mt-checkbox-list">
                                        <label v-for="item in listAdicionais" class="mt-checkbox col-md-12" style="color:rgba(52, 152, 219, 1)">
                                            <input v-bind:id="item.Handle" v-bind:value="item" type="checkbox" v-model="checkedProdutos" :disabled="pessoaOportunidadeProd.Status != 3"> {{item.Nome}}
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                             </div>
                            <div class="col-md-12" v-show="tabDisplay == 2">
                                <p> Escopo </p>
                                <div class="col-md-12" >
                                    <div id="chart_table" class="row">
                                        <div id="chart_datas" class="col-md-12">
                                            <div class="col-md-12">
                                                <div class="addRowBtn" v-on:click.prevent="addRow" value="" v-show="pessoaOportunidadeProd.Status == 3">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-lg-2 column">
                                                    <select class="form-control" v-model="escopoItem" style="height:23px;padding:0px !important" :disabled="pessoaOportunidadeProd.Status != 3">
                                                        <option value="" disabled selected>Item...</option>
                                                        <option v-for="item in checkedProdutos" v-bind:value="item">{{item.Nome}}</option>
                                                    </select>
                                                </div>
                                                <div class="col-lg-1 column" >
                                                    <label class="inputLabel" style="width:100%">
                                                        <input style="width:100%" type="number" placeholder="Ord" v-model="escopoOrdem" :disabled="pessoaOportunidadeProd.Status != 3">
                                                    </label>
                                                </div>
                                                <div class="col-lg-5 column" >
                                                    <label class="inputLabel" style="width:100%">
                                                        <input style="width:100%" type="text" placeholder="Nome do atividade" v-model="escopoNome" :disabled="pessoaOportunidadeProd.Status != 3">
                                                    </label>
                                                </div>
                                                <div class="col-lg-1 column">
                                                    <label class="inputLabel" style="width:100%">
                                                        <input style="width:100%" type="text" placeholder="Horas Base" v-model="escopoHorasBase" :disabled="pessoaOportunidadeProd.Status != 3">
                                                    </label>
                                                </div>
                                                <div class="col-lg-1 column">
                                                    <label class="inputLabel" style="width:100%">
                                                        <input style="width:100%" type="text" placeholder="Horas Editada" v-model="escopoHorasBase" disabled>
                                                    </label>
                                                </div>
                                                <div class="col-lg-1 column">
                                                    <select class="form-control" v-model="escopoTipoRecurso" style="height:23px;padding:0px !important" :disabled="pessoaOportunidadeProd.Status != 3">
                                                        <option value="" disabled selected hidden>Recurso...</option>
                                                        <option v-for="item in tiposRecursos" v-bind:value="item">{{item.Recurso}}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="chart_table" class="col-md-12">
                                            <div class="top_titles col-md-12">
                                                <div class="col-sm-12 col-md-2 column"> Item </div>
                                                <div class="col-sm-12 col-md-1 column"> Ord </div>
                                                <div class="col-sm-12 col-md-5 column"> Cronograma de Implantação </div>
                                                <div class="col-sm-12 col-md-1 column"> Horas Base </div>
                                                <div class="col-sm-12 col-md-1 column"> Horas Editada </div>
                                                <div class="col-sm-12 col-md-1 column">
                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                            <div v-for="item in listEscopo" class="table_cell col-md-12">
                                                <div class="col-sm-12 col-md-2 column">
                                                    <input style="width:100%" type="text" v-model="item.ItemNome" disabled/>
                                                </div>
                                                <div class="col-sm-12 col-md-1 column">
                                                    <input style="width:100%" type="text" v-model="item.Ordem" disabled/>
                                                </div>
                                                <div class="col-sm-12 col-md-5 column single-cel">
                                                    <input style="width:100%" type="text" v-model="item.Nome" disabled />
                                                </div>
                                                <div class="col-sm-12 col-md-1 column single-cel">
                                                    <input style="width:100%" type="text" v-model="item.HorasBase" disabled/>
                                                </div>
                                                <div class="col-sm-12 col-md-1 column single-cel">
                                                    <input style="width:100%" type="text" v-model="item.HorasEditada" v-bind:disabled="item.Disabled || pessoaOportunidadeProd.Status != 3" /> 
                                                </div>
                                                <div class="col-sm-12 col-md-1 column edit_panel">
                                                    <button class="delete_mode col-sm-6" v-on:click.prevent="deleteEscopo(item)" v-if="pessoaOportunidadeProd.Status == 3">
                                                        <i class="fa fa-times" aria-hidden="true"></i>
                                                    </button>
                                                    <button v-show="item.Disabled" class="edit_mode col-sm-6" v-on:click.prevent="item.Disabled = !item.Disabled" v-if="pessoaOportunidadeProd.Status == 3">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </button>
                                                    <button v-show="!item.Disabled" class="confirm_mode col-sm-6" v-on:click.prevent="item.Disabled = !item.Disabled" v-if="pessoaOportunidadeProd.Status == 3">
                                                        <i class="fa fa-check" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <div class="col-md-12" v-show="tabDisplay == 4">
                                <div class="form-group col-md-12">
                                    <p><h5> Fora do Escopo </h5></p>
                                    <textarea v-model="pessoaOportunidadeProd.ForaEscopo" style="width:100%;height:100px;resize:none" :disabled="pessoaOportunidadeProd.Status != 3"></textarea>
                                </div>
                             </div>
                            <div class="col-md-12" v-show="tabDisplay == 5">
                                <div class="form-group col-md-12">
                                    <p><h5> Forma de Pagamento </h5></p>
                                    <textarea v-model="pessoaOportunidadeProd.FormaPagamento" style="width:100%;height:100px;resize:none" :disabled="pessoaOportunidadeProd.Status != 3"></textarea>
                                </div>
                             </div>
                            <div class="col-md-12" v-show="tabDisplay == 6">
                                <div class="form-group col-md-12">
                                    <p><h5> Condição de Implantação </h5></p>
                                    <textarea v-model="pessoaOportunidadeProd.CondicaoImplantacao" style="width:100%;height:100px;resize:none" :disabled="pessoaOportunidadeProd.Status != 3"></textarea>
                                </div>
                             </div>
                        </div>
                    </div>
                </div>
                
                <!-- Itens com quantidades variaveis -->
                <div class="form-body col-md-12" style="border-top: 1px solid #e7ecf1;border-bottom: 1px solid #e7ecf1;" v-if="listProdutosComQuantidade.length > 0">
                    <div class="col-md-12" >
                        <p><b> Produtos que necessitam de quantidade </b></p>
                        <div v-for="item in listProdutosComQuantidade" class="form-group col-md-3">
                            <label class="col-md-8 control-label" style="padding-top:0px">{{item.Nome}}</label>
                            <div class="col-md-2" style="padding:0px !important">
                                <div class="input-icon form-control col-md-12" style="padding:0px;border:none;">
                                    <input class="col-md-12" style="padding:0px !important" type="number" min="1" v-model="item.Quantidade" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tabela de preço -->
                <div class="form-body col-md-12">
                    <div class="table-scrollable">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="col-lg-2"> # </th>
                                    <th class="col-lg-2"> Na proposta </th>
                                    <th class="col-lg-1"> Nome </th>
                                    <th class="col-lg-2"> Valor </th>
                                    <th class="col-lg-1"> Desconto (%) </th>
                                    <th class="col-lg-3"> Valor Total </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td> 
                                        <label class="mt-checkbox">
                                            <input type="checkbox" v-model="checkboxSelected.checkboxTableLocacao.value" :disabled="checkboxSelected.checkboxTableLocacao.disabled  || pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label> 
                                    </td>
                                    <td>
                                        <label class="mt-checkbox" v-show="checkboxSelectedProposta.checkboxTableLocacao.visible">
                                            <input type="checkbox" v-model="checkboxSelectedProposta.checkboxTableLocacao.value" :disabled="pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td> Licença Temporária </td>
                                    <td> R$ {{getValorLocacao()}} </td>
                                    <td> 
                                        <div class="input-icon right">
                                            <i class="fa fa-percent"></i>
                                            <input-mask type="text" min="0" class="form-control" placeholder="Desconto" v-model="descontos.descontoLocacao" mask="##.##" :disabled="checkboxSelected.checkboxTableLocacao.disabled  || pessoaOportunidadeProd.Status != 3"> 
                                        </div>
                                    </td>
                                    <td> 
                                        <table v-show="tiposUsuarios.length > 0">
                                            <tr v-for="item in tiposUsuarios">
                                                <td>{{item.Nome}}</td>
                                                <td style="width:20px;"></td>
                                                <td>R$ {{getValorLocacaoTiposUsuarios(item)}}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Total</b></td>
                                                <td style="width:20px;"></td>
                                                <td><b>R$ {{(getValorLocacao() * getDesconto(descontos.descontoLocacao)).toFixed(2)}}</b></td>
                                            </tr>
                                        </table>
                                        <label v-show="tiposUsuarios.length == 0">R$ {{(getValorLocacao() * getDesconto(descontos.descontoLocacao)).toFixed(2)}} </label>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td> 
                                        <label class="mt-checkbox">
                                            <input type="checkbox" v-model="checkboxSelected.checkboxTableLu.value" :disabled="checkboxSelected.checkboxTableLu.disabled || pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label> 
                                    </td>
                                    <td>
                                        <label class="mt-checkbox" v-show="checkboxSelectedProposta.checkboxTableLuLum.visible">
                                            <input type="checkbox" v-model="checkboxSelectedProposta.checkboxTableLuLum.value" :disabled="pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label> 
                                    </td>
                                    <td> LU </td>
                                    <td> R$ {{getValorLu()}} </td>
                                    <td> 
                                        <div class="input-icon right">
                                            <i class="fa fa-percent"></i>
                                            <input-mask type="text" min="0" class="form-control" placeholder="Desconto" v-model="descontos.descontoLu" mask="##.##"  :disabled="checkboxSelected.checkboxTableLu.disabled || pessoaOportunidadeProd.Status != 3"> 
                                        </div>
                                    </td>
                                    <td>
                                        <table v-show="tiposUsuarios.length > 0">
                                            <tr v-for="item in tiposUsuarios">
                                                <td>{{item.Nome}}</td>
                                                <td style="width:20px;"></td>
                                                <td>R$ {{getValorLuTiposUsuarios(item)}}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Total</b></td>
                                                <td style="width:20px;"></td>
                                                <td><b>R$ {{(getValorLu() * getDesconto(descontos.descontoLu)).toFixed(2)}}</b></td>
                                            </tr>
                                        </table>
                                        <label v-show="tiposUsuarios.length == 0">R$ {{(getValorLu() * getDesconto(descontos.descontoLu)).toFixed(2)}} </label>

                                    </td>
                                </tr>
                                <tr>
                                    <td> 
                                        <label class="mt-checkbox">
                                            <input type="checkbox" v-model="checkboxSelected.checkboxTableLum.value" :disabled="checkboxSelected.checkboxTableLum.disabled  || pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label> 
                                    </td>
                                    <td>
                                        <label class="mt-checkbox" v-show="checkboxSelectedProposta.checkboxTableLuLum.visible">
                                            <input type="checkbox" v-model="checkboxSelectedProposta.checkboxTableLuLum.value" :disabled="checkboxSelected.checkboxTableLum.disabled  || pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td> LUM </td>
                                    <td> R$ {{getValorLum()}} </td>
                                    <td>  
                                        <div class="input-icon right">
                                            <i class="fa fa-percent"></i>
                                            <input-mask type="text" min="0" class="form-control" placeholder="Desconto" v-model="descontos.descontoLum" mask="##.##" :disabled="checkboxSelected.checkboxTableLum.disabled  || pessoaOportunidadeProd.Status != 3"> 
                                        </div>
                                    </td>
                                    <td> 
                                        <table v-show="tiposUsuarios.length > 0">
                                            <tr v-for="item in tiposUsuarios">
                                                <td>{{item.Nome}}</td>
                                                <td style="width:20px;"></td>
                                                <td>R$ {{getValorLumTiposUsuarios(item)}}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Total</b></td>
                                                <td style="width:20px;"></td>
                                                <td><b>R$ {{(getValorLum() * getDesconto(descontos.descontoLum)).toFixed(2)}}</b></td>
                                            </tr>
                                        </table>
                                        <label v-show="tiposUsuarios.length == 0">R$ {{(getValorLum() * getDesconto(descontos.descontoLum)).toFixed(2)}} </label>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td> 
                                        <label class="mt-checkbox">
                                            <input type="checkbox" v-model="checkboxSelected.checkboxTableSaas.value" :disabled="checkboxSelected.checkboxTableSaas.disabled  || pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label> 
                                    </td>
                                    <td>
                                        <label class="mt-checkbox" v-show="checkboxSelectedProposta.checkboxTableSaas.visible">
                                            <input type="checkbox" v-model="checkboxSelectedProposta.checkboxTableSaas.value" :disabled="pessoaOportunidadeProd.Status != 3">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td> Saas </td>
                                    <td> R$ {{getValorSaas()}} </td>
                                    <td>  
                                        <div class="input-icon right">
                                            <i class="fa fa-percent"></i>
                                            <input-mask type="text" min="0" class="form-control" placeholder="Desconto" v-model="descontos.descontoSaas" mask="##.##" :disabled="checkboxSelected.checkboxTableSaas.disabled  || pessoaOportunidadeProd.Status != 3"> 
                                        </div>
                                    </td>
                                    <td>
                                        <table v-show="tiposUsuarios.length > 0">
                                            <tr v-for="item in tiposUsuarios">
                                                <td>{{item.Nome}}</td>
                                                <td style="width:20px;"></td>
                                                <td>R$ {{getValorSaasTiposUsuarios(item)}}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Total</b></td>
                                                <td style="width:20px;"></td>
                                                <td><b>R$ {{(getValorSaas() * getDesconto(descontos.descontoSaas)).toFixed(2)}}</b></td>
                                            </tr>
                                        </table>
                                        <label v-show="tiposUsuarios.length == 0">R$ {{(getValorSaas() * getDesconto(descontos.descontoSaas)).toFixed(2)}} </label>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td> 
                                        <label class="mt-checkbox">
                                            <input type="checkbox" disabled=true>
                                            <span></span>
                                        </label> 
                                    </td>
                                    <td></td>
                                    <td> Serviço </td>
                                    <td> R$ {{getValorServico()}} </td>
                                    <td>  
                                        <div class="input-icon right">
                                            <i class="fa fa-percent"></i>
                                            <input-mask type="text" min="0" class="form-control" placeholder="Desconto" v-model="descontos.descontoServico" mask="##.##" :disabled="pessoaOportunidadeProd.Status != 3"> 
                                        </div>
                                    </td>
                                    <td> R$ {{(getValorServico() * getDesconto(descontos.descontoServico)).toFixed(2)}} </td>
                                </tr>
                                <tr v-for="item in checkedImpostos">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>{{item.Nome}}</td>
                                    <td style="color:#f03434">R$ {{getImposto(item.Aliquota)}}</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>________________________</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>R$ {{getValorPropostaFinal()}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Botão Inferior -->
                <div class="col-md-12" style="padding:10px 15px;margin-bottom:10px" @click="postInfo" v-if="pessoaOportunidadeProd.Status == 3">
                    <a class="btn green btn-new"><i class="fa fa-plus btn-action"></i> Salvar</a>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    var tokens = {
	    '#': {pattern: /\d/},
        'S': {pattern: /[a-zA-Z]/},
        'A': {pattern: /[0-9a-zA-Z]/},
        'U': {pattern: /[a-zA-Z]/, transform: v => v.toLocaleUpperCase()},
        'L': {pattern: /[a-zA-Z]/, transform: v => v.toLocaleLowerCase()}
    }

    function applyMask (value, mask, masked = true) {
        value = value || ""
        var iMask = 0
        var iValue = 0
        var output = ''
        while (iMask < mask.length && iValue < value.length) {
            cMask = mask[iMask]
            masker = tokens[cMask]
            cValue = value[iValue]
            if (masker) {
                if (masker.pattern.test(cValue)) {
      	            output += masker.transform ? masker.transform(cValue) : cValue
                    iMask++
                }
                iValue++
            } else {
                if (masked) output += cMask
                if (cValue === cMask) iValue++
                iMask++
            }
        }

        return output
    }

    Vue.directive('mask', {
	    bind (el, binding) {
            var value = el.value
            Object.defineProperty(el, 'value', {
                get: function(){
                    return value;
                },
                set: function(newValue){
                    console.log(newValue)
                    el.setAttribute('value', newValue)
                },
                configurable: true
            });
        }
    })

    Vue.component('input-mask', {
        template: `<input v-model="maskedValue" :maxlength="mask.length" :placeholder="mask">`,
        props: {
            'value': String,
            'mask': String,
            'masked': {
                type: Boolean,
                default: false
            }
        },

        data: () => ({
            currentValue: '',
            currentMask: '',
        }),

        computed: {
            maskedValue: {
    	        get () {
                // fix removing mask character at the end.
                // Pressing backspace after 1.2.3 result in 1.2. instead of 1.2
                    return this.value === this.currentValue ? this.currentMask
                                                    : (this.currentMask = applyMask(this.value, this.mask, true))
                },

                set (newValue) {
                    var currentPosition = this.$el.selectionEnd
                    var lastMask = this.currentMask
                    // update the input before restoring the cursor position
                    this.$el.value = this.currentMask = applyMask(newValue, this.mask)

                    if (this.currentMask.length <= lastMask.length) { // BACKSPACE
                        // when chars are removed, the cursor position is already right
                        this.$el.setSelectionRange(currentPosition, currentPosition)
                    } else { // inserting characters
                        // if the substring till the cursor position is the same, don't change position
                        if (newValue.substring(0, currentPosition) == this.currentMask.substring(0, currentPosition)) {
                            this.$el.setSelectionRange(currentPosition, currentPosition)
                        } else { // increment 1 fixed position, but will not work if the mask has 2+ placeholders, like: ##//##
                            this.$el.setSelectionRange(currentPosition+1, currentPosition+1)
                        }
                    }
                    this.currentValue = applyMask(newValue, this.mask, this.masked)
                    this.$emit('input', this.currentValue)
                }
            }
        }
    })

    var app = new Vue({
        el: '#appItensVertical',
        data: {
            pessoaOportunidadeProd: { Status: 0 , Versao: 0 , ForaEscopo:"", FormaPagamento:"",CondicaoImplantacao:"", ComImpostos: false},
            isCreating:true,
            tabDisplay: 1,
            baseUrl: window.location.pathname.split('/')[1],
            verticalOportunidade: {},
            tabelas: [{ Handle: 0, Nome: "" }],
            impostos: [{ Handle: 0, Nome: "", Aliquota: 0 , DataInicio: "" , DataInicio: ""  }],
            tiposRecursos: [{ Recurso: "", Servico: "", ValorHora: 0, ValorHoraOportunidade: 0 }],
            tiposUsuarios: [{ Handle: 0, Nome: "", PorcentagemValor: 0 }],
            tabelaSelecionada: 0,
            categoriaSelecionada: "A",
            checkedProdutos: [],
            checkedPacotes: [],
            checkedEscopos: [],
            checkedImpostos: [],
            radioSelected: "produto",
            qtdeUsuarios: 1,
            descontos: { descontoLu: "0", descontoLum: "0", descontoLocacao: "0", descontoSaas: "0", descontoServico: "0" },
            checkboxSelected: {
                checkboxTableLu:        { value: false, disabled: false },
                checkboxTableLum:       { value: false, disabled: false } ,
                checkboxTableLocacao:   { value: false, disabled: false } ,
                checkboxTableSaas:      { value: false, disabled: false }
            },
            checkboxSelectedProposta: {
                checkboxTableLuLum:     { value: false, visible: false },
                checkboxTableLocacao:   { value: false, visible: false },
                checkboxTableSaas:      { value: false, visible: false }
            },
            escopoItem: {},
            escopoOrdem: 0,
            escopoNome: '',
            escopoHorasBase: '',
            escopoHorasEditada: '',
            escopoTipoRecurso: {},
            produtos: [{
                Categoria: "A",
                Handle: 0,
                ItensPacote: [],
                Locacao: 0,
                Lu: 0,
                Lum: 0,
                MetodoVenda: "",
                Nome: "",
                Produto: null,
                Saas: 0,
                Selecionado: false,
                TabelaPreco: 1,
                Tipo: null,
                TipoItem: 1,
            }],
            pacotes: [{
                Categoria: "A",
                Handle: 0,
                ItensPacote: [],
                Locacao: 0,
                Lu: 0,
                Lum: 0,
                MetodoVenda: "",
                Nome: "",
                Produto: null,
                Saas: 0,
                Selecionado: false,
                TabelaPreco: 1,
                Tipo: null,
                TipoItem: 1,
            }],
            adicionais: [{
                Categoria: "A",
                Handle: 0,
                ItensPacote: [],
                Locacao: 0,
                Lu: 0,
                Lum: 0,
                MetodoVenda: "",
                Nome: "",
                Produto: null,
                Saas: 0,
                Selecionado: false,
                TabelaPreco: 1,
                Tipo: null,
                TipoItem: 1,
            }],
            produtoPost: {
                Itens: [],
                Atividades: [],
                Pacotes: [],
                QuantidadeUsuarios: 0,
                DescontoLu: 0,
                DescontoLum: 0,
                DescontoLocacao: 0,
                DescontoSaas: 0,
                DescontoServico: 0,
                Oportunidade: 0,
                OportunidadeProd: 0,
                TipoVenda:0,
                TabelaPreco:0,
                Categoria: "",
                ComImpostos: false,
                PropostaLuLum:false,
                PropostaLocacao:false,
                PropostaSaas: false,
                Impostos:[],
                TiposUsuarios:[],
                ForaEscopo:"",
                FormaPagamento: "",
                CondicaoImplantacao: "",
                Versao:0
            }
        },
        mounted: function (){

            var scope = this;
            var json = <%= jsonProduto%>;
            var jsonTabela = <%= tabelas%>;
            var jsonTipos = <%= jsonRecursos%>;
            var jsonImpostos = <%= jsonImpostos%>
            var jsonTiposUsuarios = <%= jsonTiposUsuarios%>

            scope.verticalOportunidade  = json;
            scope.tabelas               = jsonTabela;
            scope.tiposRecursos         = jsonTipos;
            scope.impostos              = jsonImpostos;
            scope.tiposUsuarios         = jsonTiposUsuarios;

            scope.tabelaSelecionada     = scope.tabelas[0].Handle;

            var auxPacotes = [];
            var auxProdutos = [];
            var auxAdicionais = [];

            for (var i = 0; i < scope.verticalOportunidade.ProdutosDisponiveis.length; i++) {

                item = scope.verticalOportunidade.ProdutosDisponiveis[i];

                switch (item.TipoItem) {
                    case 1:
                        auxProdutos.push(item)
                        break;
                    case 2:
                        auxPacotes.push(item)
                        break;
                    case 3:
                        auxAdicionais.push(item)
                        break;
                }
            }

            scope.produtos = auxProdutos;
            scope.pacotes = auxPacotes;
            scope.adicionais = auxAdicionais;
            
            $.ajax({
                url: scope.setSelecionados(),
                success: function () {
                    scope.isCreating = false;
                }
            })
        },
        methods: {

            idProduto: function (handle) {
                return "Produto_" + handle
            },

            addRow: function () {
                var scope = this;
                console.log('scope.escopoOrdem')
                console.log(scope.escopoOrdem)
                if (!this.escopoItem.hasOwnProperty("Handle") ||
                    this.escopoNome == '' ||
                    this.escopoOrdem == 0 ||
                    this.escopoHorasBase == '' ||
                    !this.escopoTipoRecurso.hasOwnProperty("Handle")) {
                    
                    toastr.error("É preciso preencher todos campos para inserir um escopo!", "Erro");
                    return;
                }

                var newRow = {
                    Item: this.escopoItem.Handle,
                    Ordem: this.escopoOrdem,
                    ItemNome: this.escopoItem.Nome,
                    Nome: this.escopoNome,
                    HorasBase: this.escopoHorasBase,
                    HorasEditada: this.escopoHorasBase,
                    Disabled: true,
                    TipoRecurso: this.escopoTipoRecurso
                };
                scope.checkedEscopos.push(newRow);
                
                scope.escopoOrdem = '';
                scope.escopoItem = {};
                scope.escopoNome = '';
                scope.escopoHorasBase = '';
                scope.escopoHorasEditada = '';
                scope.escopoTipoRecurso = {};
            },

            deleteEscopo: function (item) {
                var scope = this;

                var aux = [];

                for (var i = 0; i < scope.checkedEscopos.length; i++) {
                    if (item.Item == scope.checkedEscopos[i].Item) {
                        if (item.Nome != scope.checkedEscopos[i].Nome)
                            aux.push(scope.checkedEscopos[i]);
                    } else {
                        aux.push(scope.checkedEscopos[i]);
                    }
                }

                scope.checkedEscopos = aux;
            },

            setSelecionados: function () {
                var scope = this;
                
                if (scope.verticalOportunidade.TabelaPreco != null) 
                    scope.tabelaSelecionada = scope.verticalOportunidade.TabelaPreco.Handle;

                scope.pessoaOportunidadeProd.ForaEscopo             = scope.verticalOportunidade.ForaEscopo;
                scope.pessoaOportunidadeProd.FormaPagamento         = scope.verticalOportunidade.FormaPagamento;
                scope.pessoaOportunidadeProd.CondicaoImplantacao    = scope.verticalOportunidade.CondicaoImplantacao;
                scope.pessoaOportunidadeProd.Status                 = scope.verticalOportunidade.Status;
                scope.pessoaOportunidadeProd.Versao                 = scope.verticalOportunidade.Versao;

                if (scope.verticalOportunidade.TipoVenda != null) {
                    switch (scope.verticalOportunidade.TipoVenda) {
                        case 1:
                            scope.checkboxSelected.checkboxTableLu.value = true;
                            scope.checkboxSelectedProposta.checkboxTableLuLum.value = scope.verticalOportunidade.PropostaLuLum;
                            scope.checkboxSelectedProposta.checkboxTableLocacao.value = scope.verticalOportunidade.PropostaLocacao;
                            scope.checkboxSelectedProposta.checkboxTableSaas.value = scope.verticalOportunidade.PropostaSaas;
                            break;
                        case 2: 
                            scope.checkboxSelected.checkboxTableLocacao.value = true;
                            scope.checkboxSelectedProposta.checkboxTableLuLum.value = scope.verticalOportunidade.PropostaLuLum;
                            scope.checkboxSelectedProposta.checkboxTableLocacao.value = scope.verticalOportunidade.PropostaLocacao;
                            scope.checkboxSelectedProposta.checkboxTableSaas.value = scope.verticalOportunidade.PropostaSaas;
                            break;
                        case 3: 
                            scope.checkboxSelected.checkboxTableSaas.value = true;
                            scope.checkboxSelectedProposta.checkboxTableLuLum.value = scope.verticalOportunidade.PropostaLuLum;
                            scope.checkboxSelectedProposta.checkboxTableLocacao.value = scope.verticalOportunidade.PropostaLocacao;
                            scope.checkboxSelectedProposta.checkboxTableSaas.value = scope.verticalOportunidade.PropostaSaas;
                            break;
                    }
                }

                switch (scope.verticalOportunidade.Categoria) {
                    case 1: scope.categoriaSelecionada = "A"; break;
                    case 2: scope.categoriaSelecionada = "B"; break;
                    case 3: scope.categoriaSelecionada = "C"; break;
                }

                $.ajax({
                    url: scope.setPacote(),
                    success: function () { scope.setProduto(); scope.setEscopo();}
                })
                
            },

            setEscopo: function () {
                var scope = this;
                var auxEscopo = [];

                console.log("setProduto")

                for (var i = 0; i < scope.verticalOportunidade.EscopoSelecionado.length; i++) {

                    item = scope.verticalOportunidade.EscopoSelecionado[i];
                    auxEscopo.push(item)
                    
                }

                scope.checkedEscopos = auxEscopo;
            },

            setProduto: function () {
                var scope = this;
                var auxProdutos = [];

                console.log("setProduto")

                for (var i = 0; i < scope.verticalOportunidade.ProdutosSelecionados.length; i++) {

                    item = scope.verticalOportunidade.ProdutosSelecionados[i];

                    switch (item.TipoItem) {
                        case 1:
                        case 3:
                            auxProdutos.push(item)
                            break;
                        default: break;
                    }
                }

                scope.checkedProdutos = auxProdutos;
            },

            setPacote: function () {
                var scope = this;
                var auxPacotes = [];

                console.log("setPacote")

                for (var i = 0; i < scope.verticalOportunidade.ProdutosSelecionados.length; i++) {

                    item = scope.verticalOportunidade.ProdutosSelecionados[i];

                    switch (item.TipoItem) {
                        case 2:
                            scope.radioSelected = "pacote"
                            auxPacotes.push(item)
                            break;
                        default: break;
                    }
                }

                scope.checkedPacotes = auxPacotes;
            },

            getDesconto: function (desconto) {
                var percent = parseFloat(desconto)/100;

                while (percent > 1)
                    percent = percent / 10;

                return (1 - percent);

            },
            
            getDescontoPercent: function (desconto) {

                if (desconto.length < 3)
                    return parseFloat(desconto).toFixed(2);

                if (desconto.length == 3)
                    return parseFloat(desconto/10).toFixed(2);
                
                if (desconto.length == 4)
                    return parseFloat(desconto/100).toFixed(2);

            },

            getImposto: function (aliquota) {
                var scope = this;

                var response = parseFloat(scope.getValorProposta() * aliquota) / 100;
                return response.toFixed(2)
            },

            getValorLu: function () {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Lu = 0;
                if (scope.tiposUsuarios == 0) {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {
                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Lu += parseFloat(scope.checkedPacotes[i].Lu);
                            else
                                Lu += parseFloat(scope.checkedPacotes[i].Lu) * scope.checkedPacotes[i].Quantidade;
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {
                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Lu += parseFloat(scope.checkedProdutos[i].Lu);
                            else
                                Lu += parseFloat(scope.checkedProdutos[i].Lu) * scope.checkedProdutos[i].Quantidade;
                        }
                    }
                }
                else {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {
                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Lu += parseFloat(scope.checkedPacotes[i].Lu)
                            else {
                                if (scope.checkedPacotes[i].NecessitaQuantidade == true)
                                    Lu += parseFloat(scope.checkedPacotes[i].Lu) * scope.checkedPacotes[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Lu += parseFloat(scope.checkedPacotes[i].Lu) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {
                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Lu += parseFloat(scope.checkedProdutos[i].Lu)
                            else {
                                if (scope.checkedProdutos[i].NecessitaQuantidade == true)
                                    Lu += parseFloat(scope.checkedProdutos[i].Lu) * scope.checkedProdutos[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Lu += parseFloat(scope.checkedProdutos[i].Lu) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    }
                }
                
                return Lu.toFixed(2);
            
            },
            
            getValorLuTiposUsuarios: function (item) {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Lu = 0;
                
                if (scope.checkedPacotes.length > 0) {
                    for (var i = 0; i < scope.checkedPacotes.length; i++) {
                        if (scope.checkedPacotes[i].PrecoFixo == true)
                            Lu += parseFloat(scope.checkedPacotes[i].Lu) * (item.PorcentagemValor/100);
                        else
                            Lu += parseFloat(scope.checkedPacotes[i].Lu) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                } else {
                    for (var i = 0; i < scope.checkedProdutos.length; i++) {
                        if (scope.checkedProdutos[i].PrecoFixo == true)
                            Lu += parseFloat(scope.checkedProdutos[i].Lu) * (item.PorcentagemValor/100);
                        else
                            Lu += parseFloat(scope.checkedProdutos[i].Lu) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                }    
                
                
                return Lu.toFixed(2);
            
            },

            getValorLum: function () {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Lum = 0;
                
                if (scope.tiposUsuarios == 0) {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {
                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Lum += parseFloat(scope.checkedPacotes[i].Lum);
                            else
                                Lum += parseFloat(scope.checkedPacotes[i].Lum) * scope.checkedPacotes[i].Quantidade;
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {
                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Lum += parseFloat(scope.checkedProdutos[i].Lum);
                            else
                                Lum += parseFloat(scope.checkedProdutos[i].Lum) * scope.checkedProdutos[i].Quantidade;
                        }
                    }
                }
                else {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {

                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Lum += parseFloat(scope.checkedPacotes[i].Lum);
                            else {
                                if (scope.checkedPacotes[i].NecessitaQuantidade == true)
                                    Lum += parseFloat(scope.checkedPacotes[i].Lum) * scope.checkedPacotes[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Lum += parseFloat(scope.checkedPacotes[i].Lum) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {

                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Lum += parseFloat(scope.checkedProdutos[i].Lum);
                            else {
                                if (scope.checkedProdutos[i].NecessitaQuantidade == true)
                                    Lum += parseFloat(scope.checkedProdutos[i].Lum) * scope.checkedProdutos[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Lum += parseFloat(scope.checkedProdutos[i].Lum) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    }
                }
                
                return Lum.toFixed(2);
            
            },
            
            getValorLumTiposUsuarios: function (item) {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Lum = 0;
                
                if (scope.checkedPacotes.length > 0) {
                    for (var i = 0; i < scope.checkedPacotes.length; i++) {
                        if (scope.checkedPacotes[i].PrecoFixo == true)
                            Lum += parseFloat(scope.checkedPacotes[i].Lum) * (item.PorcentagemValor/100);
                        else
                            Lum += parseFloat(scope.checkedPacotes[i].Lum) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                } else {
                    for (var i = 0; i < scope.checkedProdutos.length; i++) {
                        if (scope.checkedProdutos[i].PrecoFixo == true)
                            Lum += parseFloat(scope.checkedProdutos[i].Lum) * (item.PorcentagemValor/100);
                        else
                            Lum += parseFloat(scope.checkedProdutos[i].Lum) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                }    
                
                return Lum.toFixed(2);
            
            },

            getValorLocacao: function () {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Locacao = 0;
                
                if (scope.tiposUsuarios == 0) {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {
                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Locacao += parseFloat(scope.checkedPacotes[i].Locacao);
                            else
                                Locacao += parseFloat(scope.checkedPacotes[i].Locacao) * scope.checkedPacotes[i].Quantidade;
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {
                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Locacao += parseFloat(scope.checkedProdutos[i].Locacao);
                            else
                                Locacao += parseFloat(scope.checkedProdutos[i].Locacao) * scope.checkedProdutos[i].Quantidade;
                        }
                    }
                } else {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {

                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Locacao += parseFloat(scope.checkedPacotes[i].Locacao);
                            else {
                                if (scope.checkedPacotes[i].NecessitaQuantidade == true)
                                    Locacao += parseFloat(scope.checkedPacotes[i].Locacao) * scope.checkedPacotes[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Locacao += parseFloat(scope.checkedPacotes[i].Locacao) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {
                            
                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Locacao += parseFloat(scope.checkedProdutos[i].Locacao);
                            else {
                                if (scope.checkedProdutos[i].NecessitaQuantidade == true)
                                    Locacao += parseFloat(scope.checkedProdutos[i].Locacao) * scope.checkedProdutos[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Locacao += parseFloat(scope.checkedProdutos[i].Locacao) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    }
                }
                
                return Locacao.toFixed(2);

            },
            
            getValorLocacaoTiposUsuarios: function (item) {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Locacao = 0;
                
                if (scope.checkedPacotes.length > 0) {
                    for (var i = 0; i < scope.checkedPacotes.length; i++) {
                        if (scope.checkedPacotes[i].PrecoFixo == true)
                            Locacao += parseFloat(scope.checkedPacotes[i].Locacao) * (item.PorcentagemValor/100);
                        else
                            Locacao += parseFloat(scope.checkedPacotes[i].Locacao) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                } else {
                    for (var i = 0; i < scope.checkedProdutos.length; i++) {
                        if (scope.checkedProdutos[i].PrecoFixo == true)
                            Locacao += parseFloat(scope.checkedProdutos[i].Locacao) * (item.PorcentagemValor/100);
                        else
                            Locacao += parseFloat(scope.checkedProdutos[i].Locacao) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                }    
                
                return Locacao.toFixed(2);
            
            },

            getValorSaas: function () {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Saas = 0;
                if (scope.tiposUsuarios.length == 0) {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {
                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Saas += parseFloat(scope.checkedPacotes[i].Saas);
                            else
                                Saas += parseFloat(scope.checkedPacotes[i].Saas) * scope.checkedPacotes[i].Quantidade;
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {
                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Saas += parseFloat(scope.checkedProdutos[i].Saas);
                            else
                                Saas += parseFloat(scope.checkedProdutos[i].Saas) * scope.checkedProdutos[i].Quantidade;
                        }
                    }
                }
                else {
                    if (scope.checkedPacotes.length > 0) {
                        for (var i = 0; i < scope.checkedPacotes.length; i++) {
                            
                            if (scope.checkedPacotes[i].PrecoFixo == true)
                                Saas += parseFloat(scope.checkedPacotes[i].Saas);
                            else {
                                if (scope.checkedPacotes[i].NecessitaQuantidade == true)
                                    Saas += parseFloat(scope.checkedPacotes[i].Saas) * scope.checkedPacotes[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Saas += parseFloat(scope.checkedPacotes[i].Saas) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    } else {
                        for (var i = 0; i < scope.checkedProdutos.length; i++) {
                            
                            if (scope.checkedProdutos[i].PrecoFixo == true)
                                Saas += parseFloat(scope.checkedProdutos[i].Saas);
                            else {
                                if (scope.checkedProdutos[i].NecessitaQuantidade == true)
                                    Saas += parseFloat(scope.checkedProdutos[i].Saas) * scope.checkedProdutos[i].Quantidade;
                                else {
                                    for (var j = 0; j < scope.tiposUsuarios.length; j++) {
                                        Saas += parseFloat(scope.checkedProdutos[i].Saas) * scope.tiposUsuarios[j].Quantidade * (scope.tiposUsuarios[j].PorcentagemValor/100);
                                    }
                                }
                            }
                        }
                    }
                }
                
                return Saas.toFixed(2);                

            },

            getValorSaasTiposUsuarios: function (item) {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Saas = 0;
                
                if (scope.checkedPacotes.length > 0) {
                    for (var i = 0; i < scope.checkedPacotes.length; i++) {
                        if (scope.checkedPacotes[i].PrecoFixo == true)
                            Saas += parseFloat(scope.checkedPacotes[i].Saas) * (item.PorcentagemValor/100);
                        else
                            Saas += parseFloat(scope.checkedPacotes[i].Saas) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                } else {
                    for (var i = 0; i < scope.checkedProdutos.length; i++) {
                        if (scope.checkedProdutos[i].PrecoFixo == true)
                            Saas += parseFloat(scope.checkedProdutos[i].Saas) * (item.PorcentagemValor/100);
                        else
                            Saas += parseFloat(scope.checkedProdutos[i].Saas) * item.Quantidade * (item.PorcentagemValor/100);
                    }
                }    
                
                return Saas.toFixed(2);
            
            },

            getValorServico: function () {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var Servico = 0;

                for (var i = 0; i < scope.checkedEscopos.length; i++) {
                    Servico += parseFloat(scope.checkedEscopos[i].HorasEditada * scope.checkedEscopos[i].TipoRecurso.ValorHoraOportunidade);
                }
                
                return Servico.toFixed(2);    
            },
            
            getValorProposta: function () {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var total = (scope.getValorServico() * scope.getDesconto(scope.descontos.descontoServico));
                
                if (scope.checkboxSelected.checkboxTableLu.value == true) {

                    total += (scope.getValorLu() * scope.getDesconto(scope.descontos.descontoLu));

                    return parseFloat(total).toFixed(2);     

                } else {

                    if (scope.checkboxSelected.checkboxTableLocacao.value == true) 
                        total += (scope.getValorLocacao() * scope.getDesconto(scope.descontos.descontoLocacao));
                    
                    if (scope.checkboxSelected.checkboxTableSaas.value == true) 
                        total += (scope.getValorSaas() * scope.getDesconto(scope.descontos.descontoSaas));
                       
                    return parseFloat(total).toFixed(2) ; 

                }
            },

            getValorPropostaFinal: function () {
                var scope = this;

                if (scope.checkedProdutos.length == 0 && scope.checkedPacotes.length == 0)
                    return 0;

                var total = (scope.getValorServico() * scope.getDesconto(scope.descontos.descontoServico));
                
                if (scope.checkboxSelected.checkboxTableLu.value == true) {

                    total += (scope.getValorLu() * scope.getDesconto(scope.descontos.descontoLu));
                    
                } else {

                    if (scope.checkboxSelected.checkboxTableLocacao.value == true) 
                        total += (scope.getValorLocacao() * scope.getDesconto(scope.descontos.descontoLocacao));
                    
                    if (scope.checkboxSelected.checkboxTableSaas.value == true) 
                        total += (scope.getValorSaas() * scope.getDesconto(scope.descontos.descontoSaas));
                    
                }

                var totalImpostos = 0;

                for (var i = 0; i < scope.checkedImpostos.length; i++) {
                    totalImpostos += scope.checkedImpostos[i].Aliquota
                }

                total = total * (1 - totalImpostos / 100);

                return parseFloat(total).toFixed(2);

            },

            postInfo: function () {
                var scope = this;

                scope.produtoPost.Itens = scope.checkedProdutos;
                scope.produtoPost.Atividades = scope.checkedEscopos;
                scope.produtoPost.Pacotes = scope.checkedPacotes;
                scope.produtoPost.QuantidadeUsuarios = scope.qtdeUsuarios;
                scope.produtoPost.DescontoLu = scope.getDescontoPercent(scope.descontos.descontoLu);
                scope.produtoPost.DescontoLum = scope.getDescontoPercent(scope.descontos.descontoLum);
                scope.produtoPost.DescontoLocacao = scope.getDescontoPercent(scope.descontos.descontoLocacao);
                scope.produtoPost.DescontoSaas = scope.getDescontoPercent(scope.descontos.descontoSaas);
                scope.produtoPost.DescontoServico = scope.getDescontoPercent(scope.descontos.descontoServico);
                scope.produtoPost.Oportunidade = scope.verticalOportunidade.Oportunidade;
                scope.produtoPost.OportunidadeProd = scope.verticalOportunidade.Handle;
                scope.produtoPost.TabelaPreco = scope.tabelaSelecionada;
                scope.produtoPost.Categoria = scope.categoriaSelecionada;
                scope.produtoPost.ComImpostos = scope.pessoaOportunidadeProd.ComImpostos;
                scope.produtoPost.PropostaLuLum = scope.checkboxSelectedProposta.checkboxTableLuLum.value;
                scope.produtoPost.PropostaLocacao = scope.checkboxSelectedProposta.checkboxTableLocacao.value;
                scope.produtoPost.PropostaSaas = scope.checkboxSelectedProposta.checkboxTableSaas.value;
                scope.produtoPost.Impostos = scope.checkedImpostos;
                scope.produtoPost.TiposUsuarios = scope.tiposUsuarios;
                scope.produtoPost.Versao = scope.verticalOportunidade.Versao;
                scope.produtoPost.ForaEscopo = scope.pessoaOportunidadeProd.ForaEscopo;
                scope.produtoPost.FormaPagamento = scope.pessoaOportunidadeProd.FormaPagamento;
                scope.produtoPost.CondicaoImplantacao = scope.pessoaOportunidadeProd.CondicaoImplantacao;

                if (scope.checkboxSelected.checkboxTableLu.value == true) {
                    scope.produtoPost.TipoVenda = 1
                } else {
                    if (scope.checkboxSelected.checkboxTableLocacao.value == true && scope.checkboxSelected.checkboxTableSaas.value == true)
                        scope.produtoPost.TipoVenda = 3
                    else {
                        if (scope.checkboxSelected.checkboxTableLocacao.value == true)
                            scope.produtoPost.TipoVenda = 2
                        if (scope.checkboxSelected.checkboxTableSaas.value == true)
                            scope.produtoPost.TipoVenda = 4
                    }
                }
                console.log(" -- POST INFO --")
                console.log(scope.produtoPost)
                console.log(" -- POST INFO --")
                
                $.ajax({
                    url: Benner.Page.getApplicationPath() +"api/crm/oportunidades/save-oportunidade",
                    //url: Benner.Page.getApplicationPath() + "CrmProdutoItens/SaveItens",
                    type: 'POST',
                    dataType: "json",
                    data:JSON.stringify(scope.produtoPost),
                    contentType: "application/json; charset=utf-8",
                    crossDomain: true,
                    cache: false,
                    success: function (msg) {
                        console.log(msg);
                        if(msg.url.indexOf("Erro") != -1)
                            toastr.error(msg.url,"Erro");
                        else{
                            toastr.success("Oportunidade atualizada com sucesso!");
                            window.location.href = msg.url;
                        }
                    },
                    error: function () {
                        toastr.error("Erro ao atualizar oportunidade!","Erro");
                    }
                 });
            },

        },
        watch: {
            checkedProdutos: function (newItem,oldItem) {
                var scope = this;

                console.log("checkedProdutos")
                console.log(scope.isCreating)
                console.log(oldItem)
                console.log(newItem)

                for (var j = scope.checkedEscopos.length-1; j >= 0; j--) {
                    var itemSelecionado = false;

                    for (var i = 0; i < scope.checkedProdutos.length; i++) {
                        if (scope.checkedEscopos[j].Item == scope.checkedProdutos[i].Handle)
                            itemSelecionado = true;
                    }

                    if (!itemSelecionado) {
                        scope.checkedEscopos.splice(j,1);
                    }

                }

                for (var i = 0; i < scope.checkedProdutos.length; i++) {
                    var noEscopo = false

                    if (scope.checkedProdutos[i].NecessitaQuantidade == false && scope.checkedProdutos[i].PrecoFixo == false)
                        scope.checkedProdutos[i].Quantidade = scope.qtdeUsuarios;

                    for (var j = 0; j < scope.checkedEscopos.length; j++) {
                        if (scope.checkedEscopos[j].Item == scope.checkedProdutos[i].Handle)
                            noEscopo = true;
                    }

                    if (!noEscopo && scope.isCreating == false) {
                        $.ajax({
                            type: 'GET',
                            dataType: "json",
                            url: Benner.Page.getApplicationPath() + "/CrmProdutoItens/GetProdutoItemEscopo?produtoItem=" + scope.checkedProdutos[i].Handle+"&oportunidade="+scope.verticalOportunidade.Oportunidade,
                        }).done(function (data) {
                            var aux = []
                            aux = JSON.parse(data);

                            for (var j = 0 ; j < aux.length;j++){
                                scope.checkedEscopos.push(aux[j])
                            }

                            console.log("GetProdutoItemEscopo")
                            console.log(scope)

                        });
                    }
                }

                for (var i = 0; i < scope.checkedProdutos.length; i++) {

                    $("#Produto_" + scope.checkedProdutos[i].Handle).prop("checked", true);
                }
            },

            checkedPacotes: function (newVal,oldVal) {
                var scope = this;

                console.log(" - - -- checkedPacotes - - - -")

                for (var i = 0; i < scope.checkedProdutos.length; i++) {

                    item = scope.checkedProdutos[i];
                    $("#Produto_" + item.Handle).prop("checked", false);

                }

                scope.checkedProdutos = [];

                for (var i = 0; i < scope.checkedPacotes.length; i++) {

                    item = scope.checkedPacotes[i];

                    if (scope.checkedPacotes[i].NecessitaQuantidade == false)
                        scope.checkedPacotes[i].Quantidade = scope.qtdeUsuarios;

                    for (var j = 0; j < item.ItensPacote.length; j++) {

                        itemProduto = item.ItensPacote[j];

                        inCheckedProdutos = false;

                        for (k = 0; k < scope.checkedProdutos.length; k++) {
                            if (scope.checkedProdutos[k].Handle === itemProduto.Handle) {
                                inCheckedProdutos= true;
                            }
                        }

                        if(!inCheckedProdutos)
                            scope.checkedProdutos.push(itemProduto)
                        
                        console.log("computed-ItensPacote")
                        console.log(itemProduto)
                        console.log(itemProduto.Handle)

                    }
                }
            },

            checkedImpostos: function (newVal, oldVal) {
                console.log("checkedImpostos")
                console.log(newVal)
            },

            'pessoaOportunidadeProd.ComImpostos': function (newVal, oldVal) {
                this.checkedImpostos = [];
            },

            qtdeUsuarios: function (newVal, oldVal) {
                var scope = this;

                console.log(" - qtdeUsuarios -")

                for (var i = 0; i < scope.checkedProdutos.length; i++)
                    if (scope.checkedProdutos[i].NecessitaQuantidade == false && scope.checkedProdutos[i].PrecoFixo == false)
                        scope.checkedProdutos[i].Quantidade = scope.qtdeUsuarios;
            },

            'checkboxSelected.checkboxTableLu.value': function (newVal, oldVal) {
                var scope = this;
                if (newVal) {
                    scope.checkboxSelected.checkboxTableLum.value = true;
                    scope.checkboxSelected.checkboxTableLocacao.disabled = true;
                    scope.checkboxSelected.checkboxTableSaas.disabled = true;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableLuLum.value = true;
                    scope.checkboxSelectedProposta.checkboxTableLocacao.visible = true;
                    scope.checkboxSelectedProposta.checkboxTableSaas.visible = true;
                } else {
                    scope.checkboxSelected.checkboxTableLum.value = false;
                    scope.checkboxSelected.checkboxTableLocacao.disabled = false;
                    scope.checkboxSelected.checkboxTableSaas.disabled = false;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableLuLum.value = false;
                    scope.checkboxSelectedProposta.checkboxTableLocacao.visible = false;
                    scope.checkboxSelectedProposta.checkboxTableSaas.visible = false;
                }
            },

            'checkboxSelected.checkboxTableLum.value': function (newVal, oldVal) {
                var scope = this;
                if (newVal) {
                    scope.checkboxSelected.checkboxTableLu.value = true;
                    scope.checkboxSelected.checkboxTableLocacao.disabled = true;
                    scope.checkboxSelected.checkboxTableSaas.disabled = true;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableLuLum.value = true;
                    scope.checkboxSelectedProposta.checkboxTableLocacao.visible = true;
                    scope.checkboxSelectedProposta.checkboxTableSaas.visible = true;
                } else {
                    scope.checkboxSelected.checkboxTableLu.value = false;
                    scope.checkboxSelected.checkboxTableLocacao.disabled = false;
                    scope.checkboxSelected.checkboxTableSaas.disabled = false;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableLuLum.value = false;
                    scope.checkboxSelectedProposta.checkboxTableLocacao.visible = false;
                    scope.checkboxSelectedProposta.checkboxTableSaas.visible = false;
                }
            },

            'checkboxSelected.checkboxTableLocacao.value': function (newVal, oldVal) {
                var scope = this;
                if (newVal) {
                    scope.checkboxSelected.checkboxTableLu.value   = false;
                    scope.checkboxSelected.checkboxTableLum.value  = false;
                    scope.checkboxSelected.checkboxTableLu.disabled = true;
                    scope.checkboxSelected.checkboxTableLum.disabled = true;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableLocacao.value = true;
                    scope.checkboxSelectedProposta.checkboxTableLuLum.visible = true;
                } else {
                    scope.checkboxSelected.checkboxTableLu.value   = false;
                    scope.checkboxSelected.checkboxTableLum.value  = false;
                    scope.checkboxSelected.checkboxTableSaas.value  = false;
                    scope.checkboxSelected.checkboxTableLu.disabled = false;
                    scope.checkboxSelected.checkboxTableLum.disabled = false;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableLocacao.value = false;
                    scope.checkboxSelectedProposta.checkboxTableLuLum.visible = false;
                }
            },
                        
            'checkboxSelected.checkboxTableSaas.value': function (newVal, oldVal) {
                var scope = this;
                if (newVal) {
                    scope.checkboxSelected.checkboxTableLu.value = false;
                    scope.checkboxSelected.checkboxTableLum.value = false;
                    scope.checkboxSelected.checkboxTableLocacao.value = true;
                    scope.checkboxSelected.checkboxTableLu.disabled = true;
                    scope.checkboxSelected.checkboxTableLum.disabled = true;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableSaas.value = true;
                    scope.checkboxSelectedProposta.checkboxTableLocacao.value = true;
                    scope.checkboxSelectedProposta.checkboxTableLuLum.visible = true;
                } else {
                    scope.checkboxSelected.checkboxTableLu.disabled = false;
                    scope.checkboxSelected.checkboxTableLum.disabled = false;
                    scope.checkboxSelected.checkboxTableLocacao.value = false;
                    // Altera o objeto para mostrar na proposta
                    scope.checkboxSelectedProposta.checkboxTableSaas.value = false;
                    scope.checkboxSelectedProposta.checkboxTableLocacao.value = false;
                    scope.checkboxSelectedProposta.checkboxTableLuLum.visible = false;
                }
            },

            tabelaSelecionada: function () {
                
                if (this.isCreating == false) {
                    this.checkedPacotes = [];
                    this.checkedProdutos = [];
                    this.checkedEscopos = [];
                }
            },

            categoriaSelecionada: function () {

                if (this.isCreating == false) {
                    this.checkedPacotes = [];
                    this.checkedProdutos = [];
                    this.checkedEscopos = [];
                }
            },
            
            radioSelected: function (newVal) {

                this.checkedPacotes = [];
                this.checkedProdutos = [];
                this.checkedEscopos = [];

                if (newVal == "pacote")
                    this.tabDisplay = 3;
                if (newVal == "produto")
                    this.tabDisplay = 1;
            }
        },
        computed: {
            listProdutos() {
                var tabela = this.tabelaSelecionada;
                var categoria = this.categoriaSelecionada;
                var list = [];

                for (var i = 0; i < this.produtos.length; i++) {
                    if (this.produtos[i].TabelaPreco == tabela && this.produtos[i].Categoria == categoria)
                        list.push(this.produtos[i]);
                }

                return list;
            },
            
            listAdicionais() {
                var tabela = this.tabelaSelecionada;
                var categoria = this.categoriaSelecionada;
                var list = [];

                for (var i = 0; i < this.adicionais.length; i++) {
                    if (this.adicionais[i].TabelaPreco == tabela && this.adicionais[i].Categoria == categoria)
                        list.push(this.adicionais[i]);
                }

                return list;
            },
            
            listPacotes() {
                var tabela = this.tabelaSelecionada;
                var categoria = this.categoriaSelecionada;
                var list = [];

                for (var i = 0; i < this.pacotes.length; i++) {
                    if (this.pacotes[i].TabelaPreco == tabela && this.pacotes[i].Categoria == categoria)
                        list.push(this.pacotes[i]);
                }

                return list;
            },

            listProdutosComQuantidade() {
                var list = [];

                for (var i = 0; i < this.checkedProdutos.length; i++) {
                    if (this.checkedProdutos[i].NecessitaQuantidade == true)
                        list.push(this.checkedProdutos[i]);
                }

                return list;
            },

            listEscopo: function() {
                var scope = this;
                return _.orderBy(scope.checkedEscopos,['ItemNome','Ordem'],'asc');
            }
        }
    })       
</script>
</html>
