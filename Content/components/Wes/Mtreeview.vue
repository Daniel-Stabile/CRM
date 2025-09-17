<template>
    <div v-if="handle && tabela && carga" class="portlet light">
        <div v-if="tituloFormatado" class="portlet-title">
            <div class="caption">
                <i class="fa fa-paste font-green"></i>
                <span class="caption-subject font-green bold uppercase">{{tituloFormatado}}</span>
            </div>                                                            
        </div>
        <div class="portlet-body">

            <div class="clearfix">
                <div id="ctl00_Main_GRID_toolbar" class="form-actions top nobg no-border commands-bar fluid list-commands-bar">
                    <button type="button" :disabled="!this.podeInserir" v-on:click="novoRegistro()" class="btn green">
                        <i class="fa fa-plus"></i> Novo
                    </button>   
                </div>
            </div>
            
            <div style="clearfix row clearfixborder-collapse:separate;">
                <div class="filter-search-form note note-info note-bordered">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="input-icon right">
                                <i class="fa fa-spinner fa-pulse fa-3x fa-fw fa-spin font-dark" v-if="loading"></i>
                                <input type="text" id="search-input" autocomplete="off"  v-model="filtro" :disabled="filtroDisabled" class="form-control" 
                                    placeholder="Pesquisa..." title="Filtre registros na tabela selecionada.">    
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="clearfix margin-top-10">
                <div class="treeview" v-on:keyup="keymonitor"></div>                                                                
            </div>

        </div>         
    </div>
