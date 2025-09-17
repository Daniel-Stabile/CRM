<%@ Page Title="Gestão de projetos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GESTODEPROJETOS" Title="Gestão de projetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PROJETOS.GESTAO.GRID" DefaultFilterName="GESTÃO" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="250" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/gestaoProjetos/Projeto.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PROJETOS_GESTAO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    