<%@ Page Title="Modelos de documentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Modelos de documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_LC_MODELODOCUMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AQUISICAO IS NULL) AND (A.AQUISICAOPUBLICACAO IS NULL) AND (A.TERMOREFERENCIA IS NULL)" FormUrl="~/aga/a/f/aga_t2468_at3575_hs73b8e9e2.aspx" UserDefinedDisableRowSelection="False" PageId="AQUISICOES__MODELODOCUMENTOS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    