<%@ Page Title="Aglutinados em aberto" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Aglutinados em aberto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FN_FECHAMENTOSCONVENIO.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3 AND A.DOCUMENTOGERADO IN (SELECT HANDLE FROM FN_DOCUMENTOS WHERE HANDLE = A.DOCUMENTOGERADO AND (VALORESBAIXADOS IS NULL OR VALORESBAIXADOS &lt; VALORLIQUIDO)))" FormUrl="~/aga/a/f/aga_t2065_at2512_hs5af08d1.aspx" UserDefinedDisableRowSelection="False" PageId="FN_PASTAFECHAMENTOS__AGLUTINADOS_ABERTO_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    