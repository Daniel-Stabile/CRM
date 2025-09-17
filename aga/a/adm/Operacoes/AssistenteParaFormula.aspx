<%@ Page Title="Assistente para fórmula" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:ActionView runat="server" ID="ASSISTENTEPARAFRMULA" Title="Montagem de fórmula" Subtitle="Usado como valor unitário na movimentação de estoque" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="Itens" Action="AssistenteFormula" PageId="AGA_A_ADM_OPERACOES_ASSISTENTEPARAFORMULA" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    