<%@ Page Title="Configuração de agendamento" Language="C#" CodeFile="~/aga/e/Contabil/Conciliacao/CadastroAgendamento.aspx.cs" Inherits="CadastroAgendamento" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <style>
        .left {
            float: left;
        }

        .txt {
            width: 20%;
        }

        .right {
            text-align: right !important;
        }
    </style>


    <div id="ContentPanel" class="page-content ui-sortable" style="min-height: 525px;">

        <div class="row">
            <div id="ctl00_Main_CONFIGURAODOAGENDAMENTO">
                <div widget-type="AjaxForm" class="col-md-12 widget " id="CONFIGURAODOAGENDAMENTO" page-id="7471" entityviewname="CT_REGRACONCILIACAOAGENDAMENTO.FORM" order="20">
                    <div class="btn-group btn-group-solid developer-toolbar developer-item-shadow">
                        <button type="button" class="btn btn-sm grey-steel drag-handle ui-sortable-handle" title="Mover o widget"><i class="fa fa-arrows"></i></button>
                        <div class="btn-group btn-group-solid">
                            <button type="button" data-toggle="dropdown" data-delay="100" data-close-others="true" aria-haspopup="true" aria-expanded="false" class="btn btn-sm grey-steel dropdown-toggle dropdown-hover hover-initialized" onclick="javascript:;"><i class="fa fa-wrench"></i><i class="fa fa-angle-down"></i></button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a class="" href="/webApp/SiteSettings/View.aspx?p=1&amp;name=CT_REGRACONCILIACAOAGENDAMENTO.FORM&amp;imp=1&amp;imn=1"><i class="icon-info"></i>CT_REGRACONCILIACAOAGENDAMENTO.FORM</a></li>
                                <li><a class="" href="/webApp/SiteSettings/FormEditor.aspx?p=1&amp;view=CT_REGRACONCILIACAOAGENDAMENTO.FORM&amp;lyr=20&amp;imp=1&amp;imn=1"><i class="icon-magic-wand"></i>Editar campos</a></li>
                                <li><a class="" href="/webApp/SiteSettings/ScriptEditor.aspx?p=1&amp;view=CT_REGRACONCILIACAOAGENDAMENTO.FORM&amp;lyr=20&amp;imp=1&amp;imn=1"><i class="fa fa-file-code-o"></i>Editar scripts</a></li>
                                <li><a class="" href="/webApp/SiteSettings/CommandsEditor.aspx?p=1&amp;view=CT_REGRACONCILIACAOAGENDAMENTO.FORM&amp;lyr=20&amp;imp=1&amp;imn=1"><i class="icon-energy"></i>Editar comandos</a></li>
                                <li><a class="" href="../../../SiteSettings/AuthorizationEntityTasks.aspx?p=1&amp;imp=1&amp;imn=1&amp;pst=7d4e1ba4-46d2-496d-8a42-c65316c8ec0f"><i class="fa fa-unlock-alt"></i>Associar autorização</a></li>
                                <li><a class="" href="../../../SiteSettings/Entity.aspx?p=1&amp;key=CT_REGRACONCILIACAOAGENDAMENTO&amp;imp=1&amp;imn=1"><i class="icon-eyeglasses"></i>Definição de entidade</a></li>
                            </ul>
                        </div>
                        <button type="button" class="btn btn-sm grey-steel" title="Propriedades do formulário" onclick="javascript:Benner.WidgetCommandsBar.prepareModal('/webApp/SiteSettings/WidgetAttributes.aspx?p=1&amp;imp=1&amp;pst=663df921-1b9c-4b52-bdf2-b13ff93cbb51', '', 'Large');"><i class="icon-note"></i></button>
                        <button type="button" class="btn btn-sm grey-steel remove-widget" title="Remover o widget"><i class="fa fa-close"></i></button>
                    </div>
                    <div class="resize-width-container"><a class="btn btn-sm grey-steel resize-width-handle developer-item-shadow" style="display: none;"><i class="fa fa-arrows-h"></i></a><span class="badge badge-info current-column" style="display: none; float: left; top: 50%;">col-md-12</span></div>
                    <div class="portlet light" id="portlet_CONFIGURAODOAGENDAMENTO">
                        <div class="portlet-title">
                            <div class="caption">
                                <span class="caption-subject font-green-sharp bold uppercase">Configuração do agendamento</span>
                            </div>
                            <div class="actions">
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <div class="widget-body" data-widget-id="CONFIGURAODOAGENDAMENTO">
                                <div>
                                    <span id="ctl00_Main_CONFIGURAODOAGENDAMENTO_ctl01"></span>
                                </div>
                                <div id="ctl00_Main_CONFIGURAODOAGENDAMENTO_ctl04">
                                    <div id="ctl00_Main_CONFIGURAODOAGENDAMENTO_toolbar" class="form-actions top nobg no-border commands-bar fluid list-commands-bar">
                                        <a id="btnSalvar" class="btn blue btn-save command-action predef-action editable" title="Ctrl + Enter"><i class="fa fa-check btn-action"></i>Salvar</a>
                                        <a id="btnAgendar" class="btn green btn-save command-action predef-action editable " title="Agendar"><i class="fa fa-calendar-check-o btn-action"></i>Agendar</a>
                                        <a id="btnParar" class="btn red-intense command-action predef-action editable" title="Parar agendamento"><i class="fa fa-calendar-times-o btn-action"></i>Parar agendamento</a>
                                        <a href="javascript:__doPostBack('ctl00$Main$CONFIGURAODOAGENDAMENTO','Cancel')" class="btn grey-silver btn-cancel command-action predef-action editable" title="Esc"><i class="fa fa-times btn-action"></i>Cancelar</a>
                                    </div>
                                    <!-- Mensagem, NÃO apagar -->
                                    <div id="message" class="alert">
                                        <button class="close" data-dismiss="alert"></button>
                                        <span></span>
                                    </div>

                                    <div class="widget-context developer" style="display: none;">
                                        <a id="ctl00_Main_CONFIGURAODOAGENDAMENTO_ChromeStateChangeButton" href="javascript:__doPostBack('ctl00$Main$CONFIGURAODOAGENDAMENTO$ChromeStateChangeButton','')">ChromeState</a>
                                    </div>
                                    <input type="hidden" name="ctl00$Main$CONFIGURAODOAGENDAMENTO$SelectedTab" id="ctl00_Main_CONFIGURAODOAGENDAMENTO_SelectedTab" value="0"><div style="display: none;">
                                        <input type="submit" name="ctl00$Main$CONFIGURAODOAGENDAMENTO$FireFieldEventButton" value="FireFieldEvent" id="ctl00_Main_CONFIGURAODOAGENDAMENTO_FireFieldEventButton" uniqueid="ctl00$Main$CONFIGURAODOAGENDAMENTO$FireFieldEventButton">
                                    </div>
                                    <span id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_HANDLE">
                                        <input name="ctl00$Main$CONFIGURAODOAGENDAMENTO$formView$HANDLE_HiddenField" type="hidden" id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_HANDLE_HiddenField" value="-1" data-field="HANDLE" data-type="hidden"></span><span id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_
                                            SA"><input name="ctl00$Main$CONFIGURAODOAGENDAMENTO$formView$EMPRESA_HiddenField" type="hidden" id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_EMPRESA_HiddenField" value="12" data-field="EMPRESA" data-type="hidden"></span><div id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_PageControl">
                                                <div class="tab-content allow-focus borderless">
                                                    <div class="tab-pane active" id="CONFIGURAODOAGENDAMENTO_GERAL">
                                                        <div id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_PageControl_GERAL_GERAL" class="form-body form-horizontal">
                                                            <div class="form-group">
                                                                <div class="col-md-12 col-sm-12">
                                                                    <h4 id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_PageControl_GERAL_GERAL_GRUPOINFORMACOES" class="form-section">Informações
                                                                    </h4>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-2 col-sm-2">
                                                                            <div class="label-form">
                                                                                <div class="label-title">
                                                                                    Regra de Conciliação:
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                        <div class="col-md-4 col-sm-4 value">
                                                                            <input type="text" id="regraConciliacao" name="regraConciliacao" runat="server" value="" readonly="readonly" class="form-control " />
                                                                        </div>
                                                                        <label class="control-label col-md-2 col-sm-2">
                                                                            <div class="label-form">
                                                                                <div class="label-title">
                                                                                    Ultima Execução:
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                        <div class="col-md-4 col-sm-4 value">
                                                                            <div id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_PageControl_GERAL_GERAL_ULTIMAEXECUCAO">
                                                                                <div>
                                                                                    <input name="ctl00$Main$CONFIGURAODOAGENDAMENTO$formView$PageControl$GERAL$GERAL$ULTIMAEXECUCAO_DATE" type="text" readonly="readonly" id="ultimaExecucao" runat="server" class="form-control datepicker placeholder-no-fix " data-field="ULTIMAEXECUCAO" data-type="date" data-label="Ultima Execução:">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <input name="handleAgendamento" type="hidden" id="handleAgendamento" value="0" runat="server">
                                                                    <input name="handleRegraConciliacaoAgendamento" type="hidden" id="handleRegraConciliacaoAgendamento" runat="server">

                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-2 col-sm-2">
                                                                            <div class="label-form">
                                                                                <div class="label-title">
                                                                                    Forma de Execução
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                        <div class="col-md-4 col-sm-4 value">
                                                                            <span id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_PageControl_GERAL_GERAL_FORMAEXECUCAO">
                                                                                <input name="ctl00$Main$CONFIGURAODOAGENDAMENTO$formView$PageControl$GERAL$GERAL$FORMAEXECUCAO_TEXTBOX" type="text" readonly="readonly" id="formaExecucao" runat="server" class="form-control " key="" data-field="FORMAEXECUCAO" data-label="Forma de Execução"></span>
                                                                        </div>
                                                                        <label class="control-label col-md-2 col-sm-2">
                                                                            <div class="label-form">
                                                                                <div class="label-title">
                                                                                    Executado por
                                                                                </div>
                                                                            </div>
                                                                        </label>
                                                                        <div class="col-md-4 col-sm-4 value">
                                                                            <span id="ctl00_Main_CONFIGURAODOAGENDAMENTO_formView_PageControl_GERAL_GERAL_EXECUTADOPOR">
                                                                                <input name="ctl00$Main$CONFIGURAODOAGENDAMENTO$formView$PageControl$GERAL$GERAL$EXECUTADOPOR_TEXTBOX" type="text" maxlength="100" readonly="readonly" id="executadoPor" runat="server" class="form-control " data-field="EXECUTADOPOR" data-label="Executado por"></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="portlet-body">
                                                            <div class="tabbable-line">
                                                                <ul class="nav nav-tabs ">
                                                                    <li class="active">
                                                                        <a href="#tabAgendamento" data-toggle="tab" aria-expanded="true">Agendamento </a>
                                                                    </li>
                                                                    <li class="">
                                                                        <a href="#tabEmail" data-toggle="tab" aria-expanded="false">E-mail </a>
                                                                    </li>
                                                                </ul>
                                                                <div class="tab-content">
                                                                    <div class="tab-pane active" id="tabAgendamento">
                                                                        <div class="row">

                                                                            <div class="col-md-12">
                                                                                <div class="portlet-body">
                                                                                    <div class="tabbable-line">
                                                                                        <ul class="nav nav-tabs ">
                                                                                            <li class="active">
                                                                                                <a href="#tabUmaVez" data-toggle="tab" aria-expanded="true" data-number="1">Uma Vez </a>
                                                                                            </li>
                                                                                            <li>
                                                                                                <a href="#tabDiario" data-toggle="tab" aria-expanded="false" data-number="2">Diario </a>
                                                                                            </li>
                                                                                            <li>
                                                                                                <a href="#tabSemanal" data-toggle="tab" aria-expanded="false" data-number="3">Semanal </a>
                                                                                            </li>
                                                                                            <li>
                                                                                                <a href="#tabMensal" data-toggle="tab" aria-expanded="false" data-number="4">Mensal </a>
                                                                                            </li>
                                                                                            <li>
                                                                                                <a href="#tabIntervalo" data-toggle="tab" aria-expanded="false" data-number="6">Intervalo </a>
                                                                                            </li>

                                                                                        </ul>
                                                                                        <div class="tab-content">
                                                                                            <div class="tab-pane active" id="tabUmaVez">
                                                                                                <div class="row">
                                                                                                    <div class="col-md-6 col-xs-6 col-lg-6">
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-3 col-xs-3 col-lg-3 control-label right">Data<em class="required" aria-required="true">* </em></label>
                                                                                                            <div class="col-md-9 col-xs-9 col-lg-9">
                                                                                                                <div class="input-group">
                                                                                                                    <input name="dataUmaVez" type="text" maxlength="10" id="dataUmaVez" class="form-control datepicker" placeholder="dd/mm/aaaa" data-date-format="dd/mm/yyyy" data-type="date">
                                                                                                                    <span class="input-group-btn">
                                                                                                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                                                                                    </span>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                    <div class="col-md-6 col-xs-6 col-lg-6">
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-3 col-xs-3 col-lg-3 control-label right">Hora<em class="required" aria-required="true">* </em></label>
                                                                                                            <div class="col-md-9 col-xs-9 col-lg-9">
                                                                                                                <div class="input-group">
                                                                                                                    <input name="horaUmaVez" type="text" maxlength="8" id="horaUmaVez" class="form-control timepicker placeholder-no-fix" placeholder="hh:mm:ss" data-show-seconds="true">
                                                                                                                    <span class="input-group-btn">
                                                                                                                        <button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
                                                                                                                    </span>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="tab-pane" id="tabDiario">
                                                                                                <div class="row">
                                                                                                    <div class="col-md-6 col-xs-6 col-lg-6">
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-3 col-xs-3 col-lg-3 control-label right">Hora<em class="required" aria-required="true">* </em></label>
                                                                                                            <div class="col-md-9 col-xs-9 col-lg-9">
                                                                                                                <div class="input-group">
                                                                                                                    <input name="horaDiario" type="text" maxlength="8" id="horaDiario" class="form-control timepicker" placeholder="hh:mm:ss" data-show-seconds="true">
                                                                                                                    <span class="input-group-btn">
                                                                                                                        <button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
                                                                                                                    </span>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="tab-pane" id="tabSemanal">
                                                                                                <div class="form-group">
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-12 col-xs-12 col-lg-12">
                                                                                                            <label class="col-md-2 col-xs-2 col-lg-2 control-label right">Hora<em class="required" aria-required="true">* </em></label>
                                                                                                            <div class="col-md-4 col-xs-4 col-lg-4">
                                                                                                                <div class="input-group">
                                                                                                                    <input name="horaSemanal" type="text" maxlength="8" id="horaSemanal" class="form-control timepicker" placeholder="hh:mm:ss" data-show-seconds="true">
                                                                                                                    <span class="input-group-btn">
                                                                                                                        <button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
                                                                                                                    </span>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>

                                                                                                <div class="row">
                                                                                                    <div class="col-md-12 col-xs-12 col-lg-12">
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-2 col-xs-2 col-lg-2 control-label right">Dias<em class="required" aria-required="true">* </em></label>
                                                                                                            <div id="semanal" class="bit-control col-md-10 col-xs-10 col-lg-10" data-type="bit">
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxSemanalDomingo" type="checkbox" name="checkBoxSemanalDomingo">
                                                                                                                    <label for="checkBoxSemanalDomingo">Domingo</label><span></span>
                                                                                                                </label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxSemanalSegunda" type="checkbox" name="checkBoxSemanalSegunda"><label for="checkBoxSemanalSegunda"> Segunda</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxSemanalTerca" type="checkbox" name="checkBoxSemanalTerca"><label for="checkBoxSemanalTerca"> Terça</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxSemanalQuarta" type="checkbox" name="checkBoxSemanalQuarta"><label for="checkBoxSemanalQuarta"> Quarta</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxSemanalQuinta" type="checkbox" name="checkBoxSemanalQuinta"><label for="checkBoxSemanalQuinta"> Quinta</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxSemanalSexta" type="checkbox" name="checkBoxSemanalSexta"><label for="checkBoxSemanalSexta"> Sexta</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxSemanalSabado" type="checkbox" name="checkBoxSemanalSabado"><label for="checkBoxSemanalSabado"> Sábado</label><span></span></label>
                                                                                                            </div>

                                                                                                        </div>
                                                                                                    </div>


                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="tab-pane" id="tabMensal">
                                                                                                <div class="form-group">
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-12 col-xs-12 col-lg-12">
                                                                                                            <label class="col-md-2 col-xs-2 col-lg-2 control-label right">Hora<em class="required" aria-required="true">* </em></label>
                                                                                                            <div class="col-md-4 col-xs-4 col-lg-4">
                                                                                                                <div class="input-group">
                                                                                                                    <input name="horaMensal" type="text" maxlength="8" id="horaMensal" class="form-control timepicker" placeholder="hh:mm:ss" data-show-seconds="true">
                                                                                                                    <span class="input-group-btn">
                                                                                                                        <button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
                                                                                                                    </span>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>

                                                                                                <div class="form-group">
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-12 col-xs-12 col-lg-12">
                                                                                                            <label class="col-md-2 col-xs-2 col-lg-2 control-label right">Mêses<em class="required" aria-required="true">* </em></label>
                                                                                                            <div id="diasSemanal" class="bit-control col-md-10 col-xs-10 col-lg-10">
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalJaneiro" type="checkbox" name="checkBoxMensalJaneiro"><label for="checkBoxMensalJaneiro"> Janeiro</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalFevereiro" type="checkbox" name="checkBoxMensalFevereiro"><label for="checkBoxMensalFevereiro"> Fevereiro</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalMarco" type="checkbox" name="checkBoxMensalMarco"><label for="checkBoxMensalMarco"> Março</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalAbril" type="checkbox" name="checkBoxMensalAbril"><label for="checkBoxMensalAbril"> Abril</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalMaio" type="checkbox" name="checkBoxMensalMaio"><label for="checkBoxMensalMaio"> Maio</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalJunho" type="checkbox" name="checkBoxMensalJunho"><label for="checkBoxMensalJunho"> Junho</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalJulho" type="checkbox" name="checkBoxMensalJulho"><label for="checkBoxMensalJulho"> Julho</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalAgosto" type="checkbox" name="checkBoxMensalAgosto"><label for="checkBoxMensalAgosto"> Agosto</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalSetembro" type="checkbox" name="checkBoxMensalSetembro"><label for="checkBoxMensalSetembro"> Setembro</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalOutubro" type="checkbox" name="checkBoxMensalOutubro"><label for="checkBoxMensalOutubro"> Outubro</label><span></span></label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalNovembro" type="checkbox" name="checkBoxMensalNovembro">
                                                                                                                    <label for="checkBoxMensalNovembro">Novembro</label><span></span>
                                                                                                                </label>
                                                                                                                <label class="boolean-control mt-checkbox mt-checkbox-outline">
                                                                                                                    <input id="checkBoxMensalDezembro" type="checkbox" name="checkBoxMensalDezembro">
                                                                                                                    <label for="checkBoxMensalDezembro">Dezembro</label>
                                                                                                                    <span></span>
                                                                                                                </label>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="tab-pane" id="tabIntervalo">
                                                                                                <div class="row">
                                                                                                    <div class="col-md-6 col-xs-6 col-lg-6">
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-3 col-xs-3 col-lg-3 control-label right">Hora<em class="required" aria-required="true">* </em></label>
                                                                                                            <div class="col-md-9 col-xs-9 col-lg-9">
                                                                                                                <div class="input-group">
                                                                                                                    <input name="horaIntervalo" type="text" maxlength="8" id="horaIntervalo" class="form-control timepicker" placeholder="hh:mm:ss" data-show-seconds="true">
                                                                                                                    <span class="input-group-btn">
                                                                                                                        <button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button>
                                                                                                                    </span>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="tab-pane" id="tabEmail">
                                                                        <div class="form-group">
                                                                            <div class="row">

                                                                                <label class="control-label col-md-2 col-sm-2 rigth">
                                                                                    <div class="label-form">
                                                                                        <div class="label-title">Enviar e-mail</div>
                                                                                    </div>
                                                                                </label>
                                                                                <div class="col-md-4 col-sm-4 value">
                                                                                    <span id="enviarEmail">
                                                                                        <select name="opcoesEnviarEmail" id="opcoesEnviarEmail" class="form-control">
                                                                                            <option value="-1">(nenhum)</option>
                                                                                            <option value="1">Apenas quando a conciliação apresentar divergências</option>
                                                                                            <option value="2">Sempre que for executada a conciliação</option>
                                                                                        </select>
                                                                                    </span>
                                                                                </div>

                                                                                <label class="control-label col-md-2 col-sm-2 right">
                                                                                    <div class="label-form">
                                                                                        <div class="label-title">Aos usuários</div>
                                                                                    </div>
                                                                                </label>
                                                                                <div class="col-md-4 col-sm-4 value">
                                                                                    <input type="text" id="usuarios" class="form-control" maxlength="190">
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <label class="control-label col-md-2 col-sm-2">
                                                                                    <div class="label-form">
                                                                                        <div class="label-title">Assunto: </div>
                                                                                    </div>
                                                                                </label>
                                                                                <div class="col-md-4 col-sm-4 value">
                                                                                    <input type="text" id="assunto" class="form-control" maxlength="190">
                                                                                </div>

                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <label class="control-label col-md-2 col-sm-2">
                                                                                    <div class="label-form">
                                                                                        <div class="label-title">Descrição:</div>
                                                                                    </div>
                                                                                </label>
                                                                                <div class="col-md-10 col-sm-10 value">
                                                                                    <span id="descricaoEmail">
                                                                                        <textarea name="descricaoEmailTexto" rows="5" cols="60" id="descricaoEmailTexto" class="form-control " data-field="DESCRICAOEMAIL"></textarea></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <label class="control-label col-md-2 col-sm-2">
                                                                                    <div class="label-form">
                                                                                        <div class="label-title">Anexo relatório apresentando</div>
                                                                                    </div>
                                                                                </label>
                                                                                <div class="col-md-4 col-sm-4 value">
                                                                                    <span id="anexarRelatorio">

                                                                                        <select name="opcoesanexarRelatorio" id="opcoesanexarRelatorio" class="form-control " data-field="ANEXORELATORIO">
                                                                                            <option value="-1">(nenhum)</option>
                                                                                            <option value="1">Não anexar o relatório</option>
                                                                                            <option value="2">Todas as movimentações</option>
                                                                                            <option value="3">Apenas com documento conciliados</option>
                                                                                            <option value="4">Apenas com documento não conciliados</option>
                                                                                        </select>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="col-md-6 col-sm-6"></div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                </div>
                                <div class="form-actions bottom nobg no-border commands-bar fluid footer-commands-bar hide"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">

            var htmlMessage = null;
            $(function () {
                $("#message").hide();

                $('input[type="checkbox"]').each(function (i, cmp) {
                    $(cmp).val('false')
                })

                $('input[type="checkbox"]').click(function () {

                    $(this).val(this.checked)
                })


                BuscarDadosRegraConciliacao();
            })

            $('#btnAgendar').click(function () {
                if (htmlMessage == null) {
                    htmlMessage = $('<div>').append($('#message').clone()).html();
                }

                $('#message').remove();
                var x = GerarObjeto();

                $.ajax({
                    type: "POST",
                    url: Benner.Page.getApplicationPath() + 'Conciliacao/AgendarConciliacao',
                    data: x,
                    dataType: "json",
                    success: function (data) {

                        $(htmlMessage).insertAfter($('#ctl00_Main_CONFIGURAODOAGENDAMENTO_toolbar'));
                        $('#message').show();

                        console.log($('#message'));

                        if (data == true) {
                            $('#message').addClass('alert-info').find('span').text("Agendamento agendado com sucesso!");
                        }
                        else {
                            $('#message').addClass('alert-warning').find('span').text(data);
                        }
                    },
                    error: function (xhr, textStatus, error) {
                        console.log(error);
                    }
                });
            })

            $('#btnParar').click(function () {
                if (htmlMessage == null) {
                    htmlMessage = $('<div>').append($('#message').clone()).html();
                }

                $('#message').remove();
                var x = GerarObjeto();

                $.ajax({
                    type: "POST",
                    url: Benner.Page.getApplicationPath() + 'Conciliacao/PararAgendamento',
                    data: x,
                    dataType: "json",
                    success: function (data) {

                        $(htmlMessage).insertAfter($('#ctl00_Main_CONFIGURAODOAGENDAMENTO_toolbar'));
                        $('#message').show();

                        console.log($('#message'));

                        if (data == true) {
                            $('#message').addClass('alert-info').find('span').text("Agendamento parado com sucesso!");
                        }
                        else {
                            $('#message').addClass('alert-warning').find('span').text(data);
                        }
                    },
                    error: function (xhr, textStatus, error) {
                        console.log(error);
                    }
                });
            })


            $('#btnSalvar').click(function () {
                if (htmlMessage == null)
                {
                    htmlMessage = $('<div>').append($('#message').clone()).html();
                }

                $('#message').remove();
                var x = GerarObjeto();
                
                $.ajax({
                    type: "POST",
                    url: Benner.Page.getApplicationPath() + 'Conciliacao/SalvarAgendamentoConciliacao',
                    data: x,
                    dataType: "json",
                    success: function (data) {
                       
                        $(htmlMessage).insertAfter($('#ctl00_Main_CONFIGURAODOAGENDAMENTO_toolbar'));
                        $('#message').show();

                        console.log($('#message'));

                        if (data == true) {
                            $('#message').addClass('alert-info').find('span').text("Salvo!");
                        }
                        else {
                            $('#message').addClass('alert-warning').find('span').text(data);
                        }
                    },
                    error: function (xhr, textStatus, error) {
                        console.log(error);
                    }
                });
            })

            function GerarObjeto() {

                var objetoDaFabrica = new Object();

                objetoDaFabrica.regraConciliacao = $('#ctl00_Main_regraConciliacao').val();

                objetoDaFabrica.dataUmaVez = $('#dataUmaVez').val();
                objetoDaFabrica.horaUmaVez = $('#horaUmaVez').val();

                objetoDaFabrica.horaDiario = $('#horaDiario').val();

                objetoDaFabrica.horaSemanal = $('#horaSemanal').val();
                objetoDaFabrica.checkBoxSemanalDomingo = $('#checkBoxSemanalDomingo').val();
                objetoDaFabrica.checkBoxSemanalSegunda = $('#checkBoxSemanalSegunda').val();
                objetoDaFabrica.checkBoxSemanalTerca = $('#checkBoxSemanalTerca').val();
                objetoDaFabrica.checkBoxSemanalQuarta = $('#checkBoxSemanalQuarta').val();
                objetoDaFabrica.checkBoxSemanalQuinta = $('#checkBoxSemanalQuinta').val();
                objetoDaFabrica.checkBoxSemanalSexta = $('#checkBoxSemanalSexta').val();
                objetoDaFabrica.checkBoxSemanalSabado = $('#checkBoxSemanalSabado').val();

                objetoDaFabrica.horaMensal = $('#horaMensal').val();
                objetoDaFabrica.checkBoxMensalJaneiro = $('#checkBoxMensalJaneiro').val();
                objetoDaFabrica.checkBoxMensalFevereiro = $('#checkBoxMensalFevereiro').val();
                objetoDaFabrica.checkBoxMensalMarco = $('#checkBoxMensalMarco').val();
                objetoDaFabrica.checkBoxMensalAbril = $('#checkBoxMensalAbril').val();
                objetoDaFabrica.checkBoxMensalMaio = $('#checkBoxMensalMaio').val();
                objetoDaFabrica.checkBoxMensalJunho = $('#checkBoxMensalJunho').val();
                objetoDaFabrica.checkBoxMensalJulho = $('#checkBoxMensalJulho').val();
                objetoDaFabrica.checkBoxMensalAgosto = $('#checkBoxMensalAgosto').val();
                objetoDaFabrica.checkBoxMensalSetembro = $('#checkBoxMensalSetembro').val();
                objetoDaFabrica.checkBoxMensalOutubro = $('#checkBoxMensalOutubro').val();
                objetoDaFabrica.checkBoxMensalNovembro = $('#checkBoxMensalNovembro').val();
                objetoDaFabrica.checkBoxMensalDezembro = $('#checkBoxMensalDezembro').val();

                objetoDaFabrica.horaIntervalo = $('#horaIntervalo').val();

                objetoDaFabrica.opcoesEnviarEmail = $('#opcoesEnviarEmail').val();
                objetoDaFabrica.usuarios = $('#usuarios').val();
                objetoDaFabrica.assunto = $('#assunto').val();
                objetoDaFabrica.descricaoEmailTexto = $('#descricaoEmailTexto').val();
                objetoDaFabrica.opcoesanexarRelatorio = $('#opcoesanexarRelatorio').val();
                objetoDaFabrica.handleAgendamento = $('#ctl00_Main_handleAgendamento').val();
                objetoDaFabrica.handleRegraConciliacaoAgendamento = parseInt($('#ctl00_Main_handleRegraConciliacaoAgendamento').val());

                objetoDaFabrica.tabAtiva = $('#tabAgendamento a[aria-expanded="true"]').attr('href');

                console.log("Objeto gerado, valores:");
                console.log(objetoDaFabrica);

                return objetoDaFabrica;
            }

            //$(window).on("load", function () {
            //    $.ajax({
            //        type: "POST",
            //        url: 'CadastroAgendamento.aspx/VerificaAgendamentoAtivo',
            //        data: "{'hnd': '" + $('#ctl00_Main_handleRegraConciliacaoAgendamento').val() + "'}",
            //        contentType: "application/json; charset=utf-8",
            //        success: function (data) {
            //            try {
            //                if (data == "false") {
            //                    $('#btnParar').hide();
            //                }
            //                else {
            //                    $('#btnAgendar').hide();
            //                }
            //            } catch (e) {
            //                $('#btnParar').hide();
            //            }
            //        },
            //        error: function (data) {
            //            $('#btnAgendar').hide();
            //            $('#btnParar').hide();
            //        }
            //    })
            //})

            function BuscarDadosRegraConciliacao() {
                $.ajax({
                    type: "POST",
                    url: 'CadastroAgendamento.aspx/BuscarDadosRegraConciliacao',
                    data: "{'hnd': '" + $('#ctl00_Main_handleRegraConciliacaoAgendamento').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var registro = data.d;
                        // $('#horaUmaVez').val(registro.horaUmaVez);
                        // if (registro.horaUmaVez.typeof(DateTime)){
                        //  registro.horaUmaVez.time
                        // }
                        // for (var campo in eval('(' + registro + ')')) {

                        for (var campo in registro) {
                            $('#' + campo).val(registro[campo]);
                        }
                    },
                    error: function (data) {
                        console.log(data);
                    }
                });
            }

        </script>
</asp:Content>
