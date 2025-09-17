<%@ Page Title="DAVs - Manipulados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="DAVs - Manipulados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FL_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOVENDA = 1) AND (A.HANDLE IN (SELECT DOCUMENTO FROM FL_DOCUMENTOITENS WHERE PRODUTO IN (SELECT HANDLE FROM PD_PRODUTOS WHERE MANIPULADO = 'S'))) AND (A.STATUS=2)" FormUrl="~/aga/a/f/aga_t3926_at6401_hsf98cd50d.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_VENDAS_FRENTELOJA__CARGA_MANIPULADOS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    