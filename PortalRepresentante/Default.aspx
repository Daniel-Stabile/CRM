<%@ Page Language="C#" Title="Início" AutoEventWireup="true"
    Inherits="PortalRepresentante.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <style>
        #divCombos {
            margin-top: 30px;
        }

        #labelFiltro {
            margin-bottom: 20px;
        }

        #labelCompetencia {
            font-size: 12px;
        }

        #labelPlano {
            font-size: 12px;
        }

        #divPlano {
            margin-bottom: 10px;
        }

        #divCompetencia {
            margin-bottom: 10px;
        }
    </style>

    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" id="NomeTitulo" class="caption-subject font-green-sharp bold uppercase">Painel Agente de Vendas</span>
                <span runat="server" id="HelperTitulo" class="caption-helper">indicadores</span>
            </div>
        </div>
        <div class="portlet-body">

            <div class="row">
                <erp:ErpDashboardStat ID="tile11" runat="server" source="representante-0" color="blue-madison" />
                <erp:ErpDashboardStat ID="tile13" runat="server" source="representante-2" color="purple-plum" />
                <erp:ErpDashboardStat ID="tile14" runat="server" source="representante-3" color="red-intense" />
                <erp:ErpDashboardStat ID="tile12" runat="server" source="representante-1" color="green-haze" />
            </div>


            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <erp:ErpDashboardChart ID="ErpDashboardChart1" runat="server" source="representante-12" color="grey-cararra" />
                </div>
            </div>
            <asp:UpdatePanel ID="updatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-11 col-sm-12">
                            <erp:ErpDashboardChart ID="metasVenda" runat="server" color="grey-cararra" />

                        </div>
                        <div class="col-md-1 col-sm-1">

                            <div id="divCombos">
                                <label id="labelFiltro" class="caption-subject font-green-sharp bold uppercase"><b>Filtros</b></label>
                                <div id="divPlano">
                                    <label id="labelPlano">Plano</label>
                                    <asp:DropDownList ID="comboPlano" runat="server" AutoPostBack="true" OnSelectedIndexChanged="comboPlano_SelectedIndexChanged" Width="70" />
                                </div>
                                <div id="divCompetencia">
                                    <label id="labelCompetencia">Mês/Ano</label>
                                    <asp:DropDownList runat="server" ID="comboCompetencia"  AutoPostBack="true" OnSelectedIndexChanged="comboCompetencia_SelectedIndexChanged"  Width="70" />
                                </div>
                            </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
