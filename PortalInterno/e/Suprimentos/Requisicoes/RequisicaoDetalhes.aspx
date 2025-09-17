<%@ Page Title="Detalhes da requisi��o" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">

<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("ESPECIFICACOES->ANEXOS", "ESPECIFICACOES", "ANEXOS");
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);
        var entidade = DETALHES.GetEntity();

        TITULO.Title = "Detalhes do Item >> " + entidade.Fields["NUMERO"].ToString() + " " + entidade.Fields["PRODUTO"].ToString();

    }      

</script>


    <div class="portlet light">
        <div class="portlet-title">
            <erp:ErpPortletTitleCaption
                runat="server"
                ID="TITULO" />
        </div>

        <div class="portlet-body">
            <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">

                <erp:ErpTab runat="server" ID="ErpTab3" Text="Detalhes">
                    <div class="erp-unbox">
                        <div class="row">
                            <erp:SimpleCardView ID="DETALHES" runat="server"
                                    EntityViewName="PORTAL_INT_REQUISICAO_DETALHES.FORM"
                                    DisplayLabels="True"
                                    CanDelete="false"
                                    CanUpdate="false"
                                    CanInsert="false"
                                    FormMode="View"
                                    EditButtonClass="green" />
                         </div>  
                    </div>
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="ErpTab1" Text="Especificações">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:AjaxForm ID="ESPECIFICACOES" runat="server"
                                EntityViewName="PORTAL_INT_REQUISICOES_ESPECIFICACOES.FORM"
                                DisplayLabels="True"
                                CanDelete="false"
                                CanUpdate="false"
                                CanInsert="false"
                                ShowTitle="False"
                                EditButtonClass="green" />
                        </div>
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab2" Text="Motivo">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:AjaxForm ID="MOTIVO" runat="server"
                                EntityViewName="PORTAL_INT_REQUISICOES_MOTIVO.FORM"
                                DisplayLabels="True"
                                CanDelete="false"
                                CanUpdate="false"
                                CanInsert="false"
                                ShowTitle="False"
                                EditButtonClass="green" />
                        </div>
                    </div>
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="ErpTab4" Text="Anexos">
                    <div class="erp-unbox">
                        <div class="row">
                            <wes:SimpleGrid
                                runat="server"
                                ID="ANEXOS"
                                BootstrapCols="12"
                                UserDefinedDisableRowSelection="True"
                                FormUrl=""
                                UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)"
                                UserDefinedDataSourceParameters=""
                                DisplayRowCommand="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="10"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                DefaultFilterName=""
                                CanInsert="true"
                                CanUpdate="False"
                                CanDelete="true"
                                ShowTitle="False"
                                ChromeState="Normal"
                                EntityViewName="PORTAL_INT_REQUISICOES_ANEXOS.GRID"
                                PageWidgetHandle="108" />
                        </div>
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
</asp:content>
