<%@ Page Title="Em elaboração" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Em elaboração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL AND A.STATUSPROPOSTA = 1
 AND A.LIBERADOCONFIRMACAO &lt;&gt; 'S')" FormUrl="~/aga/a/f/aga_t2035_at2348_hsccbbfad7.aspx" UserDefinedDisableRowSelection="False" PageId="CM_PASTAPROPOSTAS__EM_ELABORACAO_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    