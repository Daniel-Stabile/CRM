<%@ Page Title="Contratos de compra" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.compra.AdicionarBadgesStatusCompra" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONTRATOSDECOMPRA" Title="Contratos de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="EXISTS(SELECT HANDLE FROM CN_TIPOSCONTRATOS T WHERE T.TIPO = 1 AND T.HANDLE = A.TIPOCONTRATO AND EHCONTRATOCONVENIO = 'N')" FormUrl="~/aga/a/contratos/ContratoCompraForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOSCOMPRA_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    