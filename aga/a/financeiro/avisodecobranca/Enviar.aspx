<%@ Page Title="Enviar aviso de cobrança" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ENVIAREMAIL" Title="Enviar e-mail" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WEB_FN_CONFIRMACAOENVIOEMAIL.AVISOCOBRANCA.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="WEB_FN_AVISODECOBRANCA_ENVIAR" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    