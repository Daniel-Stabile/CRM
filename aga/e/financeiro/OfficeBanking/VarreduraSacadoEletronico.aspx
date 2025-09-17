<%@ Page Title="Varredura do sacado eletrônico" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
        <div class="portlet light">
            <div class="porlet-title">
                <div class="caption">
                    <span class="list-heading caption-subject font-green-sharp bold uppercase">Varredura do sacado eletrônico</span>
                </div>
            </div>
        </div>
        <div class="tabbable-line">
            <ul class="nav nav-tabs" aria-label="dsasadsa">
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ARQUIVOS" class="active"><a data-toggle="tab" href="#tabARQUIVOS">Arquivos</a></li>
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TTULOS"><a data-toggle="tab" href="#tabTTULOS">Títulos</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tabARQUIVOS">
                    <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-3">
                            <ul class="nav nav-tabs tabs-left">
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CADASTRADOS" class="active"><a data-toggle="tab" href="#tabCADASTRADOS">Cadastrados</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AGUARDANDOPROCESSAMENTO"><a data-toggle="tab" href="#tabAGUARDANDOPROCESSAMENTO">Aguardando processamento</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSANDO"><a data-toggle="tab" href="#tabPROCESSANDO">Processando</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSADOS"><a data-toggle="tab" href="#tabPROCESSADOS">Processados</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="COMERRO"><a data-toggle="tab" href="#tabCOMERRO">Com erro</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ARQUIVOS"><a data-toggle="tab" href="#tabTODOS">Todos</a></li>
                            </ul>
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabCADASTRADOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="CADASTRADOS" Title="Cadastrados" Subtitle="Arquivos" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_HBVARREDURASACADO.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 1" ShowExport="True" UserDefinedDisableRowSelection="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoArquivo.aspx" Level="20" Order="10"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabAGUARDANDOPROCESSAMENTO">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="AGUARDANDOPROCESSAMENTO" Title="Aguardando processamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBVARREDURASACADO.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCommandsVisible="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoArquivo.aspx" Level="20" Order="20"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabPROCESSANDO">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="PROCESSANDO" Title="Processando" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBVARREDURASACADO.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 3" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCommandsVisible="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoArquivo.aspx" Level="20" Order="30"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabPROCESSADOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="PROCESSADOS" Title="Processados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBVARREDURASACADO.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 4" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCommandsVisible="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoArquivo.aspx" Level="20" Order="40"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabCOMERRO">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="COMERRO" Title="Com erro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBVARREDURASACADO.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 5" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCommandsVisible="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoArquivo.aspx" Level="20" Order="50"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabTODOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="ARQUIVOS" Title="Todos" Subtitle="Arquivos" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBVARREDURASACADO.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCommandsVisible="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoArquivo.aspx" Level="20" Order="60"  />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tabTTULOS">
                    <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-3">
                            <ul class="nav nav-tabs tabs-left">
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECONHECIDOS" class="active"><a data-toggle="tab" href="#tabRECONHECIDOS">Reconhecidos</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NORECONHECIDOS"><a data-toggle="tab" href="#tabNORECONHECIDOS">Não reconhecidos</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PENDENTES"><a data-toggle="tab" href="#tabPENDENTES">Pendentes</a></li>
                                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EXCLUDOS"><a data-toggle="tab" href="#tabEXCLUDOS">Excluídos</a></li>
                            </ul>
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabRECONHECIDOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="RECONHECIDOS" Title="Reconhecidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="GN_HBVARREDURASACADOPARCELAS.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SITUACAO = 1" ShowExport="True" UserDefinedDisableRowSelection="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoTitulo.aspx" Level="20" Order="10"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabNORECONHECIDOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="NORECONHECIDOS" Title="Não reconhecidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="GN_HBVARREDURASACADOPARCELAS.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SITUACAO = 2" ShowExport="True" UserDefinedDisableRowSelection="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoTitulo.aspx" Level="20" Order="20"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabPENDENTES">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="PENDENTES" Title="Pendentes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="GN_HBVARREDURASACADOPARCELAS.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SITUACAO = 3" ShowExport="True" UserDefinedDisableRowSelection="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoTitulo.aspx" Level="20" Order="30"  />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabEXCLUDOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="EXCLUDOS" Title="Excluídos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="GN_HBVARREDURASACADOPARCELAS.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SITUACAO = 4" ShowExport="True" UserDefinedDisableRowSelection="False" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoTitulo.aspx" Level="20" Order="40"  />
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
