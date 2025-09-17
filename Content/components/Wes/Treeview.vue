<template>
    <div>
        <div class="btn-group">
            <a v-if="isButtonEnabled('marcar')" href="javascript:;" class="btn btn-sm"
               v-on:click="marcarAll()">
                <i class="fa fa-check-square-o"></i> Todos
            </a>
            <a v-if="isButtonEnabled('desmarcar')" href="javascript:;" class="btn btn-sm"
               v-on:click="desmarcarAll()">
                <i class="fa fa-square-o"></i> Nenhum
            </a>
            <a v-if="isButtonEnabled('expandir')" href="javascript:;" class="btn btn-sm"
               v-on:click="expandirAll()">
                <i class="fa fa-plus-square-o"></i> Expandir
            </a>
            <a v-if="isButtonEnabled('retrair')" href="javascript:;" class="btn btn-sm"
               v-on:click="retrairAll()">
                <i class="fa fa-minus-square-o"></i> Recolher
            </a>
        </div>
        <div class="treeview"></div>    
    </div>

</template>
<script>
    import TreeViewService from "../../services/TreeViewService";
    import _ from 'lodash';
    export default {
        props: ["endpoint", "button", "noTools", "expandir", "retrair", "marcar", "desmarcar", "treeviewId", "store", "markAllByDefault", "singleSelectionFirstParent"],
        data: function () {
            return {                
                initialized: false,
                payload : {}
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
                } else if (type == "marcar") {
                    return this.marcar != "false";
                } else if (type == "desmarcar") {
                    return this.desmarcar != "false";
                }
            },
            expandirAll() {                                
                this.getTreeView().jstree('open_all');
            },
            retrairAll() {
                this.getTreeView().jstree("close_all");
            },
            marcarAll() {
                this.getTreeView().jstree("check_all");
            },
            desmarcarAll() {                
                var selected = this.getTreeView().jstree("get_selected");                
                if(selected.length > 0){
                    this.getTreeView().jstree("deselect_all");
                }
                
            },                        
            loadData: function (endpoint) {
                if (!endpoint)
                    return;

                let vm = this;
                var data = TreeViewService.getTreeViewData(endpoint).then(response => {                    
                    var payload = {
                        data: response.data,
                        choice: this.treeviewId
                    }                               
                    vm.payload = payload;
                    vm.render(response.data.items);
                });
            },
            getTreeView: function () {
                return $(this.$el).find(".treeview");
            },
            init: function (data) {                                                                      
                var self = this;
                
                this.getTreeView().on('ready.jstree', function() {                                                                                                                       
                    var markTreeView = true;
                    self.$emit('loaded', self.payload);

                    if (self.store != undefined && self.store.selected.length > 0) {              
                        markTreeView = false;
                        self.expandirAll();
                        var treeView = self.getTreeView().jstree(true);
                        _.forEach(self.store.selected, function(p) {
                            try { treeView.select_node(p + "_anchor"); } 
                            catch (error) { console.log(error); } 
                        });
                        self.retrairAll();
                    }

                    if (markTreeView && self.markAllByDefault)
                        self.marcarAll();
                });

                if (this.singleSelectionFirstParent)
                    this.getTreeView().on('select_node.jstree', function(node, selected) { 
                        var treeView = $("#"+selected.node.a_attr.id).parents(".treeview");   
                        if (_.uniq(treeView.jstree('get_selected').map(selecionado => 
                                treeView.jstree(true).get_node(selecionado).parent == "#" ? 
                                treeView.jstree(true).get_node(selecionado).id 
                                : $(".treeview").jstree(true).get_node(selecionado).parent))
                            .length > 1) {
                            treeView.jstree("deselect_all");
                            treeView.jstree(true).select_node(selected.node.a_attr.id); 
                        }         
                    });

                this.getTreeView().on('changed.jstree', function (e, data) {                             
                    self.$emit('item-selected', { node: data.node, selected: data.selected, id: self.treeviewId});
                }).jstree(
                    {
                        'core': {
                            "data": data,
                            "themes": {
                                "icons": false
                            }
                        },
                        "plugins": ["wholerow", "checkbox"],
                    });

                this.initialized = true;
            },
            render: function (data) {                              
                if (!this.initialized) {                                        
                    this.init(data);
                }
                else
                {                                        
                    this.getTreeView().jstree(true).settings.core.data = data;
                    this.getTreeView().jstree(true).refresh();                    
                }
            }
        },
        watch: {
            endpoint: function (value) {
                this.loadData(value);
            },
        },
        mounted: function () {
            this.$emit('unloaded', {choice: this.treeviewId, loaded: false});
            this.loadData(this.endpoint);
        }
    }
</script>