<%@ Page Title="Cadastrar pedido" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <script runat="server">
          
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }
    </script>

    <div class="form-wizard">

        <ul class="nav nav-pills nav-justified steps">
            <li class="active">
                <a class="step">
                    <span class="number">1</span>
                    <span class="desc">
                        <i class="fa fa-check"></i>
                        Capa do pedido
                    </span>
                </a>
            </li>
            <li class="">
                <a class="step">
                    <span class="number">2</span>
                    <span class="desc">
                        <i class="fa fa-check"></i>
                        Endereço de entrega
                    </span>
                </a>
            </li>
            <li class="">
                <a class="step">
                    <span class="number">3</span>
                    <span class="desc">
                        <i class="fa fa-check"></i>
                        Itens do pedido
                    </span>
                </a>
            </li>
        </ul>



        <div class="tab-content">
            <div class="tab-pane active" id="tab1">

                <div class="row">                     
                    <wes:AjaxForm runat="server"
                        ID="PEDIDO_FORM"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTAL_CLI_PEDIDOCAPA.FORM"
                        UserDefinedCriteriaWhereClause="A.CADASTRADO = 1"
                        IncludeRecordInRecentItems="False"
                        HideDeveloperCommands="False"
                        CanInsert="True"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="false"
                        ChromeState="Normal"
                        PageWidgetHandle="1" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
