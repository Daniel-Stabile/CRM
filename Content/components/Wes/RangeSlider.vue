<template>
    <div></div>
</template>
<script>
    export default {
        props: {                
            value: {},
            min: {
                default : 0
            },
            max: {
                default: 100
            },
            orientation: {
                default: 'horizontal'
            },
            step: {
                default: 1
            },
            tootip: {
                default: false
            }
        },
        mounted: function () {
            let vm = this;
            noUiSlider.create(this.$el, {
                start: [this.value],
                orientation: this.orientation,
                step: this.step,
                tooltips: this.tootip,
                range: {
                    'min': this.min,
                    'max': this.max
                },
            });
            this.$el.noUiSlider.on('update', function (arg) {
                vm.$emit("change", { value: arg });
            });
        }
    }
</script>