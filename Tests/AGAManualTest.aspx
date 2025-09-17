<%@ Page Title="AGA - Testes manuais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <aga:AGAResource runat="server" src="~/Content/aga/js/complete.js" /> 
    <script runat="server">

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            MyForm.IsHorizontalForm = Request["o"] != "v";
        }

        protected void Button1_OnClick(object sender, EventArgs e)
        {
            var toastr = new AGAToastr()
            {
                Target = ToastrUrlTarget.BlankPage,
                Position = ToastrPosition.TopRight,
                Title = "Titulo",
                Message = "Mensagem do toastr",
                Kind = ToastrKind.Success,
                TimeOutSeconds = 0
            };
            toastr.AppendToPage(this);
        }



    </script>


    <script>
        function toOrientation(horizontal) {
            var url = window.location.href.split("?")[0];
            if (horizontal)
                url += "?o=h";
            else
                url += "?o=v";

            window.location.href = url;
        }

        function anyChange(e) {
            console.log(e.name + " foi alterado!");
        }

        function allReadOnly(readonly) {
            AGA.Radio.setReadOnly("MyRadio", readonly);
            AGA.Date.setReadOnly("MyDate", readonly);
            AGA.Date.setReadOnly("MyDateMonth", readonly);
            AGA.Date.setReadOnly("MyDateYear", readonly);
            AGA.Text.setReadOnly("MyText", readonly);
            AGA.Number.setReadOnly("MyNumber", readonly);
            AGA.Lookup.setReadOnly("MyLookup", readonly);
            AGA.Lookup.setReadOnly("MyLookupCli", readonly);
            AGA.Lookup.setReadOnly("MyLookupMultiServer", readonly);
            AGA.Lookup.setReadOnly("MyLookupMultiCli", readonly);
            AGA.Checkbox.setReadOnly("CHECKBOX1", readonly);


        }

    </script>

    <asp:Button ID="Button1" runat="server" Text="Toastr" OnClick="Button1_OnClick" />



    <a class="btn" href="javascript:toOrientation(true);">Horizontal</a>
    <a class="btn" href="javascript:toOrientation(false);">Vertical</a>

    <a class="btn" href="javascript: AGA.Form.setReadOnly('#MyForm', true);">ReadOnly</a>
    <a class="btn" href="javascript: AGA.Form.setReadOnly('#MyForm', false);">Editável</a>


    <aga:agaformcontrol runat="server" id="MyForm" ishorizontalform="true"
        clientchangecallback="anyChange" readonly="true">


        <div class="row">

            <div class="col-md-4">
                <aga:AGARadioControl runat="server" Name="MyRadio" LabelText="Radio">
                    <aga:AGARadioItem runat="server" Text="Opcao1" Value="Opcao1" CssClasses="btn blue" />
                    <aga:AGARadioItem runat="server" Text="Opcao2" Value="Opcao2" CssClasses="btn red" />
                </aga:AGARadioControl>
            </div>
            <div class="col-md-4">
                <aga:AGATextControl runat="server" Name="MyText" LabelText="MyText" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <aga:AGADateControl runat="server" Name="MyDate" LabelText="MyDate" LabelHelp="Esse é um teste" />
            </div>
            <div class="col-md-4">
                <aga:AGADateControl runat="server" Name="MyDateMonth" LabelText="MyDate Month" DateFormat="MonthYear" LabelHelp="Esse é um teste" />
            </div>
            <div class="col-md-4">
                <aga:AGADateControl runat="server" Name="MyDateYear" LabelText="MyDate Year" DateFormat="Year" LabelHelp="Esse é um teste" />
            </div>

        </div>
        <div class="row">
            <div class="col-md-4">
                <aga:AGANumberControl runat="server" ID="MyNumber" Name="MyNumber" LabelText="MyNumber"
                    ClientChangeCallback="changeNumberTest" Decimals="2" />
            </div>

            <div class="col-md-4">
                <aga:AGALookupControl runat="server" ID="MyLookup" Name="MyLookup" LabelText="Lookup simples server"
                    ClientChangeCallback="changeLookupTest"
                    TargetTable="EMPRESAS"
                    ResultFields="NOME" ClearButton="True" />
            </div>

            <div class="col-md-4">
                <aga:AGALookupControl runat="server" ID="AGALookupControl1"
                    Name="MyLookupCli" LabelText="Lookup simples client"
                    ClientChangeCallback="changeLookupTest" ClearButton="True">
                    <aga:AGALookupItem runat="server" Value="1" Text="Item 1" />
                    <aga:AGALookupItem runat="server" Value="2" Text="Item 2" />
                    <aga:AGALookupItem runat="server" Value="3" Text="Item 3" />
                </aga:AGALookupControl>
            </div>

        </div>

        <div class="row">
            <div class="col-md-4">

                <aga:AGALookupControl runat="server" ID="AGALookupControl2"
                    Multiple="True"
                    Name="MyLookupMultiServer" LabelText="Lookup multiplo server"
                    ClientChangeCallback="changeLookupTest"
                    TargetTable="EMPRESAS"
                    ResultFields="NOME" ClearButton="True" />
            </div>

            <div class="col-md-4">
                <aga:AGALookupControl runat="server" ID="AGALookupControl3"
                    Multiple="true"
                    Name="MyLookupMultiCli" LabelText="Lookup multiplo client"
                    ClientChangeCallback="changeLookupTest" ClearButton="True">
                    <aga:AGALookupItem runat="server" Value="1" Text="Item 1" />
                    <aga:AGALookupItem runat="server" Value="2" Text="Item 2" />
                    <aga:AGALookupItem runat="server" Value="3" Text="Item 3" />
                </aga:AGALookupControl>
            </div>


            <div class="col-md-4">
                <aga:AGACheckBoxControl runat="server"
                    ID="EdtFilterRequired"
                    LabelText=""
                    Name="CHECKBOX1"
                    LabelCheckBox="CheckBox1" />
            </div>
        </div>

        <div class="row">

            <div class="col-md-4">
                <aga:AGALookupControl runat="server" ID="AGALookupControl4"
                    Name="PAI" LabelText="PAI"
                    ClearButton="True">
                    <aga:AGALookupItem runat="server" Value="1" Text="Item 1" />
                    <aga:AGALookupItem runat="server" Value="2" Text="Item 2" />
                    <aga:AGALookupItem runat="server" Value="3" Text="Item 3" />
                </aga:AGALookupControl>
            </div>

            <div class="col-md-4">
                <aga:AGALookupControl runat="server" ID="AGALookupControl5"
                    Name="FILHO" LabelText="FILHO"
                    ClearButton="True" Depend="PAI">
                    <aga:AGALookupItem runat="server" Value="1" Text="Item 1" />
                    <aga:AGALookupItem runat="server" Value="2" Text="Item 2" />
                    <aga:AGALookupItem runat="server" Value="3" Text="Item 3" />
                </aga:AGALookupControl>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <aga:AGALookupControl runat="server" ID="AGALookupControl6"
                    Multiple="True"
                    Name="MULTIPLOPAI" LabelText="Lookup multiplo pai"
                    ClientChangeCallback="changeLookupTest"
                    TargetTable="EMPRESAS"
                    ResultFields="NOME" ClearButton="True" />
            </div>
            <div class="col-md-4">
                <aga:AGALookupControl runat="server" ID="AGALookupControl7"
                    Multiple="True"
                    Name="MULTIPLOFILHO" LabelText="Lookup multiplo filho"
                    ClientChangeCallback="changeLookupTest"
                    TargetTable="FILIAIS" CompanyFilterMode="None" Depend="MULTIPLOPAI"
                    ResultFields="NOME" ClearButton="True" LocalWhere="EMPRESA IN (@@(MULTIPLOPAI))" />
            </div>
        </div>

        <div class="row">

            <div class="col-md-6">

                <aga:AGAMemoControl runat="server" LabelText="Texto" Name="TEXTO" Rows="10" Cols="80" />

            </div>
        </div>

    </aga:agaformcontrol>
    <hr />


    <script>
        function showValues() {
            alert(AGA.Helper.getProps(AGA.Form.getValues('MyForm')));
            AGA.Toastr.show({
                kind: "Info",
                position: "TopRight",
                timeout: 0,
                title: "Info do AGAForm",
                message: AGA.Helper.getProps(AGA.Form.getValues('MyForm')),
                url: "",
                urlTarget: "Navigate"
            });            
        };

    </script>

    <aga:agajavascriptbutton runat="server" clientclickcallback="showValues" text="Valores do Form" cssclasses="blue" />




    <div class="form-horizontal">

        <div class="form-group">
            <label class="control-label col-md-2 col-sm-2">
                <div class="label-form">
                    <div class="label-title">
                        Funcionário
                    </div>
                    <div class="label-title-help">
                        <i class="fa fa-question-circle help-tooltip" data-original-title="Funcionário que terá a unidade alterada"></i>
                    </div>
                </div>
            </label>
            <div class="col-md-4 col-sm-4 value">
                <span id="ctl00_ctl03_defaultWebPartManager_DefaultDataInputForm_formView_PageControl_GERAL_GERAL_FUNCIONARIO">
                    <input type="text" id="ctl00_ctl03_defaultWebPartManager_DefaultDataInputForm_formView_PageControl_GERAL_GERAL_FUNCIONARIO_ctl01_text" value="DIRCEU" readonly="readonly" class="form-control"><input type="hidden" name="ctl00$ctl03$defaultWebPartManager$DefaultDataInputForm$formView$PageControl$GERAL$GERAL$FUNCIONARIO$ctl01" id="ctl00_ctl03_defaultWebPartManager_DefaultDataInputForm_formView_PageControl_GERAL_GERAL_FUNCIONARIO_ctl01" value="{&quot;id&quot;:4259,&quot;text&quot;:&quot;DIRCEU&quot;}" data-type="association" data-field="FUNCIONARIO" data-label="Funcionário"></span>
            </div>

            <label class="control-label col-md-2 col-sm-2">
                <div class="label-form">
                    <div class="label-title">
                        Unidade atual
                    </div>
                    <div class="label-title-help">
                        <i class="fa fa-question-circle help-tooltip" data-original-title="Unidade atual do funcionário"></i>
                    </div>
                </div>
            </label>
            <div class="col-md-4 col-sm-4 value">
                <span id="ctl00_ctl03_defaultWebPartManager_DefaultDataInputForm_formView_PageControl_GERAL_GERAL_UNIDADEATUAL">
                    <input type="text" id="ctl00_ctl03_defaultWebPartManager_DefaultDataInputForm_formView_PageControl_GERAL_GERAL_UNIDADEATUAL_ctl01_text" value="Blumenau" readonly="readonly" class="form-control"><input type="hidden" name="ctl00$ctl03$defaultWebPartManager$DefaultDataInputForm$formView$PageControl$GERAL$GERAL$UNIDADEATUAL$ctl01" id="ctl00_ctl03_defaultWebPartManager_DefaultDataInputForm_formView_PageControl_GERAL_GERAL_UNIDADEATUAL_ctl01" value="{&quot;id&quot;:904,&quot;text&quot;:&quot;Blumenau&quot;}" data-type="association" data-field="UNIDADEATUAL" data-label="Unidade atual"></span>
            </div>
        </div>
    </div>

    <div class="row">
        <aga:AGATile runat="server"
            ID="agaTile"
            Data-Uid="agaTile"
            Data-Size="2"
            Data-CssClass="green-jungle"
            Data-FontIcon="fa-dollar"            
            Data-Name="Test Tile"
            Data-Value="999"
            Data-Url="~/Tests/Manualtest.aspx"
            Data-UrlTarget="2">
        </aga:AGATile>
    </div>

    <%--EXEMPLO DE UTILIZAÇÃO do AGA.TableCreator--%>
    <div class="row">
        <div id="tableCreator">
        </div>
    </div>

    <script>
        var tabela = new AGA.TableCreator({ "class": "table table-hover", "id": "testeTable", "data-orderby": "NOME" });
        $(tabela.headerRow).addClass("header");

        tabela.addColumns({ name: "Coluna1", title: "Minha coluna 1" });
        tabela.addColumns({
            name: "Colunax",
            title: function (node) {
                var a = document.createElement("a");
                $(a).attr("href", "javascript:ManutencaoVerbas.setOrderBy('NOME');")
                    .text("Matricula").appendTo(node);
            },
            setValue: function (td, dataObject) {
                var a = document.createElement("a");
                $(a).attr("href", "javascript:;")
                    .text(AGA.Helper.getProps(dataObject)).appendTo(td);
            }
        });
        tabela.addColumns("Minha coluna 2");
        tabela.addColumns(["Minha coluna 3", "Minha coluna 4"]);

        var col3 = tabela.getHeaderCell(3);
        $(col3).css("background-color", "#e4c7c7");

        var colx = tabela.getHeaderCell("Colunax");
        $(colx).css("background-color", "#d3d3e8");

        var row = tabela.addRow({ "Coluna1": "Valorcoluna1" });

        row.getCell(3).innerText = "Meu teste coluna 3";
        row.getCell("Coluna1").innerText = "1";

        row = tabela.addRow({ "Coluna1": "linha 2" });
        row.getCell(2).innerText = "linha 2";
        row.getCell(3).innerText = "linha 2";
        row.getCell(4).innerText = "linha 2";


        $("#tableCreator").append(tabela.table);


    </script>


</asp:Content>
