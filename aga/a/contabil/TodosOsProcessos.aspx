<%@ Page Title="Todos os Processos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="TODOSOSPROCESSOS" Title="Todos os Processos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_PROCESSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT ZPROCESSO.HANDLE
  FROM ED_PROCESSOS SPEDTICKET
  JOIN GN_TASKTICKETS GNTICKET ON GNTICKET.HANDLE = SPEDTICKET.TICKET
  JOIN Z_PROCESSOS ZPROCESSO ON ZPROCESSO.HANDLE = GNTICKET.NUMEROTICKET
 WHERE SPEDTICKET.TIPOESCRITURACAO=4
)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_TODOSOSPROCESSOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    