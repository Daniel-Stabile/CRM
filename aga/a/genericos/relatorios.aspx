<%@ Page Title="Relatórios" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RELATRIOSDISPONVEIS" Title="Relatórios disponíveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_R_RELATORIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EMISSAOWEB = 'S' AND (A.HANDLE IN (SELECT RELATORIO FROM R_TAREFARELATORIOS WHERE TAREFA IN @TAREFAS) OR @PAPEL = (SELECT HANDLE FROM Z_PAPEIS WHERE NOME = 'W_DESENVOLVEDOR')) AND A.CODIGO NOT IN ('P.9902', 'P.0275', 'P.1400', 'P.3206','P.3207')" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_RELATORIOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    