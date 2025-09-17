<%@ Page Language="C#" Title="Início" AutoEventWireup="true" Inherits="PortalCRM.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="wes" %>
<%@ Register Src="~/uc/TopBar.ascx" TagName="TopBar" TagPrefix="wes" %>
<%@ Register Src="~/uc/TopBarMainContent.ascx" TagName="TopBarMainContent" TagPrefix="wes" %>
<%@ Register Src="~/uc/HeadSection.ascx" TagName="HeadSection" TagPrefix="wes" %>
<%@ Register Src="~/uc/SidePanel.ascx" TagName="SidePanel" TagPrefix="wes" %>
<%@ Register Src="~/uc/WesManager.ascx" TagName="WesManager" TagPrefix="wes" %>
<%@ Register TagPrefix="wes" Namespace="Benner.Tecnologia.Wes.Components.WebApp" Assembly="Benner.Tecnologia.Wes.Components.WebApp, Version=2008.0.0.0, Culture=neutral, PublicKeyToken=f2db26731026fd37" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">


    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" id="NomeTitulo" class="caption-subject font-green-sharp bold uppercase">Painel CRM</span>
                <span runat="server" id="HelperTitulo" class="caption-helper">indicadores</span>
            </div>
        </div>
        <div class="portlet-body">

            <div class="row">
                <erp:ErpDashboardStat ID="tile1" runat="server" source="TarefasTerceiros" color="blue-madison" />
                <erp:ErpDashboardStat ID="tile3" runat="server" source="TarefasPendentes" color="purple-plum" />
                <erp:ErpDashboardStat ID="tile4" runat="server" source="TarefasAtrasadas" color="red-intense" />
                <erp:ErpDashboardStat ID="tile2" runat="server" source="OportunidadesAberto" color="green-haze" hideZeroValue="true" />
            </div>  


        </div>
    </div>    
        <div class="row">             
            <wesWidget:WorkFlowGrid runat="server" ID="WFL_TASKS_INBOX"  Title="Minhas tarefas" BootstrapCols="12" FormUrl="~/wfl/a/t/tarefa.aspx" UserDefinedCriteriaWhereClause="@WFL_INBOX" UserDefinedDataSourceParameters="" CompanyFilterMode="None" DisplayRowCommand="True" SystemFilterOnly="False" UserDefinedPageSize="10" Mode="Selectable" UserDefinedSelectColumnVisible="False" DefaultFilterName="Título" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="True" ChromeState="Normal" EntityViewName="Z_WFTAREFAS.INBOX.GRID" PageWidgetHandle="270"  />            
        </div>        

</asp:Content>
