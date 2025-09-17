<%@ Page Title="Apontamentos" Language="C#" Inherits="aga.a.OrdemProducaoApontamento.OrdemProducaoApontamentoGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APONTAMENTOS" Title="Apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMPRODUCAOAPONTAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/OrdemProducaoApontamento/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAOAPONTAMENTO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    