<%@ Page Title="Análises gerenciais (Oculto)" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Análises gerenciais (Oculto)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_ANALISES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(0 = (SELECT COUNT(*) FROM CT_ANALISEUSUARIOS WHERE ANALISE = A.HANDLE)) OR (A.HANDLE IN (SELECT ANALISE FROM CT_ANALISEUSUARIOS WHERE USUARIO = @USUARIO))" FormUrl="~/aga/a/f/aga_t1397_at1133_hsa9eb4e30.aspx" UserDefinedDisableRowSelection="False" PageId="CONTABIL__ANALISES_GERENCIAIS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    