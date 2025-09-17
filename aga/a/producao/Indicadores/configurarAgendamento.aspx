<%@ Page Title="Indicadores Produção" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.producao.Indicadores.IndicadoresconfigurarAgendamentoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CONFIGURAOAGENDAMENTOINDICADORESPRODUO" Title="Indicadores Produção" Subtitle="Configuração do agendamento de sincronização" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_AGENDAMENTOS.INDICADORES_PRODUCAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.CLASSE = 'Benner.Corporativo.Producao.Indicadores.GeradorDashboardProducaoUltimos12Meses, Benner.Corporativo.Producao'" UserDefinedCommandsVisible="True" PageId="CONFIG_INDICADORES_PRODUCAO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    