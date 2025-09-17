<%@ Page Title="Conferência de autenticidade de documentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" MasterPageFile="~/Blank.master"%>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:ActionView runat="server" ID="CONFERENCIADEAUTENTICIDADEDEDOCUMENTOS" Title="Conferencia de autenticidade de documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="ConsultaDocumentosPublicos" Action="ConsultarDocumentosPublicos" PageId="AUTENTICIDADE_DOCUMENTOS_PUBLICO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    