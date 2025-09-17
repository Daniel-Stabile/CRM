<%@ Page Title="Balancete" Language="C#"
Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Contabil.consultas.Balancete" %> <%@ Register
Assembly="Benner.Tecnologia.Wes.Components.WebApp"
Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
  <div class="row">
    <div id="app" class="col-md-12">
      <div
        id="navegadorNaoSuportado"
        class="note note-danger note-bordered"
        style="display: none;"
      >
        <h3>Ops!</h3>
        <p
          >O navegador atual não tem suporte para acessar esta página e
          visualizar o relatório Gerenciais, recomendamos a utilização do Google
          Chrome.</p
        >
      </div>
      <contabil-balancete-balancete></contabil-balancete-balancete>
    </div>
  </div>

  <style>
    .dx-pivotgrid-vertical-headers, .dx-row-total
    { 
      background: #dbe8f8
      !important; 
    } 
    
    .dx-last-cell 
    { 
      background: #FFF; 
    }

    .textAlignCenter {
      text-align: center;
    }
	
	.dx-pivotgrid-toolbar {
		padding-bottom: 2rem;
	}	

  </style>

  <script>    
    Benner.BalanceteStore.commit("treeview/setDefaultBranchAndCompany", {
        company: $("#CurrentCompany").val(),
        branch: $("#CurrentBranch").val()
    });

    var app = new window.Vue({
        el: '#app',
        store: Benner.BalanceteStore
    });

    $(document).ready(function() {
        verificarSeBrowserEhSuportado();
    });

    function verificarSeBrowserEhSuportado() {
        var ua =
            window.navigator.userAgent;
        var msie = ua.indexOf("MSIE ");
        if (!(msie > 0 ||
                !!navigator.userAgent.match(/Trident.*rv\:11\./)))
            $("#navegadorNaoSuportado").hide();
        else $("#navegadorNaoSuportado").show();
        return false;
    }

    app.$children[0].$children[0].fieldPanelVisible = true;
    app.$children[0].$children[0].showCheckBox = false;
    app.$children[0].$children[0].fieldPanelShowColumnFields = false;
    app.$children[0].$children[0].fieldPanelShowDataFields = false;
    app.$children[0].$children[0].fieldPanelShowFilterFields = false; 

    function FormatarValorCelula(paramValor, paramDC, nomeColuna)
    {
        let valorStr = paramValor.replace(/\./g, "").replace(/\,/g, ".");
        let valorStrFormatado = (parseFloat(valorStr).toFixed(2));
        
        const formatter = new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'BRL',
            minimumFractionDigits: 2
        });

        if (isValoresEmMilhares())
            valorStrFormatado /= 1000;
		
		if (nomeColuna != "debito" && nomeColuna != "credito") {
			if (isFormatacaoDC()) {
				if (paramDC == "C")
					valorStrFormatado = valorStrFormatado * -1; 

				valorStrOK = formatter.format(valorStrFormatado).replace(/\,/g, '_').replace(/\./g, ',').replace(/\_/g, '.').replace('R$', '');

				if (valorStrFormatado == 0)
					return valorStrOK;

				return String.format("{0} ({1})", valorStrOK, paramDC);
			}
			
			if (isFormatacaoParenteses() && paramDC == "C") {
				valorStrFormatado = valorStrFormatado * -1;	
				return String.format("({0})", formatter.format(valorStrFormatado).replace(/\,/g, '_').replace(/\./g, ',').replace(/\_/g, '.').replace('R$', ''));
			}
		}

        return formatter.format(valorStrFormatado).replace(/\,/g, '_').replace(/\./g, ',').replace(/\_/g, '.').replace('R$', '');
    }   

    function isPeriodoSemestres()
    {
      return app.$store.getters["filtro/isPeriodoSemestres"];
    }
    function isFormatacaoDC()
    {
      return app.$store.getters["filtro/isFormatacaoDC"];
    }
    function isFormatacaoParenteses()
    {
      return app.$store.getters["filtro/isFormatacaoParenteses"];
    }

    const isValoresEmMilhares = () => app.$store.getters["filtro/isValoresEmMilhares"];

    function PrintPivotGrid1()
    {        
        var mywindow = window.open('', 'PRINT', 'height=400,width=600');

        mywindow.document.write('<html><head><title>' + document.title  + '</title>');
        mywindow.document.write('<link rel="stylesheet" href="pivottable.css" type="text/css" />');
        mywindow.document.write('</head><body >');
        mywindow.document.write('<h1>' + document.title  + '</h1>');
        mywindow.document.write(document.getElementById('pivotgrid').innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        //mywindow.close();

        return false;
    }

    function PrintPivotGrid2()
    {
        window.print();

        return false;
    }    

    function ExpandConta()
    {
      var nivelConta = sessionStorage.getItem('nivelConta');

	  $("#pivotgrid").dxPivotGrid("instance").getDataSource().expandAll("conta"+nivelConta.toString());
	  
	  if (nivelConta < 5)
        nivelConta++;
		
      sessionStorage.setItem('nivelConta', nivelConta);          
    }

    function CollapseConta()
    {          
      var nivelConta = sessionStorage.getItem('nivelConta');

	  $("#pivotgrid").dxPivotGrid("instance").getDataSource().collapseAll("conta"+nivelConta.toString());
      
	  if (nivelConta > 1)
        nivelConta--;
		
      sessionStorage.setItem('nivelConta', nivelConta);
    }

    function ExpandCC()
    {
      // Get saved data from sessionStorage
      var nivelCC = sessionStorage.getItem('nivelCC');

      if (nivelCC == null)
      {
        nivelCC = 5;
        sessionStorage.setItem('nivelCC', nivelCC);          
      }

      $("#pivotgrid").dxPivotGrid("instance").getDataSource().expandAll("CC"+nivelCC.toString());

      if (nivelCC == "")
        nivelCC = 5;
      else if (nivelCC != 5)
        nivelCC++;
        
      // Save data to sessionStorage
      sessionStorage.setItem('nivelCC', nivelCC);          
    }

    function CollapseCC()
    {     
      // Get saved data from sessionStorage
      var nivelCC = sessionStorage.getItem('nivelCC');

      if (nivelCC == null)
      {
        nivelCC = 5;
        sessionStorage.setItem('nivelCC', nivelCC);          
      }

      if (nivelCC == "")
        nivelCC = 1;
      else if (nivelCC != 1)
        nivelCC--;
    
      $("#pivotgrid").dxPivotGrid("instance").getDataSource().collapseAll("CC"+nivelCC.toString());
      
      // Save data to sessionStorage
      sessionStorage.setItem('nivelCC', nivelCC);
    }

    function ExpandProjeto()
    {
      // Get saved data from sessionStorage
      var nivelProjeto = sessionStorage.getItem('nivelProjeto');

      if (nivelProjeto == null)
      {
        nivelProjeto = 5;
        sessionStorage.setItem('nivelProjeto', nivelProjeto);          
      }

      $("#pivotgrid").dxPivotGrid("instance").getDataSource().expandAll("Projeto"+nivelProjeto.toString());

      if (nivelProjeto == "")
      nivelProjeto = 5;
      else if (nivelProjeto != 5)
      nivelProjeto++;
        
      // Save data to sessionStorage
      sessionStorage.setItem('nivelProjeto', nivelProjeto);          
    }

    function CollapseProjeto()
    {     
      // Get saved data from sessionStorage
      var nivelProjeto = sessionStorage.getItem('nivelProjeto');

      if (nivelProjeto == null)
      {
        nivelProjeto = 5;
        sessionStorage.setItem('nivelProjeto', nivelProjeto);          
      }

      if (nivelProjeto == "")
        nivelProjeto = 1;
      else if (nivelProjeto != 1)
        nivelProjeto--;
    
      $("#pivotgrid").dxPivotGrid("instance").getDataSource().collapseAll("Projeto"+nivelProjeto.toString());
      
      // Save data to sessionStorage
      sessionStorage.setItem('nivelProjeto', nivelProjeto);
    }    
    
    // teste para o campo do tipo balancete
    /*var teste    =
    `{"parametros":{"dataset":{"balanceteDiario":false}},"filtro":{"saldoAnteriorAtual":true,"debitosCreditos":false,"saldoMes":true,"abertura":false,"fechamentoGerencial":true,"considerarLalur":false,"antesZeramento":true,"saldoDiario":false,"completarEstrutura":false,"mostrarReduzido":false,"mostrarApelido":true,"ignorarPosteriorDate":"01/07/2020"},"treeview":{"regrasDeComparacaoDeEmpresaMestre":{"projeto":false,"conta":true,"centroDeCusto":true},"treeview_loaded":[{"loaded":true},{"loaded":true},{"loaded":true},{"loaded":true}],"treeview_selecoes":[{"id":"CC","tipo":"Padrão","origem":0,"selected":["1","2","3","4","5","6","8","9","10","51","52","53"],"data":{"count":20,"items":[{"handle":"","id":"1","text":"1
    - ADMINISTRAÇÃO GERAL","children":[{"handle":"","id":"2","text":"1.01 -
    ADMINISTRAÇÃO","children":[{"handle":"","id":"3","text":"1.01.01 -
    Presidência","children":[]},{"handle":"","id":"4","text":"1.01.02 -
    Financeiro","children":[]},{"handle":"","id":"5","text":"1.01.03 -
    Controladoria","children":[]},{"handle":"","id":"6","text":"1.01.04 -
    Informática","children":[]},{"handle":"","id":"10","text":"1.01.05 -
    Recursos Humanos","children":[]},{"handle":"","id":"51","text":"1.01.06 - CC
    ATIVO WEB","children":[]},{"handle":"","id":"52","text":"1.01.07 - CC ATIVO
    WEB 02","children":[]},{"handle":"","id":"53","text":"1.01.08 - CC ATIVO WEB
    03","children":[]}]},{"handle":"","id":"8","text":"1.02 -
    AJUSTES","children":[{"handle":"","id":"9","text":"1.02.01 - Ajuste
    gerencial","children":[]}]}]},{"handle":"","id":"11","text":"2 -
    OPERACIONAL","children":[{"handle":"","id":"12","text":"2.01 -
    COMERCIAL","children":[{"handle":"","id":"13","text":"2.01.01 - Vendas
    Nacionais","children":[]},{"handle":"","id":"14","text":"2.01.02 - Vendas
    Exportação","children":[]}]},{"handle":"","id":"15","text":"2.02 -
    PRODUÇÃO","children":[{"handle":"","id":"16","text":"2.02.01 - Produção
    01","children":[]},{"handle":"","id":"17","text":"2.02.02 - Produção
    02","children":[]},{"handle":"","id":"26","text":"2.02.03 - Produção
    03","children":[]}]}]}]}},{"id":"empresaFilial","tipo":"default","origem":0,"selected":["12-1","12","12-3","12-4","12-31","12-35","12-42","12-53","12-76","12-142","15-7","15","20-16","20","20-19","23-20","23","23-24","23-26","23-33","23-34","23-36","23-37","23-38","23-39","23-40","23-41","23-57","23-59","23-62","23-63","23-65","23-73","23-75","23-77","23-78","23-79","23-80","23-81","24-21","24","24-25","24-27","25-22","25","25-28","26-23","26","26-29","26-30","30-44","30","31-45","31","31-46","32-48","32","32-49","33-50","33","34-51","34","35-52","35","36-55","36","36-56","37-66","37","37-67","37-68","38-69","38","38-70","38-71","38-72","39-82","39","39-102","39-103","39-104","39-105","59-122","59"],"data":{"count":98,"items":[{"handle":"12","id":"12","text":"Empresa
    REF Qualidade 01","children":[{"handle":"1","id":"12-1","text":"Matriz -
    Espirito Santo","children":[]},{"handle":"3","id":"12-3","text":"Filial
    Joaçaba","children":[]},{"handle":"4","id":"12-4","text":"Filial São
    Paulo","children":[]},{"handle":"31","id":"12-31","text":"Filial Rio do
    Sul","children":[]},{"handle":"35","id":"12-35","text":"Filial NDD -
    Blumenau","children":[]},{"handle":"42","id":"12-42","text":"FILIAL SAO
    PAULO 2","children":[]},{"handle":"53","id":"12-53","text":"NAO USAR -
    Filial NDD - Santa
    Catarina","children":[]},{"handle":"76","id":"12-76","text":"Filial NDD 2 -
    Rio de Janeiro","children":[]},{"handle":"142","id":"12-142","text":"Filial
    NFS INVENTTI -
    Florianopolis","children":[]}]},{"handle":"15","id":"15","text":"Empresa REF
    Qualidade
    02","children":[{"handle":"7","id":"15-7","text":"Matriz","children":[]}]},{"handle":"20","id":"20","text":"Empresa
    REF Qualidade
    10","children":[{"handle":"16","id":"20-16","text":"Matriz","children":[]},{"handle":"19","id":"20-19","text":"Filial
    1","children":[]}]},{"handle":"23","id":"23","text":"Empresa CORP_SQL_MAG
    Qualidade 20","children":[{"handle":"20","id":"23-20","text":"Matriz 00 SPED
    ICMS contribuinte IPI (REINF) filial
    matriz","children":[]},{"handle":"24","id":"23-24","text":"Filial 01 SPED
    ICMS contribuinte IPI (REINF) filial
    emitente","children":[]},{"handle":"26","id":"23-26","text":"Filial 02 SPED
    ICMS não contribuinte
    IPI","children":[]},{"handle":"33","id":"23-33","text":"Filial 04 - SPED
    PISCOFINS não cumulativo e cumulativo rateio
    proporcional","children":[]},{"handle":"34","id":"23-34","text":"Filial 03
    NDD SPED ICMS substituição tributária
    (REINF)","children":[]},{"handle":"36","id":"23-36","text":"Filial 05 - SPED
    PISCOFINS não cumulativo e cumulativo rateio
    proporcional","children":[]},{"handle":"37","id":"23-37","text":"Filial 06 -
    SPED PISCOFINS não cumulativo rateio
    proporcional","children":[]},{"handle":"38","id":"23-38","text":"Filial 07 -
    SPED PISCOFINS não cumulativo rateio
    proporcional","children":[]},{"handle":"39","id":"23-39","text":"Filial 08 -
    SPED PISCOFINS não cumulativo rateio
    direto","children":[]},{"handle":"40","id":"23-40","text":"Filial 09 - SPED
    PIS COFINS
    cumulativo","children":[]},{"handle":"41","id":"23-41","text":"Filial 10 -
    SPED PIS COFINS
    cumulativo","children":[]},{"handle":"57","id":"23-57","text":"Filial 11 -
    SPED PISCOFINS não cumulativo e ICMS - Minas Gerais -
    NDD","children":[]},{"handle":"59","id":"23-59","text":"Filial 12 - SPED
    PISCOFINS não cumulativo e ICMS - Mato
    Grosso","children":[]},{"handle":"62","id":"23-62","text":"Filial 13 - SPED
    PISCOFINS não cumulativo e ICMS com estado
    2","children":[]},{"handle":"63","id":"23-63","text":"Filial 14 - SPED
    PISCOFINS não cumulativo e ICMS com estado
    2","children":[]},{"handle":"65","id":"23-65","text":"Filial 15 - SPED
    PISCOFINS não cumulativo e ICMS com estado
    2","children":[]},{"handle":"73","id":"23-73","text":"Filial 17 - SPED
    PISCOFINS não cumulativo e ICMS - Rio Grande do Sul-
    NDD","children":[]},{"handle":"75","id":"23-75","text":"Filial 18 - SPED
    PISCOFINS não cumulativo ICMS -
    Bahia","children":[]},{"handle":"77","id":"23-77","text":"Filial 19 - SPED
    ICMS/PISCOFINS -
    Pernambuco","children":[]},{"handle":"78","id":"23-78","text":"Filial 11B -
    SPED PISCOFINS não cumulativo e ICMS -
    filial","children":[]},{"handle":"79","id":"23-79","text":"Filial 20 - SPED
    ICMS/PISCOFINS - Espírito
    Santo","children":[]},{"handle":"80","id":"23-80","text":"Filial 22 - SPED
    ICMS - BLOCO B_NÃO contribuinte
    ICMS","children":[]},{"handle":"81","id":"23-81","text":"Filial 23 - SPED
    ICMS - BLOCO B_Contribuinte de
    ICMS","children":[]}]},{"handle":"24","id":"24","text":"Empresa REF
    Qualidade
    25","children":[{"handle":"21","id":"24-21","text":"Matriz","children":[]},{"handle":"25","id":"24-25","text":"Filial
    1","children":[]},{"handle":"27","id":"24-27","text":"Filial
    2","children":[]}]},{"handle":"25","id":"25","text":"Empresa REF Qualidade
    26","children":[{"handle":"22","id":"25-22","text":"Matriz","children":[]},{"handle":"28","id":"25-28","text":"Filial
    1","children":[]}]},{"handle":"26","id":"26","text":"Empresa REF Qualidade
    27","children":[{"handle":"23","id":"26-23","text":"Matriz","children":[]},{"handle":"29","id":"26-29","text":"Filial
    1","children":[]},{"handle":"30","id":"26-30","text":"Filial
    2","children":[]}]},{"handle":"30","id":"30","text":"Empresa REF Qualidade
    30","children":[{"handle":"44","id":"30-44","text":"Matriz -
    SC","children":[]}]},{"handle":"31","id":"31","text":"Empresa REF Qualidade
    31","children":[{"handle":"45","id":"31-45","text":"Filial 01 - SPED
    PISCOFINS cumulativo para
    COOPERATIVAS","children":[]},{"handle":"46","id":"31-46","text":"Filial 02 -
    SPED PISCOFINS não cumulativo para
    COOPERATIVAS","children":[]}]},{"handle":"32","id":"32","text":"Empresa REF
    Qualidade 32","children":[{"handle":"48","id":"32-48","text":"Filial 01 -
    SPED PISCOFINS não cumulativo - Instituição
    Financeira","children":[]},{"handle":"49","id":"32-49","text":"Filial 02 -
    SPED PISCOFINS cumulativo - Instituição
    Financeira","children":[]}]},{"handle":"33","id":"33","text":"Empresa REF
    Qualidade 40","children":[{"handle":"50","id":"33-50","text":"Filial 01 -
    SPED ECF - LALUR Lucro Real
    Anual","children":[]}]},{"handle":"34","id":"34","text":"Empresa REF
    Qualidade 41","children":[{"handle":"51","id":"34-51","text":"Filial 01 -
    SPED ECF - LALUR Lucro Real
    Trimestral","children":[]}]},{"handle":"35","id":"35","text":"Empresa REF
    Qualidade 42","children":[{"handle":"52","id":"35-52","text":"Filial 01 -
    SPED ECF - LALUR Lucro
    Presumido","children":[]}]},{"handle":"36","id":"36","text":"Empresa REF
    Qualidade 43","children":[{"handle":"55","id":"36-55","text":"Filial 01 -
    Orçamento
    Financeiro","children":[]},{"handle":"56","id":"36-56","text":"Filial 02 -
    Orçamento
    Contábil","children":[]}]},{"handle":"37","id":"37","text":"Empresa REF
    Qualidade 21","children":[{"handle":"66","id":"37-66","text":"Matriz -
    Transportadora","children":[]},{"handle":"67","id":"37-67","text":"Filial 01
    - Transportadora","children":[]},{"handle":"68","id":"37-68","text":"Filial
    02 -
    Transportadora","children":[]}]},{"handle":"38","id":"38","text":"Empresa
    REF Qualidade 22","children":[{"handle":"69","id":"38-69","text":"Matriz -
    Transportadora","children":[]},{"handle":"70","id":"38-70","text":"Filial 01
    - Transportadora","children":[]},{"handle":"71","id":"38-71","text":"Filial
    02 -
    Transportadora","children":[]},{"handle":"72","id":"38-72","text":"Filial 03
    - Transportadora","children":[]}]},{"handle":"39","id":"39","text":"Empresa
    REF Testes Integracao_Web
    Legais","children":[{"handle":"82","id":"39-82","text":"Filial 01 - Matriz -
    SP","children":[]},{"handle":"102","id":"39-102","text":"Filial 02 - Filial
    da Matriz - SP","children":[]},{"handle":"103","id":"39-103","text":"Filial
    03 - SC","children":[]},{"handle":"104","id":"39-104","text":"Filial 04 -
    RJ","children":[]},{"handle":"105","id":"39-105","text":"Filial 05 -
    DF","children":[]}]},{"handle":"59","id":"59","text":"Empresa REF Qualidade
    06","children":[{"handle":"122","id":"59-122","text":"Matriz","children":[]}]},{"handle":"60","id":"60","text":"Empresa
    REF Qualidade
    07","children":[{"handle":"123","id":"60-123","text":"Matriz","children":[]}]},{"handle":"61","id":"61","text":"Empresa
    REF Qualidade
    08","children":[{"handle":"124","id":"61-124","text":"Matriz","children":[]}]}]}},{"id":"projetos","tipo":"Padrão","origem":0,"selected":[],"data":{"count":2,"items":[{"handle":"","id":"50","text":"01
    - Projeto Alfa","children":[{"handle":"","id":"56","text":"01.01 - Conta
    Alfa","children":[]}]}]}},{"id":"contas","tipo":"Padrão","origem":1,"selected":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","163","164","165","171","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","198","199","200","201","202","203","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","255","256","257","258","259","260","261","262","263","264","265","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","1177","1178","1179","1180","1181","1182","1183","1184","1185","1186","1187","1188","1189","1190","1191","1192","1193","1194","1195","1196","1197","1198","1199","1200","1201","1202","1203","1204","1205","1206","1207","1208","1209","1210","1211","1212","1213","1214","1215","1216","1217","1218","1219","1220","1221","1222","1223","1224","1225","1226","1227","1228","1229","1230","1231","1273","1274","1278","1279","1280","1281","1282","1283","1284","1285","1286","1287","1288","1289","1291","1293","1294","1295","1296","1297","1298","1299","1300","1301","1302","1303","1304","1305","1306","1307","1308","1309","1310","1311","1312","1313","1314","1315","1316","1317","1318","1319","1320","1321","1322","1323","1324","1325","1326","1327","1328","1329","1330","1331","1333","1334","1335","1336","1337","1338","1339","1340","1341","1342","1343","1344","1345","1346","1347","1348","1351","1352","1353","1354","1355","1356","1357","1358","1359","1360","1361","1362","1403","1404","1405"],"data":{"count":413,"items":[{"handle":"","id":"1","text":"01
    - ATIVO","children":[{"handle":"","id":"2","text":"01.01 -
    CIRCULANTE","children":[{"handle":"","id":"3","text":"01.01.01 -
    DISPONÍVEL","children":[{"handle":"","id":"42","text":"01.01.01.01 -
    Caixa","children":[{"handle":"","id":"43","text":"01.01.01.01.001 - Caixa
    Geral","children":[]}]},{"handle":"","id":"44","text":"01.01.01.02 - Banco
    contas movimento","children":[{"handle":"","id":"45","text":"01.01.01.02.001
    - Banco do
    Brasil","children":[]},{"handle":"","id":"263","text":"01.01.01.02.002 -
    Bradesco","children":[]}]},{"handle":"","id":"238","text":"01.01.01.03 -
    Aplicacoes de Liquidez
    Imediata","children":[{"handle":"","id":"239","text":"01.01.01.03.001 -
    Aplicacoes BB - Liquidacao
    imediata","children":[]}]}]},{"handle":"","id":"4","text":"01.01.02 -
    CLIENTES","children":[{"handle":"","id":"46","text":"01.01.02.01 - Clientes
    Nacionais","children":[]},{"handle":"","id":"47","text":"01.01.02.02 -
    Clientes
    Estrangeiros","children":[]},{"handle":"","id":"48","text":"01.01.02.03 - (
    - ) Duplicatas
    Descontadas","children":[]},{"handle":"","id":"49","text":"01.01.02.04 - ( -
    ) Provisão para crédito de liquidação
    duvidosa","children":[]},{"handle":"","id":"235","text":"01.01.02.05 - ( - )
    Devoluções a
    compensar","children":[]},{"handle":"","id":"237","text":"01.01.02.06 - ( -
    ) Depositos a
    identificar","children":[]},{"handle":"","id":"1220","text":"01.01.02.07 - (
    - ) Ajuste ao valor
    presente","children":[]},{"handle":"","id":"258","text":"01.01.02.08 -
    Variações Cambiais
    Ativas","children":[]}]},{"handle":"","id":"5","text":"01.01.03 -
    ESTOQUES","children":[{"handle":"","id":"50","text":"01.01.03.01 -
    Mercadoria para
    comercialização","children":[]},{"handle":"","id":"51","text":"01.01.03.02 -
    Almoxarifado","children":[]},{"handle":"","id":"52","text":"01.01.03.03 -
    Produtos Acabados","children":[]},{"handle":"","id":"53","text":"01.01.03.04
    - Produtos em
    elaboração","children":[]},{"handle":"","id":"54","text":"01.01.03.05 -
    Matérias-primas","children":[]},{"handle":"","id":"55","text":"01.01.03.06 -
    Materiais
    Auxiliares","children":[]},{"handle":"","id":"56","text":"01.01.03.07 -
    Estoques em
    trânsito","children":[]},{"handle":"","id":"57","text":"01.01.03.08 -
    Adiantamento a
    fornecedores","children":[]},{"handle":"","id":"58","text":"01.01.03.09 -
    Importações em
    andamento","children":[]},{"handle":"","id":"59","text":"01.01.03.10 - ( - )
    Provisão p/ajuste ao valor de
    mercado","children":[]},{"handle":"","id":"1222","text":"01.01.03.11 - ( - )
    Ajuste ao valor
    presente","children":[]},{"handle":"","id":"231","text":"01.01.03.12 -
    Material de
    Consumo","children":[]},{"handle":"","id":"1358","text":"01.01.03.13 -
    Produtos Acabados (Outros
    tipos)","children":[]},{"handle":"","id":"1359","text":"01.01.03.14 -
    Estoque de
    Embalagens","children":[]}]},{"handle":"","id":"6","text":"01.01.04 -
    IMPOSTOS E CONTRIBUIÇÕES A
    RECUPERAR","children":[{"handle":"","id":"60","text":"01.01.04.01 - IRRF
    Retido a
    Compensar","children":[]},{"handle":"","id":"61","text":"01.01.04.02 - IRPJ
    Retido a
    Compensar","children":[]},{"handle":"","id":"62","text":"01.01.04.03 - CSL
    Retido a
    Compensar","children":[]},{"handle":"","id":"63","text":"01.01.04.04 - ICMS
    a Recuperar","children":[]},{"handle":"","id":"64","text":"01.01.04.05 -
    PIS/PASEP não cumulativo a
    compensar","children":[]},{"handle":"","id":"65","text":"01.01.04.06 -
    COFINS não cumulativo a
    compensar","children":[]},{"handle":"","id":"174","text":"01.01.04.07 - IPI
    a Recuperar","children":[]},{"handle":"","id":"205","text":"01.01.04.08 -
    Pis Retido a
    Compensar","children":[]},{"handle":"","id":"206","text":"01.01.04.09 -
    Cofins Retido a
    Compensar","children":[]},{"handle":"","id":"217","text":"01.01.04.10 - Pis
    a Recuperar na
    Aquisição","children":[]},{"handle":"","id":"218","text":"01.01.04.11 -
    Cofins a Recuperar na
    Aquisição","children":[]},{"handle":"","id":"229","text":"01.01.04.12 - INSS
    Retido a
    Compensar","children":[]},{"handle":"","id":"1180","text":"01.01.04.13 - ISS
    Retido a
    Compensar","children":[]},{"handle":"","id":"1181","text":"01.01.04.14 -
    Cofins a
    Recuperar","children":[]},{"handle":"","id":"1190","text":"01.01.04.15 -
    PIS/COFINS/CSLL Retido a
    Compensar","children":[]}]},{"handle":"","id":"7","text":"01.01.05 - OUTROS
    CREDITOS","children":[{"handle":"","id":"66","text":"01.01.05.01 -
    Adiantamento para
    despesas","children":[]},{"handle":"","id":"67","text":"01.01.05.02 -
    Adiantamento a
    empregados","children":[]}]},{"handle":"","id":"208","text":"01.01.06 -
    REALIZAVEL A CURTO
    PRAZO","children":[{"handle":"","id":"209","text":"01.01.06.01 - TRIBUTOS A
    COMPENSAR","children":[{"handle":"","id":"210","text":"01.01.06.01.001 -
    ICMS A COMPENSAR CURTO
    PRAZO","children":[]},{"handle":"","id":"211","text":"01.01.06.01.002 - PIS
    A COMPENSAR A CURTO
    PRAZO","children":[]},{"handle":"","id":"212","text":"01.01.06.01.003 -
    COFINS A COMPENSAR A CURTO
    PRAZO","children":[]}]},{"handle":"","id":"1191","text":"01.01.06.02 -
    CLIENTES","children":[{"handle":"","id":"1193","text":"01.01.06.02.001 -
    Clientes
    Nacionais","children":[]},{"handle":"","id":"1221","text":"01.01.06.02.002 -
    ( - ) Ajuste ao valor
    presente","children":[]}]},{"handle":"","id":"1286","text":"01.01.06.03 -
    OUTRAS","children":[{"handle":"","id":"1287","text":"01.01.06.03.001 -
    Despesas a
    apropriar","children":[]}]}]}]},{"handle":"","id":"8","text":"01.02 - NÃO
    CIRCULANTE","children":[{"handle":"","id":"9","text":"01.02.01 - REALIZÁVEL
    A LONGO PRAZO","children":[{"handle":"","id":"213","text":"01.02.01.01 -
    TRIBUTOS A
    COMPENSAR","children":[{"handle":"","id":"214","text":"01.02.01.01.001 -
    ICMS A COMPENSAR A LONGO
    PRAZO","children":[]},{"handle":"","id":"215","text":"01.02.01.01.002 - PIS
    A COMPENSAR A LONGO
    PRAZO","children":[]},{"handle":"","id":"216","text":"01.02.01.01.003 -
    COFINS A COMPENSAR A LONGO
    PRAZO","children":[]}]},{"handle":"","id":"1192","text":"01.02.01.02 -
    CLIENTES","children":[{"handle":"","id":"1194","text":"01.02.01.02.001 -
    Clientes
    Nacionais","children":[]}]}]},{"handle":"","id":"10","text":"01.02.02 -
    INVESTIMENTOS","children":[{"handle":"","id":"68","text":"01.02.02.01 -
    Participações
    Societárias","children":[]},{"handle":"","id":"69","text":"01.02.02.02 -
    Imóveis para
    Investimento","children":[]},{"handle":"","id":"1227","text":"01.02.02.03 -
    ( - ) Redução estimada do
    ágio","children":[]},{"handle":"","id":"1228","text":"01.02.02.04 - ( - )
    Redução estimada de participação
    societária","children":[]}]},{"handle":"","id":"11","text":"01.02.03 -
    IMOBILIZADO","children":[{"handle":"","id":"70","text":"01.02.03.01 -
    Maquinas e
    Ferramentas","children":[]},{"handle":"","id":"71","text":"01.02.03.02 -
    Móveis e
    Utensílios","children":[]},{"handle":"","id":"72","text":"01.02.03.03 -
    Instalações","children":[]},{"handle":"","id":"73","text":"01.02.03.04 -
    Veículos","children":[]},{"handle":"","id":"74","text":"01.02.03.05 -
    Computadores e
    periféricos","children":[]},{"handle":"","id":"1224","text":"01.02.03.06 -
    Máquinas e Ferramentas ICPC
    10","children":[]},{"handle":"","id":"1351","text":"01.02.03.07 -
    Equipamentos Adoção Lei
    12973","children":[]},{"handle":"","id":"1225","text":"01.02.03.09 - ( - )
    REDUÇÃO ESTIMADA DE
    IMOBILIZADO","children":[{"handle":"","id":"1226","text":"01.02.03.09.001 -
    ( - ) Redução estimada de Máquinas e
    Ferramentas","children":[]}]},{"handle":"","id":"75","text":"01.02.03.10 - (
    - ) Depreciação
    Acumulada","children":[{"handle":"","id":"76","text":"01.02.03.10.001 - (- )
    Deprec. Acumulada Móveis e
    utensílios","children":[]},{"handle":"","id":"77","text":"01.02.03.10.002 -
    (- ) Deprec. Acumulada
    Instalações","children":[]},{"handle":"","id":"78","text":"01.02.03.10.003 -
    (- ) Deprec. Acumulada
    Veículos","children":[]},{"handle":"","id":"79","text":"01.02.03.10.004 - (-
    ) Deprec. Acumulada computadores e
    periféricos","children":[]},{"handle":"","id":"240","text":"01.02.03.10.005
    - (-) Depreciacoes Acumulada de Maquinas e
    Equip.","children":[]},{"handle":"","id":"1352","text":"01.02.03.10.006 -
    (-) Depreciacoes Acumulada Equipamentos Adoção Lei
    12973","children":[]},{"handle":"","id":"1353","text":"01.02.03.10.007 - (-)
    Depreciacoes Acumulada Equipamentos Adoção Lei 12973 -
    Subconta","children":[]}]},{"handle":"","id":"255","text":"01.02.03.11 - ( -
    ) Provisões para
    Perdas","children":[{"handle":"","id":"256","text":"01.02.03.11.001 - (-)
    Provisões para perdas de Máquinas e
    Equipamentos","children":[]},{"handle":"","id":"257","text":"01.02.03.11.002
    - (-)Provisão Para Perdas de
    Veículos","children":[]}]},{"handle":"","id":"1279","text":"01.02.03.12 -
    Impostos não recuperados a imobilizar
    (transitória)","children":[]},{"handle":"","id":"1405","text":"01.02.03.13 -
    IMOBILIZADO WEB","children":[]}]},{"handle":"","id":"12","text":"01.02.04 -
    INTANGÍVEL","children":[{"handle":"","id":"80","text":"01.02.04.01 -
    Sofwares","children":[]},{"handle":"","id":"81","text":"01.02.04.02 - Marcas
    e patentes","children":[]}]}]}]},{"handle":"","id":"13","text":"02 -
    PASSIVO","children":[{"handle":"","id":"14","text":"02.01 -
    CIRCULANTE","children":[{"handle":"","id":"15","text":"02.01.01 -
    FORNECEDORES","children":[{"handle":"","id":"82","text":"02.01.01.01 -
    Fornecedores
    Nacionais","children":[]},{"handle":"","id":"83","text":"02.01.01.02 -
    Fornecedores
    Estrangeiros","children":[]},{"handle":"","id":"259","text":"02.01.01.05 -
    Variações Cambiais
    Passivas","children":[]},{"handle":"","id":"1223","text":"02.01.01.06 - ( -
    ) Ajuste ao valor
    presente","children":[]},{"handle":"","id":"261","text":"02.01.01.99 -
    Devoluções de Fornecedores
    Nacionais","children":[]}]},{"handle":"","id":"16","text":"02.01.02 -
    IMPOSTOS E CONTRIBUICOES A
    RECOLHER","children":[{"handle":"","id":"84","text":"02.01.02.01 - ICMS a
    recolher","children":[]},{"handle":"","id":"85","text":"02.01.02.02 -
    PIS/PASEP a
    Recolher","children":[]},{"handle":"","id":"86","text":"02.01.02.03 - COFINS
    a Recolher","children":[]},{"handle":"","id":"87","text":"02.01.02.04 -
    Provisão para
    IRPJ","children":[]},{"handle":"","id":"88","text":"02.01.02.05 - Provisão
    para CSL","children":[]},{"handle":"","id":"89","text":"02.01.02.06 - IRRF a
    Recolher - Folha","children":[]},{"handle":"","id":"163","text":"02.01.02.07
    - ISS a Recolher","children":[]},{"handle":"","id":"198","text":"02.01.02.08
    - Csll a
    Recolher","children":[]},{"handle":"","id":"199","text":"02.01.02.09 - IPI a
    recolher","children":[]},{"handle":"","id":"1182","text":"02.01.02.10 -
    PIS/COFINS/CSLL Retido a
    Recolher","children":[]},{"handle":"","id":"1183","text":"02.01.02.11 - PIS
    Retido a
    Recolher","children":[]},{"handle":"","id":"1184","text":"02.01.02.12 -
    Cofins Retido a
    Recolher","children":[]},{"handle":"","id":"1185","text":"02.01.02.13 - CSLL
    Retida a
    Recolher","children":[]},{"handle":"","id":"1186","text":"02.01.02.14 - ISS
    Retido a
    Recolher","children":[]},{"handle":"","id":"1187","text":"02.01.02.15 - IRRF
    - PF Serviçços a
    Recolher","children":[]},{"handle":"","id":"1188","text":"02.01.02.16 - IRRF
    - PJ - Serviços a
    Recolher","children":[]},{"handle":"","id":"1280","text":"02.01.02.17 -
    Contribuição previdenciária a
    Recolher","children":[]}]},{"handle":"","id":"18","text":"02.01.03 -
    OBRIGAÇÕES
    TRABALHISTAS","children":[{"handle":"","id":"90","text":"02.01.03.01 -
    Salários e Ordenados a
    Pagar","children":[]},{"handle":"","id":"91","text":"02.01.03.02 - Comissões
    a PAgar","children":[]},{"handle":"","id":"92","text":"02.01.03.03 - FGTS a
    Recolher","children":[]},{"handle":"","id":"93","text":"02.01.03.04 - INSS a
    Recolher","children":[]},{"handle":"","id":"94","text":"02.01.03.05 -
    Provisão para 13 Salário e
    Encargos","children":[]},{"handle":"","id":"95","text":"02.01.03.06 -
    Provisão para Férias e
    Encargos","children":[]},{"handle":"","id":"1189","text":"02.01.03.07 - INSS
    Retido a Recolher","children":[]}]},{"handle":"","id":"19","text":"02.01.04
    - EMPRÉSTIMOS
    BANCÁRIOS","children":[{"handle":"","id":"223","text":"02.01.04.01 - Banco
    do Brasil","children":[]},{"handle":"","id":"1178","text":"02.01.04.90 -
    Juros a apropriar","children":[]}]},{"handle":"","id":"20","text":"02.01.05
    - FINANCIAMENTOS","children":[{"handle":"","id":"224","text":"02.01.05.01 -
    Banco do Brasil","children":[]},{"handle":"","id":"243","text":"02.01.05.02
    - Arrendamento mercantil a pagar -
    BB","children":[]},{"handle":"","id":"247","text":"02.01.05.10 - Juros a
    apropriar","children":[]}]},{"handle":"","id":"260","text":"02.01.06 -
    ADIANTAMENTOS","children":[{"handle":"","id":"203","text":"02.01.06.01 -
    Adiantamento de
    clientes","children":[]}]},{"handle":"","id":"248","text":"02.01.07 -
    RECEITAS DIFERIDAS","children":[{"handle":"","id":"249","text":"02.01.07.01
    - Receitas a
    Apropriar","children":[]}]}]},{"handle":"","id":"21","text":"02.02 - NÃO
    CIRCULANTE","children":[{"handle":"","id":"241","text":"02.02.01 -
    EMPRÉSTIMOS E
    FINANCIAMENTOS","children":[{"handle":"","id":"242","text":"02.02.01.01 -
    Empréstimos
    Bancários","children":[]},{"handle":"","id":"244","text":"02.02.01.02 -
    Financiamentos","children":[]},{"handle":"","id":"245","text":"02.02.01.03 -
    Arrendamento mercantil a
    pagar","children":[]},{"handle":"","id":"246","text":"02.02.01.10 - Juros a
    apropriar","children":[]}]},{"handle":"","id":"250","text":"02.02.02 -
    RECEITAS DIFERIDAS","children":[{"handle":"","id":"251","text":"02.02.02.01
    - Receitas a
    Apropriar","children":[]}]}]},{"handle":"","id":"22","text":"02.03 -
    PATRIMÔNIO LÍQUIDO","children":[{"handle":"","id":"23","text":"02.03.01 -
    CAPITAL SOCIAL","children":[{"handle":"","id":"96","text":"02.03.01.01 -
    Capital Subscrito","children":[]},{"handle":"","id":"97","text":"02.03.01.02
    - ( - ) Capital a
    integralizar","children":[]}]},{"handle":"","id":"24","text":"02.03.02 -
    RESERVAS DE CAPITAL","children":[{"handle":"","id":"98","text":"02.03.02.01
    - Correção monetária do capital
    integralizado","children":[]},{"handle":"","id":"99","text":"02.03.02.02 -
    Ágio na emissão de
    ações","children":[]},{"handle":"","id":"100","text":"02.03.02.03 -
    Alienação de bônus de
    subscrição","children":[]},{"handle":"","id":"101","text":"02.03.02.04 -
    Alienação de partes
    beneficiárias","children":[]},{"handle":"","id":"102","text":"02.03.02.05 -
    ( - ) Ações em
    tesouraria","children":[]}]},{"handle":"","id":"25","text":"02.03.03 -
    AJUSTES DE AVALIAÇÃO
    PATRIMONIAL","children":[{"handle":"","id":"103","text":"02.03.03.01 -
    Ajuste de elementos do
    ativo","children":[]},{"handle":"","id":"104","text":"02.03.03.02 - ( - )
    Ajustes de elementos do
    passivo","children":[]}]},{"handle":"","id":"26","text":"02.03.04 - RESERVAS
    DE LUCRO","children":[{"handle":"","id":"105","text":"02.03.04.01 - Reserva
    Legal","children":[]},{"handle":"","id":"106","text":"02.03.04.02 - Reservas
    Estatutárias","children":[]},{"handle":"","id":"107","text":"02.03.04.03 -
    Reservas para
    Contingências","children":[]},{"handle":"","id":"108","text":"02.03.04.04 -
    Retenção de
    lucros","children":[]},{"handle":"","id":"109","text":"02.03.04.05 -
    Reservas de lucros a
    realizar","children":[]},{"handle":"","id":"110","text":"02.03.04.06 -
    Reserva Especial para Dividendos
    Obrigatórios","children":[]},{"handle":"","id":"111","text":"02.03.04.07 -
    Reserva de incentivos
    fiscais","children":[]},{"handle":"","id":"112","text":"02.03.04.08 - ( - )
    Ações em
    tesouraria","children":[]}]},{"handle":"","id":"27","text":"02.03.05 -
    PREJUÍZOS
    ACUMULADOS","children":[{"handle":"","id":"113","text":"02.03.05.01 - ( - )
    Prejuízos
    Acumulados","children":[]},{"handle":"","id":"114","text":"02.03.05.02 -
    Resultado do Exercício em
    Curso","children":[]}]}]}]},{"handle":"","id":"28","text":"03 -
    RECEITAS","children":[{"handle":"","id":"29","text":"03.01 - RECEITA DE
    VENDA DE MERCADORIAS","children":[{"handle":"","id":"31","text":"03.01.01 -
    RECEITA BRUTA DE VENDA DE
    MERCADORIAS","children":[{"handle":"","id":"115","text":"03.01.01.01 -
    Vendas no mercado interno fabricação
    própria","children":[]},{"handle":"","id":"1273","text":"03.01.01.02 -
    Vendas no mercado interno
    revenda","children":[]},{"handle":"","id":"116","text":"03.01.01.03 - Vendas
    no mercado
    externo","children":[]},{"handle":"","id":"1281","text":"03.01.01.04 -
    Receita com 2 contas
    referenciais","children":[]},{"handle":"","id":"1282","text":"03.01.01.05 -
    Receita com 2 contas referenciais
    02","children":[]},{"handle":"","id":"1283","text":"03.01.01.06 - Receita
    com 2 contas referenciais
    03","children":[]},{"handle":"","id":"1284","text":"03.01.01.07 - Receita
    com 2 contas referenciais
    04","children":[]},{"handle":"","id":"1354","text":"03.01.01.08 - Receitas
    tributadas pelo PIS/COFINS - F100
    automático","children":[]},{"handle":"","id":"1355","text":"03.01.01.09 -
    Receitas tributadas pelo PIS/COFINS com cc - F100
    automático","children":[]},{"handle":"","id":"1356","text":"03.01.01.10 -
    Receitas isentas de PIS/COFINS - F100
    automático","children":[]},{"handle":"","id":"1357","text":"03.01.01.11 -
    Receitas isentas de PIS/COFINS com cc - F100
    automático","children":[]}]},{"handle":"","id":"164","text":"03.01.02 -
    RECEITA BRUTA DA VENDA DE
    SERVIÇOS","children":[{"handle":"","id":"165","text":"03.01.02.01 - Venda de
    serviços ao mercado
    interno","children":[]},{"handle":"","id":"1274","text":"03.01.02.02 - Venda
    de serviços ao mercado
    externo","children":[]}]},{"handle":"","id":"32","text":"03.01.03 - ( - )
    DEDUÇÕES DA VENDAS","children":[{"handle":"","id":"117","text":"03.01.03.01
    - Vendas
    Canceladas","children":[]},{"handle":"","id":"118","text":"03.01.03.02 -
    Devolução de
    Vendas","children":[]},{"handle":"","id":"119","text":"03.01.03.03 -
    TRIBUTOS SOBRE
    VENDAS","children":[{"handle":"","id":"120","text":"03.01.03.03.001 - ICMS
    s/vendas","children":[]},{"handle":"","id":"121","text":"03.01.03.03.002 -
    PIS/PASEP sobre
    vendas","children":[]},{"handle":"","id":"171","text":"03.01.03.03.003 -
    Cofins sobre
    vendas","children":[]},{"handle":"","id":"191","text":"03.01.03.03.004 -
    ISS","children":[]},{"handle":"","id":"202","text":"03.01.03.03.005 - IPI
    s/vendas","children":[]},{"handle":"","id":"227","text":"03.01.03.03.006 -
    CSLL
    s/vendas","children":[]},{"handle":"","id":"228","text":"03.01.03.03.007 -
    IRRF
    s/vendas","children":[]},{"handle":"","id":"230","text":"03.01.03.03.008 -
    PIS Cumulativo
    s/Vendas","children":[]},{"handle":"","id":"1278","text":"03.01.03.03.009 -
    PIS/COFINS/CSLL
    s/venda","children":[]},{"handle":"","id":"1285","text":"03.01.03.03.010 -
    Contribuição previdenciária sobre
    vendas","children":[]}]},{"handle":"","id":"1179","text":"03.01.03.04 -
    Abatimentos
    concedidos","children":[]}]}]},{"handle":"","id":"30","text":"03.02 -
    RECEITAS FINANCEIRAS","children":[{"handle":"","id":"1195","text":"03.02.01
    - RECEITAS
    FINANCEIRAS","children":[{"handle":"","id":"1196","text":"03.02.01.01 -
    Descontos
    Obtidos","children":[]},{"handle":"","id":"1197","text":"03.02.01.02 - Juros
    Ativos","children":[]},{"handle":"","id":"1198","text":"03.02.01.03 -
    Variação Cambial
    Ativa","children":[]},{"handle":"","id":"1199","text":"03.02.01.04 - Multas
    Recebidas","children":[]},{"handle":"","id":"1200","text":"03.02.01.05 -
    Receita de Aplicações
    Financeiras","children":[]},{"handle":"","id":"1201","text":"03.02.01.06 -
    Outras Receitas
    Financeiras","children":[]}]}]},{"handle":"","id":"33","text":"03.03 -
    OUTRAS RECEITAS","children":[{"handle":"","id":"1202","text":"03.03.01 -
    OUTRAS RECEITAS","children":[{"handle":"","id":"1203","text":"03.03.01.01 -
    Venda de bens do ativo
    imobilizado","children":[]},{"handle":"","id":"1204","text":"03.03.01.02 -
    Alugueis","children":[]},{"handle":"","id":"1205","text":"03.03.01.03 -
    Outras receitas","children":[]},{"handle":"","id":"1206","text":"03.03.01.04
    - Recuperacao de Creditos Baixados como
    Prejuizo","children":[]},{"handle":"","id":"1207","text":"03.03.01.05 -
    Receitas Decorrentes de Ajustes a Valor
    Justo","children":[]},{"handle":"","id":"1208","text":"03.03.01.06 -
    Receitas Decorrentes de Ajustes a Valor
    Presente","children":[]},{"handle":"","id":"1209","text":"03.03.01.07 -
    Receitas Decorrentes de Outros Ajustes aos Padrões Internacionais de
    Contabilida","children":[]},{"handle":"","id":"1360","text":"03.03.01.08 -
    Outras receitas
    02","children":[]},{"handle":"","id":"1361","text":"03.03.01.09 - Outras
    receitas 03","children":[]},{"handle":"","id":"1404","text":"03.03.01.10 -
    Receitas de equivalência
    patrimonial","children":[]}]}]},{"handle":"","id":"1306","text":"03.04 -
    RECEITAS INSTITUIÇÕES
    FINANCEIRAS","children":[{"handle":"","id":"1307","text":"03.04.01 -
    RECEITAS
    OPERACIONAIS","children":[{"handle":"","id":"1311","text":"03.04.01.01 -
    Rendas de Operações de
    Crédito","children":[{"handle":"","id":"1316","text":"03.04.01.01.001 -
    Rendas de
    empréstimos","children":[]},{"handle":"","id":"1317","text":"03.04.01.01.002
    - Rendas de títulos
    descontados","children":[]},{"handle":"","id":"1318","text":"03.04.01.01.003
    - Rendas de
    financiamentos","children":[]}]},{"handle":"","id":"1314","text":"03.04.01.02
    - Rendas de
    Câmbio","children":[{"handle":"","id":"1319","text":"03.04.01.02.001 -
    Rendas de operações de
    câmbio","children":[]},{"handle":"","id":"1320","text":"03.04.01.02.002 -
    Rendas de variações e diferenças de
    taxas","children":[]}]},{"handle":"","id":"1315","text":"03.04.01.03 -
    Rendas com Títulos e Valores Mobiliários e Instrumentos Financeiros
    Derivativos","children":[{"handle":"","id":"1321","text":"03.04.01.03.001 -
    Rendas de títulos de renda
    fixa","children":[]},{"handle":"","id":"1322","text":"03.04.01.03.002 -
    Rendas de títulos de renda
    variável","children":[]}]}]},{"handle":"","id":"1308","text":"03.04.02 -
    RECEITAS NAO
    OPERACIONAIS","children":[{"handle":"","id":"1312","text":"03.04.02.01 -
    Lucros em Transações com Valores e
    Bens","children":[{"handle":"","id":"1328","text":"03.04.02.01.001 - Lucros
    na alienação de
    investimentos","children":[]},{"handle":"","id":"1329","text":"03.04.02.01.002
    - Lucros na alienação de valores e
    bens","children":[]}]},{"handle":"","id":"1340","text":"03.04.02.02 - Outras
    Receitas
    Operacionais","children":[{"handle":"","id":"1341","text":"03.04.02.02.001 -
    Reversão de provisões
    operacionais","children":[]},{"handle":"","id":"1342","text":"03.04.02.02.002
    - Outras rendas
    operacionais","children":[]}]},{"handle":"","id":"1313","text":"03.04.02.03
    - Outras Receitas Não
    Operacionais","children":[{"handle":"","id":"1330","text":"03.04.02.03.001 -
    Ganhos de
    capital","children":[]},{"handle":"","id":"1331","text":"03.04.02.03.002 -
    Rendas de
    aluguéis","children":[]}]},{"handle":"","id":"1326","text":"03.04.02.04 -
    Receita decorrente da venda de bens do ativo
    permanente","children":[{"handle":"","id":"1327","text":"03.04.02.04.001 -
    Receita da venda de bens do ativo permanente (não-circulante) –
    Imobilizado","children":[]}]}]},{"handle":"","id":"1309","text":"03.04.03 -
    (- ) DEDUÇÕES DAS
    RECEITAS","children":[{"handle":"","id":"1323","text":"03.04.03.01 - Vendas
    Canceladas","children":[{"handle":"","id":"1324","text":"03.04.03.01.001 -
    Descontos
    incondicionais","children":[]},{"handle":"","id":"1325","text":"03.04.03.01.002
    - Vendas canceladas –
    Serviços","children":[]}]},{"handle":"","id":"1343","text":"03.04.03.02 -
    Recuperações de créditos baixados como perda, limitados aos valores
    efetivamente","children":[{"handle":"","id":"1344","text":"03.04.03.02.001 -
    Recuperação de créditos no período – Renegociação de
    dívida","children":[]},{"handle":"","id":"1345","text":"03.04.03.02.002 -
    Recuperação de créditos no período – Demais formas de
    recuperação","children":[]}]}]}]}]},{"handle":"","id":"34","text":"04 -
    CUSTOS E DESPESAS","children":[{"handle":"","id":"35","text":"04.01 - CUSTOS
    E DESPESAS OPERACIONAIS","children":[{"handle":"","id":"36","text":"04.01.01
    - CUSTOS DAS VENDAS","children":[{"handle":"","id":"127","text":"04.01.01.01
    - Custos dos Produtos
    Vendidos","children":[]},{"handle":"","id":"268","text":"04.01.01.02 -
    Custos da Mercadorias
    Revendidas","children":[]}]},{"handle":"","id":"128","text":"04.01.02 -
    CUSTO DOS SERVIÇOS
    PRESTADOS","children":[{"handle":"","id":"129","text":"04.01.02.01 - Custo
    dos serviços
    vendidos","children":[]}]},{"handle":"","id":"37","text":"04.01.03 -
    DESPESAS COM VENDAS","children":[{"handle":"","id":"130","text":"04.01.03.01
    - DESPESAS COM
    PESSOAL","children":[{"handle":"","id":"175","text":"04.01.03.01.001 -
    Salarios/Ordenados","children":[]},{"handle":"","id":"176","text":"04.01.03.01.002
    - Ferias","children":[]},{"handle":"","id":"177","text":"04.01.03.01.003 -
    13 Salario","children":[]},{"handle":"","id":"178","text":"04.01.03.01.004 -
    INSS","children":[]},{"handle":"","id":"179","text":"04.01.03.01.005 -
    FGTS","children":[]},{"handle":"","id":"269","text":"04.01.03.01.006 -
    Treinamento","children":[]},{"handle":"","id":"270","text":"04.01.03.01.007
    - Alimentação","children":[]}]},{"handle":"","id":"131","text":"04.01.03.02
    - Consumo de
    telefone","children":[]},{"handle":"","id":"132","text":"04.01.03.03 -
    Consumo de água","children":[]},{"handle":"","id":"133","text":"04.01.03.04
    - Consumo de energia
    elétrica","children":[]},{"handle":"","id":"134","text":"04.01.03.05 -
    IMPOSTOS E
    TAXAS","children":[{"handle":"","id":"185","text":"04.01.03.05.001 - Taxas
    Federais","children":[]},{"handle":"","id":"186","text":"04.01.03.05.002 -
    Taxas
    Estaduais","children":[]},{"handle":"","id":"187","text":"04.01.03.05.003 -
    IPTU","children":[]},{"handle":"","id":"188","text":"04.01.03.05.004 - Taxas
    Municipais","children":[]},{"handle":"","id":"189","text":"04.01.03.05.005 -
    Outras Taxas","children":[]},{"handle":"","id":"190","text":"04.01.03.05.006
    - Impostos
    Diversos","children":[]},{"handle":"","id":"200","text":"04.01.03.05.007 -
    Contribuições
    Patronais","children":[]}]},{"handle":"","id":"135","text":"04.01.03.06 -
    Aluguel","children":[]},{"handle":"","id":"136","text":"04.01.03.07 -
    Combustíveis","children":[]},{"handle":"","id":"137","text":"04.01.03.08 -
    Despesas com
    Viagens","children":[]},{"handle":"","id":"138","text":"04.01.03.09 -
    Depreciações","children":[{"handle":"","id":"139","text":"04.01.03.09.001 -
    Móveis e
    Utensílios","children":[]},{"handle":"","id":"140","text":"04.01.03.09.002 -
    Instalações","children":[]},{"handle":"","id":"141","text":"04.01.03.09.003
    - Veículos","children":[]},{"handle":"","id":"142","text":"04.01.03.09.004 -
    Computadores e
    periféricos","children":[]}]},{"handle":"","id":"225","text":"04.01.03.10 -
    Frete s/vendas","children":[]},{"handle":"","id":"226","text":"04.01.03.11 -
    Seguro","children":[]},{"handle":"","id":"234","text":"04.01.03.12 -
    Serviços de
    Tomados","children":[]},{"handle":"","id":"1403","text":"04.01.03.13 -
    Propaganda","children":[]}]},{"handle":"","id":"38","text":"04.01.04 -
    DESPESAS
    ADMINISTRATIVAS","children":[{"handle":"","id":"143","text":"04.01.04.01 -
    DESPESAS COM
    PESSOAL","children":[{"handle":"","id":"180","text":"04.01.04.01.001 -
    Salarios/Ordenados","children":[]},{"handle":"","id":"181","text":"04.01.04.01.002
    - Ferias","children":[]},{"handle":"","id":"182","text":"04.01.04.01.003 -
    13o. Salario","children":[]},{"handle":"","id":"183","text":"04.01.04.01.004
    - INSS","children":[]},{"handle":"","id":"184","text":"04.01.04.01.005 -
    FGTS","children":[]},{"handle":"","id":"219","text":"04.01.04.01.006 -
    Alimentação de sócios e
    acionistas","children":[]},{"handle":"","id":"279","text":"04.01.04.01.007 -
    Alimentação","children":[]},{"handle":"","id":"280","text":"04.01.04.01.008
    - Treinamento","children":[]}]},{"handle":"","id":"144","text":"04.01.04.02
    - Consumo de
    telefone","children":[]},{"handle":"","id":"145","text":"04.01.04.03 -
    Consumo de água","children":[]},{"handle":"","id":"146","text":"04.01.04.04
    - Consumo de energia
    elétrica","children":[]},{"handle":"","id":"147","text":"04.01.04.05 -
    IMPOSTOS E
    TAXAS","children":[{"handle":"","id":"192","text":"04.01.04.05.001 -
    Taxas","children":[]},{"handle":"","id":"193","text":"04.01.04.05.002 -
    IPTU","children":[]},{"handle":"","id":"194","text":"04.01.04.05.003 -
    Contribuições
    Patronais","children":[]},{"handle":"","id":"201","text":"04.01.04.05.007 -
    Outras Taxas","children":[]}]},{"handle":"","id":"148","text":"04.01.04.06 -
    Aluguel","children":[]},{"handle":"","id":"149","text":"04.01.04.07 -
    Combustíveis","children":[]},{"handle":"","id":"150","text":"04.01.04.08 -
    Despesas com
    Viagens","children":[]},{"handle":"","id":"151","text":"04.01.04.09 -
    Depreciações","children":[{"handle":"","id":"152","text":"04.01.04.09.001 -
    Móveis e
    Utensílios","children":[]},{"handle":"","id":"153","text":"04.01.04.09.002 -
    Despesa de
    depreciação","children":[]},{"handle":"","id":"154","text":"04.01.04.09.003
    - Veículos","children":[]},{"handle":"","id":"155","text":"04.01.04.09.004 -
    Computadores e
    periféricos","children":[]}]},{"handle":"","id":"207","text":"04.01.04.10 -
    Impostos Não
    Recuperados","children":[]},{"handle":"","id":"232","text":"04.01.04.11 -
    Material de
    consumo","children":[]},{"handle":"","id":"233","text":"04.01.04.12 -
    Serviços tomados","children":[]},{"handle":"","id":"236","text":"04.01.04.13
    - Perdas clientes","children":[]}]},{"handle":"","id":"39","text":"04.01.05
    - DESPESAS
    FINANCEIRAS","children":[{"handle":"","id":"156","text":"04.01.05.01 - Juros
    Passivos","children":[]},{"handle":"","id":"157","text":"04.01.05.02 -
    Descontos
    Concedidos","children":[]},{"handle":"","id":"158","text":"04.01.05.03 -
    Variação Cambial
    Passiva","children":[]},{"handle":"","id":"262","text":"04.01.05.04 - Multas
    Pagas","children":[]},{"handle":"","id":"264","text":"04.01.05.06 - Despesas
    Bancárias","children":[]},{"handle":"","id":"265","text":"04.01.05.07 -
    IOF","children":[]}]},{"handle":"","id":"271","text":"04.01.06 - CUSTOS DE
    PRODUÇÃO","children":[{"handle":"","id":"272","text":"04.01.06.01 -
    MATERIAIS
    DIRETOS","children":[{"handle":"","id":"273","text":"04.01.06.01.001 -
    Matérias
    Primas","children":[]},{"handle":"","id":"274","text":"04.01.06.01.002 -
    Materiais
    Auxiliares","children":[]},{"handle":"","id":"275","text":"04.01.06.01.003 -
    Material de
    Embalagem","children":[]}]},{"handle":"","id":"276","text":"04.01.06.02 -
    INDUSTRIALIZAÇÕES DE
    TERCEIROS","children":[{"handle":"","id":"277","text":"04.01.06.02.001 -
    Industrialização de
    Terceiros","children":[]}]},{"handle":"","id":"278","text":"04.01.06.03 -
    DESPESAS COM
    PESSOAL","children":[{"handle":"","id":"281","text":"04.01.06.03.001 -
    Salários/Ordenados","children":[]},{"handle":"","id":"282","text":"04.01.06.03.002
    - Férias","children":[]},{"handle":"","id":"283","text":"04.01.06.03.003 -
    13 Salário","children":[]},{"handle":"","id":"284","text":"04.01.06.03.004 -
    INSS","children":[]},{"handle":"","id":"285","text":"04.01.06.03.005 -
    FGTS","children":[]},{"handle":"","id":"286","text":"04.01.06.03.006 -
    Alimentação","children":[]},{"handle":"","id":"287","text":"04.01.06.03.007
    - Treinamento","children":[]}]},{"handle":"","id":"288","text":"04.01.06.04
    - GASTOS GERAIS","children":[{"handle":"","id":"289","text":"04.01.06.04.001
    -
    Depreciações","children":[]},{"handle":"","id":"290","text":"04.01.06.04.002
    -
    Manutenções","children":[]},{"handle":"","id":"291","text":"04.01.06.04.003
    - Consumo de
    Telefone","children":[]},{"handle":"","id":"1177","text":"04.01.06.04.004 -
    Aluguéis","children":[]},{"handle":"","id":"292","text":"04.01.06.04.005 -
    Consumo de
    Água","children":[]},{"handle":"","id":"293","text":"04.01.06.04.006 -
    Consumo de Energia
    Elétrica","children":[]},{"handle":"","id":"294","text":"04.01.06.04.007 -
    Material de
    Consumo","children":[]},{"handle":"","id":"295","text":"04.01.06.04.008 -
    Arrendamento
    Mercantil","children":[]},{"handle":"","id":"296","text":"04.01.06.04.009 -
    Impostos e
    Taxas","children":[]},{"handle":"","id":"297","text":"04.01.06.04.010 -
    Despesas de
    Viagens","children":[]},{"handle":"","id":"298","text":"04.01.06.04.011 -
    Combustíveis e
    Lubrificantes","children":[]},{"handle":"","id":"299","text":"04.01.06.04.012
    - Desenvolvimento de Novos
    Projetos","children":[]},{"handle":"","id":"300","text":"04.01.06.04.013 -
    Contribuições
    Patronais","children":[]}]},{"handle":"","id":"301","text":"04.01.06.90 -
    (-)CUSTOS
    ABSORVIDOS","children":[{"handle":"","id":"302","text":"04.01.06.90.001 -
    (-)Custos de Produção
    Absorvidos","children":[]}]}]}]},{"handle":"","id":"40","text":"04.02 -
    OUTRAS DESPESAS","children":[{"handle":"","id":"1210","text":"04.02.01 -
    OUTRAS DESPESAS","children":[{"handle":"","id":"1211","text":"04.02.01.01 -
    Doações","children":[]},{"handle":"","id":"1212","text":"04.02.01.02 - Custo
    do Imobilizado
    Vendido","children":[]},{"handle":"","id":"1213","text":"04.02.01.03 -
    Alienação de bens do
    imobilizado","children":[]},{"handle":"","id":"1214","text":"04.02.01.04 -
    Brindes","children":[]},{"handle":"","id":"1215","text":"04.02.01.05 -
    Multas de
    trânsito","children":[]},{"handle":"","id":"1216","text":"04.02.01.06 -
    Despesas Decorrentes de Ajustes a Valor
    Justo","children":[]},{"handle":"","id":"1217","text":"04.02.01.07 -
    Despesas Decorrentes de Ajustes a Valor
    Presente","children":[]},{"handle":"","id":"1218","text":"04.02.01.08 -
    Perdas Decorrentes de Teste de Recuperabilidade do Imobilizado e do
    Intangível","children":[]},{"handle":"","id":"1219","text":"04.02.01.09 -
    Despesas Decorrentes de Outros Ajustes aos Padrões Internacionais de
    Contabilida","children":[]},{"handle":"","id":"1362","text":"04.02.01.10 -
    Outras despesas 01","children":[]}]}]},{"handle":"","id":"41","text":"04.03
    - PROVISÕES","children":[{"handle":"","id":"1229","text":"04.03.01 -
    PROVISÃO PARA IRPJ E CONTRIBUIÇÃO
    SOCIAL","children":[{"handle":"","id":"1230","text":"04.03.01.01 - Provisão
    para IRPJ","children":[]},{"handle":"","id":"1231","text":"04.03.01.02 -
    Provisão para Contribuição
    Social","children":[]}]}]},{"handle":"","id":"1288","text":"04.04 - DESPESA
    COOPERATIVAS","children":[{"handle":"","id":"1289","text":"04.04.01 -
    DISPÊNDIOS REPASSE COOPERADO ( Exclusão SPED Coop
    Geral)","children":[{"handle":"","id":"1291","text":"04.04.01.01 - 51 /1
    Despesas repasse cooperativa (Exclusão SPED Coop Geral
    Cod.Contr.51/1)","children":[]},{"handle":"","id":"1293","text":"04.04.01.02
    - 51/1 Despesas repasse cooperativa 2 (Exclusão SPED Coop Geral
    Cod.Contr.51/1)","children":[]},{"handle":"","id":"1294","text":"04.04.01.03
    - 52/2 Despesas repasse cooperativa 3 (Exclusão SPED Coop Geral
    Cod.Contr.52/2)","children":[]},{"handle":"","id":"1295","text":"04.04.01.04
    - 51/1 Despesas sem CC 1 (Exclusão SPED Coop Geral
    Cod.Contr.51/1)","children":[]},{"handle":"","id":"1301","text":"04.04.01.05
    - 52/2 Despesas sem CC 2 (Exclusão SPED Coop Geral
    Cod.Contr.52/2)","children":[]},{"handle":"","id":"1300","text":"04.04.01.06
    - 31 Despesas sem CC 2 (Exclusão SPED Coop Geral
    Cod.Contr.31)","children":[]},{"handle":"","id":"1302","text":"04.04.01.07 -
    31 Despesas repasse cooperativa 3 (Exclusão SPED Coop Geral Cod.Contr.
    31)","children":[]}]},{"handle":"","id":"1296","text":"04.04.02 - DISPÊNDIOS
    FRETES (Exclusão SPED Tipo Soc
    Coop)","children":[{"handle":"","id":"1297","text":"04.04.02.01 - 51/1
    Despesas frete 01 (Exclusão SPED Tipo Soc Coop
    Cod.Contr.51/1)","children":[]},{"handle":"","id":"1298","text":"04.04.02.02
    - 52/2 Despesas ao frete 01 (Exclusão SPED Tipo Soc Coop
    Cod.Contr.52/2)","children":[]},{"handle":"","id":"1299","text":"04.04.02.03
    - 51/1 Despesas ao frete 03 (Exclusão SPED Tipo Soc Coop
    Cod.Contr.51/1)","children":[]},{"handle":"","id":"1303","text":"04.04.02.04
    - 51/1 Despesas frete sem CC (Exclusão SPED Tipo Soc Coop
    Cod.Contr.51/1)","children":[]},{"handle":"","id":"1304","text":"04.04.02.05
    - 52/2 Despesas frete sem CC (Exclusão SPED Tipo Soc Coop
    Cod.Contr.52/2)","children":[]},{"handle":"","id":"1305","text":"04.04.02.06
    - 31 Despesas com relativas ao frete 04 (Exclusão SPED Tipo Soc Coop
    Cod.Contr.31)","children":[]}]}]},{"handle":"","id":"1310","text":"04.05 -
    DESPESAS INSTITUIÇÕES
    FINANCEIRAS","children":[{"handle":"","id":"1333","text":"04.05.01 -
    Despesas incorridas nas operações de intermediação
    financeira","children":[{"handle":"","id":"1335","text":"04.05.01.01 -
    Despesas de depósito de
    poupança","children":[]},{"handle":"","id":"1336","text":"04.05.01.02 -
    Despesas de depósito a
    prazo","children":[]},{"handle":"","id":"1337","text":"04.05.01.03 -
    Despesas de depósitos
    interfinanceiros","children":[]}]},{"handle":"","id":"1334","text":"04.05.02
    - Despesas de
    câmbio","children":[{"handle":"","id":"1338","text":"04.05.02.01 - Despesas
    de operações de câmbio -
    exportação","children":[]},{"handle":"","id":"1339","text":"04.05.02.02 -
    Despesas de variações e diferenças de
    taxas","children":[]}]},{"handle":"","id":"1346","text":"04.05.03 - Outras
    deduções e exclusões de caráter
    específico","children":[{"handle":"","id":"1347","text":"04.05.03.01 -
    Despesas de operacoes
    especiais","children":[]},{"handle":"","id":"1348","text":"04.05.03.02 -
    Outras deduções admitidas na
    legislação","children":[]}]}]}]}]}}]},"pivotgrid":{"dataset":{"store":[{"id":43,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.01 --
    DISPONÍVEL","conta4":"01.01.01.01 -- Caixa","conta5":"01.01.01.01.001 -
    Caixa Geral","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-1173044.45,"saldoAtual":-1173044.45,"nivel":5},{"id":45,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.01 --
    DISPONÍVEL","conta4":"01.01.01.02 -- Banco contas
    movimento","conta5":"01.01.01.02.001 - Banco do Brasil","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":10645673.89,"saldoAtual":10645673.89,"nivel":5},{"id":46,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.02 --
    CLIENTES","conta4":"01.01.02.01 - Clientes Nacionais","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":24941390.84,"saldoAtual":24941390.84,"nivel":4,"conta5":"01.01.02.01
    - Clientes Nacionais"},{"id":47,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.02 -- CLIENTES","conta4":"01.01.02.02 - Clientes
    Estrangeiros","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":250098.75,"saldoAtual":250098.75,"nivel":4,"conta5":"01.01.02.02
    - Clientes Estrangeiros"},{"id":50,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.03 -- ESTOQUES","conta4":"01.01.03.01 -
    Mercadoria para comercialização","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-3964002.05,"saldoAtual":-3964002.05,"nivel":4,"conta5":"01.01.03.01
    - Mercadoria para comercialização"},{"id":52,"conta1":"01 --
    ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.03 --
    ESTOQUES","conta4":"01.01.03.03 - Produtos Acabados","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-702280.55,"saldoAtual":-702280.55,"nivel":4,"conta5":"01.01.03.03
    - Produtos Acabados"},{"id":53,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.03 -- ESTOQUES","conta4":"01.01.03.04 - Produtos
    em elaboração","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-42.22,"saldoAtual":-42.22,"nivel":4,"conta5":"01.01.03.04
    - Produtos em elaboração"},{"id":54,"conta1":"01 -- ATIVO","conta2":"01.01
    -- CIRCULANTE","conta3":"01.01.03 -- ESTOQUES","conta4":"01.01.03.05 -
    Matérias-primas","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-10000,"saldoAtual":-10000,"nivel":4,"conta5":"01.01.03.05
    - Matérias-primas"},{"id":57,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.03 -- ESTOQUES","conta4":"01.01.03.08 -
    Adiantamento a fornecedores","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-142500,"saldoAtual":-142500,"nivel":4,"conta5":"01.01.03.08
    - Adiantamento a fornecedores"},{"id":60,"conta1":"01 --
    ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E
    CONTRIBUIÇÕES A RECUPERAR","conta4":"01.01.04.01 - IRRF Retido a
    Compensar","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":850,"saldoAtual":850,"nivel":4,"conta5":"01.01.04.01
    - IRRF Retido a Compensar"},{"id":61,"conta1":"01 -- ATIVO","conta2":"01.01
    -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E CONTRIBUIÇÕES A
    RECUPERAR","conta4":"01.01.04.02 - IRPJ Retido a Compensar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":757.5,"saldoAtual":757.5,"nivel":4,"conta5":"01.01.04.02
    - IRPJ Retido a Compensar"},{"id":62,"conta1":"01 -- ATIVO","conta2":"01.01
    -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E CONTRIBUIÇÕES A
    RECUPERAR","conta4":"01.01.04.03 - CSL Retido a Compensar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":505,"saldoAtual":505,"nivel":4,"conta5":"01.01.04.03
    - CSL Retido a Compensar"},{"id":63,"conta1":"01 -- ATIVO","conta2":"01.01
    -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E CONTRIBUIÇÕES A
    RECUPERAR","conta4":"01.01.04.04 - ICMS a Recuperar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":81550,"saldoAtual":81550,"nivel":4,"conta5":"01.01.04.04
    - ICMS a Recuperar"},{"id":65,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E CONTRIBUIÇÕES A
    RECUPERAR","conta4":"01.01.04.06 - COFINS não cumulativo a
    compensar","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":4300,"saldoAtual":4300,"nivel":4,"conta5":"01.01.04.06
    - COFINS não cumulativo a compensar"},{"id":70,"conta1":"01 --
    ATIVO","conta2":"01.02 -- NÃO CIRCULANTE","conta3":"01.02.03 --
    IMOBILIZADO","conta4":"01.02.03.01 - Maquinas e Ferramentas","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":60000,"saldoAtual":60000,"nivel":4,"conta5":"01.02.03.01
    - Maquinas e Ferramentas"},{"id":71,"conta1":"01 -- ATIVO","conta2":"01.02
    -- NÃO CIRCULANTE","conta3":"01.02.03 -- IMOBILIZADO","conta4":"01.02.03.02
    - Móveis e Utensílios","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1253000,"saldoAtual":1253000,"nivel":4,"conta5":"01.02.03.02
    - Móveis e Utensílios"},{"id":72,"conta1":"01 -- ATIVO","conta2":"01.02 --
    NÃO CIRCULANTE","conta3":"01.02.03 -- IMOBILIZADO","conta4":"01.02.03.03 -
    Instalações","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":24000,"saldoAtual":24000,"nivel":4,"conta5":"01.02.03.03
    - Instalações"},{"id":73,"conta1":"01 -- ATIVO","conta2":"01.02 -- NÃO
    CIRCULANTE","conta3":"01.02.03 -- IMOBILIZADO","conta4":"01.02.03.04 -
    Veículos","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":331000,"saldoAtual":331000,"nivel":4,"conta5":"01.02.03.04
    - Veículos"},{"id":76,"conta1":"01 -- ATIVO","conta2":"01.02 -- NÃO
    CIRCULANTE","conta3":"01.02.03 -- IMOBILIZADO","conta4":"01.02.03.10 -- ( -
    ) Depreciação Acumulada","conta5":"01.02.03.10.001 - (- ) Deprec. Acumulada
    Móveis e utensílios","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-77333.3,"saldoAtual":-77333.3,"nivel":5},{"id":78,"conta1":"01
    -- ATIVO","conta2":"01.02 -- NÃO CIRCULANTE","conta3":"01.02.03 --
    IMOBILIZADO","conta4":"01.02.03.10 -- ( - ) Depreciação
    Acumulada","conta5":"01.02.03.10.003 - (- ) Deprec. Acumulada
    Veículos","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-114000.04,"saldoAtual":-114000.04,"nivel":5},{"id":82,"conta1":"02
    -- PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.01 --
    FORNECEDORES","conta4":"02.01.01.01 - Fornecedores Nacionais","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-6566957.32,"saldoAtual":-6566957.32,"nivel":4,"conta5":"02.01.01.01
    - Fornecedores Nacionais"},{"id":84,"conta1":"02 -- PASSIVO","conta2":"02.01
    -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E CONTRIBUICOES A
    RECOLHER","conta4":"02.01.02.01 - ICMS a recolher","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-1215156.9,"saldoAtual":-1215156.9,"nivel":4,"conta5":"02.01.02.01
    - ICMS a recolher"},{"id":85,"conta1":"02 -- PASSIVO","conta2":"02.01 --
    CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E CONTRIBUICOES A
    RECOLHER","conta4":"02.01.02.02 - PIS/PASEP a Recolher","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-225444.99,"saldoAtual":-225444.99,"nivel":4,"conta5":"02.01.02.02
    - PIS/PASEP a Recolher"},{"id":86,"conta1":"02 -- PASSIVO","conta2":"02.01
    -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E CONTRIBUICOES A
    RECOLHER","conta4":"02.01.02.03 - COFINS a Recolher","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-194766.66,"saldoAtual":-194766.66,"nivel":4,"conta5":"02.01.02.03
    - COFINS a Recolher"},{"id":90,"conta1":"02 -- PASSIVO","conta2":"02.01 --
    CIRCULANTE","conta3":"02.01.03 -- OBRIGAÇÕES
    TRABALHISTAS","conta4":"02.01.03.01 - Salários e Ordenados a Pagar","cc":"CC
    não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":104192.01,"saldoAtual":104192.01,"nivel":4,"conta5":"02.01.03.01
    - Salários e Ordenados a Pagar"},{"id":91,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.03 -- OBRIGAÇÕES
    TRABALHISTAS","conta4":"02.01.03.02 - Comissões a PAgar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":50000,"saldoAtual":50000,"nivel":4,"conta5":"02.01.03.02
    - Comissões a PAgar"},{"id":92,"conta1":"02 -- PASSIVO","conta2":"02.01 --
    CIRCULANTE","conta3":"02.01.03 -- OBRIGAÇÕES
    TRABALHISTAS","conta4":"02.01.03.03 - FGTS a Recolher","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-6178.79,"saldoAtual":-6178.79,"nivel":4,"conta5":"02.01.03.03
    - FGTS a Recolher"},{"id":93,"conta1":"02 -- PASSIVO","conta2":"02.01 --
    CIRCULANTE","conta3":"02.01.03 -- OBRIGAÇÕES
    TRABALHISTAS","conta4":"02.01.03.04 - INSS a Recolher","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-35620,"saldoAtual":-35620,"nivel":4,"conta5":"02.01.03.04
    - INSS a Recolher"},{"id":94,"conta1":"02 -- PASSIVO","conta2":"02.01 --
    CIRCULANTE","conta3":"02.01.03 -- OBRIGAÇÕES
    TRABALHISTAS","conta4":"02.01.03.05 - Provisão para 13 Salário e
    Encargos","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":10000,"saldoAtual":10000,"nivel":4,"conta5":"02.01.03.05
    - Provisão para 13 Salário e Encargos"},{"id":95,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.03 -- OBRIGAÇÕES
    TRABALHISTAS","conta4":"02.01.03.06 - Provisão para Férias e
    Encargos","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":8100,"saldoAtual":8100,"nivel":4,"conta5":"02.01.03.06
    - Provisão para Férias e Encargos"},{"id":96,"conta1":"02 --
    PASSIVO","conta2":"02.03 -- PATRIMÔNIO LÍQUIDO","conta3":"02.03.01 --
    CAPITAL SOCIAL","conta4":"02.03.01.01 - Capital Subscrito","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-100000,"saldoAtual":-100000,"nivel":4,"conta5":"02.03.01.01
    - Capital Subscrito"},{"id":105,"conta1":"02 -- PASSIVO","conta2":"02.03 --
    PATRIMÔNIO LÍQUIDO","conta3":"02.03.04 -- RESERVAS DE
    LUCRO","conta4":"02.03.04.01 - Reserva Legal","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-200000,"saldoAtual":-200000,"nivel":4,"conta5":"02.03.04.01
    - Reserva Legal"},{"id":109,"conta1":"02 -- PASSIVO","conta2":"02.03 --
    PATRIMÔNIO LÍQUIDO","conta3":"02.03.04 -- RESERVAS DE
    LUCRO","conta4":"02.03.04.05 - Reservas de lucros a realizar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-10140,"saldoAtual":-10140,"nivel":4,"conta5":"02.03.04.05
    - Reservas de lucros a realizar"},{"id":114,"conta1":"02 --
    PASSIVO","conta2":"02.03 -- PATRIMÔNIO LÍQUIDO","conta3":"02.03.05 --
    PREJUÍZOS ACUMULADOS","conta4":"02.03.05.02 - Resultado do Exercício em
    Curso","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":200000,"saldoAtual":200000,"nivel":4,"conta5":"02.03.05.02
    - Resultado do Exercício em Curso"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-21210917.56,"saldoAtual":-21210917.56,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":115,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.01 - Vendas no mercado interno fabricação
    própria","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.01
    - Vendas no mercado interno fabricação própria"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-4105661.75,"saldoAtual":-4105661.75,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":116,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.03 - Vendas no mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.03
    - Vendas no mercado externo"},{"id":117,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.01 - Vendas
    Canceladas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":178980,"saldoAtual":178980,"nivel":4,"conta5":"03.01.03.01
    - Vendas Canceladas"},{"id":117,"conta1":"03 -- RECEITAS","conta2":"03.01 --
    RECEITA DE VENDA DE MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.01 - Vendas
    Canceladas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.03.01
    - Vendas Canceladas"},{"id":118,"conta1":"03 -- RECEITAS","conta2":"03.01 --
    RECEITA DE VENDA DE MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.02 - Devolução de
    Vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":121542.5,"saldoAtual":121542.5,"nivel":4,"conta5":"03.01.03.02
    - Devolução de Vendas"},{"id":118,"conta1":"03 -- RECEITAS","conta2":"03.01
    -- RECEITA DE VENDA DE MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.02 - Devolução de
    Vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.03.02
    - Devolução de Vendas"},{"id":118,"conta1":"03 -- RECEITAS","conta2":"03.01
    -- RECEITA DE VENDA DE MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.02 - Devolução de
    Vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.03.02
    - Devolução de Vendas"},{"id":120,"conta1":"03 -- RECEITAS","conta2":"03.01
    -- RECEITA DE VENDA DE MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.001 - ICMS
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1927662.9,"saldoAtual":1927662.9,"nivel":5},{"id":120,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.001 - ICMS
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":120,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.001 - ICMS
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":120,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.001 - ICMS
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":120,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.001 - ICMS
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":121,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.002 - PIS/PASEP sobre
    vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":253222.5,"saldoAtual":253222.5,"nivel":5},{"id":121,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.002 - PIS/PASEP sobre
    vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":121,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.002 - PIS/PASEP sobre
    vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":127,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.01
    - Custos dos Produtos Vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1498120,"saldoAtual":1498120,"nivel":4,"conta5":"04.01.01.01
    - Custos dos Produtos Vendidos"},{"id":127,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.01
    - Custos dos Produtos Vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.01
    - Custos dos Produtos Vendidos"},{"id":127,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.01
    - Custos dos Produtos Vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.01
    - Custos dos Produtos Vendidos"},{"id":127,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.01
    - Custos dos Produtos Vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.01
    - Custos dos Produtos Vendidos"},{"id":127,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.01
    - Custos dos Produtos Vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.01
    - Custos dos Produtos Vendidos"},{"id":127,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.01
    - Custos dos Produtos Vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.01
    - Custos dos Produtos Vendidos"},{"id":127,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.01
    - Custos dos Produtos Vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.01
    - Custos dos Produtos Vendidos"},{"id":129,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.02 -- CUSTO DOS SERVIÇOS
    PRESTADOS","conta4":"04.01.02.01 - Custo dos serviços
    vendidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":164299.66,"saldoAtual":164299.66,"nivel":4,"conta5":"04.01.02.01
    - Custo dos serviços vendidos"},{"id":131,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1380989.77,"saldoAtual":1380989.77,"nivel":4,"conta5":"04.01.03.02
    - Consumo de telefone"},{"id":131,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.02
    - Consumo de telefone"},{"id":131,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.02
    - Consumo de telefone"},{"id":131,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.02
    - Consumo de telefone"},{"id":131,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.02
    - Consumo de telefone"},{"id":131,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.02
    - Consumo de telefone"},{"id":132,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":391650,"saldoAtual":391650,"nivel":4,"conta5":"04.01.03.03
    - Consumo de água"},{"id":132,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.03
    - Consumo de água"},{"id":132,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.03
    - Consumo de água"},{"id":132,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.03
    - Consumo de água"},{"id":133,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.04 - Consumo de energia
    elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":374350,"saldoAtual":374350,"nivel":4,"conta5":"04.01.03.04
    - Consumo de energia elétrica"},{"id":133,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.04 - Consumo de energia
    elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.03.04
    - Consumo de energia elétrica"},{"id":135,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.06 - Aluguel","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1520,"saldoAtual":1520,"nivel":4,"conta5":"04.01.03.06
    - Aluguel"},{"id":136,"conta1":"04 -- CUSTOS E DESPESAS","conta2":"04.01 --
    CUSTOS E DESPESAS OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.07 - Combustíveis","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":12000,"saldoAtual":12000,"nivel":4,"conta5":"04.01.03.07
    - Combustíveis"},{"id":139,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.09 -- Depreciações","conta5":"04.01.03.09.001 -
    Móveis e Utensílios","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":76500,"saldoAtual":76500,"nivel":5},{"id":139,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.09 -- Depreciações","conta5":"04.01.03.09.001 -
    Móveis e Utensílios","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":141,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.09 -- Depreciações","conta5":"04.01.03.09.003 -
    Veículos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":100900,"saldoAtual":100900,"nivel":5},{"id":144,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":11750,"saldoAtual":11750,"nivel":4,"conta5":"04.01.04.02
    - Consumo de telefone"},{"id":144,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.02 - Consumo de
    telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.02
    - Consumo de telefone"},{"id":145,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":288833,"saldoAtual":288833,"nivel":4,"conta5":"04.01.04.03
    - Consumo de água"},{"id":145,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.03
    - Consumo de água"},{"id":145,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.03
    - Consumo de água"},{"id":145,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.03
    - Consumo de água"},{"id":145,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.03
    - Consumo de água"},{"id":145,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.03 - Consumo de
    água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.03
    - Consumo de água"},{"id":146,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.04 - Consumo de energia
    elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":191256.25,"saldoAtual":191256.25,"nivel":4,"conta5":"04.01.04.04
    - Consumo de energia elétrica"},{"id":146,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.04 - Consumo de energia
    elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.04
    - Consumo de energia elétrica"},{"id":146,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.04 - Consumo de energia
    elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.04
    - Consumo de energia elétrica"},{"id":148,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.06 -
    Aluguel","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":57000,"saldoAtual":57000,"nivel":4,"conta5":"04.01.04.06
    - Aluguel"},{"id":148,"conta1":"04 -- CUSTOS E DESPESAS","conta2":"04.01 --
    CUSTOS E DESPESAS OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.06 -
    Aluguel","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.06
    - Aluguel"},{"id":149,"conta1":"04 -- CUSTOS E DESPESAS","conta2":"04.01 --
    CUSTOS E DESPESAS OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.07 -
    Combustíveis","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":47800,"saldoAtual":47800,"nivel":4,"conta5":"04.01.04.07
    - Combustíveis"},{"id":149,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.07 -
    Combustíveis","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.07
    - Combustíveis"},{"id":150,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.08 - Despesas com
    Viagens","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":12000,"saldoAtual":12000,"nivel":4,"conta5":"04.01.04.08
    - Despesas com Viagens"},{"id":153,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.09 --
    Depreciações","conta5":"04.01.04.09.002 - Despesa de depreciação","cc":"CC
    não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":14433.32,"saldoAtual":14433.32,"nivel":5},{"id":154,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.09 --
    Depreciações","conta5":"04.01.04.09.003 -
    Veículos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":3100.02,"saldoAtual":3100.02,"nivel":5},{"id":156,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.01 - Juros
    Passivos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":29297.92,"saldoAtual":29297.92,"nivel":4,"conta5":"04.01.05.01
    - Juros Passivos"},{"id":157,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.02 - Descontos
    Concedidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1409,"saldoAtual":1409,"nivel":4,"conta5":"04.01.05.02
    - Descontos Concedidos"},{"id":158,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.03 - Variação Cambial
    Passiva","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":16500,"saldoAtual":16500,"nivel":4,"conta5":"04.01.05.03
    - Variação Cambial Passiva"},{"id":165,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.02 -- RECEITA BRUTA DA VENDA DE
    SERVIÇOS","conta4":"03.01.02.01 - Venda de serviços ao mercado
    interno","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-2750752.13,"saldoAtual":-2750752.13,"nivel":4,"conta5":"03.01.02.01
    - Venda de serviços ao mercado interno"},{"id":165,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.02 -- RECEITA BRUTA DA VENDA DE
    SERVIÇOS","conta4":"03.01.02.01 - Venda de serviços ao mercado
    interno","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.02.01
    - Venda de serviços ao mercado interno"},{"id":165,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.02 -- RECEITA BRUTA DA VENDA DE
    SERVIÇOS","conta4":"03.01.02.01 - Venda de serviços ao mercado
    interno","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.02.01
    - Venda de serviços ao mercado interno"},{"id":165,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.02 -- RECEITA BRUTA DA VENDA DE
    SERVIÇOS","conta4":"03.01.02.01 - Venda de serviços ao mercado
    interno","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.02.01
    - Venda de serviços ao mercado interno"},{"id":165,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.02 -- RECEITA BRUTA DA VENDA DE
    SERVIÇOS","conta4":"03.01.02.01 - Venda de serviços ao mercado
    interno","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.02.01
    - Venda de serviços ao mercado interno"},{"id":165,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.02 -- RECEITA BRUTA DA VENDA DE
    SERVIÇOS","conta4":"03.01.02.01 - Venda de serviços ao mercado
    interno","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.02.01
    - Venda de serviços ao mercado interno"},{"id":171,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.003 - Cofins sobre
    vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":189880,"saldoAtual":189880,"nivel":5},{"id":174,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E
    CONTRIBUIÇÕES A RECUPERAR","conta4":"01.01.04.07 - IPI a Recuperar","cc":"CC
    não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":4900,"saldoAtual":4900,"nivel":4,"conta5":"01.01.04.07
    - IPI a Recuperar"},{"id":175,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.03.01.001 -
    Salarios/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":19000,"saldoAtual":19000,"nivel":5},{"id":178,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.03.01.004 - INSS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":18520,"saldoAtual":18520,"nivel":5},{"id":178,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.03.01.004 - INSS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":179,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.03.01.005 - FGTS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":17200,"saldoAtual":17200,"nivel":5},{"id":180,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.001 -
    Salarios/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":107200,"saldoAtual":107200,"nivel":5},{"id":180,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.001 -
    Salarios/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":180,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.001 -
    Salarios/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":180,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.001 -
    Salarios/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":180,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.001 -
    Salarios/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":181,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.002 - Ferias","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":11900,"saldoAtual":11900,"nivel":5},{"id":183,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.004 - INSS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":15000,"saldoAtual":15000,"nivel":5},{"id":184,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.005 - FGTS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":2100,"saldoAtual":2100,"nivel":5},{"id":184,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.005 - FGTS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":190,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.05 -- IMPOSTOS E TAXAS","conta5":"04.01.03.05.006
    - Impostos Diversos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":36600,"saldoAtual":36600,"nivel":5},{"id":190,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.05 -- IMPOSTOS E TAXAS","conta5":"04.01.03.05.006
    - Impostos Diversos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":191,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.004 - ISS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":6500,"saldoAtual":6500,"nivel":5},{"id":193,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.05 -- IMPOSTOS E
    TAXAS","conta5":"04.01.04.05.002 - IPTU","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1200,"saldoAtual":1200,"nivel":5},{"id":198,"conta1":"02
    -- PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E
    CONTRIBUICOES A RECOLHER","conta4":"02.01.02.08 - Csll a Recolher","cc":"CC
    não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-4500,"saldoAtual":-4500,"nivel":4,"conta5":"02.01.02.08
    - Csll a Recolher"},{"id":199,"conta1":"02 -- PASSIVO","conta2":"02.01 --
    CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E CONTRIBUICOES A
    RECOLHER","conta4":"02.01.02.09 - IPI a recolher","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-502812.39,"saldoAtual":-502812.39,"nivel":4,"conta5":"02.01.02.09
    - IPI a recolher"},{"id":202,"conta1":"03 -- RECEITAS","conta2":"03.01 --
    RECEITA DE VENDA DE MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.005 - IPI
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":4008461.14,"saldoAtual":4008461.14,"nivel":5},{"id":202,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.005 - IPI
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":203,"conta1":"02
    -- PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.06 --
    ADIANTAMENTOS","conta4":"02.01.06.01 - Adiantamento de clientes","cc":"CC
    não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":160000,"saldoAtual":160000,"nivel":4,"conta5":"02.01.06.01
    - Adiantamento de clientes"},{"id":205,"conta1":"01 --
    ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E
    CONTRIBUIÇÕES A RECUPERAR","conta4":"01.01.04.08 - Pis Retido a
    Compensar","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":328.25,"saldoAtual":328.25,"nivel":4,"conta5":"01.01.04.08
    - Pis Retido a Compensar"},{"id":206,"conta1":"01 -- ATIVO","conta2":"01.01
    -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E CONTRIBUIÇÕES A
    RECUPERAR","conta4":"01.01.04.09 - Cofins Retido a Compensar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":51865,"saldoAtual":51865,"nivel":4,"conta5":"01.01.04.09
    - Cofins Retido a Compensar"},{"id":207,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.10 - Impostos Não
    Recuperados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":447.92,"saldoAtual":447.92,"nivel":4,"conta5":"04.01.04.10
    - Impostos Não Recuperados"},{"id":210,"conta1":"01 --
    ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.06 -- REALIZAVEL A
    CURTO PRAZO","conta4":"01.01.06.01 -- TRIBUTOS A
    COMPENSAR","conta5":"01.01.06.01.001 - ICMS A COMPENSAR CURTO
    PRAZO","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":4072.96,"saldoAtual":4072.96,"nivel":5},{"id":211,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.06 -- REALIZAVEL A
    CURTO PRAZO","conta4":"01.01.06.01 -- TRIBUTOS A
    COMPENSAR","conta5":"01.01.06.01.002 - PIS A COMPENSAR A CURTO
    PRAZO","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":247.56,"saldoAtual":247.56,"nivel":5},{"id":212,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.06 -- REALIZAVEL A
    CURTO PRAZO","conta4":"01.01.06.01 -- TRIBUTOS A
    COMPENSAR","conta5":"01.01.06.01.003 - COFINS A COMPENSAR A CURTO
    PRAZO","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1140,"saldoAtual":1140,"nivel":5},{"id":214,"conta1":"01
    -- ATIVO","conta2":"01.02 -- NÃO CIRCULANTE","conta3":"01.02.01 --
    REALIZÁVEL A LONGO PRAZO","conta4":"01.02.01.01 -- TRIBUTOS A
    COMPENSAR","conta5":"01.02.01.01.001 - ICMS A COMPENSAR A LONGO
    PRAZO","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-4770.88,"saldoAtual":-4770.88,"nivel":5},{"id":215,"conta1":"01
    -- ATIVO","conta2":"01.02 -- NÃO CIRCULANTE","conta3":"01.02.01 --
    REALIZÁVEL A LONGO PRAZO","conta4":"01.02.01.01 -- TRIBUTOS A
    COMPENSAR","conta5":"01.02.01.01.002 - PIS A COMPENSAR A LONGO
    PRAZO","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-302.57,"saldoAtual":-302.57,"nivel":5},{"id":216,"conta1":"01
    -- ATIVO","conta2":"01.02 -- NÃO CIRCULANTE","conta3":"01.02.01 --
    REALIZÁVEL A LONGO PRAZO","conta4":"01.02.01.01 -- TRIBUTOS A
    COMPENSAR","conta5":"01.02.01.01.003 - COFINS A COMPENSAR A LONGO
    PRAZO","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-1393.34,"saldoAtual":-1393.34,"nivel":5},{"id":219,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.006 - Alimentação de sócios e
    acionistas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":50000,"saldoAtual":50000,"nivel":5},{"id":223,"conta1":"02
    -- PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.04 -- EMPRÉSTIMOS
    BANCÁRIOS","conta4":"02.01.04.01 - Banco do Brasil","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-14000,"saldoAtual":-14000,"nivel":4,"conta5":"02.01.04.01
    - Banco do Brasil"},{"id":225,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.10 - Frete s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":47992,"saldoAtual":47992,"nivel":4,"conta5":"04.01.03.10
    - Frete s/vendas"},{"id":226,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.11 - Seguro","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-552,"saldoAtual":-552,"nivel":4,"conta5":"04.01.03.11
    - Seguro"},{"id":227,"conta1":"03 -- RECEITAS","conta2":"03.01 -- RECEITA DE
    VENDA DE MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.006 - CSLL
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":100,"saldoAtual":100,"nivel":5},{"id":228,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.007 - IRRF
    s/vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":24700,"saldoAtual":24700,"nivel":5},{"id":229,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E
    CONTRIBUIÇÕES A RECUPERAR","conta4":"01.01.04.12 - INSS Retido a
    Compensar","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":5555,"saldoAtual":5555,"nivel":4,"conta5":"01.01.04.12
    - INSS Retido a Compensar"},{"id":230,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.008 - PIS Cumulativo
    s/Vendas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-2200,"saldoAtual":-2200,"nivel":5},{"id":231,"conta1":"01
    -- ATIVO","conta2":"01.01 -- CIRCULANTE","conta3":"01.01.03 --
    ESTOQUES","conta4":"01.01.03.12 - Material de
    Consumo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-292500,"saldoAtual":-292500,"nivel":4,"conta5":"01.01.03.12
    - Material de Consumo"},{"id":231,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.03 -- ESTOQUES","conta4":"01.01.03.12 - Material
    de Consumo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"01.01.03.12
    - Material de Consumo"},{"id":232,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.11 - Material de
    consumo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":403600,"saldoAtual":403600,"nivel":4,"conta5":"04.01.04.11
    - Material de consumo"},{"id":233,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.12 - Serviços
    tomados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":24000,"saldoAtual":24000,"nivel":4,"conta5":"04.01.04.12
    - Serviços tomados"},{"id":235,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.02 -- CLIENTES","conta4":"01.01.02.05 - ( - )
    Devoluções a compensar","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-25153,"saldoAtual":-25153,"nivel":4,"conta5":"01.01.02.05
    - ( - ) Devoluções a compensar"},{"id":236,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.13 - Perdas
    clientes","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1333.34,"saldoAtual":1333.34,"nivel":4,"conta5":"04.01.04.13
    - Perdas clientes"},{"id":236,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.13 - Perdas
    clientes","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.13
    - Perdas clientes"},{"id":236,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.13 - Perdas
    clientes","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.04.13
    - Perdas clientes"},{"id":239,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.01 -- DISPONÍVEL","conta4":"01.01.01.03 --
    Aplicacoes de Liquidez Imediata","conta5":"01.01.01.03.001 - Aplicacoes BB -
    Liquidacao imediata","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":199976.65,"saldoAtual":199976.65,"nivel":5},{"id":242,"conta1":"02
    -- PASSIVO","conta2":"02.02 -- NÃO CIRCULANTE","conta3":"02.02.01 --
    EMPRÉSTIMOS E FINANCIAMENTOS","conta4":"02.02.01.01 - Empréstimos
    Bancários","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-27411.95,"saldoAtual":-27411.95,"nivel":4,"conta5":"02.02.01.01
    - Empréstimos Bancários"},{"id":243,"conta1":"02 -- PASSIVO","conta2":"02.01
    -- CIRCULANTE","conta3":"02.01.05 -- FINANCIAMENTOS","conta4":"02.01.05.02 -
    Arrendamento mercantil a pagar - BB","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-165000,"saldoAtual":-165000,"nivel":4,"conta5":"02.01.05.02
    - Arrendamento mercantil a pagar - BB"},{"id":251,"conta1":"02 --
    PASSIVO","conta2":"02.02 -- NÃO CIRCULANTE","conta3":"02.02.02 -- RECEITAS
    DIFERIDAS","conta4":"02.02.02.01 - Receitas a Apropriar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-115000,"saldoAtual":-115000,"nivel":4,"conta5":"02.02.02.01
    - Receitas a Apropriar"},{"id":258,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.02 -- CLIENTES","conta4":"01.01.02.08 -
    Variações Cambiais Ativas","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":55550,"saldoAtual":55550,"nivel":4,"conta5":"01.01.02.08
    - Variações Cambiais Ativas"},{"id":259,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.01 --
    FORNECEDORES","conta4":"02.01.01.05 - Variações Cambiais Passivas","cc":"CC
    não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-16500,"saldoAtual":-16500,"nivel":4,"conta5":"02.01.01.05
    - Variações Cambiais Passivas"},{"id":261,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.01 --
    FORNECEDORES","conta4":"02.01.01.99 - Devoluções de Fornecedores
    Nacionais","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":148360,"saldoAtual":148360,"nivel":4,"conta5":"02.01.01.99
    - Devoluções de Fornecedores Nacionais"},{"id":262,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.04 - Multas
    Pagas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":55150,"saldoAtual":55150,"nivel":4,"conta5":"04.01.05.04
    - Multas Pagas"},{"id":262,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.04 - Multas
    Pagas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.05.04
    - Multas Pagas"},{"id":262,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.04 - Multas
    Pagas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.05.04
    - Multas Pagas"},{"id":262,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.04 - Multas
    Pagas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.05.04
    - Multas Pagas"},{"id":262,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.04 - Multas
    Pagas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.05.04
    - Multas Pagas"},{"id":263,"conta1":"01 -- ATIVO","conta2":"01.01 --
    CIRCULANTE","conta3":"01.01.01 -- DISPONÍVEL","conta4":"01.01.01.02 -- Banco
    contas movimento","conta5":"01.01.01.02.002 - Bradesco","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-41965.42,"saldoAtual":-41965.42,"nivel":5},{"id":264,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.05 -- DESPESAS
    FINANCEIRAS","conta4":"04.01.05.06 - Despesas
    Bancárias","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":250,"saldoAtual":250,"nivel":4,"conta5":"04.01.05.06
    - Despesas Bancárias"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":6129641.17,"saldoAtual":6129641.17,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":268,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.01 -- CUSTOS DAS VENDAS","conta4":"04.01.01.02
    - Custos da Mercadorias Revendidas","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.01.01.02
    - Custos da Mercadorias Revendidas"},{"id":270,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.03.01.007 -
    Alimentação","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":7500,"saldoAtual":7500,"nivel":5},{"id":279,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.04 -- DESPESAS
    ADMINISTRATIVAS","conta4":"04.01.04.01 -- DESPESAS COM
    PESSOAL","conta5":"04.01.04.01.007 -
    Alimentação","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":15000,"saldoAtual":15000,"nivel":5},{"id":281,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.001 -
    Salários/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":102100,"saldoAtual":102100,"nivel":5},{"id":281,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.001 -
    Salários/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":281,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.001 -
    Salários/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":281,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.001 -
    Salários/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":281,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.001 -
    Salários/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":281,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.001 -
    Salários/Ordenados","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":284,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.004 - INSS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":42100,"saldoAtual":42100,"nivel":5},{"id":284,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.004 - INSS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":285,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.005 - FGTS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":3400,"saldoAtual":3400,"nivel":5},{"id":285,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.005 - FGTS","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":286,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.03 -- DESPESAS COM
    PESSOAL","conta5":"04.01.06.03.006 -
    Alimentação","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":13600,"saldoAtual":13600,"nivel":5},{"id":290,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.002
    - Manutenções","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":275000,"saldoAtual":275000,"nivel":5},{"id":290,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.002
    - Manutenções","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":291,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.003
    - Consumo de Telefone","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":17400,"saldoAtual":17400,"nivel":5},{"id":292,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.005
    - Consumo de Água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":10747.65,"saldoAtual":10747.65,"nivel":5},{"id":292,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.005
    - Consumo de Água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":292,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.005
    - Consumo de Água","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":293,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.006
    - Consumo de Energia Elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":208142.07,"saldoAtual":208142.07,"nivel":5},{"id":293,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.006
    - Consumo de Energia Elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":293,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.006
    - Consumo de Energia Elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":293,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.006
    - Consumo de Energia Elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":293,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.006
    - Consumo de Energia Elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":293,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.006
    - Consumo de Energia Elétrica","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":298,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.06 -- CUSTOS DE
    PRODUÇÃO","conta4":"04.01.06.04 -- GASTOS GERAIS","conta5":"04.01.06.04.011
    - Combustíveis e Lubrificantes","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":3000,"saldoAtual":3000,"nivel":5},{"id":1179,"conta1":"03
    -- RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.04 - Abatimentos
    concedidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":302000,"saldoAtual":302000,"nivel":4,"conta5":"03.01.03.04
    - Abatimentos concedidos"},{"id":1180,"conta1":"01 -- ATIVO","conta2":"01.01
    -- CIRCULANTE","conta3":"01.01.04 -- IMPOSTOS E CONTRIBUIÇÕES A
    RECUPERAR","conta4":"01.01.04.13 - ISS Retido a Compensar","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1030,"saldoAtual":1030,"nivel":4,"conta5":"01.01.04.13
    - ISS Retido a Compensar"},{"id":1182,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E
    CONTRIBUICOES A RECOLHER","conta4":"02.01.02.10 - PIS/COFINS/CSLL Retido a
    Recolher","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":72675,"saldoAtual":72675,"nivel":4,"conta5":"02.01.02.10
    - PIS/COFINS/CSLL Retido a Recolher"},{"id":1183,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E
    CONTRIBUICOES A RECOLHER","conta4":"02.01.02.11 - PIS Retido a
    Recolher","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-41061,"saldoAtual":-41061,"nivel":4,"conta5":"02.01.02.11
    - PIS Retido a Recolher"},{"id":1184,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E
    CONTRIBUICOES A RECOLHER","conta4":"02.01.02.12 - Cofins Retido a
    Recolher","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-2180,"saldoAtual":-2180,"nivel":4,"conta5":"02.01.02.12
    - Cofins Retido a Recolher"},{"id":1185,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E
    CONTRIBUICOES A RECOLHER","conta4":"02.01.02.13 - CSLL Retida a
    Recolher","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-800,"saldoAtual":-800,"nivel":4,"conta5":"02.01.02.13
    - CSLL Retida a Recolher"},{"id":1187,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E
    CONTRIBUICOES A RECOLHER","conta4":"02.01.02.15 - IRRF - PF Serviçços a
    Recolher","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-11473.18,"saldoAtual":-11473.18,"nivel":4,"conta5":"02.01.02.15
    - IRRF - PF Serviçços a Recolher"},{"id":1188,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.02 -- IMPOSTOS E
    CONTRIBUICOES A RECOLHER","conta4":"02.01.02.16 - IRRF - PJ - Serviços a
    Recolher","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-625,"saldoAtual":-625,"nivel":4,"conta5":"02.01.02.16
    - IRRF - PJ - Serviços a Recolher"},{"id":1189,"conta1":"02 --
    PASSIVO","conta2":"02.01 -- CIRCULANTE","conta3":"02.01.03 -- OBRIGAÇÕES
    TRABALHISTAS","conta4":"02.01.03.07 - INSS Retido a Recolher","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":550,"saldoAtual":550,"nivel":4,"conta5":"02.01.03.07
    - INSS Retido a Recolher"},{"id":1194,"conta1":"01 -- ATIVO","conta2":"01.02
    -- NÃO CIRCULANTE","conta3":"01.02.01 -- REALIZÁVEL A LONGO
    PRAZO","conta4":"01.02.01.02 -- CLIENTES","conta5":"01.02.01.02.001 -
    Clientes Nacionais","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":115000,"saldoAtual":115000,"nivel":5},{"id":1196,"conta1":"03
    -- RECEITAS","conta2":"03.02 -- RECEITAS FINANCEIRAS","conta3":"03.02.01 --
    RECEITAS FINANCEIRAS","conta4":"03.02.01.01 - Descontos
    Obtidos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-85300,"saldoAtual":-85300,"nivel":4,"conta5":"03.02.01.01
    - Descontos Obtidos"},{"id":1197,"conta1":"03 -- RECEITAS","conta2":"03.02
    -- RECEITAS FINANCEIRAS","conta3":"03.02.01 -- RECEITAS
    FINANCEIRAS","conta4":"03.02.01.02 - Juros
    Ativos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-1291.1,"saldoAtual":-1291.1,"nivel":4,"conta5":"03.02.01.02
    - Juros Ativos"},{"id":1198,"conta1":"03 -- RECEITAS","conta2":"03.02 --
    RECEITAS FINANCEIRAS","conta3":"03.02.01 -- RECEITAS
    FINANCEIRAS","conta4":"03.02.01.03 - Variação Cambial
    Ativa","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-55550,"saldoAtual":-55550,"nivel":4,"conta5":"03.02.01.03
    - Variação Cambial Ativa"},{"id":1200,"conta1":"03 --
    RECEITAS","conta2":"03.02 -- RECEITAS FINANCEIRAS","conta3":"03.02.01 --
    RECEITAS FINANCEIRAS","conta4":"03.02.01.05 - Receita de Aplicações
    Financeiras","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-50000,"saldoAtual":-50000,"nivel":4,"conta5":"03.02.01.05
    - Receita de Aplicações Financeiras"},{"id":1201,"conta1":"03 --
    RECEITAS","conta2":"03.02 -- RECEITAS FINANCEIRAS","conta3":"03.02.01 --
    RECEITAS FINANCEIRAS","conta4":"03.02.01.06 - Outras Receitas
    Financeiras","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-170800,"saldoAtual":-170800,"nivel":4,"conta5":"03.02.01.06
    - Outras Receitas Financeiras"},{"id":1203,"conta1":"03 --
    RECEITAS","conta2":"03.03 -- OUTRAS RECEITAS","conta3":"03.03.01 -- OUTRAS
    RECEITAS","conta4":"03.03.01.01 - Venda de bens do ativo
    imobilizado","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-5130000,"saldoAtual":-5130000,"nivel":4,"conta5":"03.03.01.01
    - Venda de bens do ativo imobilizado"},{"id":1204,"conta1":"03 --
    RECEITAS","conta2":"03.03 -- OUTRAS RECEITAS","conta3":"03.03.01 -- OUTRAS
    RECEITAS","conta4":"03.03.01.02 - Alugueis","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-1182000,"saldoAtual":-1182000,"nivel":4,"conta5":"03.03.01.02
    - Alugueis"},{"id":1205,"conta1":"03 -- RECEITAS","conta2":"03.03 -- OUTRAS
    RECEITAS","conta3":"03.03.01 -- OUTRAS RECEITAS","conta4":"03.03.01.03 -
    Outras receitas","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-2567907.25,"saldoAtual":-2567907.25,"nivel":4,"conta5":"03.03.01.03
    - Outras receitas"},{"id":1211,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.02 -- OUTRAS DESPESAS","conta3":"04.02.01 -- OUTRAS
    DESPESAS","conta4":"04.02.01.01 - Doações","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":139200,"saldoAtual":139200,"nivel":4,"conta5":"04.02.01.01
    - Doações"},{"id":1212,"conta1":"04 -- CUSTOS E DESPESAS","conta2":"04.02 --
    OUTRAS DESPESAS","conta3":"04.02.01 -- OUTRAS
    DESPESAS","conta4":"04.02.01.02 - Custo do Imobilizado Vendido","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-300,"saldoAtual":-300,"nivel":4,"conta5":"04.02.01.02
    - Custo do Imobilizado Vendido"},{"id":1214,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.02 -- OUTRAS DESPESAS","conta3":"04.02.01 -- OUTRAS
    DESPESAS","conta4":"04.02.01.04 - Brindes","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":900,"saldoAtual":900,"nivel":4,"conta5":"04.02.01.04
    - Brindes"},{"id":1224,"conta1":"01 -- ATIVO","conta2":"01.02 -- NÃO
    CIRCULANTE","conta3":"01.02.03 -- IMOBILIZADO","conta4":"01.02.03.06 -
    Máquinas e Ferramentas ICPC 10","cc":"CC não informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":30000,"saldoAtual":30000,"nivel":4,"conta5":"01.02.03.06
    - Máquinas e Ferramentas ICPC 10"},{"id":1273,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.02 - Vendas no mercado interno
    revenda","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-2276300,"saldoAtual":-2276300,"nivel":4,"conta5":"03.01.01.02
    - Vendas no mercado interno revenda"},{"id":1273,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.01 -- RECEITA BRUTA DE VENDA DE
    MERCADORIAS","conta4":"03.01.01.02 - Vendas no mercado interno
    revenda","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"03.01.01.02
    - Vendas no mercado interno revenda"},{"id":1274,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.02 -- RECEITA BRUTA DA VENDA DE
    SERVIÇOS","conta4":"03.01.02.02 - Venda de serviços ao mercado
    externo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-2450000,"saldoAtual":-2450000,"nivel":4,"conta5":"03.01.02.02
    - Venda de serviços ao mercado externo"},{"id":1278,"conta1":"03 --
    RECEITAS","conta2":"03.01 -- RECEITA DE VENDA DE
    MERCADORIAS","conta3":"03.01.03 -- ( - ) DEDUÇÕES DA
    VENDAS","conta4":"03.01.03.03 -- TRIBUTOS SOBRE
    VENDAS","conta5":"03.01.03.03.009 - PIS/COFINS/CSLL
    s/venda","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":22097.25,"saldoAtual":22097.25,"nivel":5},{"id":1316,"conta1":"03
    -- RECEITAS","conta2":"03.04 -- RECEITAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"03.04.01 -- RECEITAS
    OPERACIONAIS","conta4":"03.04.01.01 -- Rendas de Operações de
    Crédito","conta5":"03.04.01.01.001 - Rendas de
    empréstimos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-10000,"saldoAtual":-10000,"nivel":5},{"id":1316,"conta1":"03
    -- RECEITAS","conta2":"03.04 -- RECEITAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"03.04.01 -- RECEITAS
    OPERACIONAIS","conta4":"03.04.01.01 -- Rendas de Operações de
    Crédito","conta5":"03.04.01.01.001 - Rendas de
    empréstimos","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":5},{"id":1319,"conta1":"03
    -- RECEITAS","conta2":"03.04 -- RECEITAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"03.04.01 -- RECEITAS
    OPERACIONAIS","conta4":"03.04.01.02 -- Rendas de
    Câmbio","conta5":"03.04.01.02.001 - Rendas de operações de
    câmbio","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-20000,"saldoAtual":-20000,"nivel":5},{"id":1327,"conta1":"03
    -- RECEITAS","conta2":"03.04 -- RECEITAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"03.04.02 -- RECEITAS NAO
    OPERACIONAIS","conta4":"03.04.02.04 -- Receita decorrente da venda de bens
    do ativo permanente","conta5":"03.04.02.04.001 - Receita da venda de bens do
    ativo permanente (não-circulante) –
    Imobilizado","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-500,"saldoAtual":-500,"nivel":5},{"id":1335,"conta1":"04
    -- CUSTOS E DESPESAS","conta2":"04.05 -- DESPESAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"04.05.01 -- Despesas incorridas nas operações de
    intermediação financeira","conta4":"04.05.01.01 - Despesas de depósito de
    poupança","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":1000,"saldoAtual":1000,"nivel":4,"conta5":"04.05.01.01
    - Despesas de depósito de poupança"},{"id":1335,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.05 -- DESPESAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"04.05.01 -- Despesas incorridas nas operações de
    intermediação financeira","conta4":"04.05.01.01 - Despesas de depósito de
    poupança","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":0,"saldoAtual":0,"nivel":4,"conta5":"04.05.01.01
    - Despesas de depósito de poupança"},{"id":1336,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.05 -- DESPESAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"04.05.01 -- Despesas incorridas nas operações de
    intermediação financeira","conta4":"04.05.01.02 - Despesas de depósito a
    prazo","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":500,"saldoAtual":500,"nivel":4,"conta5":"04.05.01.02
    - Despesas de depósito a prazo"},{"id":1338,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.05 -- DESPESAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"04.05.02 -- Despesas de câmbio","conta4":"04.05.02.01
    - Despesas de operações de câmbio - exportação","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":800,"saldoAtual":800,"nivel":4,"conta5":"04.05.02.01
    - Despesas de operações de câmbio - exportação"},{"id":1342,"conta1":"03 --
    RECEITAS","conta2":"03.04 -- RECEITAS INSTITUIÇÕES
    FINANCEIRAS","conta3":"03.04.02 -- RECEITAS NAO
    OPERACIONAIS","conta4":"03.04.02.02 -- Outras Receitas
    Operacionais","conta5":"03.04.02.02.002 - Outras rendas
    operacionais","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-150000,"saldoAtual":-150000,"nivel":5},{"id":1360,"conta1":"03
    -- RECEITAS","conta2":"03.03 -- OUTRAS RECEITAS","conta3":"03.03.01 --
    OUTRAS RECEITAS","conta4":"03.03.01.08 - Outras receitas 02","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-50000,"saldoAtual":-50000,"nivel":4,"conta5":"03.03.01.08
    - Outras receitas 02"},{"id":1362,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.02 -- OUTRAS DESPESAS","conta3":"04.02.01 -- OUTRAS
    DESPESAS","conta4":"04.02.01.10 - Outras despesas 01","cc":"CC não
    informado","date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":130000,"saldoAtual":130000,"nivel":4,"conta5":"04.02.01.10
    - Outras despesas 01"},{"id":1403,"conta1":"04 -- CUSTOS E
    DESPESAS","conta2":"04.01 -- CUSTOS E DESPESAS
    OPERACIONAIS","conta3":"04.01.03 -- DESPESAS COM
    VENDAS","conta4":"04.01.03.13 - Propaganda","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":12900,"saldoAtual":12900,"nivel":4,"conta5":"04.01.03.13
    - Propaganda"},{"id":1404,"conta1":"03 -- RECEITAS","conta2":"03.03 --
    OUTRAS RECEITAS","conta3":"03.03.01 -- OUTRAS
    RECEITAS","conta4":"03.03.01.10 - Receitas de equivalência
    patrimonial","cc":null,"date":"2020-06-01
    GMT-03:00","debito":0,"credito":0,"saldoPeriodo":0,"saldoAnterior":-175000,"saldoAtual":-175000,"nivel":4,"conta5":"03.03.01.10
    - Receitas de equivalência
    patrimonial"}],"fields":[{"area":"row","caption":"","groupName":"ContaContabil","index":0,"_initProperties":{},"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"levels":[{"dataField":"conta1","dataType":"string","displayFolder":"","caption":"Contas","groupIndex":0,"groupName":"ContaContabil","visible":true,"_initProperties":{},"index":1,"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"area":"row"},{"dataField":"conta2","dataType":"string","displayFolder":"","caption":"2","groupIndex":1,"groupName":"ContaContabil","visible":true,"_initProperties":{},"index":2,"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"area":"row"},{"dataField":"conta3","dataType":"string","displayFolder":"","caption":"3","groupIndex":2,"groupName":"ContaContabil","visible":true,"_initProperties":{},"index":3,"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"area":"row"},{"dataField":"conta4","dataType":"string","displayFolder":"","caption":"4","groupIndex":3,"groupName":"ContaContabil","visible":true,"_initProperties":{},"index":4,"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"area":"row"},{"dataField":"conta5","dataType":"string","displayFolder":"","caption":"5","groupIndex":4,"groupName":"ContaContabil","visible":true,"_initProperties":{},"index":5,"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"area":"row"}]},{"caption":"Contas","dataField":"conta1","groupIndex":0,"groupName":"ContaContabil","visible":true},{"caption":"2","dataField":"conta2","groupIndex":1,"groupName":"ContaContabil","visible":true},{"caption":"3","dataField":"conta3","groupIndex":2,"groupName":"ContaContabil","visible":true},{"caption":"4","dataField":"conta4","groupIndex":3,"groupName":"ContaContabil","visible":true},{"caption":"5","dataField":"conta5","groupIndex":4,"groupName":"ContaContabil","visible":true},{"area":"row","caption":"CC","dataField":"cc"},{"area":"column","caption":"","dataField":"date","dataType":"date","groupName":"Date"},{"caption":"Ano","groupIndex":0,"groupInterval":"year","groupName":"Date","index":8,"_initProperties":{},"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"area":"column","dataField":"date","dataType":"date"},{"caption":"Mês","groupIndex":1,"groupInterval":"month","groupName":"Date","index":9,"_initProperties":{},"allowSorting":false,"allowSortingBySummary":true,"allowFiltering":true,"allowExpandAll":true,"areaIndex":0,"area":"column","dataField":"date","dataType":"date"},{"area":"data","calculateSummaryValue":"function(e)
    { if (e.field('column') == null) { return e.value(); } else { return null; }
    }","caption":"Saldo
    anterior","dataField":"saldoAnterior","format":{"type":"currency","precision":2,"currency":"BRL"},"summaryType":"sum"},{"area":"data","calculateSummaryValue":"function(e)
    { if (e.field('column') != null) { return e.value(); } else { return null; }
    }","caption":"Saldo do
    período","dataField":"saldoPeriodo","format":{"type":"currency","precision":2,"currency":"BRL"},"summaryType":"sum"},{"area":"data","calculateSummaryValue":"function(e)
    { if (e.field('column') == null) { return e.value(); } else { return null; }
    }","caption":"Saldo
    atual","dataField":"saldoAtual","format":{"type":"currency","precision":2,"currency":"BRL"},"summaryType":"sum"}]},"error":null},"options":{"startDate":"30/06/2020","endDate":"01/07/2020"}}`;
    app.$store.replaceState((JSON.parse(teste)));
    */
   
  </script>
</asp:Content>
