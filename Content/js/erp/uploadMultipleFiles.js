var ErpUploadMultipleFiles = {
    Init: function () {
        if ($(".dz-started").length > 0)
            $("#submitall").slideUp(500);
        
            $("#dropzoneSection").dropzone({
                url: Benner.Page.getApplicationPath() + "/uc/erp/UploadMultipleFiles.ashx",
                maxFiles: (_totalFiles ? _totalFiles : 10),
                maxFilesize: 10,
                type: "POST",
                dataType: "json",
                dictMaxFilesExceeded: "Você não pode enviar mais arquivos.",
                //params: { 'prSubmitRQ': $('#umfRequestSubmit').val() },
                autoProcessQueue: false,
                addRemoveLinks: false,
                autoDiscover: false,
                paramName: "file", // The name that will be used to transfer the file
                accept: function (file, done) {
                    var re = /(?:\.([^.]+))?$/;
                    var filenameExt = re.exec(file.name);
                    
                    if (($.isArray(_extensionsAllowed) && _extensionsAllowed.indexOf(filenameExt[0]) >= 0) || _extensionsAllowed == null) {
                        done();
                    }
                    else {
                        $(file.previewElement).find('.dz-error-message').text("Arquivo extensão '" + filenameExt[1] + "'. Extensão do arquivo deve ser válido para processar");
                        done("Arquivo extensão '" + filenameExt[1] + "'. Extensão do arquivo deve ser '" + _extensionsAllowed.join(" , ") + "' válido para processar");
                    }                   
                },
                success: function (file, response) {
                    var imgName = response;
                    file.previewElement.classList.add("dz-success");
                    console.log('Successfully uploaded :' + file.name + "->" + "OK");
                    if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
                        __doPostBack(); //Utilizado para atualizar a pagina e aparecer os tasks iniciados;
                        parent.Benner.ModalPage.hide();
                    }
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                    $(file.previewElement).find('.dz-error-message').text(response);
                },
                init: function () {
                    var dropzone = this;
                    //Ao iniciar o botão de confirmar não aparece, pois não tem arquivos;
                    $('input[data-name="btSubmitAll"]').hide();
                    //$('input[data-name="btSubmitAll"]').click();
    
                    this.on("addedfile", function (file) {
                        //Quandi adicionar um arquivo mostrar botão de confirmar;
                        $('input[data-name="btSubmitAll"]').slideDown(500);
                        var removeButton = Dropzone.createElement("<a class=\"dz-remove\" data-dz-remove=\"\">Remover</a>");
                        var _this = $('#dropzoneSection')[0].dropzone;
                        removeButton.addEventListener("click", function (e) {
                            e.preventDefault();
                            e.stopPropagation();
                            _this.removeFile(file);
                            //Esconder botão de confirmar quando não possuir um arquivo adicionado;
                            if ($(".dz-started").length <= 0)
                                $('input[data-name="btSubmitAll"]').slideUp(500);
                        });
                        //Adicionar elemento do botão remover;
                        file.previewElement.appendChild(removeButton);
                    });
                }
    
            });
    


    },
    ProcessFiles: function () {
        //recuperar instancia(object) dz
        var _this = $('#dropzoneSection')[0].dropzone;
        if (_this != null) {
            //Quantidade de arquivos na fila para subir
            var nFiles = _this.getQueuedFiles().length;
            //Setar a quantidade de uploads a processar;
            _this.options.parallelUploads = nFiles;
            //Processar a fila de arquivos
            _this.processQueue();

        }
    }
}