</template>
<script>
    import TreeViewService from "../../services/TreeViewService";
    import MTreeView from "../../js/MTreeView";
    import _ from 'lodash';
    
    export default {
        props: ["titulo","funcaotitulo","tabela", "carga", "handle", "noTools", "expandir", "retrair", "cadastrar", "treeviewId", "breadcrumb"],
        data: function () {
            return {                
                initialized: false,
                payload : {},
                treeView : {},
                selectedNodeId : String,
                lastFilteredId : String,
                novoVisible: false,
                filtro : "",
                filtering : false,
                filteredNodes : {},
                loading : false,
                sessionKey : String
            }
        },  
        computed: {
            tituloFormatado() {
                if (this.funcaotitulo)
                    return this.treeView.TraduzFuncaoTitulo(this.funcaotitulo, this.titulo);
                else
                    return this.titulo;
            },
            filtroDisabled() {
                if (this.selectedNodeId) {
                    var node = this.getTreeView().jstree(true).get_node(this.selectedNodeId);                    
                    return !(node.a_attr.type == 2);                    
                }
                return true;
            },
            podeInserir() {
                if (this.selectedNodeId) {
                    var node = this.getTreeView().jstree(true).get_node(this.selectedNodeId);
                    if (node.a_attr.onlyRecord != "S" && node.a_attr.canInsert == "S") return true;
                    // para tabela
                    if (node.a_attr.type == 2 && node.a_attr.onlyRecord == "S" && node.a_attr.canInsert == "S" && node.state.loaded && node.children.length == 0) return true;
                    // para registro
                    if ([3,4].includes(node.a_attr.type) && node.a_attr.onlyRecord != "S" && node.a_attr.canInsert == "S") return true;
                    return false;
                }
                return false;
            }
        },
        methods: {                    
            isButtonEnabled(type) {                
                if (this.noTools == "true") {
                    return false;
                }
                if (type == "expandir") {
                    return this.expandir != "false";
                } else if (type == "retrair") {
                    return this.retrair != "false";
                } else if (type == "cadastrar") {
                    return this.cadastrar != "false";
                }
            },
            expandirAll() {      
                if (this.selectedNodeId)
                    this.getTreeView().jstree('open_node', this.selectedNodeId);
                else
                    this.getTreeView().jstree('open_all');
            },
            retrairAll() {                
                if (this.selectedNodeId)
                    this.getTreeView().jstree('close_node', this.selectedNodeId);
                else
                    this.getTreeView().jstree("close_all");
            },
            keymonitor: function(event) {
                if(event.key == "F2") {  
                    var node = this.getTreeView().jstree(true).get_node(this.selectedNodeId);
                    if (node.a_attr.type == 2) {
                        $('#search-input').focus();
                        $('#search-input').select();
                    }
                }  
            },
            novoRegistro() {
                if (this.podeInserir && this.selectedNodeId) {
                    var node = this.getTreeView().jstree(true).get_node(this.selectedNodeId);
                    this.gerarLink(node, true);
                }
            },
            getTreeView: function () {
                return $(this.$el).find(".treeview");
            },
            gerarLink(node, cadastrar) {                
                var data = {
                    permission : {
                        insert : node.a_attr.canInsert,
                        update : node.a_attr.canUpdate,
                        delete : node.a_attr.canDelete,
                        onlyRecord : node.a_attr.onlyRecord
                    },
                    entityName : node.a_attr.entityName,
                    entityViewName : node.a_attr.entityViewName,
                    title : node.a_attr.title,
                    parentTable : node.a_attr.parentTable,
                    parentHandle : node.a_attr.parentHandle,
                    nodeInternalCode : node.a_attr.nodeInternalCode,
                    handle : (cadastrar ? 0 : node.a_attr.parentHandle)
                }
                
                TreeViewService.getTreeViewLink(data).then(response => {
                    this.abrirDetalhes(response.body);
                });
            },
            abrirDetalhes(link){
                var config = {
                    url: link,
                    displayTitle: false,
                    displayFooter: false,
                    buttonLabel:'Fechar',
                    size:'large',
                    height: parseInt($(window).height() * 0.7),
                    triggeredByCommand: false
                };
                let self = this;
                Benner.ModalPage.show(config, Benner.WidgetCommandsBar.openModal, function() { self.onModalClose() });
            },
            onModalClose() {
                /*
                var node = this.getTreeView().jstree(true).get_node(this.selectedNodeId);
                if (node.a_attr.type == 3)
                    node = this.getTreeView().jstree(true).get_node(node.parent);
                    
                    
                if (this.filtering)
                    this.filtro = "";

                this.recarregarNode(node.id);*/
            },
            filtrar() {
                this.loading = true;
                if (this.lastFilteredId && this.lastFilteredId != this.selectedNodeId)
                   this.limparFiltro(true);
                
                this.lastFilteredId = this.selectedNodeId;                
                this.getTreeView().jstree(true).search(this.filtro, false, false, this.selectedNodeId);
            },
            limparFiltro(force) {                
                if ((this.lastFilteredId && this.filtering && !this.filtro) || force) {
                    console.log("[Limpar filtro]");
                    
                    this.filtering = false;
                    this.filteredNodes = [];

                    var node = this.getTreeView().jstree(true).get_node(this.lastFilteredId);
                    node.state.loaded = false;
                    
                    this.recarregarNode(this.lastFilteredId, function() {
                        this.lastFilteredId = null;
                    }.bind(this));
                }
            },
            recarregarNode(nodeId, callback)      
            {
                this.getTreeView().jstree(true).load_node(nodeId, function() {

                    this.getTreeView().jstree(true).redraw_node(nodeId);                    
                    this.getTreeView().jstree(true).open_node(nodeId);
                    if (callback)
                        callback();                    
                }.bind(this));
            },
            init: function (data) {
                var self = this;
                this.getTreeView().on("select_node.jstree", function (e, data) { 
                    self.selectedNodeId = data.node.id; 
                    if (data.node.a_attr.type == 3)                         
                        self.gerarLink(data.node);
                });
                
                this.getTreeView().on("clear_search.jstree", function (e, data) {
                    console.log("[Clear search]");
                    self.limparFiltro();
                });
                
                this.getTreeView().on('close_node.jstree', function (e, data) {
                    console.log('close_node', data.node);
                    if (data.node.a_attr.type != 1 && data.node.a_attr.type != 3)
                        data.node.state.loaded = false;
                });

                this.getTreeView().jstree(
                {
                    "plugins": ["wholerow", "json_data", "search"],
                    'core': {
                        "load_open" : true,
                        "data" : function (node, cb) {
                            if(node.id === "#") {
                                var data = {
                                    tabela: self.tabela,
                                    carga: self.carga,
                                    handle: self.handle,
                                    sessionKey: self.sessionKey,
                                    breadcrumb: self.breadcrumb
                                };

                                TreeViewService.getTreeViewCargaInicial(data).then(response => {    
                                    self.log("[Carga inicial] " + response.data.count + " registros carregados - ");
                                    console.log(response.data.items);                  
                                    self.loading = false;
                                    cb(response.data.items);
                                }).catch(e => {
                                    console.log(e);
                                    self.loading = false;
                                });
                            }
                            else {
                                if (self.filtering && self.lastFilteredId == node.id) {
                                    self.loading = false;
                                    cb(self.filteredNodes);
                                    return;
                                }
                                
                                var treeviewdata = self.getTreeView().jstree(true).get_json('#', {flat:false});
                                var data = {
                                    node: node,
                                    fulldata: treeviewdata,
                                    sessionKey: self.sessionKey,
                                    breadcrumb: self.breadcrumb
                                };

                                TreeViewService.getTreeViewCargaDependencia(data).then(response => {                 
                                    self.log("[Carga dependencia] " + response.data.count + " registros carregados - ");
                                    console.log(response.data.items);                  
                                    self.loading = false;
                                    cb(response.data.items);
                                }).catch(e => {
                                    console.log(e);
                                    self.loading = false;
                                });
                            }
                        },
                        "themes": {
                            "icons": true
                        },
                        'strings' : {
                            'Loading ...' : 'Carregando ...'
                        }
                    },
                    "search" : {
                        "case_insensitive" : true,
                        "ajax" : function(strFiltro,cb) { 
                            var node = self.getTreeView().jstree(true).get_node(self.selectedNodeId);                            
                            var treeviewdata = self.getTreeView().jstree(true).get_json('#', {flat:false});
                            var data = {
                                search: strFiltro,
                                node: node,
                                fulldata: treeviewdata,
                                sessionKey: self.sessionKey,
                                breadcrumb: self.breadcrumb
                            };
                            
                            // Filtra e retorna os filhos filtrados do node selecionado
                            TreeViewService.filterTreeView(data).then(response => {                 
                                self.log("[Filtro pelo texto: "+strFiltro+" ] " + response.data.count + " registros carregados - ");
                                console.log(response.data.items);  
                                
                                self.filtering = true;
                                self.filteredNodes = response.data.items;
                                node.children = response.data.items;

                                // manda o componente carregar o node selecionado com os registros filhos
                                self.recarregarNode(self.selectedNodeId, function() {
                                    node.state.loaded = true;
                                    cb([self.selectedNodeId]);
                                })
                            }).catch(e => {
                                console.log(e);
                                self.loading = false;
                            });
                        }
                    }                        
                });

                this.initialized = true;
            },
            log(string) {
                var today = new Date();
                var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
                var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                var dateTime = ' '+date+' '+time;                       
                console.log(string + dateTime);                  
            }
        },
        watch: {
            handle: function (value) {
                this.init();
            },
            filtro: function(value) {
                this.debouncedFilter();
            }
        },
        mounted: function () {            
            this.$emit('unloaded', {choice: this.treeviewId, loaded: false});
            this.init();
        },
        created() {
            this.debouncedFilter = _.debounce(this.filtrar, 500);
            this.filtro = "";
            this.selectedNodeId = "";
            this.lastFilteredId = "";
            this.treeView = new MTreeView();
            this.sessionKey = this.tabela + this.handle;
        }
    }
</script>