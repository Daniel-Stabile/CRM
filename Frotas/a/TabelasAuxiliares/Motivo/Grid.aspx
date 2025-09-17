<%@ Page Title="Cadastro Motivo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="TIPOSDEMOVIMENTAODEVECULOS" Title="Tipos de movimentação de Veículos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_MOTIVOS.CADASTRO_MOTIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Frotas/a/TabelasAuxiliares/Motivo/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_A_TABELASAUXILIARES_MOTIVO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    