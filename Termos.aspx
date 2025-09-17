<%@ Page Title="Termos e condi&ccedil;&otilde;es de uso" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
<%@ Import Namespace="Benner.Tecnologia.Wes.Components.Helpers" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.ERP.Comum" Namespace="Benner.ERP.Comum" TagPrefix="wes" %>
<!doctype html>
<html lang="pt" class="no-js">

<head runat="server">
    <title>Termos e condi&ccedil;&otilde;es de uso</title>
</head>

<link rel="stylesheet" type="text/css" href='<%= UrlResolverHelper.ResolveUrl("~/content/dist/benner.min.css") %>' />
<link rel="stylesheet" type="text/css" href='<%= UrlResolverHelper.ResolveUrl("~/content/css/flaticon.css") %>' />


<script src="<%= UrlResolverHelper.ResolveUrl("~/content/dist/benner.min.js") %>" type="text/javascript" charset="utf-8"></script>

<body>

    <div class="container">

        <div class="content">

            <div>

                <h2 style="text-align:center;"><b>Termos e condi&ccedil;&otilde;es de Uso</b></h2>
                <h4 style="text-align:center;">Aceite nossos termos para continuar a utilizar o sistema normalmente.</h4>

            </div>

            <div class="therms-content" id="therms">

            </div>

            <div class="bottom">


                <div style='display: flex; padding: 20px 0px ;'>


                    <a download='Termos e condi&ccedil;&otilde;es de Uso' id="download"
                        class="hfeDownload">
                        <i class="fa fa-download"></i>
                        Baixar Termos e condi&ccedil;&otilde;es de Uso
                    </a>

                </div>

                <div>

                    <a href="<%= UrlResolverHelper.ResolveUrl("~/Users/Logoff") %>" style="margin-bottom: 20px;" class="btn default btn-save command-action predef-action editable">
                        <i class="fa fa-times"></i>
                        Recusar
                    </a>

                    <a style="margin-bottom: 20px;" id="accept" class="btn blue btn-save command-action predef-action editable">
                        <i class="fa fa-check"></i>
                        Aceitar</a>

                </div>

            </div>

        </div>

    </div>

    </div>

    <style>
        body {
            height: 100vh;
        }

        .container {
            height: 100%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .content {
            height: 100%;
            border: 1px solid #ddd;
            border-radius: 12px !important;
            flex: 1;
            width: 100%;
            display: flex;
            flex-direction: column;
            max-width: 900px;
            padding: 20px;
        }

        .therms-content {
            height: 100%;
            overflow-y: scroll;
            word-wrap: break-word;
            margin: 10px 0;
            border-radius: 8px !important;
            flex: 1;
            width: 100%;
            background-color: #eeeeee;
            padding: 20px;
            font-size: 23px;
            text-align: justify;
        }

        .bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #accept{
            opacity: 0;
            pointer-events: none;
        }
    </style>

    <script>
        $(function() {
            $("#accept").on("click", Aceitar)
        })

        function getPath() {
            return String(window.location.href).split('/Termos.aspx')[0]
        }

        function Montar() {

            var url = getPath() + '/TermoUso/BuscarTermoUso';

            $.ajax({
                type: "GET",
                url,
                dataType: "json",
                contentType: "application/json; charset=utf-8",

                success: function(data){
                    document.querySelector('#therms').innerHTML = data.Descricao;
                    document.querySelector('#download').href = data.UrlDownload;
                },
                error: function(_data) {
                    alert('Erro ao captar Termo de Uso e Política de Cookies. Contate o suporte.');
                }
            });
        }

        function Aceitar() {

            var url = getPath() + '/TermoUso/InserirAssinatura';

            $.ajax({
                type: "POST",
                url,
                dataType: "json",
                contentType: "application/json; charset=utf-8",

                success: function(data) {
                    if(data)
                    {
                        window.location.href = '<%= UrlResolverHelper.ResolveUrl("~/") %>'
                    }
                        
                },
                error: function(_data) {
                    alert('Erro ao aceitar Termo de Uso e Politica de Cookies. Contate o suporte');
                }
            });

        }

        const hfeDownload = document.querySelector('.hfeDownload');
        const accept = document.querySelector('#accept');

        hfeDownload.addEventListener('click', () => {
            accept.style.opacity = "100";
            accept.style.pointerEvents = "all";
        });

        Montar();
    </script>

</body>

</html>