<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Planilha.aspx.cs" Inherits="Views_CrmPerformance_Planilha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="appCrmPlanilha" class="row">
        <div v-show="Loading" style="background-color:whitesmoke;z-index:100;opacity:0.6;height:100%;width:100%;position:absolute">
            <img src="../../content/img/Dot Loader.gif" style="position:relative;left:40%;top:30%;width:20%"/>
        </div>
        <div class="col-md-12" style="z-index:50;">
            <div class="portlet light bordered">
                <div class="portlet-title green">
                    <div class="caption ">
                        <i class="fa fa-cubes font-green"></i>
                        <span class="caption-subject font-green bold uppercase">Planilha</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="Widget-body">
                        <div class="form-actions col-md-12">
                            <div class="row">
                                <div class="col-md-9" v-if="Mensagem == 'Ok'">
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table-scrollable" style="margin-top:20px;">
                            <table class="table table-hover simple-grid">
                                <thead>
                                    <tr style="background-color:#F7CA18">
                                        <th style="width:50px">{{Cabecalho.Nome}}</th>
                                        <th style="width:50px" v-for="item in Cabecalho.ListaCampos">{{item}}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td><b>Vertical</b></td></tr>
                                    <tr v-for="plan in PlanilhaVertical">
                                        <td style="width:50px">{{plan.Nome}}</td>
                                        <td style="width:50px" v-for="item in plan.ListaCampos">{{item}}</td>
                                    </tr>
                                    <tr><td><b>Executivo</b></td></tr>
                                    <tr v-for="plan in PlanilhaUsuario">
                                        <td style="width:50px">{{plan.Nome}}</td>
                                        <td style="width:50px" v-for="item in plan.ListaCampos">{{item}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-actions col-md-12">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    var app = new Vue({
        el: '#appCrmPlanilha',
        data: {
            PlanilhaVertical: {},
            PlanilhaUsuario: {},
            Cabecalho: {},
            Mensagem: "",
            Loading:false
        },
        methods: {
        },
        watch: {
            
        },
        mounted: function () {
            var scope = this;
            var jsonTestePlanilhaVertical = <%= JsonPlanilhaVertical.ToString()%>;
            var jsonTestePlanilhaUsuario = <%= JsonPlanilhaUsuario.ToString()%>;
            var jsonTesteCabecalho = <%= JsonCabecalho.ToString()%>;
            var jsonVertical;
            var jsonUsuario;
            var jsonCabecalho;
            var mensagem = "";

            if (jsonTestePlanilhaVertical != "Json")
                jsonVertical = <%= JsonPlanilhaVertical%>;
            else
                jsonVertical = {}
            
            if (jsonTestePlanilhaUsuario != "Json")
                jsonUsuario = <%= JsonPlanilhaUsuario%>;
            else
                jsonUsuario = {}
            
            if (jsonTesteCabecalho != "Json")
                jsonCabecalho = <%= JsonCabecalho%>;
            else
                jsonCabecalho = {}

            mensagem = "<%= mensagem%>";

            scope.PlanilhaVertical = jsonVertical;
            scope.PlanilhaUsuario = jsonUsuario;
            scope.Cabecalho = jsonCabecalho;
            
            console.log(scope);
        }
    });
</script>
</html>
