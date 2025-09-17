<%@ Page Title="Balancete de verificação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="BALANCETEDEVERIFICAO" Title="Balancete de verificação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_FILTROSBALANCETE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_CT_BALANCETEVERIFICACAO" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(function (){
    
    EsconderMensagem($('#ctl00_Main_BALANCETEDEVERIFICAO_ctl04'));
    var prm = Sys.WebForms.PageRequestManager.getInstance();
      if (!prm.get_isInAsyncPostBack()) {
        prm.add_endRequest(function (sender, args) {
            EsconderMensagem($('#ctl00_Main_BALANCETEDEVERIFICAO_ctl04'));
        });
      }
})

              </script>
      </asp:Content>
    