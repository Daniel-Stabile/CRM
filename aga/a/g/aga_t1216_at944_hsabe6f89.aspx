<%@ Page Title="Documentos do contas a receber" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Documentos do contas a receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ENTRADASAIDA='S' AND ((A.TIPODEMOVIMENTO = 1) OR (A.TIPODEMOVIMENTO = 2))) OR (A.ENTRADASAIDA = 'E' AND (A.TIPODEMOVIMENTO = 3))" FormUrl="~/aga/a/f/aga_t1216_at944_hsabe6f89.aspx" UserDefinedDisableRowSelection="False" PageId="CONTAS_A_RECEBER__DOCUMENTOS_DO_CONTAS_A_RECEBER_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    