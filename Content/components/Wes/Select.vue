<template>
    <select class="form-control" v-model="selectedValue">
        <option v-for="option in options" :value="option.id" :key="option.id">
            {{ option.text }}
        </option>
    </select>
</template>
<script>
    import LookupService from "../../services/LookupService";

    export default {
        props: ["endpoint", "resultFields", "value", "store", "origem"],        
        data: function () {
            return {
                options: [],
                selectedValue: this.value
            }
        },
        methods: {
            loadOptions: function (endpoint, resultFields, origem) {
                this.options = [];
                if (!endpoint)
                    return;

                let vm = this;
                var data = LookupService.getLookupData(endpoint, resultFields, origem).then(response => {                    
                    this.options = response.data;

                    this.$emit('options-loaded', response.data)

                    this.selectDefaultOption();
                });
            },
            selectDefaultOption(){                                         
                if(this.store !== undefined && this.store.origem !== 0 && this.store.origem !== this.selectedValue){
                    this.selectedValue = this.store.origem;
                } else {
                    
                    this.selectFirstOption();
                }
            },
            selectFirstOption: function () {
                if (this.options && this.options.length > 0) {
                    const option = this.options[0];

                    if (option && option.id)
                        this.selectedValue = option.id;
                }
            },            
        },
        watch: {
            selectedValue: function (value) {                                
                this.$emit('item-selected', value);
            },
            endpoint: function (value) {
                this.loadOptions(value, this.resultFields, this.origem)
            },
        },
        mounted: function () {
            this.loadOptions(this.endpoint, this.resultFields, this.origem);
        }
    }
</script>