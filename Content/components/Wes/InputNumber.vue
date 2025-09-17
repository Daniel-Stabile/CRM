<template>
    <div class="form-group">
        <label class="control-label name column-nowrap">
            <div class="label-form">
                <div class="label-title">
                    {{inputLabel}}
                </div>
            </div>
        </label>
        <span>
            <input type="number" class="form-control" min="1" :id="inputId" :class="inputClass" v-model.number="value" @input="valueChanged">
        </span>
    </div>
</template>

<script>
    export default {
        props: ['inputId', 'inputClass', 'inputLabel'],
        data() {
            return {
                value: '1'
            }
        },
        methods: {
            valueChanged() {
                this.$emit('updated', { value: this.value });
            } 
        } 
    }
</script>

<style>
</style>