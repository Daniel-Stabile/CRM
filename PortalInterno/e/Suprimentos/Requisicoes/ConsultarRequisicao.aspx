<%@ Page Title="Consultar requisições" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("RESUMO->ITENS", "RESUMO", "ITENS");
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);
        var entidade = RESUMO.GetEntity();

        TITULO.Title = "Requisição " + entidade.Fields["NUMERO"].ToString() + " >> " + entidade.Fields["STATUS"].ToString();

    }    
    
</script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }
    </style>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="TITULO" />
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row">
		                    <wesWidget:AjaxForm 
                                runat="server"
                                ID="RESUMO" 
                                Title="Requisição &gt;&gt; consulta"
                                FormMode="View"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                UserDefinedCriteriaWhereClause="" 
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                HideDeveloperCommands="true"
                                EntityViewName="PORTAL_INT_SUP_REQUISICOES_CONSULTA_CABECALHO.FORM"
                                PageWidgetHandle="110"  />
	                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row">
		                    <wesWidget:SimpleGrid 
                                runat="server" 
                                ID="ITENS"  
                                Title="Itens" 
                                BootstrapCols="12" 
                                UserDefinedDisableRowSelection="True" 
                                FormUrl="~/PortalInterno/e/Suprimentos/Requisicoes/RequisicaoDetalhes.aspx" 
                                UserDefinedCriteriaWhereClause="A.REQUISICAOPAI = @CAMPO(HANDLE)" 
                                UserDefinedDataSourceParameters="" 
                                CompanyFilterMode="None" 
                                DisplayRowCommand="True" 
                                SystemFilterOnly="False" 
                                UserDefinedPageSize="20" 
                                Mode="None" 
                                UserDefinedSelectColumnVisible="False" 
                                DefaultFilterName="" 
                                CanInsert="False" 
                                CanUpdate="False" 
                                CanDelete="False" 
                                ShowTitle="True" 
                                ChromeState="Normal" 

                                EntityViewName="PORTAL_INT_REQUISICOES_ITENS_CONSULTAR.GRID" 
                                PageWidgetHandle="111"  />
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:content>
