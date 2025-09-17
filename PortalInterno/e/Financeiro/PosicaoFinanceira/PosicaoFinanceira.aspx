<%@ Page Title="Posição financeira" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("RESUMO->VENCIDOS", "RESUMO", "VENCIDOS");
        AddWebPartStaticConnection("RESUMO->VENCER", "RESUMO", "VENCER");
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);
        var entidade = RESUMO.GetEntity();
        TITULO.Title = entidade.Fields["PESSOA"].ToString() + ">> " + String.Format("Total à pagar: R$ {0:C}", entidade.Fields["TOTALGERAL"].ToString());

        INFOSCREDITO.Title = "Informações de crédito >> Situação cliente: " + entidade.Fields["SITUACAO"].ToString();
        
        
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
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
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
		                    <wesWidget:AjaxForm 
                                runat="server"
                                ID="RESUMO" 
                                Title="Limite crédito"
                                FormMode="View"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                HideDeveloperCommands="true"
                                EntityViewName="PORTAL_INT_POSICAO_FINANCEIRA_LIMITE.FORM"
                                PageWidgetHandle="110"  />
	                    </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
		                    <wesWidget:SimpleGrid 
                                runat="server" 
                                ID="VENCIDOS"  
                                Title="Vencidos" 
                                BootstrapCols="12" 
                                UserDefinedDisableRowSelection="True" 
                                UserDefinedCriteriaWhereClause="A.POSICAOFINANCEIRA = @CAMPO(HANDLE) AND A.TIPOVENCIMENTO = 1" 
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
                                EntityViewName="PORTAL_INT_POSICAO_FINANCEIRA_SALDOS_VENCER.GRID" 
                                PageWidgetHandle="111"  />
	                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
		                    <wesWidget:AjaxForm 
                                runat="server"
                                ID="INFOSCREDITO"                                     
                                FormMode="View"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                IncludeRecordInRecentItems="False"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="true"
                                ChromeState="Normal"
                                HideDeveloperCommands="true"
                                EntityViewName="PORTAL_INT_POSICAO_FINANCEIRA_INFOS_CREDITO.FORM"
                                PageWidgetHandle="110"  />
	                    </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
		                    <wesWidget:SimpleGrid 
                                runat="server" 
                                ID="VENCER"  
                                Title="A vencer" 
                                BootstrapCols="12" 
                                UserDefinedDisableRowSelection="True" 
                                UserDefinedCriteriaWhereClause="A.POSICAOFINANCEIRA = @CAMPO(HANDLE) AND A.TIPOVENCIMENTO = 2" 
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
                                EntityViewName="PORTAL_INT_POSICAO_FINANCEIRA_SALDOS_VENCER.GRID" 
                                PageWidgetHandle="111"  />
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:content>
