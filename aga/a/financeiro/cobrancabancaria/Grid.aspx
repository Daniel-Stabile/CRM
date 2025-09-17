<%@ Page Title="Cobrança bancária" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.cobrancabancaria.cobrancabancariaGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="COBRANCASBANCARIAS" Title="Cobranças bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_FN_COBRANCABANCARIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/financeiro/cobrancabancaria/Editar.aspx" UserDefinedDisableRowSelection="False" PageId="WEB_A_FINANCEIRO_COBRANCABANCARIA_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    