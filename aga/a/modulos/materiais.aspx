<%@ Page Title="Materiais" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.Materiais" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:CommandsPanel runat="server" ID="COMANDOS" Title="Comandos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="COMANDOS_MODULO_MATERIAIS.FORM" VerticalOrientation="False" PageId="MENU_MATERIAIS" Level="20" Order="1"  />
        </div>
    
        <script type="text/javascript">
              ExibirMenusModuloMateriais();
              </script>
      </asp:Content>
    