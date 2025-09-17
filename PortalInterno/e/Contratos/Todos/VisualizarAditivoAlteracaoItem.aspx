<%@ Page Title="Visualizar contrato" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            
        }

        protected override void OnPreRenderComplete(EventArgs e) 
        {
            base.OnPreRenderComplete(e);
            var entidade = ADITIVOALTERACAO.GetEntity();


            TITULO.Title = "Itens alterados >> " + entidade.Fields["PATH_635814565584131305"].ToString();

        }


    
    </script>

    <style>
        .page-content{
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
		            <wes:AjaxForm 
                        runat="server"
                        ID="ADITIVOALTERACAO" 
                        Title=""
                        FormMode="ReadOnly"
                        BootstrapCols="12"
                        UserDefinedCommandsVisible="True"
                        UserDefinedCriteriaWhereClause="" 
                        IncludeRecordInRecentItems="False"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="False"
                        ChromeState="Normal"
                        HideDeveloperCommands="True"
                        EntityViewName="PORTAL_INT_ADITIVO_ALTERACAO_OBJETO.FORM"
                        PageWidgetHandle="110"  />
                </div>
            </div>
        </div>
    </div>
</asp:content>
