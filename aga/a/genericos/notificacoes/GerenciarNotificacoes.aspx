<%@ Page Title="Gerenciar notificações" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.genericos.notificacoes.GerenciarNotificacoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GERENCIARNOTIFICAES" Title="Gerenciar notificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_TIPOSNOTIFICACOES.GERENCIAR_NOTIFICACOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_GENERICOS_NOTIFICACOES_GERENCIARNOTIFICACOES" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(Benner.Corporativo.Notificacoes.associarEventosToggleNotificacoes);
    Benner.Corporativo.Notificacoes.associarEventosToggleNotificacoes();
});

              </script>
        <style>
              .bootstrap-switch span:before {
    content: "";
}

              </style>
      </asp:Content>
    