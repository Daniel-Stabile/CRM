<%@ Page Title="Acompanhamento do cliente" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ACOMPANHAMENTODOCLIENTE" Title="Consulta de cliente" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.ACOMPANHAMENTOCLIENTE.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GN_PESSOAS_ACOMPANHAMENTO_CLIENTE" Level="20" Order="10"  />
        </div>
    
        <style>
              #top-CMD_OCORRENCIAS_inline {
    margin-top: 5px;
    margin-bottom: 5px;
}

              </style>
      </asp:Content>
    