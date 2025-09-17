<%@ Page Title="Aprovados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Aprovados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="AGA_GN_PESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.EHCLIENTE = 'S') OR (A.EHFORNECEDOR = 'S')) AND (A.STATUS = 4)" FormUrl="~/aga/a/f/aga_t717_at6719_hsfd9ad658.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_CLIENTE_COM_APROVACAO__CLIENTES_APROVACAO_APROVADOS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    