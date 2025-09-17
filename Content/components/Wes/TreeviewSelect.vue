<template>
    <div>
        <div v-show="showSelect" class="input-group">
            <div class="input-group-btn">
                <button type="button" class="btn btn-default blue" data-toggle="dropdown">
                    {{currentCaption}}
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li v-for="(item, index) in definitions" :key="index">
                        <a href="#" v-on:click="menuSelect(item)">{{item.caption}}</a>
                    </li>
                </ul>
            </div>
            <wes-select :store="refStore" v-if="(lookupEntityName)" ref="select" :endpoint="lookupEntityName" v-on:item-selected="lookupItemSelected" result-fields="nome" :origem="origem"></wes-select>
        </div>
        <wes-treeview :markAllByDefault="markAllByDefault" :store="refStore" :treeview-id="treeviewId" button="circle" class="margin-top-10" ref="treeview" v-on:item-selected="itemSelected" v-on:loaded="treeViewLoaded" v-on:unloaded="treeViewUnloaded" ></wes-treeview>
    </div>
</template>
<script>
    import _ from 'lodash';
    export default {        
        props: {
            definitions: {

            },
            treeviewId: {

            }, 
            store: {

            }, 
            markAllByDefault: {

            }, 
            showSelect: {
                default: true
            },
			origem: {
			
			}
        },
        data: function () {
            return {
                currentCaption: "",
                lookupCurrentItem: 0,
                lookupEntityName: "",
                treeviewFilterField: "",
                treeviewEntityName: "",                
                refStore : {},
                firstUsage: true
            }
        },
        mounted: function () {
            this.selectDefaultMenu();
            this.refStore = this.store;            
            this.treeview = this.$refs.treeview;
        },
        methods: {   
            clear(){
                this.treeview.desmarcarAll();
            },        
            getTreeViewSelectStore() {      
                return this.store;                            
            },       
            selectDefaultMenu(){                
                if (this.definitions && this.definitions.length > 0) {                
                    var selected = this.definitions[0];
                    if(this.store !== undefined){                                                                     
                        var store = this.store;                                                                        
                        var d = _.filter(this.definitions, function(p) { return p.caption === store.tipo });
                        if(d.length === 1){                            
                            selected = d[0];
                        }
                                           
                    }                
                    this.menuSelect(selected);
                }
            },
            treeViewLoaded: function (args) {                                
                this.$emit('tree-view-loaded', args);
            },
            treeViewUnloaded: function (args) {                                
                this.$emit('tree-view-unloaded', args);
            },
            itemSelected: function (args) {                                
                this.$emit('item-selected', args);
            },
            loadTreeViewData: function () {
                 if(this.firstUsage){
                    this.firstUsage = false;
                } else {
                    this.$refs.treeview.desmarcarAll();                             
                }    


                if (this.treeviewFilterField) {
                    this.$refs.treeview.loadData(this.treeviewEntityName + '/' + this.treeviewFilterField + '/' + this.lookupCurrentItem);
                } else {
                    this.$refs.treeview.loadData(this.treeviewEntityName);
                }
            },
            lookupItemSelected: function (value) {                
                this.lookupCurrentItem = value;
                this.loadTreeViewData();                
                var payload = {
                    choice: this.treeviewId,
                    origem: value
                };
                this.$emit('lookup-item-selected', payload);
            },
            menuSelect: function (item) {                         
                this.currentCaption = item.caption;
                this.lookupEntityName = item.lookupEntityName;
                this.treeviewFilterField = item.treeviewFilterField;
                this.treeviewEntityName = item.treeviewEntityName;

                var payload = {
                    choice: this.treeviewId,
                    tipo: item.caption  
                };                                                                
                this.$emit('menu-item-selected', payload);                
                if (!this.lookupEntityName) {                                                      
                    this.loadTreeViewData();
                }
            },
        }
    }
</script>
<style>
    .margin-top-10{
        margin-top:10px;
    }
</style>