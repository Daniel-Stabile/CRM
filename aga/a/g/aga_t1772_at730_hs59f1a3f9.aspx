<%@ Page Title="Materiais - Itens da empresa" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.ItensEmpresa" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Itens da empresa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PRODUTOSPAI.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3)" FormUrl="~/aga/a/f/aga_t1772_at730_hs59f1a3f9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ITENS_DA_EMPRESA_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    