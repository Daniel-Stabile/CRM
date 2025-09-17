//var AGA = AGA || {};
AGA.Schedule = (function () {
    var CLASSES = {
        autoInit: "aga-autoinit",
        noPerson: "aga-no-schedule-person",
        needUpdate: "aga-need-update"
    };

    var SELECTOR = {
        calendar: ".aga-calendar",
        calendarBody: ".aga-calendar-body",
        calendarPlaceHolder: ".aga-calendar-placeholder",
        needUpdate: ".aga-need-update"
    };
    
    var isAllDay = function (mmt, mmtFim) {

        if (mmt.hour() !== 0 && mmt.minute() !== 0)
            return false;

        var fh = mmtFim.hour();
        if (fh !== 0 && fh !== 23)
            return false;
        var fm = mmtFim.minute();
        if (fm !== 0 && fm !== 59)
            return false;
        return true;
    };

    var getRoot = function (anyTarget) {
        return $(anyTarget).closest(SELECTOR.calendar);
    };

    var getLookupSchedule = function (root) {
        return $(root).find("[data-name='SCHEDULE_LOOKUP']");
    };

    var getLookupPerson = function (root) {
        return $(root).find("[data-name='SCHEDULE_PERSON']");
    };

    var hasPerson = function (lookupPerson) {
        return !$(lookupPerson).hasClass(CLASSES.noPerson);
    };

    var getModalUrl = function (schedule, event, person, date) {
        var dateStr = (date ? "&dt=" + date.format("YYYYMMDDHHmmss") : "");
        return AGA.Ajax.getUrlPath("aga/a/agenda/eventoagenda.aspx?imp=1" +
            "&s=" + schedule +
            "&pe=" + person +
            "&e=" + event +
            dateStr);
    };

    var tryShowNewEventButton = function(root) {
        var mustHide = ($(root).data("readonly") === "S") || ($(root).data("interval") === "S");
        $(".aga-schedule-new-event").toggleClass("hide", mustHide);
    };

    var unblock = function (anyTarget) {
        var root = getRoot(anyTarget);

        tryShowNewEventButton(root);

        if (!$(root).hasClass("blocked"))
            return;

        $(root).removeClass("blocked")
			.find(SELECTOR.calendarPlaceHolder).each(
            function (index, item) {
                AGA.Helper.unblockElement(item);
            });
    };

    var block = function (anyTarget) {
        var root = getRoot(anyTarget);
        if ($(root).hasClass("blocked"))
            return;

        $(root).addClass("blocked");
        AGA.Helper.blockElement($(root)
			.find(SELECTOR.calendarPlaceHolder)[0],
            "Selecione acima a agenda desejada");

        $(".aga-schedule-new-event").addClass("hide");
    };

    var canShowContent = function (anyTarget) {
        var root = getRoot(anyTarget);
        var lookupSchedule = getLookupSchedule(root);
        var mustBlock = (!lookupSchedule) || AGA.Lookup.isNull(lookupSchedule);
        //if (!mustBlock) {
        //    var lookupPerson = getLookupPerson(root);
        //    if (hasPerson(lookupPerson)) {
        //        mustBlock = AGA.Lookup.isNull(lookupPerson);
        //    }
        //}
        return !mustBlock;
    };

    var getCurrentInfo = function (anyTarget) {
        var root = getRoot(anyTarget);
        var lookupSchedule = getLookupSchedule(root);
        var lookupPerson = getLookupPerson(root);
        var person = hasPerson(lookupPerson) ? AGA.Lookup.getValue(lookupPerson) : 0;
        return {
            schedule: AGA.Lookup.getValue(lookupSchedule),
            person: person
        };
    };

    var getUnavailabilityText = function (period, title) {
        var rowTemplate = '<div class="row"><label class="col-md-3">%label%</label><div class="col-md-9 bold">%value%</div></div>';
        var buildRow = function (label, value) {
            return rowTemplate
                .replace("%label%", label)
                .replace("%value%", value);
        };

        return buildRow("Período:", period) + buildRow("Descrição:", title);
    };

    var updateSourceBuilder = function (root) {
        var myRoot = root;
        return function (start, end, utc, callback) {

            var show = canShowContent(myRoot);
            if (!show)
                callback([]);
            else {
                var info = getCurrentInfo(myRoot);
                info.start = start.format("DD/MM/YYYY");
                info.end = end.format("DD/MM/YYYY");

                $.ajax({
                    url: AGA.Ajax.getUrlPath("api/AGAAgendaProvider"),
                    data: info,
                    cache: false,
                    dataType: "json",
                    success: function (data) {
                        $(myRoot).data("hash", data.ScheduleHash);
                        $(myRoot).data("person", data.PersonHash);
                        $(myRoot).data("readonly", data.ReadOnly);
                        $(myRoot).data("interval", (data.Interval && data.Interval > 0) ? "S" : "N");

                        var events = data.Events.map(function (item) {
                            var startEvent = moment(item.Range.s);
                            var endEvent = moment(item.Range.e);
                            return {
                                id: item.Id,
                                start: startEvent,
                                end: endEvent,
                                title: item.Title,
                                allDay: isAllDay(startEvent, endEvent),
                                schedule: data.ScheduleHash,
                                person: data.PersonHash,
                                backgroundColor: "#69a4e0",
                                endOfScale: item.eos
                            };
                        });

                        if (data.Availabilities && data.Availabilities.length) {
                            for (var index = 0; index < data.Availabilities.length; index++) {
                                var range = data.Availabilities[index];
                                var startAvail = moment(range.s);
                                var endAvail = moment(range.e);
                                events.push(
                                    {
                                        id: "new",
                                        start: startAvail,
                                        end: endAvail,
                                        title: "Disponível",
                                        allDay: isAllDay(startAvail, endAvail),
                                        schedule: data.ScheduleHash,
                                        person: data.PersonHash,
                                        backgroundColor: "#1bbc9b",
                                        endOfScale: range.eos
                                    });
                            };
                        };

                        if (data.Unavailabilities && data.Unavailabilities.length) {
                            data.Unavailabilities.map(function (current) {
                                current.Ranges.map(function (range) {
                                    var startUn = moment(range.s);
                                    var endUn = moment(range.e);
                                    events.push(
                                        {
                                            id: "not",
                                            start: startUn,
                                            end: endUn,
                                            title: current.Title,
                                            rangeText: current.RangeText,
                                            allDay: isAllDay(startUn, endUn),
                                            backgroundColor: "#F3565D",
                                            resourceEditable: false,
                                            editable: false
                                        });
                                });
                            });
                        };

                        callback(events);
                        unblock(myRoot);
                    },
                    error: function (error) {
                        AGA.Helper.alert(AGA.Ajax.getErrorMessage(error));
                    }
                });
            }
        };
    };

    var updateContent = function (anyTarget) {
        var canUpdate = canShowContent(anyTarget);
        var root = getRoot(anyTarget);
        $(root).find(SELECTOR.calendarBody).fullCalendar("refetchEvents");
        if (canUpdate) {
            //unblock(anyTarget);
        } else {
            block(anyTarget);
        }
    };

    var scheduleChanged = function (e) {
        var url = "AgaAgendas/Agendado?agenda=" + e.value + "&_=" + new Date().getTime();
        url = AGA.Ajax.getUrlPath(url);
        $(".aga-schedule-scheduled").empty();
        $.get(url,
	        function (data) {
	            $(".aga-schedule-scheduled").html(data);
	            AGA.Lookup.initAll();
	            updateContent(e.currentTarget);
	        });
    };

    var scheduledPersonChanged = function (e) {
        updateContent(e.currentTarget);
    };

    var modalClose = function () {
        AGA.log("AGA.Schedule.modalClose");
        Benner.WidgetCommandsBar.disposeModal();
        $(SELECTOR.needUpdate).each(function (index, item) {
            $(item).removeClass(CLASSES.needUpdate);
            updateContent(item);
        });
    };

    var openModal = function (url) {
        AGA.log("AGA.Schedule.openModal");
        var config = {
            url: url,
            id: "aga-schedule-modal",
            size: "large",
            height: 750,
            displayFooter: false,
            displayTitle: false,
            title: ""
        };

        Benner.ModalPage.show(config,
            Benner.WidgetCommandsBar.openModal,
            modalClose);
    };

    var getConfig = function (root) {
        return {
            header: {
                //left: "prev,next today",
                left: "title",
                center: "",
                right: "prev,next today,agendaDay,agendaWeek,month"
            },
            monthNames: [
	            "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro",
	            "Novembro", "Dezembro"
            ],
            monthNamesShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
            dayNames: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"],
            dayNamesShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"],
            timeFormat: "HH:mm ",
            axisFormat: "HH:mm",
            allDayText: "Hora",
            lazyFetching: false,
            buttonText: {
                today: "Hoje",
                month: "Mês",
                week: "Semana",
                day: "Dia"
            },
            displayEventTime: false,
            slotDuration: "00:15:00",
            scrollTime: "06:00:00",
            columnFormat: {
                day: "ddd DD/MM",
                week: "ddd DD/MM",
                month: "ddd"
            },
            titleFormat: {
                month: "MMMM/YYYY",
                day: "ddd - DD/MM/YYYY",
                week: "DD/MM/YYYY"
            },
            eventSources: [updateSourceBuilder(root)],

            eventRender: function (event, element) {
                if (event.allDay) {
                    $(element).find(".fc-time").addClass("hide");
                }
                if (event.id === "not") {
                    $(element).find(".fc-time").text(event.start.format("HH:mm") +" - "+ event.end.format("HH:mm"));
                }


                if (event.endOfScale) {
                    $(element).css("border-bottom", "solid 2px #F3565D");
                } else {
                    $(element).css("border-bottom", "solid 1px #eee");
                }
            },
            eventClick: function (calEvent) {

                // alert('Event: ' + calEvent.schedule);
                // alert('Id: ' + calEvent.id);
                // alert('View: ' + view.name);

                if (calEvent.schedule) {
                    var url = getModalUrl(calEvent.schedule, calEvent.id, calEvent.person, calEvent.start);
                    openModal(url);
                } else {
                    AGA.Helper.alert("Indisponibilidade", getUnavailabilityText(calEvent.rangeText, calEvent.title));
                }
            }

        };

    };

    var initAll = function () {
        $(".aga-calendar").each(function (index, item) {
            $(item).removeClass(CLASSES.autoInit);
            $(item).find(SELECTOR.calendarBody).fullCalendar(getConfig(item));
            block(item);
        });
    };

    var needUpdate = function () {
        AGA.log("AGA.Schedule.needUpdate call");
        $(SELECTOR.calendar).addClass(CLASSES.needUpdate);
    };

    var newEvent = function (e) {
        var root = getRoot(e);
        var schedule = $(root).data("hash");
        var person = $(root).data("person");
        var url = getModalUrl(schedule, "new", person);
        openModal(url);
    };

    return {
        initAll: initAll,
        scheduleChanged: scheduleChanged,
        scheduledPersonChanged: scheduledPersonChanged,
        needUpdate: needUpdate,
        newEvent: newEvent
    };

})();

$(document).ready(function () { AGA.Schedule.initAll(); });