<%@ Page Title="Cancelados com carência" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Cancelados com carência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CN_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 7) AND
(A.TIPOCONTRATO IN(SELECT X.HANDLE FROM CN_TIPOSCONTRATOS X WHERE X.HANDLE = A.TIPOCONTRATO AND X.TIPO = 2  AND X.EHCONTRATOCONVENIO = 'N' ))" FormUrl="~/aga/a/f/aga_t1907_at6763_hs391b37d0.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FATURAMENTO__CANCELADOSCARENCIA_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    