<%@ Page Title="Visitas" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WIDGETID_636047060992203613" Title="Visitas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTAL_REP_CM_VISITAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.AGENTEVENDAS IN (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)" FormUrl="~/PortalRepresentante/a/Visitas/CadastroVisitas.aspx" UserDefinedDisableRowSelection="False" PageId="PORTAL_REP_VISITAS_CONSULTA" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    