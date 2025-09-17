/* global AGA */
AGA.Text = (function () {

    // Obter implementação base
    var baseMethods = AGA.BaseInputControl();
    var publicMethods = $.extend({}, baseMethods);

    // customizações
    publicMethods.getControlClass = function () { return "aga-text" };

    // retornar implementação final
    return publicMethods;

})();

AGA.Form.addControl(AGA.Text);
