import Dropzone from 'dropzone';
import Page from './Page';
import ModalPage from './ModalPage';
import { PDFDocument } from 'pdf-lib';

Dropzone.autoDiscover = false;

var DropZone = function () {
    function init() {
        $('.benner-dropzone.dropzone.dz-clickable.btn-default').each((i, element) => {
            var currentFile = null;
            var dropzoneControl = $("#" + element.id)[0].dropzone;
            if (dropzoneControl) {
                dropzoneControl.destroy();
            }

            var allExtensions = null;

            var field = $(element)[0].attributes["fieldName"].value;
            var key = $(element)[0].attributes["entitySessionKey"].value;
            var view = $(element)[0].attributes["viewName"].value;
            var validatePdf = $(element)[0].attributes["validatePdf"].value;

            $.ajax({
                url: Page.getApplicationPath() + "api/dropzone/extensions",
                data: { viewName: view, fieldName: field },
                dataType: "json",
                async: false,
                success: function (data) {
                    allExtensions = data;
                },
            });

            $("#" + element.id).dropzone({
                maxFiles: 1,
                maxFilesize: (Benner.Page.maxFileSizeInKB / 1000),
                acceptedFiles: allExtensions,
                dictInvalidFileType: "Extens\u00e3o de arquivo inv\u00e1lida!",
                dictFileTooBig: "Tamanho do arquivo muito grande!",
                timeout: 0,

                addedfile: function (file) {
                    if (currentFile) {
                        this.removeFile(currentFile)
                    }
                    currentFile = file;
                },

                accept: function (file, done) {
                    if (_shouldValidateFile(file, validatePdf)) {
                        App.blockUI({ animete: true, boxed: true, message: "<span class='message'>Aguarde a valida\u00e7\u00e3o do arquivo pdf.</span>", zIndex: 11000 });
                        _validatePdfContainsPotentiallyDangerousScripts(currentFile, element, done);
                    } else {
                        done();
                    }
                },

                sending: function (file, xhr, formData) {
                    formData.append('fieldName', field);
                    formData.append('entitySessionKey', key);
                    formData.append('viewName', view);
                    var filePassword = $(element)[0].getAttribute("filePassword");
                    formData.append('filePassword', (filePassword != null ? filePassword : ''));
                    $(element)[0].removeAttribute("filePassword");
                    App.blockUI({ textOnly: false, boxed: true, message: "<span class='message'>Aguarde o carregamento do arquivo.</span> <span class='progrees'></span>", zIndex: 11000 });
                },

                uploadprogress: function (file, progress, bytesSent) {
                    $('.loading-message.loading-message-boxed span.progrees').text(parseInt(progress) + "%");
                },

                maxfilesexceeded: function (file, response) {
                    this.removeFile(file);
                },

                error: function (file, errorMessage) {
                    if (file.xhr != undefined && file.xhr.status === "413")
                        swal("", "Tamanho do arquivo muito grande!", "error");
                    else
                        swal("", errorMessage, "error");

                    App.unblockUI();
                },

                success: function (file, resp) {
                    if (resp.error != null) {
                        swal("", resp.error, "error");
                        App.unblockUI();
                        return;
                    }
                    var span = $("#" + element.id)[0].childNodes[0];
                    var fileSize = Math.ceil(file.size / 1024) + "KB";
                    let fileName = file.name;
                    if (fileName.length >= 45) {
                        fileName = file.name.substring(0, 25).concat("...", file.name.substring(file.name.length - 10, file.name.length));
                    }
                    App.unblockUI();

                    span.innerText = fileName.concat(" - ", fileSize);
                }
            });

            $("#" + element.id + "-clear-file").on("click", function (e) {
                e.preventDefault();
                $.ajax({
                    url: Page.getApplicationPath() + "api/dropzone/delete",
                    data: { entitySessionKey: key, fieldName: field },
                    success: function (data) {
                        $("#" + element.id)[0].childNodes[0].innerText = data;
                        $("#" + element.id)[0].dropzone.removeAllFiles(true);
                    },
                });
            });

            $("#" + element.id + "-upload-file").on("click", function (e) {
                e.preventDefault();
                $("#" + element.id)[0].dropzone.hiddenFileInput.click();
            });
        });
    }

    function _shouldValidateFile(file, validatePdf) {
        return file.name.toLowerCase().endsWith('.pdf') && validatePdf === "true";
    }

    function _validatePdfContainsPotentiallyDangerousScripts(pdfFile, dropzoneInput, done) {
        _readFileAsArrayBuffer(pdfFile).then(function (pdfBytes) {
            PDFDocument.load(pdfBytes, { ignoreEncryption: true }).then((pdfDoc) => {
                const validationErrorMessage = "Arquivo cont\u00e9m conte\u00fado potencialmente malicioso.";

                if (pdfDoc.javaScripts.length > 0) {
                    done(validationErrorMessage);
                    return;
                }

                if (_containsMaliciousTag(pdfDoc.catalog.dict)) {
                    done(validationErrorMessage);
                    return;
                }

                var indirectObjects = pdfDoc.context.enumerateIndirectObjects();
                for (var i = 0; i < indirectObjects.length; i++) {
                    if (indirectObjects[i][1].constructor.name == 'PDFDict') {
                        if (_containsMaliciousTag(indirectObjects[i][1])) {
                            done(validationErrorMessage);
                            return;
                        }
                    }
                }

                for (const page of pdfDoc.getPages()) {
                    if (_containsMaliciousTag(page.node.dict)) {
                        done(validationErrorMessage);
                        return;
                    }
                }

                if (pdfDoc.isEncrypted) {
                    App.unblockUI();
                    var html = new Sys.StringBuilder();
                    html.append('<div>');
                    html.append('<input type="password" class="form-control" id="dropzoneFilePassword" />');
                    html.append('</div>');
                    html.append('<div style="text-align: right; margin-top: 10px">');
                    html.append('<button id="dropzoneFilePasswordBtn" type="button" class="btn blue" data-dismiss="modal">Enviar</button>')
                    html.append('</div>');
                    ModalPage.show({ id: 'filePassword', size: 'default', customBody: html, title: 'Informe a senha do arquivo:', displayFooter: false }, () => {
                        $('#dropzoneFilePasswordBtn').click(() => {
                            $(dropzoneInput)[0].setAttribute("filePassword", $('#dropzoneFilePassword').val());
                            done();
                        });
                    });
                } else {
                    done();
                }
            }).catch(function (error) {
                done('Falha na valida\u00e7\u00e3o de conte\u00fado malicioso: ' + error.message);
            });
        });
    }

    function _containsMaliciousTag(root) {
        var keys = [...root.keys()];
        for (var i = 0; i < keys.length; i++) {
            var key = keys[i];
            if (key.encodedName == '/AA' ||
                key.encodedName == '/OpenAction' ||
                key.encodedName == '/JS' ||
                key.encodedName == '/JavaScript') {
                return true;
            }
            var value = root.get(key);
            if (value.constructor.name == 'PDFDict') {
                if (_containsMaliciousTag(value.dict)) {
                    return true;
                }
            }
        }
        return false;
    }

    function _readFileAsArrayBuffer(file) {
        return new Promise(function (resolve, reject) {
            const reader = new FileReader();

            reader.onload = function (event) {
                resolve(event.target.result);
            };

            reader.onerror = function (event) {
                reject(event.target.error);
            };

            reader.readAsArrayBuffer(file);
        });
    }

    return {
        init: init
    };
}();

export default DropZone;