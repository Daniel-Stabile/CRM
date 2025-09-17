<%@ Page Title="Parâmetros" Language="C#" CodeFile="~/aga/e/GestaoCobranca/Parametros.aspx.cs" Inherits="GestaoCobrancaParametrosPage" %>
   

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp"
TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components"
TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <style>
        .alert-danger {
            display: none;
        }
    </style>
    <div class="row">
        <!-- InicioTabs -->
        <div class="col-md-12">
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption ">
                        <span class="caption-subject font-green-sharp bold uppercase" title="GC_PARAMETROS">
                            Parâmetros
                        </span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tabGERAL" data-toggle="tab" aria-expanded="true">Geral</a>
                                </li>
                                <li class="">
                                    <a href="#tabCONTAS" data-toggle="tab" aria-expanded="false">Contas</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade  active in" id="tabGERAL">
                                    <div class="row">
                                        <wes:AjaxForm runat="server" ID="PARMETROS" Title="Parâmetros"
                                            Subtitle="" PortletCssClass="" PortletLayout="Default"
                                            BootstrapCols="12" FontIcon="" ShowTitle="false"
                                            ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True"
                                            CanUpdate="True" CanInsert="True"
                                            EntityViewName="GC_PARAMETROS.CADASTROS.FORM" FormMode="None"
                                            IncludeRecordInRecentItems="True"
                                            UserDefinedCommandsVisible="True"
                                            UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA"
                                            PageId="GC_CADASTROS_PARAMETOS" Level="20" Order="10" />
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tabCONTAS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server" ID="FILIAIS"
                                            Title="Etapas do processo" Subtitle="" PortletCssClass=""
                                            PortletLayout="Default" BootstrapCols="6" FontIcon=""
                                            ShowTitle="false" ProviderWidgetUniqueId="PARMETROS"
                                            ChromeState="Normal" CanDelete="false" CanUpdate="false"
                                            CanInsert="false"
                                            EntityViewName="FILIAIS.CADASTROS_COBRANCA.GRID" Mode="None"
                                            UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10"
                                            SystemFilterOnly="False" DisplayRowCommand="True"
                                            CompanyFilterMode="OnlyCompany"
                                            UserDefinedCriteriaWhereClause="A.EMPRESA = @CAMPO(EMPRESA)"
                                            PageId="GC_CADASTROS_PARAMETOS" Level="20" Order="20" />

                                        <wes:AjaxForm runat="server" ID="CONTAS" Title="Contas" Subtitle=""
                                            PortletCssClass="" PortletLayout="Default" BootstrapCols="6"
                                            FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FILIAIS"
                                            ChromeState="Normal" CanDelete="True" CanUpdate="True"
                                            CanInsert="True"
                                            EntityViewName="GC_PARAMETROSFILIAIS.CADASTROS.FORM"
                                            UserDefinedCriteriaWhereClause="A.EMPRESA = @CAMPO(EMPRESA) AND A.FILIAL = @CAMPO(HANDLE)"
                                            FormMode="None" IncludeRecordInRecentItems="True"
                                            UserDefinedCommandsVisible="True"
                                            PageId="GC_CADASTROS_PARAMETOS" Level="20" Order="25" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(function() {
            if($("#ctl00_Main_PARMETROS_ctl01 > div>a")[0].text == "Registro não encontrado."){
                $("#ctl00_Main_PARMETROS_ctl01 > div")[0].remove();
            }
        })

    </script>
</asp:Content>