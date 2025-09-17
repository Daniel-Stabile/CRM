<%@ Page Title="Novidades" Language="C#" CodeFile="~/Pages/K_CRM_NOVIDADES/Novidades.aspx.cs" Inherits="K_CRM_NOVIDADESNovidadesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:ActionView runat="server" ID="K_NOTICIAS" Title="Noticias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="CrmNovidades" Action="Feed" PageId="K_PAGES_K_CRM_NOVIDADES_NOVIDADES" Level="50" Order="10"  />
        </div>
    
      </asp:Content>
    