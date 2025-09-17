<%@ Page Title="Devolver Lote" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.DevolverLoteRequisicao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:EditableGrid runat="server" ID="DEVOLVERLOTE" Title="Devolver Lote" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CP_REQUISICAOATENDIMENTOLOTES.DEVOLVERLOTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" PageId="ATENDIMENTO_REQUISICAO_DEVOLVER_LOTE" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    