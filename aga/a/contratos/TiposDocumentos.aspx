<%@ Page Title="Tipos Documentos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.TiposDocumentos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:EditableGrid runat="server" ID="DOCUMENTAODOCONTRATO" Title="Documentação do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CN_TIPOSDOCUMENTOS.DOCUMENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" PageId="TIPOS_DOCUMENTOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    