<%@ Page Title="Importar XML" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.itensDaEmpresa.PreRecebimentoXml" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="IMPORTARXML" Title="Importar XML" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="CP_PRERECEBIMENTONFESXML.XML.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_PRERECEBIMENTOFISICO_IMPORTARXML" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ARQUIVOSAIMPORTAR" Title="Arquivos a processar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="CP_PRERECEBIMENTONFESXML.PRERECEBIMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="1=2" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_PRERECEBIMENTOFISICO_IMPORTARXML" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    