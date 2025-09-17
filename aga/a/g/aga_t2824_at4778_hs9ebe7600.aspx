<%@ Page Title="Mensagens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Mensagens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_Z_FILAMENSAGENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FILA IN (SELECT HANDLE FROM Z_FILAS WHERE UPPER(Z_FILAS.NOME) = '$BENNER_WORKFLOW_EVENTS$' OR UPPER(Z_FILAS.NOME) = '$BENNER_WORKFLOW_VBAPROCESS$')" FormUrl="~/aga/a/f/aga_t2824_at4778_hs9ebe7600.aspx" UserDefinedDisableRowSelection="False" PageId="MONITOR__MENSAGENS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    