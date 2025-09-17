<%@ Page Title="Contratos - Configurações assinatura digital" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.assinaturaDigital.Configuracoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AGENDAMENTO" class="active"><a data-toggle="tab" href="#tabAGENDAMENTO">Agendamento</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARMETROS"><a data-toggle="tab" href="#tabPARMETROS">Parâmetros</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabAGENDAMENTO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AGENDAMENTO" Title="Agendamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_AGENDAMENTOS.ASSINATURA_DIGITAL_CONTRATOS.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.CLASSE = 'Benner.Corporativo.Contratos.AssinaturaDigital.SincronizadorAssinaturasDigitais, Benner.Corporativo.Contratos'" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_ASSINATURADIGITAL_CONFIGURACOES" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabPARMETROS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PARMETROS" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="EMPRESAS.CONFIGURACOES_ASSINATURA_DIGITAL_CONTRATOS.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @EMPRESA" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_ASSINATURADIGITAL_CONFIGURACOES" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    