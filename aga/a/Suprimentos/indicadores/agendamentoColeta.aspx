<%@ Page Title="Agendamento coleta" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.indicadores.ConfigurarAgendamento" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="AGENDAMENTOSINDICADORES_SUPRIMENTOS" Title="Indicadores Suprimentos" Subtitle="Configuração do agendamento de sincronização" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_AGENDAMENTOS.INDICADORES_SUPRIMENTOS.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.CLASSE = 'Benner.Corporativo.Suprimentos.Agendamento.AgendamentoColeta, Benner.Corporativo.Suprimentos' 
AND A.EMPRESA = @EMPRESA" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_INDICADORES_AGENDAMENTOCOLETA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    