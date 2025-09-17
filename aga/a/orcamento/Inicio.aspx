<%@ Page Title="Início" Language="C#" Inherits="aga.a.orcamento.Inicio" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:CommandsPanel runat="server" ID="COMANDOS" Title="Comandos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WEB_OR_MODULO.GRID" VerticalOrientation="False" PageId="AGA_A_ORCAMENTO_INICIO" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              ExibirMenusModuloOrcamentos();
              </script>
      </asp:Content>
    