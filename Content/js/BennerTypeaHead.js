Benner.TypeaHead = function () {

    var datasetFields = function () {

        var entityView = document.querySelector(".typeahead-source-view");
        if (entityView !== null && entityView.options !== undefined && entityView.selectedIndex !== -1) {


            var fieldsView = new Bloodhound({
                datumTokenizer: Bloodhound.tokenizers.whitespace,
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                identify: function (obj) { return obj.Name; },
                prefetch: Benner.Page.getApplicationPath() + 'api/views/' + entityView.options[0].text + '/fields',
                remote: {
                    url: Benner.Page.getApplicationPath() + 'api/views/' + entityView.options[0].text + '/fields/%FILTER',
                    wildcard: '%FILTER'
                }
            });

            fieldsView.initialize();

            function getWithSuggestions(query, sync, async) {
                if (query === '') {
                    sync(fieldsView.all());
                } else {
                    fieldsView.search(query, sync, async);
                }
            }

            var datasetField = {
                name: 'fieldsView',
                displayKey: 'Name',
                source: getWithSuggestions,
                templates: {
                    header: '<h5>Campos da visão</h5>'
                }
            };

            return datasetField;
        } else {
            console.log("Não encontrado 'typeahead-field-origin' no HTML");
            return null;
        }
    };

    var datasetColors = function () {
        var colorMetronic = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/Color/prefetch',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/Color?filter=%FILTER',
                wildcard: '%FILTER'
            }
        });

        colorMetronic.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(colorMetronic.all());
            } else {
                colorMetronic.search(query, sync, async);
            }
        }

        var datasetColor = {
            name: 'colors',
            source: getWithSuggestions,
            templates: {
                suggestion: function (item) {
                    return '<div><span class="bg-' + item + ' typeahead-color">&nbsp;</span><span>' + item + '</span></div>';
                }
            }
        };

        return datasetColor;
    };

    var datasetFontIcons = function () {
        var fontIconMetronic = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/FontIcons/prefetch',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/FontIcons?filter=%FILTER',
                wildcard: '%FILTER'
            }
        });

        fontIconMetronic.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(fontIconMetronic.all());
            } else {
                fontIconMetronic.search(query, sync, async);
            }
        }

        var datasetFontIcon = {
            name: 'fontIcons',
            source: getWithSuggestions,
            templates: {
                suggestion: function (item) {
                    return "<div><i class='" + item + "' /> " + item + "</div>";
                }
            }
        };

        return datasetFontIcon;
    };

    return {

        init: function () {
            var listTypeahead = document.querySelectorAll(".typeahead");
            if (listTypeahead.length === 0)
                return;

            for (var i = 0; i < listTypeahead.length; i++) {

                var typeahead = listTypeahead[i];
                var classNames = typeahead.className;
                var arrayDatasets = new Array();

                if (classNames.indexOf("typeahead-color") !== -1) {
                    var datasetColor = datasetColors();
                    arrayDatasets.push(datasetColor);
                }

                if (classNames.indexOf("typeahead-fonticon") !== -1) {
                    var datasetFontIcon = datasetFontIcons();
                    arrayDatasets.push(datasetFontIcon);
                }

                if (classNames.indexOf("typeahead-fields") !== -1) {
                    var datasetField = datasetFields();
                    if (datasetField !== null) {
                        //Limpa o template de cabeçalho padrão
                        if (arrayDatasets.length === 0)
                            datasetField.templates.header = "";

                        arrayDatasets.push(datasetField);
                    }
                }

                $(typeahead).typeahead("destroy");
                $(typeahead).typeahead({ highlight: true, minLength: 0, }, arrayDatasets);
            }
        }
    }
}();