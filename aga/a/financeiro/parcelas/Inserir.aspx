<%@ Page Title="Inserir Parcela" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INSERIRPARCELA" class="active"><a data-toggle="tab" href="#tabINSERIRPARCELA">Inserir Parcela</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabINSERIRPARCELA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="INSERIRPARCELA" Title="Inserir Parcela" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-plus" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="FN_VT_PARCELAMANUAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_INSERIR_PARCELAS" Level="20" Order="10"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    