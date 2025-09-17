<%@ Page Title="Avaliar Desconto" Language="C#" CodeFile="~/Pages/KCrmPoDescontos/AvaliarDesconto.aspx.cs" Inherits="KCrmPoDescontosAvaliarDescontoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:ActionView runat="server" ID="K_AVALIAR" Title="Avaliar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="CrmPoDescontos" Action="AvaliarDesconto" PageId="K_PAGES_KCRMPODESCONTOS_AVALIARDESCONTO" Level="50" Order="30"  />
        </div>
    
      </asp:Content>
    