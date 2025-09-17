<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>

<!DOCTYPE html>

<script runat="server">

    internal class ServicoDesc
    {
        public string Nome { get; set; }
        public string ClassName { get; set; }
        public bool StatusOk { get; set; }
        public string BindingPadrao { get; set; }
        public bool SuportaBindingTriplo { get; set; }
        public string Erro { get; set; }
        public bool NaoCorporativo { get; set; }
    }

    private ServicoDesc GetServiceDesc(string arquivo)
    {
        var res = new ServicoDesc();
        try
        {
            res.Nome = System.IO.Path.GetFileName(arquivo);

            string content = string.Empty;
            using (var sr = new System.IO.StreamReader(arquivo))
            {
                content = sr.ReadToEnd();
            }
            content = content.Replace("%@ ", "");
            content = content.Replace("%>", @" />");

            var doc = new System.Xml.XmlDocument();
            doc.LoadXml(content);
            var root = doc.FirstChild;
            string classe = string.Empty;
            string factory = string.Empty;
            foreach (System.Xml.XmlAttribute atr in root.Attributes)
            {
                if (atr.Name == "Service")
                    classe = atr.Value;
                if (atr.Name == "Factory")
                    factory = atr.Value;
            }

            if (!classe.StartsWith("Benner.Corporativo.WebServices"))
            {
                return null;
            }

            res.SuportaBindingTriplo = factory == "Benner.Corporativo.WebServices.HttpServiceHostFactory";
            res.BindingPadrao = res.SuportaBindingTriplo ? "?" : "web.config";

            if ((classe.IndexOf(',') < 0) && (classe.StartsWith("Benner.Corporativo.WebServices")))
            {
                classe += ", Benner.Corporativo.WebServices";
            }

            Type tipo = Type.GetType(classe, true);
            res.StatusOk = true;
            res.ClassName = tipo.FullName;

            if (res.SuportaBindingTriplo)
            {
                try
                {
                    Type factoryType = typeof(Benner.Corporativo.WebServices.HttpServiceHostFactory);
                    var mt = factoryType.GetMethod("GetBindingMode", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Static);
                    var bm = mt.Invoke(null, new object[] { tipo });
                    res.BindingPadrao = bm.ToString();
                }
                catch
                {
                    res.BindingPadrao = "Não definido";
                }
            }
        }
        catch (Exception erro)
        {
            res.StatusOk = false;
            res.Erro = erro.Message;
        }
        return res;
    }

    private HtmlAnchor GetAnchor(string text, string target)
    {
        var ha = new HtmlAnchor() { InnerText = text };
        ha.HRef = this.Page.AppRelativeTemplateSourceDirectory + target;
        return ha;
    }

    private HtmlAnchor GetAnchor(string text, string target, string cssClass)
    {
        var h = GetAnchor(text, target);
        h.Attributes["class"] = cssClass;
        return h;
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        CarregarServicos();
        CarregarDLLs();
    }

    private void CarregarDLLs()
    {

        var diretorio = Server.MapPath(ResolveUrl("~/bin"));

        Action<string> adicionar = (mascara) =>
            {
                //  diretorio = Server.MapPath(this.Page.AppRelativeTemplateSourceDirectory);
                foreach (string arquivo in Directory.GetFiles(diretorio, mascara))
                {
                    var vi = System.Diagnostics.FileVersionInfo.GetVersionInfo(arquivo);
                    string desc = string.Format("{0} - FileVersion: {1} - ProductVersion: {2}",
                        vi.OriginalFilename, vi.FileVersion, vi.ProductVersion);

                    LISTADLLS.Controls.Add(new HtmlGenericControl("li") { InnerText = desc });
                }
            };

        adicionar("Benner.Corporativo.*.dll");
        adicionar("Benner.Tecnologia.Common2.dll");

    }

    private void CarregarServicos()
    {

        string root = Server.MapPath(this.Page.AppRelativeTemplateSourceDirectory);
        string configFile = root + "web.config";

        List<string> configServices = new List<string>();

        if (File.Exists(configFile))
        {
            var doc = new XmlDocument();
            doc.Load(configFile);
            foreach (XmlNode item in doc.GetElementsByTagName("service"))
            {
                configServices.Add(item.Attributes["name"].Value);
            }
            var gen = new HtmlGenericControl("p");
            gen.InnerText = "Arquivo web.config encontrado, com os seguintes serviços configurados:";
            gen.Attributes["class"] = "danger";
            WEBCONFIG.Controls.Add(gen);

            configServices.Sort();
        }

        int statusCell = 2;
        int padraoCell = statusCell + 1;
        int basicCell = statusCell + 2;
        int gzipCell = statusCell + 3;
        int wsCell = statusCell + 4;
        int erroCell = statusCell + 5;

        //SERVICOSLIST
        var arquivos = System.IO.Directory.GetFiles(root, "*.svc");
        foreach (var item in arquivos)
        {
            var info = GetServiceDesc(item);
            if (info == null)
                continue;

            HtmlTableRow row = new HtmlTableRow();
            while (row.Cells.Count < 8)
                row.Cells.Add(new HtmlTableCell { InnerText = "" });

            var ha = GetAnchor(info.Nome, info.Nome);
            var ha2 = GetAnchor("wsdl", info.Nome + "?wsdl", "wsdlLink");

            row.Cells[0].Controls.Add(ha);
            row.Cells[1].Controls.Add(ha2);
            row.Cells[erroCell].InnerText = info.Erro;

            if (configServices.Contains(info.ClassName))
            {
                info.SuportaBindingTriplo = false;
                info.BindingPadrao = "web.config";
                LISTAWEBCONFIG.Controls.Add(new HtmlGenericControl("li") { InnerText = info.Nome });
            }

            if (info.SuportaBindingTriplo)
            {
                row.Cells[basicCell].Controls.Add(GetAnchor("Sim", info.Nome + "/basic", "bindLink"));
                row.Cells[gzipCell].Controls.Add(GetAnchor("Sim", info.Nome + "/gzip", "bindLink"));
                row.Cells[wsCell].Controls.Add(GetAnchor("Sim", info.Nome + "/ws", "bindLink"));
            }

            row.Cells[padraoCell].InnerText = info.BindingPadrao;
            if (!info.StatusOk)
            {
                row.Attributes["class"] = "rowError";
                row.Cells[statusCell].InnerText = "?";
            }
            else
            {
                row.Cells[statusCell].InnerText = "Ok";
            }

            TABELASERVICOS.Rows.Add(row);
        }
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Informações dos serviços</title>
    </head>
    <body>
        <style>
            body {
                background-color: white;
                color: black;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                font-size: 0.8em;
            }

            .danger {
                color: red;
            }

            .ok {
                color: green;
            }

            tr, td {
                border: 1px solid silver;
            }

            .rowError {
                color: red;
            }

            td {
                text-align: center;
            }

                td:nth-child(1) {
                    text-align: left;
                }
        </style>

        <h1 id="titulo" runat="server">
            Informações dos serviços
        </h1>

        <div id="SERVICOSLIST" runat="server"></div>
        <table style="width: 100%;" cellpadding="1" cellspacing="0" id="TABELASERVICOS" runat="server">
            <thead>
                Relação de serviços e suporte a binding
            </thead>
            <tr>
                <td>Serviço</td>
                <td>wsdl</td>
                <td>Status</td>
                <td>Binding padrão</td>
                <td>Basic</td>
                <td>GZip</td>
                <td>WS</td>
                <td>Erro</td>
            </tr>
        </table>
        <ul>
            <li>Status = A instalação possui a dll com o serviço.</li>
            <li>Binding padrão = O tipo de binding padrão para consumo do serviço.</li>
            <li>Basic = Suporte ao binding Basic incluindo /basic no final da url do serviço.</li>
            <li>GZip = Suporte ao binding GZip incluindo /gzip no final da url do serviço.</li>
            <li>WS = Suporte ao binding WS incluindo /ws no final da url do serviço.</li>
            <li>Erro = Erro que ocorreu ao tentar encontrar o serviço na instalação.</li>
        </ul>

        <h2 id="WEBCONFIG" runat="server"></h2>
        <ul id="LISTAWEBCONFIG" runat="server"></ul>

        <h2 id="H1" runat="server">DLLs</h2>
        <ul id="LISTADLLS" runat="server"></ul>

        <script>
            function avisoLink() {
                alert('O browser irá apresentar uma tela vazia. Utilize o conteúdo do link para consumir o serviço com este tipo de binding.');                
            }

            var links = document.getElementsByClassName("bindLink");
            for (var i = 0; i < links.length; i++) {
                links[i].addEventListener("click", avisoLink);
            }
        </script>
    </body>
</html>
