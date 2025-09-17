<%@ Page Title="Comissões" Language="C#" Inherits="aga.e.Financeiro.Comissoes.Geral" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="tabbable-line portlet light">
                <div class="tab-pane active" id="tab_representantes">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="REPRESENTANTES"
                            Title="Representantes"
                            Subtitle=""
                            PortletCssClass=""
                            PortletLayout="Default"
                            BootstrapCols="12"
                            FontIcon="fa fa-users font-green-sharp uppercase"
                            ShowTitle="true"
                            ProviderWidgetUniqueId=""
                            ChromeState="Fixed"
                            CanDelete="True"
                            CanUpdate="True"
                            CanInsert="True"
                            EntityViewName="GN_PESSOAS.COMISSAO.REPRESENTANTES.GRID"
                            Mode="Selectable"
                            UserDefinedSelectColumnVisible="False"
                            UserDefinedPageSize="10"
                            SystemFilterOnly="False"
                            DisplayRowCommand="True"
                            CompanyFilterMode="OnlyCompany"
                            UserDefinedCriteriaWhereClause="A.EHAGENTEVENDAS='S' AND A.INATIVO <>'S'"
                            ShowExport="True"
                            UserDefinedDisableRowSelection="false"
                            PageWidgetHandle="22376"
                            Level="20"
                            Order="10" />
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="tabbable-line portlet light" style="padding: 0px;">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab_representanteapuracoes" data-toggle="tab" aria-expanded="true"><i class="fa fa-users font-dark"></i>&nbsp;Apurações</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_representanteapuracoes">
                                        <div class="row">
                                            <wes:SimpleGrid runat="server"
                                                ID="APURACOESREPRESENTANTE"
                                                FormUrl="~/Erp/Financeiro/Comissao/Apuracao.aspx"
                                                Title="Apurações"
                                                Subtitle="Representante"
                                                OnCommandExecute="APURACOESREPRESENTANTE_CommandExecute"
                                                PortletCssClass=""
                                                PortletLayout="Default"
                                                BootstrapCols="12"
                                                FontIcon=""
                                                ShowTitle="false"
                                                ProviderWidgetUniqueId="REPRESENTANTES"
                                                ChromeState="Normal"
                                                CanDelete="True"
                                                CanUpdate="True"
                                                CanInsert="True"
                                                EntityViewName="FN_DOCUMENTOCOMISSOESAPURACOES.COMISSAO.APURACOES.GRID"
                                                Mode="Selectable"
                                                UserDefinedSelectColumnVisible="true"
                                                UserDefinedPageSize="10"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="True"
                                                CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause="A.AGENTEVENDAS = @CAMPO(HANDLE)"
                                                ShowExport="True"
                                                UserDefinedDisableRowSelection="false"
                                                PageWidgetHandle="22377" Level="20" Order="20" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
