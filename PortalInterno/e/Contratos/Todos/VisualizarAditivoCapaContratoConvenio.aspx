<%@ Page Title="Visualizar aditivo capa de contrato/convênio" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
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
            <div class="portlet-body">
                <div class="row">
		            <wes:AjaxForm 
                        runat="server"
                        ID="TAB_CONTRATO" 
                        Title="Capa do contrato/convênio"
                        FormMode="ReadOnly"
                        BootstrapCols="12"
                        UserDefinedCommandsVisible="True"
                        UserDefinedCriteriaWhereClause="" 
                        IncludeRecordInRecentItems="False"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="True"
                        ChromeState="Normal"
                        HideDeveloperCommands="True"
                        EntityViewName="PORTAL_INT_CAPA_CONTRATO_CONVENIO.FORM"
                        PageWidgetHandle="110"  />
                </div>
            </div>
        </div>
    </div>
</asp:content>
