<template>
    <div v-if="message" :class="getAlertClass()">
        <button type="button" class="close" @click="close"></button>
        <strong>{{title}}</strong> {{getMessage()}}
    </div>
</template>
<script>
    export default {
        props: ["title", "message", "type"],
        watch: {
            message: function (message) {
                window.$(this.$el).collapse("show");
            }
        },
        methods: {
            getMessage() {
                if (this.message && this.message.ExceptionMessage)
                    return this.message.ExceptionMessage;

                return this.message;
            },
            getAlertClass: function() {
                return "collapse in alert alert-" + this.type;
            },
            close: function () {
                window.$(this.$el).collapse("hide");
            }
        }
    }
</script>