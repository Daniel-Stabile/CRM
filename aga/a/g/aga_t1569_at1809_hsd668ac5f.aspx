<%@ Page Title="Planilhas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Planilhas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_Z_PLANILHAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(0=(SELECT COUNT(*) FROM Z_PLANILHAUSUARIOS WHERE PLANILHA = A.HANDLE)) OR (A.HANDLE IN (SELECT PLANILHA FROM Z_PLANILHAUSUARIOS WHERE USUARIO = @USUARIO))" FormUrl="~/aga/a/f/aga_t1569_at1809_hsd668ac5f.aspx" UserDefinedDisableRowSelection="False" PageId="ADM_PLANILHAS__PLANILHAS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    