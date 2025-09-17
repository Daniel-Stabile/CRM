<%@ Page Title="Ordens de viagem" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Ordens de viagem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_OV_TIPOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="HANDLE IN (SELECT TIPO FROM OV_ORDENSVIAGEM WHERE (AREA IN (SELECT AREA FROM OV_AREASUSUARIOS WHERE USUARIO = @USUARIO)) OR ((SELECT COUNT(*) FROM OV_AREASUSUARIOS WHERE USUARIO = @USUARIO) = 0))" FormUrl="~/aga/a/f/aga_t1866_at2045_hs177502a4.aspx" UserDefinedDisableRowSelection="False" PageId="ORDEM_DE_VIAGEM__ORDENSVIAGEM_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    