/* global AGA */
// Inicializações quando o documento está pronto
(function () {

    $(document).ready(function () {
        AGA.Menu.init();
        AGA.Lookup.initAll();
        AGA.Grid.initAll();
        AGA.Form.initAll();
    });
})();
