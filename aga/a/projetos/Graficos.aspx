<%@ Page Title="Gráficos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.Grafico" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:FilterWidget runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOS.FILTRO.GRID" DefaultFilterName="filtro gráfico" Mode="FixedRequired" PageId="GRAFICOS_PROJETOS" Level="20" Order="20"  />
        <wes:ActionView runat="server" ID="GRAFICO" Title="Gráfico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="GanttChart" Action="ObterDadosProjeto" PageId="GRAFICOS_PROJETOS" Level="20" Order="40"  />
        </div>
    
      </asp:Content>
    