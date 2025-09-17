<%@ Page Title="Aquisições" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Aquisicoes.Aquisicoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="AQUISICOES" Title="AQUISICOES" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AQUISICOES.MODULO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="MENU_AQUISICOES" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              ExibirMenusModuloAquisicoes();
              </script>
      </asp:Content>
    