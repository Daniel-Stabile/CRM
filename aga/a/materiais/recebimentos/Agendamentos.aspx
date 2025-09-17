<%@ Page Title="Agendamentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONFIGURARAGENDAMENTONFEEMAIL" class="active"><a data-toggle="tab" href="#tabCONFIGURARAGENDAMENTONFEEMAIL">Configurar agendamento NFe - E-mail</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONFIGURARAGENDAMENTONFESEFAZ"><a data-toggle="tab" href="#tabCONFIGURARAGENDAMENTONFESEFAZ">Configurar agendamento NFe - Sefaz</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONFIGURARAGENDAMENTONFSE"><a data-toggle="tab" href="#tabCONFIGURARAGENDAMENTONFSE">Configurar agendamento NFSe</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabCONFIGURARAGENDAMENTONFEEMAIL">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONFIGURARAGENDAMENTONFEEMAIL" Title="Configurar agendamento NFe - E-mail" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VTAGENDAMENTOSNFE.EMAIL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.BUSCARSEFAZ = 'N' AND A.BUSCANFSE = 'N'" UserDefinedCommandsVisible="True" PageId="AGENDAMENTOSMATERIAIS" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabCONFIGURARAGENDAMENTONFESEFAZ">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONFIGURARAGENDAMENTONFESEFAZ" Title="Configurar agendamento NFe - Sefaz" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VTAGENDAMENTOSNFE.SEFAZ.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.BUSCARSEFAZ = 'S' AND A.BUSCANFSE = 'N'" UserDefinedCommandsVisible="True" PageId="AGENDAMENTOSMATERIAIS" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabCONFIGURARAGENDAMENTONFSE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONFIGURARAGENDAMENTONFSE" Title="Configurar agendamento NFSe" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VTAGENDAMENTOSNFE.NFSE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.BUSCANFSE = 'S' AND A.BUSCARSEFAZ = 'N'" UserDefinedCommandsVisible="True" PageId="AGENDAMENTOSMATERIAIS" Level="20" Order="30"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    