<%@ Page Title="TreeView" Language="C#" Inherits="aga.e.Generico.MTreeViewFormPage, Benner.Corporativo.Wes.WebApp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm 
            runat="server" 
            PortletLayout="Default"
            ID="TREEVIEWFORM" 
            BootstrapCols="12" 
            ShowTitle="True"
            ChromeState="Normal" 
            IncludeRecordInRecentItems="True" 
            UserDefinedCommandsVisible="True" 
            CanView="true"
            CanInsert="true"
            CanUpdate="true"
            CanDelete="true"
        />
    </div>

    <!-- Inclua a biblioteca jQuery, se ainda não estiver incluída -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Inclua a biblioteca FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <script type="text/javascript">
		$(document).ready(function(){
		    // Processo responsável por disponibilizar um botão "download" na página de histórico de geração de períodos.
			
			// Selecionando o link dentro do elemento com data-field="ARQUIVO"
			var link = $('span[data-field="ARQUIVO"] a');

			// Verificando se o link existe
			if (link.length === 0) {
				// Se o link não for encontrado, sair do script
				return;
			}

			// Configurando o link para download
			link.attr('download', '');

			var helpIcon = $('.label-title-help .fa-question-circle');
			// Se o ícone de ajuda for encontrado, adicionar o ícone de download
			if (helpIcon.length > 0) {
				// Criando um novo div com a classe 'label-title'
				var newDiv = $('<div>', { class: 'label-title', title: 'ARQUIVO' });

				// Criando o ícone de download e adicionando ao novo div
				newDiv.append('<i class="fa fa-download" aria-hidden="true" style="margin-left: 10px; cursor: pointer; display: inline; font-size: 20px;"></i>');

				// Adicionando o novo div após o div 'label-title-help'
				$('.label-title-help').after(newDiv);

				// Adicionando um evento de clique no ícone de download
				$('.fa-download').on('click', function() {
					// Disparando um clique no link original para iniciar o download
					link[0].click();
				});
			}
		});
	
    </script>
</asp:Content>