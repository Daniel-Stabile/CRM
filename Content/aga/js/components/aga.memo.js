/* global AGA */
AGA.Memo = (function () {

    // Obter implementação base
    var baseMethods = AGA.BaseInputControl();
    var publicMethods = $.extend({}, baseMethods);

    // customizações
    publicMethods.getControlClass = function () { return "aga-memo"; };

    // retornar implementação final
    return publicMethods;

})();

AGA.Form.addControl(AGA.Memo);
