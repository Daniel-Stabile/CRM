<%@ Page Title="Contas financeiras" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.ErpWeb.Genericos.ContasFinanceiras, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <div class="row">
        <div id="divMsgRetorno" runat="server" visible="false" class="alert alert-warning" >
	        <button class="close" data-dismiss="alert"></button><span id="msgRetorno" runat="server"></span>
        </div>

        <div id="divBotoes" class="col-lg-12 col-md-12 col-sm-12">
            <a id="botacaoConfirmar" runat="server" class="btn blue btn-save command-action predef-action editable" onServerClick="GravarRegistros">
                <i aria-hidden="true" class="fa fa-check"></i>
                Confirmar
            </a>
            <a id="botacaoCancelar" class="btn red btn-save command-action predef-action editable">
                <i aria-hidden="true" class="fa fa-times"></i>
                Cancelar
            </a>
        </div>

        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="portlet light">
                <div class="portlet-title">
                    <erp:ErpPortletTitleCaption
                        runat="server"
                        Title="Lançamentos"
                        ID="TITULO" />
                </div>


                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView
                            ID="gridLancamentos"
                            runat="server"
                            AutoGenerateColumns="false"
                            AllowSorting="true"
                            EmptyDataText="Sem dados para exibir"
                            OnRowCommand="gridLancamentos_RowCommand"
                            OnSelectedIndexChanged="gridLancamentos_SelectedIndexChanged"
                            OnRowDataBound="gridLancamentos_RowDataBound">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Button1" runat="server" CausesValidation="false" CommandName="DeleteRow" class="btn btn-xs btn-circle red" Text="Excluir">
                                    <i aria-hidden="true" class="fa fa-minus"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="conta" HeaderText="Conta" />
                                <asp:BoundField DataField="filial" HeaderText="Filial" />
                                <asp:BoundField DataField="natureza" HeaderText="Natureza" />
                                <asp:BoundField DataField="valor" HeaderText="Valor" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>

        <wes:AjaxForm runat="server" ID="CONTASFINANCEIRAS" OnCommandExecuted="CONTASFINANCEIRAS_CommandExecuted" OnCommandExecute="CONTASFINANCEIRAS_CommandExecute" Title="Contas financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_CONTAFINANCEIRA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22048" Level="20" Order="10" />

        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="portlet light">
                <div class="portlet-title">
                    <erp:ErpPortletTitleCaption
                        runat="server"
                        Title="Lançamentos Centro de custo"
                        ID="ErpPortletTitleCaption1" />
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView
                            ID="gridLancamentosCC"
                            runat="server"
                            AutoGenerateColumns="false"
                            AllowSorting="true"
                            EmptyDataText="Sem dados para exibir"
                            OnRowCommand="gridLancamentosCC_RowCommand">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Button1" runat="server" CausesValidation="false" CommandName="DeleteRow" class="btn btn-xs btn-circle red" Text="Excluir">
                                    <i aria-hidden="true" class="fa fa-minus"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="cc" HeaderText="Centro de custo" />
                                <asp:BoundField DataField="projeto" HeaderText="Projeto" />
                                <asp:BoundField DataField="valor" HeaderText="Valor" />
                                <asp:BoundField DataField="percentual" HeaderText="Percentual" />
                                <asp:BoundField DataField="rateio" HeaderText="Rateio" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>


        <wes:AjaxForm runat="server" ID="CENTRODECUSTO" Title="Centro de custo" OnCommandExecute="CENTRODECUSTO_CommandExecute" OnCommandExecuted="CENTRODECUSTO_CommandExecuted" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_CENTROCUSTO_CONTAFINANCEIRA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22051" Level="20" Order="20" />
    </div>

</asp:Content>
