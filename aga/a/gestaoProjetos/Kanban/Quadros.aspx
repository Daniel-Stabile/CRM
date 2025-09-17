<%@ Page Title="Quadros" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.Kanban" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:FilterWidget runat="server" ID="FILTROKANBAN" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOSKANBAN.FILTRO.GRID" DefaultFilterName="Filtro Projeto Kanban" Mode="FixedRequired" PageId="QUADROS_KANBAN" Level="20" Order="5"  />
        <wes:ActionView runat="server" ID="KANBAN" Title="Kanban" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FILTROKANBAN" ChromeState="Fixed" Controller="Kanban" Action="ObterDadosKanban" PageId="QUADROS_KANBAN" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    