<%@ Page Title="Gerar Alocação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="GERAALOCAO" Title="Gerar Alocação de Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_GERA_ALOCACAO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_GERA_ALOCACAO" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              var prm = window.Sys.WebForms.PageRequestManager.getInstance();
if (!prm.get_isInAsyncPostBack()) {
    prm.add_endRequest(function(sender, args){
       $('.nav-tabs').find('li').removeClass('active');
       $('[href="#GERAALOCAO_RESULTADOPROCESSO"]').trigger('click');
    });
}

              </script>
      </asp:Content>
    