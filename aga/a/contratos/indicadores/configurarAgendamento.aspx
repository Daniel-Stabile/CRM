<%@ Page Title="Configurar agendamento coleta indicadores" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.faturamento.dashboard.ConfigurarAgendamento" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="COLETADEINDICADORES" Title="Indicadores contratos faturamento" Subtitle="Configuração do agendamento de sincronização" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_AGENDAMENTOS.INDICADORES_CONTRATO_FATURAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.CLASSE = 'Benner.Corporativo.Contratos.Indicadores.IndicadoresContratosServices, Benner.Corporativo.Contratos'" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_INDICADORES_CONFIGURARAGENDAMENTO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    