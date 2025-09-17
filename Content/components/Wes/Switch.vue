<template>
    <input type="checkbox" v-model="value"> 
</template>
<script>
    export default {
        props: {
            value: {
                default: false
            },
            size: {
                default: "mini"
            },
            onText: {
                default: "sim"
            },
            offText: {
                default: "não"
            }
        },
        data: function () {
            return {    
                valor: this.value
            }        
        },
        methods: {

        },
        mounted: function () {
            let vm = this;
            window.$(this.$el).bootstrapSwitch({
                'size': this.size,
                'onText': this.onText,
                'offText': this.offText,
                'onSwitchChange': function (event, state) {
                    vm.$emit("change", { event: event, state: state });
                },
                'AnotherName': 'AnotherValue'
            });
        }
    }
</script>