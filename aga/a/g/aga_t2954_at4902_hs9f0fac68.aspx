<%@ Page Title="Emitidos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IE_CERTIFICADOS.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3 AND @MODULO IN (SELECT B.HANDLE FROM Z_ARVORES B WHERE ((A.EXPIMP='E' AND B.NOME = 'EXPORTACAO')  OR (A.EXPIMP='I' AND B.NOME = 'IMPORTACAO')) AND B.HANDLE = @MODULO))" FormUrl="~/aga/a/f/aga_t2954_at4902_hs9f0fac68.aspx" UserDefinedDisableRowSelection="False" PageId="IE_CARGA_CERTIFICADOS__EMITIDOS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    