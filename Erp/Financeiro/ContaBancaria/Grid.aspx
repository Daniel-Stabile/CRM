<%@ Page Title="Contas Bancárias" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:ActionView runat="server" ID="CONTASBANCARIAS" Title="Contas Bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="ContaBancaria" Action="Grid" PageId="ERP_FINANCEIRO_CONTASBANCARIAS_FN_CONTASTESOURARIA_GRID" Level="20" Order="200"  />
        </div>
    
      </asp:Content>
    