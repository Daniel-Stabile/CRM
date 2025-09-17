"use strict";
AGA.RevealHandles = (function () {

	function revealAssociationFieldsHandles() {
		$("input[data-type='association']").each(function () {

			if (isShowing($(this)))
				return;

            var widgetId = $(this).closest(".widget").attr("id");
            var widgets = Benner.Page.widgets.filter(function(x) { return x.id === widgetId; });
            if (widgets.length > 0) {
                var widgetObj = widgets[0];
                
                var campo = $(this).attr('data-field');
                var value = widgetObj.field(campo);
                var handle = "?";
                if(value != null)
                    handle = value.id;
                
                var spanHandle = $('<span></span>').text(campo + ': ' + handle)
                    .addClass('bold').css({ 'background-color': '#e0ebf9' });
                var span = $(this).closest('span');
                span.before(spanHandle);
            }
        });
	}

	function revealAggregationFieldsHandles() {
		$("input[data-type='aggregation']").each(function (index, obj) {

			var field = $(this).attr('data-field');		
			var handlesField = "";

            if (typeof obj !=="undefined" && obj !== null && obj.value !== null && obj.value !== "") {
                if (isShowing($(obj)))
                    return;

                var widgetId = $(this).closest(".widget").attr("id");
                var widgets = Benner.Page.widgets.filter(function(x) { return x.id === widgetId; });
                if (widgets.length > 0) {
                    var widgetObj = widgets[0];

                    var campo = $(this).attr('data-field');
                    var value = widgetObj.field(campo);
                    if (value != null) {
                        handlesField = value.reduce(function(acc, cur) {
                            if (acc !== '')
                                acc += ", ";
                            acc += cur.id;
                            return acc;
                        },'');
                    }
                        
                    if (handlesField === "")
                        return;

                    var spanHandles = $('<span></span>').text(field + ': ' + handlesField)
                        .addClass('bold').css({'background-color': '#e0ebf9' });
                    var span = $(this).closest('span');
                    span.before(spanHandles);
                }
            }
        });
	}

    function revealFormHandles() {
        var widgets = Benner.Page.widgets.filter(function(x) { return x.widgetType === "AjaxForm" });
        $(widgets).each(function(index, item) {
            if (isShowing($(item)))
                return;
            var spanHandle = $('<span></span>').text('HANDLE: ' + item.field('HANDLE')).addClass('bold').css({'background-color': '#e0ebf9' });
            $(item.el()).find(".widget-body").first().before(spanHandle);
        });
	}

	function revealGridHandles() {
		$("tr[handle]").each(function () {

			if (isShowing($(this)))
				return;

			var handle = $(this).attr('handle');
			var table = $(this).closest('table');
            
			var bodyTd = $('<td></td>').text(handle).addClass('info');
			$(this).find('td:first').before(bodyTd);

			if (!isShowing(table)) {
                var headerTd = $('<td></td>').text('HANDLE').addClass('info bold').css({ 'width': '70px' });
				table.find('th').eq($(bodyTd).index()).before(headerTd);
			}
		});
	}

	function isShowing(e) {
		if ($(e).attr('showmethehandles') === 'S')
			return true;
		$(e).attr('showmethehandles', 'S');
		return false;
	}

	return {
		showmethehandles: function () {
		    revealAssociationFieldsHandles();
		    revealAggregationFieldsHandles();
		    revealFormHandles();
		    revealGridHandles();
		}
	};
})();

AGA.showmethehandles = function () {
    AGA.RevealHandles.showmethehandles();
};