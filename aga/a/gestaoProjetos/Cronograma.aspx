<%@ Page Title="Cronograma" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.Cronograma" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CRONOGRAMA" Title="Cronograma" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOTAREFAS.CRONOGRAMA.GRID" DefaultFilterName="Padrão" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="250" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/gestaoProjetos/CronogramaTarefa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CRONOGRAMA_PROJETO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    